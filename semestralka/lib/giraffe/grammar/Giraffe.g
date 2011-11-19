grammar Giraffe;

options { 
language = Ruby; 
output = AST;
}


@header {
require './lib/giraffe/tree/programTree.rb'
require './lib/giraffe/tree/assignTree.rb'
require './lib/giraffe/tree/derefTree.rb'
require './lib/giraffe/tree/indexTree.rb'
require './lib/giraffe/tree/printTree.rb'
require './lib/giraffe/tree/ifTree.rb'
require './lib/giraffe/tree/whileTree.rb'
require './lib/giraffe/tree/doTree.rb'
require './lib/giraffe/tree/forTree.rb'
require './lib/giraffe/tree/funcTree.rb'
require './lib/giraffe/tree/callTree.rb'
require './lib/giraffe/tree/binaryOperatorTree.rb'
require './lib/giraffe/tree/unaryOperatorTree.rb'
require './lib/giraffe/tree/atomTree.rb'
require './lib/giraffe/tree/arrayTree.rb'
require './lib/giraffe/tree/varTree.rb'
require './lib/giraffe/tree/exitTree.rb'
require './lib/giraffe/tree/returnTree.rb'
require './lib/giraffe/tree/breakTree.rb'
require './lib/giraffe/tree/readTree.rb'
require './lib/giraffe/tree/methodCallTree.rb'
require './lib/giraffe/tree/classTree.rb'
require './lib/giraffe/tree/newTree.rb'
require './lib/giraffe/operators.rb'
}

@members {

}

program	returns [result]
	:	block {$result = ProgramTree.new($block.list)};

block returns [list]
	:	{$list = []}
		instruction  
		{$list = [$instruction.result] unless $instruction.result == nil}
		instructionRest 
		{$list = $list + $instructionRest.list}		
	;

instructionRest returns [list]
	: 	{$list = []}
		(( COMMENT!? '\r'!? '\n'!) | SEMICOLON!) 
		instruction 
		{$list = [$instruction.result] unless $instruction.result == nil}		
		op=instructionRest
		{$list = $list + $op.list}				
	|	{$list = []}
	;

instruction returns [result]
	:	assignment {$result = $assignment.result}
	|	func {$result = $func.result}
	|	forCycle {$result = $forCycle.result}
	|	ifInstruction {$result = $ifInstruction.result}
	|	whileCycle {$result = $whileCycle.result}
	|	doCycle {$result = $doCycle.result}
	|	printInstruction {$result = $printInstruction.result}
	|	printlInstruction {$result = $printlInstruction.result}
	|	returnInstruction {$result = $returnInstruction.result}	
	|	exitInstruction {$result = $exitInstruction.result}
	|	breakInstruction {$result = $breakInstruction.result}
	|	call {$result = $call.result}
	|	classDef {$result = $classDef.result}
	|	{$result = nil} 
	;

readInstruction returns [result]
	:	READ {$result = ReadTree.new}
	;

breakInstruction returns [result]
	:	BREAK {$result = BreakTree.new}
	;

returnInstruction returns [result]
	:	RETURN^ expression {$result = ReturnTree.new($expression.result)}
	;

exitInstruction returns [result]
	:	EXIT^ 	(LB! alt1=statusCode RB! {$result = ExitTree.new($alt1.result)} 
			| alt2=statusCode {$result = ExitTree.new($alt2.result)})? 
	;

statusCode returns [result]
	:	{sign = ""}
		(PLUS | MINUS {sign = $MINUS.text})? INT 
		{(sign + $INT.text).to_i}
	;

printInstruction returns [result]
 	:	PRINT^ printText {$result = PrintTree.new($printText.list)}
 	;
 	
printlInstruction returns [result]
 	:	(PRINTL | PRINTLN)^ printText {$result = PrintTree.new($printText.list,true)}
 	;
 	
printText returns [list]
	:	expression {$list = [$expression.result]}
		(COMMA rest=printText {$list = $list + $rest.list})?
	; 
 	
ifInstruction returns [result]	
	:	IF^ condition LCB! block RCB! ifRest
		{$result = IfTree.new($condition.result,$block.list,$ifRest.result)}
	;

ifRest returns [result]
	:	ELSE LCB! block RCB! {$result = $block.list}
	|	(ELSEIF | ELIF) condition LCB! block RCB! op=ifRest 
		{$result = IfTree.new($condition.result,$block.list,$op.result)}	
	|	{$result = nil}
	;

whileCycle returns [result]
 	:	WHILE condition LCB! block RCB!
 		{$result = WhileTree.new($condition.result,$block.list)}
 	;

doCycle	returns [result]
	:	DO LCB! block RCB! WHILE condition
 		{$result = DoTree.new($condition.result,$block.list)}
 	;

forCycle returns [result]
	:	FOR as1=assignment SEMICOLON! condition SEMICOLON! as2=assignment LCB! block RCB!
		{$result = ForTree.new($as1.result,$condition.result,$as2.result,$block.list)}
	;	
	
func returns [result]
	:	ID^ params? LCB! block RCB!
		{$result = FuncTree.new($ID.text,$params.list,$block.list)}
	;

params returns [list]
	:	ID paramRest
		{$list = [$ID.text] + $paramRest.list}
	;

paramRest returns [list]
	:	COMMA! params
		{$list = $params.list}		
	|	{$list = []}
	;
	
call returns [result]
	:	fun=ID^ LB! args1=args? RB!
		{$result = CallTree.new($fun.text,$args1.list)}
		( DOT method=ID LB! args2=args? RB! {$result = MethodCallTree.new($result,$method.text,$args2.list) })*
	;
	
args returns [list]
	: 	expression argsRest {$list = [$expression.result] + $argsRest.list}
	; 
	
argsRest returns [list]
	:	COMMA! args
		{$list = $args.list}
	|	{$list = []}
	;

// OR (closer to root -> will process after AND)

condition returns [result]
	:	orOperand {$result = $orOperand.result}
		(OR^ op=condition {$result = BinaryOperatorTree.new($result,$op.result,Operators.method(:or))})?
	;

// AND (further from root -> will process before OR)

orOperand returns [result]
	:	boolOperand {$result = $boolOperand.result}
		(AND^ op=orOperand {$result = BinaryOperatorTree.new($result,$op.result,Operators.method(:and))})?
	;

boolOperand returns [result]
	:	bool {$result = $bool.result}
	|	NOT LB! condition RB! {$result = !$condition.result}
	|	op1=expression (EQ^ (	op2=bool | op2=expression ) {$result = BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:eq))}
			|	NE^ (	op2=bool | op2=expression ) {$result = BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:ne))}
			|	LT^ (	op2=bool | op2=expression ) {$result = BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:lt))}
			|	GT^ (	op2=bool | op2=expression ) {$result = BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:gt))}
			|	LE^ (	op2=bool | op2=expression ) {$result = BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:le))}
			|	GE^ (	op2=bool | op2=expression ) {$result = BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:ge))}
		) 
	;

// add / substract (closer to root -> will process later)
expression returns [result]
	:	addOperand {$result = $addOperand.result}
		(
			PLUS^ op=expression {$result = BinaryOperatorTree.new($result,$op.result,Operators.method(:add))}
		|	MINUS^ op=expression {$result = BinaryOperatorTree.new($result,$op.result,Operators.method(:sub))}
		)?
	;

addOperand returns [result]
	:	mulOperand {$result = $mulOperand.result}
		(
			MUL^ op=addOperand {$result = BinaryOperatorTree.new($result,$op.result,Operators.method(:mul))}
		|	DIV^ op=addOperand {$result = BinaryOperatorTree.new($result,$op.result,Operators.method(:div))}
		|	MOD^ op=addOperand {$result = BinaryOperatorTree.new($result,$op.result,Operators.method(:mod))}
		)?
	;

mulOperand returns [result]
	:	PLUS mulOperandRest {$result = $mulOperandRest.result}
	|	MINUS mulOperandRest {$result = UnaryOperatorTree.new($mulOperandRest.result,Operators.method(:neg))}
	|	TO_INT mulOperandRest {$result = UnaryOperatorTree.new($mulOperandRest.result,Operators.method(:int))}
	|	TO_FLOAT mulOperandRest {$result = UnaryOperatorTree.new($mulOperandRest.result,Operators.method(:float))}
	|	mulOperandRest {$result = $mulOperandRest.result}
	;

mulOperandRest returns [result]
	:	arrayIndexTarget {$result = $arrayIndexTarget.result}	
		('[' expression ']' { $result = IndexTree.new($result,$expression.result) } )*		
	;
	
arrayIndexTarget returns [result]
	:	ID {$result = VarTree.new($ID.text)}
	|	LB! expression RB! {$result = $expression.result}
	|	INT {$result = AtomTree.new($INT.text.to_i)}
	|	FLOAT {$result = AtomTree.new($FLOAT.text.to_f)}
	|	string {$result = AtomTree.new($string.result)}
	|	call {$result = $call.result}
	|	array {$result = ArrayTree.new($array.result)}
	|	readInstruction {$result = $readInstruction.result}
	|	new {$result = $new.result}
	;

new returns [result]
	:	NEW ID (LB args? RB)? {$result = NewTree.new($ID.text,$args.list)}
	;

array returns [result]
	:	'[' {$result = []}
		(ex1=expression {$result << $ex1.result}
		(COMMA ex2=expression {$result << $ex2.result} )*)?
		']'
	;
	
// dochazi tady k tomu, ze az ten posledni index je adresou, ty predchozi jsou 
// indexy vracejici hodnotu... takze ja musim odchytavat o patro vys
// TODO - neumi to strida call a index, ... 
assignment returns [result]	
	:	var=ID {$result = VarTree.new($var.text)}
		( ASSIGN^ op1=expression { $result = AssignTree.new($var.text,$op1.result) } 
		| {index=nil}
			(( {index_ = index} '[' index=expression ']' {target_ = $result; $result = IndexTree.new($result,$index.result)})+  // obalovac ... 
			( ASSIGN^ op2=expression { $result = DerefTree.new(target_,$index.result,$op2.result) }					
			| (DOT method1=ID LB! args1=args? RB! {$result = MethodCallTree.new($result,$method1.text,$args1.list)})+
			))
		| (DOT method2=ID LB! args2=args? RB! {$result = MethodCallTree.new($result,$method2.text,$args2.list) })+
		)	
	;	

bool returns [result]	
	:	TRUE {$result = AtomTree.new(true)}
	| 	FALSE {$result = AtomTree.new(false)}
	;

string returns [result]	
	:	STRING {$result = $STRING.text[1..-2]}
	;

STRING
    :  '"' ( ESC_SEQ | ' ' | ~('\\'|'"'|' ') )* '"'
    ;

classDef returns [result]
	:	{superclass=nil}
		CLASS classid=ID (SUPERCLASS superclassid=ID {superclass=$superclassid.text})? LCB 
			block
		RCB {$result = ClassTree.new($classid.text,$block.list,superclass)}
	;

fragment
HEX_DIGIT : ('0'..'9'|'a'..'f'|'A'..'F') ;

fragment
ESC_SEQ
    :   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\'|'e')
    |   UNICODE_ESC
    |   OCTAL_ESC
    ;

fragment
OCTAL_ESC
    :   '\\' ('0'..'3') ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7')
    ;

fragment
UNICODE_ESC
    :   '\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
    ;	
    
TO_INT	:	'int:';
TO_FLOAT:	'float:';
READ	:	'read';
PRINT	:	'print';
PRINTL	:	'printl';
PRINTLN	:	'println';	// jenom alias pro printl
TRUE	:	'true';
FALSE	:	'false';
FOR	:	'for';
IF	:	'if';
ELSE	:	'else';
ELIF	:	'elif';
ELSEIF	:	'elseif';
WHILE	:	'while';
DO	:	'do';
RETURN	:	'return';
EXIT	:	'exit';
BREAK	:	'break';
CONTINUE:	'continue';
CLASS	:	'class';
SUPERCLASS
	:	'superclass';
NEW	:	'new';

ID  :	('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;

INT :	'0'..'9'+
    ;
    
fragment
FLOAT
    :   ('0'..'9')+ '.' ('0'..'9')* EXPONENT?
    |   '.' ('0'..'9')+ EXPONENT?
    |   ('0'..'9')+ EXPONENT
    ;

COMMENT
    :   '#' ~('\n'|'\r')* {$channel=HIDDEN;}
    ;

WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=HIDDEN;}
    ; 

fragment
EXPONENT : ('e'|'E') ('+'|'-')? ('0'..'9')+ ;

LB	:	'(';
RB	:	')';
LCB	:	'{';
RCB	:	'}';
QUOTE	:	'"';
COMMA	:	',';
DOT	:	'.';
COLON	:	':';
SEMICOLON
	:	';';
ASSIGN	:	'=';
PLUS	:	'+';
MINUS	:	'-';
MUL	:	'*';
DIV	:	'/';
MOD	:	'%';

EQ	:	'==';
NE	:	'!=';
LT	:	'<';
GT	:	'>';
LE	:	'<=';
GE	:	'>=';

AND	:	'&&';
OR	:	'||';
NOT	:	'!';

QM	:	'?';
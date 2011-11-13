grammar Giraffe;

options { 
language = Ruby; 
output = AST;
}


@header {
require './lib/giraffe/tree/programTree.rb'
require './lib/giraffe/tree/envTree.rb'
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
require './lib/giraffe/operators.rb'
}

@members {

}

program	returns [result]
	:	block {$result = ProgramTree.new($block.list)};

env returns [result]
	:	LCB! 
		block {$result = EnvTree.new($block.list)}
		RCB!
	;

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
	|	env {$result = $env.result}
	|	forCycle {$result = $forCycle.result}
	|	ifInstruction {$result = $ifInstruction.result}
	|	whileCycle {$result = $whileCycle.result}
	|	doCycle {$result = $doCycle.result}
	|	printInstruction {$result = $printInstruction.result}
	|	printlInstruction {$result = $printlInstruction.result}
	|	returnInstruction {$result = $returnInstruction.result}	
	|	exitInstruction {$result = $exitInstruction.result}
	|	breakInstruction {$result = $exitInstruction.result}
//	|	expression {$result = $expression.result}
	|	call {$result = $call.result}
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
 	:	PRINT^ expression {$result = PrintTree.new($expression.result)}
 	;
 	
printlInstruction returns [result]
 	:	(PRINTL | PRINTLN)^ expression {$result = PrintTree.new($expression.result,true)}
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
	:	FOR as1=assignment COMMA! condition COMMA! as2=assignment LCB! block RCB!
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
	:	ID^ LB! args? RB!
		{$result = CallTree.new($ID.text,$args.list)}
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
		('[' expression ']' // obalovac ... 
			{$result = IndexTree.new($result,$expression.result)}
		)*
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
	;

array returns [result]
	:	'[' {$result = []}
		(ex1=expression {$result << $ex1.result}
		(COMMA ex2=expression {$result << $ex2.result} )*)?
		']'
	;
	
// dochazi tady k tomu, ze az ten posledni index je adresou, ty predchozi jsou 
// indexy vracejici hodnotu... takze ja musim odchytavat o patro vys
assignment returns [result]	
	:	ID 
		( ASSIGN^ op1=expression { $result = AssignTree.new($ID.text,$op1.result) } 
		| {target = VarTree.new($ID.text); index=nil}
			({index_ = index} '[' index=expression ']' {target_ = target; target = IndexTree.new(target,$index.result)})+  // obalovac ... 
			ASSIGN^ op2=expression 
			{ if index_ == nil # byl tady jen jeden index
				$result = DerefTree.new(target_,$index.result,$op2.result)
			  else # vrat stare indexy a target
			  	$result = DerefTree.new(IndexTree.new(target_,$index_.result),$index.result,$op2.result)
			  end  }					
		)	
	;	

bool returns [result]	
	:	TRUE {$result = AtomTree.new(true)}
	| 	FALSE {$result = AtomTree.new(false)}
	;

string returns [result]
	:	'"' innerString '"' {$result = $innerString.result}
	;

innerString returns [result]
	:	esc=ESC_SEQ in1=innerString {$result = $esc.text + $in1.result}
	|	normal=~(ESC_SEQ | '"') in2=innerString {$result = $normal.text + $in2.result}
	|	{$result = ""}	
	;

fragment
HEX_DIGIT : ('0'..'9'|'a'..'f'|'A'..'F') ;

fragment
ESC_SEQ
    :   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
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
COMMA	:	',';
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
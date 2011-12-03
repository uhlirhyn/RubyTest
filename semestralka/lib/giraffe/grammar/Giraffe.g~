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

// Do pole -result-,-tree- se smi obalovat pouze -X-Tree.new
// jinak neni zaruka, ze vrtva vys neobali pole znova a parser
// pak nema moznost se tim prokousat ...
   
program	returns [result]
	:	functions {$result = ProgramTree.new($functions.list)} 
	;

funcdef returns [result]
	:	func {$result = $func.result} 
	|	{$result = nil} 
	;

functions returns [list]
	:	{$list = []}
		funcdef
		{$list = [$funcdef.result] unless $funcdef.result == nil}
		functionsRest 
		{$list = $list + $functionsRest.list}	
	;
	
functionsRest returns [list]
	: 	(( COMMENT!? '\r'!? '\n'!) | SEMICOLON!) 
		functions 
		{$list = $functions.list}				
	|	{$list = []}
	;
	
block returns [list]
	:	{$list = []}
		instruction  
		{$list = [$instruction.result] unless $instruction.result == nil}
		instructionRest 
		{$list = $list + $instructionRest.list}		
	;

instructionRest returns [list]
	: 	(( COMMENT!? '\r'!? '\n'!) | SEMICOLON!) 
		block 
		{$list = $block.list}				
	|	{$list = []}
	;

instruction returns [result]
	:	assignment {$result = $assignment.result}
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
	|	{$result = nil} 
	;

readInstruction returns [result]
	:	READ {$result = ReadTree.new}
	;

breakInstruction returns [result]
	:	BREAK {$result = BreakTree.new}
	;

returnInstruction returns [result]
	:	RETURN^ expression {$result = [ReturnTree.new($expression.result),$RETURN.tree]}
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
 	:	PRINT^ LB! printText RB! {$result = [PrintTree.new($printText.list),$PRINT.tree]} 
 	;
 	
printlInstruction returns [result]
 	:	(an=PRINTL | an=PRINTLN)^ LB! printText RB!{$result = [PrintTree.new($printText.list,true),$an.tree]}
 	;
 	
printText returns [list]
	:	expression {$list = [$expression.result]}
		(COMMA rest=printText {$list = $list + $rest.list})? 
	; 
 	
ifInstruction returns [result]	
	:	IF^ condition LCB! block RCB! ifRest
		{$result = [IfTree.new($condition.result,$block.list,$ifRest.result),$IF.tree]}
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
	:	FOR as1=assignment (( COMMENT!? '\r'!? '\n'!) | SEMICOLON!)  condition (( COMMENT!? '\r'!? '\n'!) | SEMICOLON!)  as2=assignment LCB! block RCB!
		{$result = ForTree.new($as1.result,$condition.result,$as2.result,$block.list)}
	;	
	
func returns [result]
	:	ID^ params? LCB! block RCB!
		{$result = [FuncTree.new($ID.text,$params.list,$block.list),$ID.tree]}
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
		{$result = [CallTree.new($fun.text,$args1.list),$fun.tree]}
		( DOT method=ID LB! args2=args? RB! {$result = [MethodCallTree.new($result,$method.text,$args2.list),$method.tree]})*
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
		(OR^ op=condition {$result = [BinaryOperatorTree.new($result,$op.result,Operators.method(:or)),$op.tree]})?
	;

// AND (further from root -> will process before OR)

orOperand returns [result]
	:	boolOperand {$result = $boolOperand.result}
		(AND^ op=orOperand {$result = [BinaryOperatorTree.new($result,$op.result,Operators.method(:and)),$op.tree] })?
	;

boolOperand returns [result]
	:	bool {$result = $bool.result}
	|	NOT LB! condition RB! {$result = !$condition.result}
	|	op1=expression (EQ^ (	op2=bool | op2=expression ) {$result = [BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:eq)),$op2.tree]}
			|	NE^ (	op2=bool | op2=expression ) {$result = [BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:ne)),$op2.tree]}
			|	LT^ (	op2=bool | op2=expression ) {$result = [BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:lt)),$op2.tree]}
			|	GT^ (	op2=bool | op2=expression ) {$result = [BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:gt)),$op2.tree]}
			|	LE^ (	op2=bool | op2=expression ) {$result = [BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:le)),$op2.tree]}
			|	GE^ (	op2=bool | op2=expression ) {$result = [BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:ge)),$op2.tree]}
		) 
	;

// add / substract (closer to root -> will process later)
expression returns [result]
	:	addOperand {$result = $addOperand.result}
		(
			PLUS^ op=expression {$result = [BinaryOperatorTree.new($result,$op.result,Operators.method(:add)),$op.tree]}
		|	MINUS^ op=expression {$result = [BinaryOperatorTree.new($result,$op.result,Operators.method(:sub)),$op.tree]}
		)?
	;

addOperand returns [result]
	:	mulOperand {$result = $mulOperand.result}
		(
			MUL^ op=addOperand {$result = [BinaryOperatorTree.new($result,$op.result,Operators.method(:mul)),$op.tree]}
		|	DIV^ op=addOperand {$result = [BinaryOperatorTree.new($result,$op.result,Operators.method(:div)),$op.tree]}
		|	MOD^ op=addOperand {$result = [BinaryOperatorTree.new($result,$op.result,Operators.method(:mod)),$op.tree]}
		)?
	;

mulOperand returns [result]
	:	PLUS mulOperandRest {$result = $mulOperandRest.result}
	|	MINUS mulOperandRest {$result = [UnaryOperatorTree.new($mulOperandRest.result,Operators.method(:neg)),$$mulOperandRest.tree]}
	|	mulOperandRest {$result = $mulOperandRest.result}
	;

mulOperandRest returns [result]
	:	arrayIndexTarget {$result = $arrayIndexTarget.result}	
		('[' expression ']' { $result = [IndexTree.new($result,$expression.result),$expression.tree] })*		
	;
	
arrayIndexTarget returns [result]
	:	ID {$result = [VarTree.new($ID.text),$ID.tree]}
	|	LB! expression RB! {$result = $expression.result}
	|	INT {$result = [AtomTree.new($INT.text.to_i),$INT.tree]}
	|	FLOAT {$result = [AtomTree.new($FLOAT.text.to_f),$FLOAT.tree]}
	|	call {$result = $call.result}
	|	array {$result = [ArrayTree.new($array.result),$array.tree]}
	|	readInstruction {$result = $readInstruction.result}
	;

array returns [result]
	:	'[' {$result = []}
		(ex1=expression {$result << $ex1.result}
		(COMMA ex2=expression {$result << $ex2.result} )*)?
		']'
	;

// bere vnitrek a chova se k nemu
// jako k adrese ktere prida offset
indexed	returns [result]
	:	identified {$result = $identified.result}
		// indexTree si na addressSource zavola ziskani hodnoty (Load, push on stack ...)
		('[' expression ']' {$result = IndexTree.new($result, $expression.result)})*
	;

// stara se o vraceni ID 
// od lokalni promenne nebo argumentu ... nebo funkce apod.
identified returns [result]
	:	ID {$result = [VarTree.new($ID.text),$ID.tree]}
	;


assignment returns [result]
	:	indexed ASSIGN^ expression { $result = [AssignTree.new($indexed.result,$expression.result),$indexed.tree] } 
	;

fragment
bool returns [result]	
	:	TRUE	{$result = new AtomTree(1)}
	| 	FALSE	{$result = new AtomTree(0)}
	;
    
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
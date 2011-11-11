grammar Giraffe;

options { 
language = Ruby; 
output = AST;
}


@header {
require './lib/giraffe/tree/programTree.rb'
require './lib/giraffe/tree/envTree.rb'
require './lib/giraffe/tree/assignTree.rb'
require './lib/giraffe/tree/printTree.rb'
require './lib/giraffe/tree/printlTree.rb'
require './lib/giraffe/tree/ifTree.rb'
require './lib/giraffe/tree/whileTree.rb'
require './lib/giraffe/tree/doTree.rb'
require './lib/giraffe/tree/forTree.rb'
require './lib/giraffe/tree/funcTree.rb'
require './lib/giraffe/tree/callTree.rb'
require './lib/giraffe/tree/binaryOperandTree.rb'
require './lib/giraffe/tree/unaryOperandTree.rb'
require './lib/giraffe/tree/atomTree.rb'
require './lib/giraffe/tree/varTree.rb'
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
	|	call {$result = $call.result}
	|	func {$result = $func.result}
	|	env {$result = $env.result}
	|	forCycle {$result = $forCycle.result}
	|	ifInstruction {$result = $ifInstruction.result}
	|	whileCycle {$result = $whileCycle.result}
	|	doCycle {$result = $doCycle.result}
	|	printInstruction {$result = $printInstruction.result}
	|	printlInstruction {$result = $printlInstruction.result}
	|	{$result = nil} 
	;

printInstruction returns [result]
 	:	PRINT  	(	STRING {$result = PrintTree.new($STRING.text)}
 			|	expression {$result = PrintTree.new($expression.result)}
 			) 
 	;
 	
printlInstruction returns [result]
 	:	PRINTL 	(	STRING {$result = PrintlTree.new(AtomTree.new(lambda {|env| $STRING}))}
 			|	expression {$result = PrintlTree.new($expression.result)}
 			) 
 	;

ifInstruction returns [result]	
	:	IF^ condition env ifRest
		{$result = IfTree.new($condition.result,$env.result,$ifRest.result)}
	;

ifRest returns [result]
	:	ELSE env {$result = $env.result}
	|	(ELSEIF | ELIF) condition env op=ifRest 
		{$result = IfTree.new($condition.result,$env.result,$op.result)}	
	|	{$result = nil}
	;

whileCycle returns [result]
 	:	WHILE condition env
 		{$result = WhileTree.new($condition.result,$env.result)}
 	;

doCycle	returns [result]
	:	DO env WHILE condition
 		{$result = DoTree.new($condition.result,$env.result)}
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
		{$result = CallTree.new($ID,$args.list)}
	;
	
args returns [list]
	:	expression argsRest
		{$list = [$expression.result] + $argsRest.list}
	; 
	
argsRest returns [list]
	:	COMMA! args
		{$list = $args.list}
	|	{$list = []}
	;

// OR (closer to root -> will process after AND)

condition returns [result]
	:	orOperand {$result = $orOperand.result}
		(OR^ op=condition {$result = BinaryOperandTree.new($result,$op.result,lambda {|x,y| x || y})})?
	;

// AND (further from root -> will process before OR)

orOperand returns [result]
	:	boolOperand {$result = $boolOperand.result}
		(AND^ op=orOperand {$result = BinaryOperandTree.new($result,$op.result,lambda {|x,y| x && y})})?
	;

boolOperand returns [result]
	:	bool {$result = $bool.result}
	|	NOT LB! condition RB! {$result = !$condition.result}
	|	op1=expression (EQ^ (	op2=bool | op2=expression ) {$result = BinaryOperandTree.new($op1.result,$op2.result,lambda {|x,y| x == y})}
			|	NE^ (	op2=bool | op2=expression ) {$result = BinaryOperandTree.new($op1.result,$op2.result,lambda {|x,y| x != y})}
			|	LT^ (	op2=bool | op2=expression ) {$result = BinaryOperandTree.new($op1.result,$op2.result,lambda {|x,y| x < y})}
			|	GT^ (	op2=bool | op2=expression ) {$result = BinaryOperandTree.new($op1.result,$op2.result,lambda {|x,y| x > y})}
			|	LE^ (	op2=bool | op2=expression ) {$result = BinaryOperandTree.new($op1.result,$op2.result,lambda {|x,y| x <= y})}
			|	GE^ (	op2=bool | op2=expression ) {$result = BinaryOperandTree.new($op1.result,$op2.result,lambda {|x,y| x >= y})}
		) 
	;

// add / substract (closer to root -> will process later)
expression returns [result]
	:	addOperand {$result = $addOperand.result}
		(
			PLUS^ op=expression {$result = BinaryOperandTree.new($result,$op.result,lambda {|x,y| x + y})}
		|	MINUS^ op=expression {$result = BinaryOperandTree.new($result,$op.result,lambda {|x,y| x - y})}
		)?
	;

addOperand returns [result]
	:	mulOperand {$result = $mulOperand.result}
		(
			MUL^ op=addOperand {$result = BinaryOperandTree.new($result,$op.result,lambda {|x,y| x * y})}
		|	DIV^ op=addOperand {$result = BinaryOperandTree.new($result,$op.result,lambda {|x,y| x / y})}
		|	MOD^ op=addOperand {$result = BinaryOperandTree.new($result,$op.result,lambda {|x,y| x \% y})}
		)?
	;

mulOperand returns [result]
	:	PLUS mulOperandRest {$result = $mulOperandRest.result}
	|	MINUS mulOperandRest {$result = UnaryOperandTree.new($mulOperandRest.result,lambda {|x| -x})}
	|	mulOperandRest {$result = $mulOperandRest.result}
	;

mulOperandRest returns [result]
	:	ID {$result = VarTree.new($ID.text)}
	|	LB! expression RB! {$result = $expression.result}
	|	INT {$result = AtomTree.new(lambda {|env| $INT.text.to_i})}
	|	FLOAT {$result = AtomTree.new(lambda {|env| $FLOAT.text.to_f})}
	|	call {$result = $call.result};

value returns [result]
	: 	expression {$result = $expression.result}
	|	STRING {$result = AtomTree.new(lambda {|env| $STRING.text})}
	|	CHAR {$result = AtomTree.new(lambda {|env| $CHAR.text})}
	;
	
assignment returns [result]	
	:	ID ASSIGN^ value { $result = AssignTree.new($ID.text,$value.result) } ;	

bool returns [result]	
	:	TRUE {$result = AtomTree.new(lambda {|env| true})}
	| 	FALSE {$result = AtomTree.new(lambda {|env| false})}
	;


PRINT	:	'print';
PRINTL	:	'printl';
TRUE	:	'true';
FALSE	:	'false';
FOR	:	'for';
IF	:	'if';
ELSE	:	'else';
ELIF	:	'elif';
ELSEIF	:	'elseif';
WHILE	:	'while';
DO	:	'do';

ID  :	('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;

INT :	'0'..'9'+
    ;

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

STRING
    :  '"' ( ESC_SEQ | ~('\\'|'"') )* '"'
    ;

CHAR:  '\'' ( ESC_SEQ | ~('\''|'\\') ) '\''
    ;

fragment
EXPONENT : ('e'|'E') ('+'|'-')? ('0'..'9')+ ;

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

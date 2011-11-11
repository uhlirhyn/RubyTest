grammar Giraffe;

options { 
language = Ruby; 
output = AST;
}


@header {
require './lib/giraffe/tree/blockTree.rb'
require './lib/giraffe/tree/assignTree.rb'
require './lib/giraffe/tree/printTree.rb'
require './lib/giraffe/tree/printlTree.rb'
require './lib/giraffe/tree/ifTree.rb'
require './lib/giraffe/tree/whileTree.rb'
require './lib/giraffe/tree/doTree.rb'
}

@members {

}

program	:	block {@programTree = $block.tree};

env returns [tree]
	:	LCB! 
		block {$tree = $block.tree}
		RCB!
	;

block returns [tree]
	:	{$tree = BlockTree.new}
		instruction  
		{$tree.addInstruction!($instruction.tree) unless $instruction.tree == nil}
		instructionRest 
		{$tree.addInstructions!($instructionRest.list)}		
	;

instructionRest returns [list]
	: 	{$list = []}
		(( COMMENT!? '\r'!? '\n'!) | SEMICOLON!) 
		instruction 
		{$list << $instruction.tree unless $instruction.tree == nil}		
		op=instructionRest
		{$list = $list + $op.list}				
	|	{$list = []}
	;

instruction returns [tree]
	:	assignment {$tree = $assignment.tree}
	|	call {$tree = $call.tree}
	|	func {$tree = $func.tree}
	|	env {$tree = $env.tree}
	|	forCycle {$tree = $forCycle.tree}
	|	ifInstruction {$tree = $ifInstruction.tree}
	|	whileCycle {$tree = $whileCycle.tree}
	|	doCycle {$tree = $doCycle.tree}
	|	printInstruction {$tree = $printInstruction.tree}
	|	printlInstruction {$tree = $printlInstruction.tree}
	|	{$tree = nil} 
	;

printInstruction returns [tree]
 	:	PRINT  	(	STRING {$tree = PrintTree.new($STRING.text)}
 			|	expression {$tree = PrintTree.new($expression.tree)}
 			) 
 	;
 	
printlInstruction returns [tree]
 	:	PRINTL 	(	STRING {$tree = PrintlTree.new($STRING.text)}
 			|	expression {$tree = PrintlTree.new($expression.tree)}
 			) 
 	;

ifInstruction returns [tree]	
	:	IF^ condition env ifRest
		{$tree = IfTree.new($condition.tree,$env.tree,$ifRest.tree}
	;

ifRest returns [tree]
	:	ELSE env {$tree = $env.tree}
	|	(ELSEIF | ELIF) condition env ifRest 
		{$tree = IfTree.new($condition.tree,$env.tree,$ifRest.tree}	
	|	{$tree = nil}
	;

whileCycle returns [tree]
 	:	WHILE condition env
 		{$tree = WhileTree.new($condition.tree,$env.tree}
 	;

doCycle	returns [tree]
	:	DO env WHILE condition
 		{$tree = DoTree.new($condition.tree,$env.tree}
 	;

forCycle returns [tree]
	:	FOR assignment COMMA! condition COMMA! assignment env;
	
func returns [tree]
	:	ID^ params? env;

params returns [tree]
	:	ID paramRest;

paramRest returns [tree]
	:	COMMA! params
	|	;
	
call returns [tree]
	:	ID^ LB! args? RB!;
	
args returns [tree]
	:	expression argsRest; 
	
argsRest returns [tree]
	:	COMMA! args
	|	;

// OR (closer to root -> will process after AND)

condition returns [tree]
	:	orOperand {$result = $orOperand.result}
		(OR^ op=condition {$result = $result || $op.result})?
	;

// AND (further from root -> will process before OR)

orOperand returns [tree]
	:	boolOperand {$result = $boolOperand.result}
		(AND^ op=orOperand {$result = $result && $op.result})?
	;

andOperand returns [tree]
	:	boolOperand {$result = $boolOperand.result} (
			EQ^ op=andOperand {$result = $result == $op.result}
		| 	NE^ op=andOperand {$result = $result != $op.result}
		| 	LT^ op=andOperand {$result = $result < $op.result}
		| 	GT^ op=andOperand {$result = $result > $op.result}
		| 	LE^ op=andOperand {$result = $result <= $op.result}
		| 	GE^ op=andOperand {$result = $result >= $op.result}
		)?				
	;
	
boolOperand returns [tree]
	:	bool {$result = $bool.result}
	|	NOT LB! condition RB! {$result = !$condition.result}
	|	op1=expression (
			EQ^ (	op2=bool {$result = $op1.result == $op2.result}
				|	op2=expression {$result = $op1.result == $op2.result}) 
			|
			NE^ (	op2=bool {$result = $op1.result != $op2.result}
				| 	op2=expression {$result = $op1.result != $op2.result}) 
			|
			LT^ (	op2=bool {$result = $op1.result < $op2.result}
				|	op2=expression {$result = $op1.result < $op2.result}) 
			|
			GT^ (	op2=bool {$result = $op1.result > $op2.result}
				| 	op2=expression {$result = $op1.result > $op2.result}) 
			|
			LE^ (	op2=bool {$result = $op1.result <= $op2.result}
				| 	op2=expression {$result = $op1.result <= $op2.result}) 
			|
			GE^ (	op2=bool {$result = $op1.result >= $op2.result}
				| 	op2=expression {$result = $op1.result >= $op2.result}) 
		) 
	;

// add / substract (closer to root -> will process later)
expression returns [tree]
	:	addOperand {$result = $addOperand.result}
		(
			PLUS^ op=expression {$result = $result + $op.result}
		|	MINUS^ op=expression {$result = $result - $op.result}
		)?
	;

addOperand returns [tree]
	:	mulOperand {$result = $mulOperand.result}
		(
			MUL^ op=addOperand {$result = $result * $op.result}
		|	DIV^ op=addOperand {$result = $result / $op.result}
		|	MOD^ op=addOperand {$result = $result \% $op.result}
		)?
	;

mulOperand returns [tree]
	:	PLUS mulOperandRest {$result = $mulOperandRest.result}
	|	MINUS mulOperandRest {$result = -$mulOperandRest.result}
	|	mulOperandRest {$result = $mulOperandRest.result}
	;

mulOperandRest returns [tree]
	:	ID {$result = @@progEnv.varLookup($ID.text)}
	|	LB! expression RB! {$result = $expression.result}
	|	INT {$result = $INT.text.to_i}
	|	FLOAT {$result = $FLOAT.text.to_f}
	|	call {puts "CALL-LOOKUP"};

value returns [tree]
	: 	expression {$result = $expression.result}
	|	STRING {$result = $STRING.text}
	|	CHAR {$result = $CHAR.text}
	;
	
assignment
	:	ID ASSIGN^ value { @@progEnv.varSet($ID.text,$value.result) } ;	

bool returns [tree]	
	:	TRUE {$result = true}
	| 	FALSE {$result = true}
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

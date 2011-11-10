grammar Giraffe;

options { 
language = Ruby; 
output = AST;
}


@header {
require './lib/giraffe/env.rb'
}

@members {
@@progEnv = Env.new
}

program	:	block ;

env
	:	LCB! { @@progEnv.raise } 
		block 
		RCB! { @@progEnv.descend }
	;

block
	:	instruction instructionRest;

instructionRest
	: 	(( COMMENT!? '\r'!? '\n'!) | SEMICOLON!) block
	|	;

instruction
	:	assignment
	|	call
	|	func
	|	env
	|	forCycle
	|	ifInstruction
	|	whileCycle
	|	doCycle
	|	;

ifInstruction 	
	:	IF^ condition env ifRest 
		{ if $condition.result
			puts "alt\#1"
		  end
		}
	;

ifRest	:	ELSE env
	|	(ELSEIF | ELIF) condition env
	|	;

whileCycle
 	:	WHILE condition env;

doCycle	:	DO env WHILE condition;

forCycle
	:	FOR assignment COMMA! condition COMMA! assignment env;
	
func 	:	ID^ params? env;

params	:	ID paramRest;

paramRest
	:	COMMA! params
	|	;
	
call 
	:	ID^ LB! args? RB!;
	
args 
	:	expression argsRest; 
	
argsRest
	:	COMMA! args
	|	;

// OR (closer to root -> will process after AND)

condition returns [result]
	:	orOperand {$result = $orOperand.result}
		(OR^ op=condition {$result = $result || $op.result})?
	;

// AND (further from root -> will process before OR)

orOperand returns [result]
	:	andOperand {$result = $andOperand.result}
		(AND^ op=orOperand {$result = $result && $op.result})?
	;

andOperand returns [result]
	:	boolOperand {$result = $boolOperand.result} (
			EQ^ op=andOperand {$result = $result == $op.result}
		| 	NE^ op=andOperand {$result = $result != $op.result}
		| 	LT^ op=andOperand {$result = $result < $op.result}
		| 	GT^ op=andOperand {$result = $result > $op.result}
		| 	LE^ op=andOperand {$result = $result <= $op.result}
		| 	GE^ op=andOperand {$result = $result >= $op.result}
		)?
	;
	
boolOperand returns [result]
	:	bool {$result = $bool.result}
	|	NOT LB! condition RB! {$result = !$condition.result}
	|	op1=expression (
			EQ^ (
				bool {$result = $op1.result == $bool.result}
			| 	op2=expression {$result = $op1.result == $op2.result}) 
		) 
	;

// add / substract (closer to root -> will process later)
expression returns [result]
	:	addOperand {$result = $addOperand.result}
		(
			PLUS^ op=expression {$result = $result + $op.result}
		|	MINUS^ op=expression {$result = $result - $op.result}
		)?
	;

addOperand returns [result]
	:	mulOperand {$result = $mulOperand.result}
		(
			MUL^ op=addOperand {$result = $result * $op.result}
		|	DIV^ op=addOperand {$result = $result / $op.result}
		|	MOD^ op=addOperand {$result = $result \% $op.result}
		)?
	;

mulOperand returns [result]
	:	PLUS mulOperandRest {$result = $mulOperandRest.result}
	|	MINUS mulOperandRest {$result = -$mulOperandRest.result}
	|	mulOperandRest {$result = $mulOperandRest.result}
	;

mulOperandRest returns [result]
	:	ID {puts "VAR-LOOKUP"}
	|	LB! expression RB! {$result = $expression.result}
	|	INT {$result = $INT.text.to_i}
	|	FLOAT {$result = $FLOAT.text.to_f}
	|	call {puts "CALL-LOOKUP"};

value returns [result]
	: 	expression {$result = $expression.result}
	|	STRING {$result = $STRING.text}
	|	CHAR {$result = $CHAR.text}
	;
	
assignment
	:	ID ASSIGN^ value { @@progEnv.varSet($ID.text,$value.result) } ;	

bool returns [result]	
	:	TRUE {$result = true}
	| 	FALSE {$result = true}
	;


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

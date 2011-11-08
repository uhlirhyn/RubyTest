grammar giraffe;

program	:	block;

env	:	LCB block RCB;

block
	:	instruction instructionRest
	|	COMMENT;

instructionRest
	: 	(('\r'? '\n') | SEMICOLON) block
	|	;

instruction
	:	assignment
	|	call
	|	func
	|	env
	|	for
	|	if
	|	while
	|	do
	|	;

if 	:	IF condition env ifRest;

ifRest	:	ELSE env
	|	(ELSEIF | ELIF) condition env
	|	;

while 	:	WHILE condition env;

do	:	DO env WHILE condition;

for	:	FOR assignment COMMA condition COMMA assignment env;
	
func 	:	ID params? env;

params	:	ID paramRest;

paramRest
	:	COMMA params
	|	;
	
call
	:	ID LB args? RB;
	
args 
	:	expression argsRest; 
	
argsRest
	:	COMMA args
	|	;

// OR (closer to root -> will process after AND)

condition
	:	orOperand conditionRest;
	
conditionRest
	:	OR conditionRest
	|	;

// AND (further from root -> will process before OR)

orOperand
	:	andOperand orOperandRest;
	
orOperandRest
	:	AND andOperand orOperandRest
	|	;

andOperand
	:	boolOperand andOperandRest;

andOperandRest
	:	boolOperator boolOperand
	|	;

boolOperand
	:	bool
	|	NOT LB condition RB
	|	expression boolOperator (bool | expression);

// add / substract (closer to root -> will process later)
expression
	:	addOperand expressionRest;
	
expressionRest
	:	addOperator addOperand expressionRest
	|	;

addOperand
	:	mulOperand addOperandRest ;

addOperandRest
	:	mulOperator mulOperand addOperandRest
	|	;

mulOperand
	:	PLUS mulOperandRest
	|	MINUS mulOperandRest
	|	mulOperandRest ;

mulOperandRest	
	:	ID
	|	LB expression RB
	|	INT
	|	FLOAT
	|	call;

mulOperator
	:	MUL
	|	DIV
	|	MOD;

addOperator
	:	PLUS
	|	MINUS ;

value 
	: 	expression 
	|	STRING
	|	CHAR;
	
assignment
	:	ID (PLUS | MINUS | MUL | MOD | DIV | ) ASSIGN value;	

boolOperator
	:	EQ | NE | LT | GT | LE | GE; 

bool	:	TRUE 
	| 	FALSE;


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
    :   '#' ~('\n'|'\r')* '\r'? '\n' {$channel=HIDDEN;}
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
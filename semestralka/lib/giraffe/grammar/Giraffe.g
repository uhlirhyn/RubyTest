grammar Giraffe;

options { 
language = Ruby; 
output = AST;
}


@header {
require './lib/giraffe/tree/programTree.rb'
require './lib/giraffe/tree/assignTree.rb'
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
require './lib/giraffe/tree/returnTree.rb'
require './lib/giraffe/tree/stringTree.rb'
require './lib/giraffe/tree/openFileTree.rb'
require './lib/giraffe/tree/closeFileTree.rb'
require './lib/giraffe/tree/writeFileTree.rb'
require './lib/giraffe/tree/readNumberTree.rb'
require './lib/giraffe/tree/nilTree.rb'
require './lib/giraffe/tree/allocTree.rb'
require './lib/giraffe/tree/sizeofTree.rb'
require './lib/giraffe/operators.rb'
require './lib/giraffe/debug.rb'
}

@members {

include Debug

def emit_error_message(message) 
	#@syntax_error = :error
	puts red("Error: ") + orange(message)
	#@error_output.puts( message ) if @error_output

                puts red("\n BUILD FAILED ...\n")
	exit
end

attr_reader :syntax_error
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
	|	returnInstruction {$result = $returnInstruction.result}	
	|	aloneCall {$result = $aloneCall.result}
	|	closeFile {$result = $closeFile.result}
	|	writeFileA {$result = $writeFileA.result}
	|	{$result = nil} 
	;

readInstruction returns [result]
	:	READ {$result = ReadTree.new}
	;

returnInstruction returns [result]
	:	RETURN^ expression {$result = [ReturnTree.new($expression.result),$RETURN.tree]}
	;

statusCode returns [result]
	:	{sign = ""}
		(PLUS | MINUS {sign = $MINUS.text})? INT 
		{(sign + $INT.text).to_i}
	;

printInstruction returns [result]
 	:	PRINT^ LB! printText RB! {$result = [PrintTree.new($printText.list),$PRINT.tree]}  		
 	;
 	
printText returns [list]
	:	expression {$list = [$expression.result]}
		(COMMA rest=printText {$list = $list + $rest.list})? 
	; 
 	
ifInstruction returns [result]	
	:	IF^ LB! expression RB! LCB! block RCB! ifRest
		{$result = [IfTree.new($expression.result,$block.list,$ifRest.result),$IF.tree]}
	;

ifRest returns [result]
	:	ELSE LCB! block RCB! {$result = $block.list}
	|	(ELSEIF | ELIF) expression LCB! block RCB! op=ifRest 
		{$result = IfTree.new($expression.result,$block.list,$op.result)}	
	|	{$result = nil}
	;

whileCycle returns [result]
 	:	WHILE LB expression RB LCB! block RCB!
 		{$result = [WhileTree.new($expression.result,$block.list),$WHILE.tree]}
 	;

doCycle	returns [result]
	:	DO LCB! block RCB! WHILE LB expression RB
 		{$result = [DoTree.new($expression.result,$block.list),$DO.tree]}
 	;

forCycle returns [result]
	:	FOR LB as1=assignment (( COMMENT!? '\r'!? '\n'!) | SEMICOLON!)  expression (( COMMENT!? '\r'!? '\n'!) | SEMICOLON!)  as2=assignment RB LCB! block RCB!
		{$result = [ForTree.new($as1.result,$expression.result,$as2.result,$block.list), $FOR.tree]}
	;	
	
func returns [result]
	:	ID (LB! params RB!)? LCB! block RCB!
		{$result = [FuncTree.new($ID.text,$params.list == nil ? [] : $params.list,$block.list),$ID.tree]}
	|	MAIN^ LCB! block RCB!
		{$result = [FuncTree.new("main",[],$block.list),$MAIN.tree]}
	;

params returns [list]
	:	ID paramRest
		{$list = [$ID.text] + $paramRest.list}
	| 	{$list = []}
	;

paramRest returns [list]
	:	COMMA! params
		{$list = $params.list}		
	|	{$list = []}
	;

aloneCall returns [result]
	:	fun=ID^ LB! args1=args? RB!
		{$result = [CallTree.new($fun.text,$args1.list,true),$fun.tree]}
	;

callVar returns [result]
	:	ID {$result = [VarTree.new($ID.text),$ID.tree]}
		( 
		LB args1=args? RB 
		{$result = [CallTree.new($ID.text,$args1.list,false),$ID.tree]} 
		)?
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

expression returns [result]
	:	op1=orOperand {$result = $op1.result}
		(OR^ op2=expression {$result = [BinaryOperatorTree.new($result,$op2.result,Operators.method(:or)),$op2.tree]})?
	;

// AND (further from root -> will process before OR)

orOperand returns [result]
	:	op1=andOperand {$result = $op1.result}
		(AND^ op2=orOperand {$result = [BinaryOperatorTree.new($result,$op2.result,Operators.method(:and)),$op2.tree] })?
	;

andOperand returns [result]
	:	op1=compareOperand {$result = $op1.result}		
		(	EQ^ op2=andOperand  {$result = [BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:eq)),$op2.tree]}
		|	NE^ op2=andOperand  {$result = [BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:ne)),$op2.tree]}
		|	LT^ op2=andOperand  {$result = [BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:lt)),$op2.tree]}
		|	GT^ op2=andOperand  {$result = [BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:gt)),$op2.tree]}
		|	LE^ op2=andOperand  {$result = [BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:le)),$op2.tree]}
		|	GE^ op2=andOperand  {$result = [BinaryOperatorTree.new($op1.result,$op2.result,Operators.method(:ge)),$op2.tree]}		
		)?
	|	NOT^ LB! op1=expression RB! {$result = [UnaryOperatorTree.new($op1.result,Operators.method(:not)),$op1.tree]}		
	;

// add / substract (closer to root -> will process later)
compareOperand returns [result]
	:	op1=addOperand {$result = $op1.result}
		(	PLUS^ op2=compareOperand {$result = [BinaryOperatorTree.new($result,$op2.result,Operators.method(:add)),$op2.tree]}
		|	MINUS^ op2=compareOperand {$result = [BinaryOperatorTree.new($result,$op2.result,Operators.method(:sub)),$op2.tree]}
		)?
	;

addOperand returns [result]
	:	op1=mulOperand {$result = $op1.result}
		(	MUL^ op2=addOperand {$result = [BinaryOperatorTree.new($result,$op2.result,Operators.method(:mul)),$op2.tree]}
		|	DIV^ op2=addOperand {$result = [BinaryOperatorTree.new($result,$op2.result,Operators.method(:div)),$op2.tree]}
		|	MOD^ op2=addOperand {$result = [BinaryOperatorTree.new($result,$op2.result,Operators.method(:mod)),$op2.tree]}
		)?
	;

mulOperand returns [result]
	:	PLUS mulOperandRest {$result = $mulOperandRest.result}
	|	MINUS mulOperandRest {$result = [UnaryOperatorTree.new($mulOperandRest.result,Operators.method(:neg)),$mulOperandRest.tree]}
	|	mulOperandRest {$result = $mulOperandRest.result}
	;

mulOperandRest returns [result]
	:	arrayIndexTarget {$result = $arrayIndexTarget.result}	
		('[' expression ']' { $result = [IndexTree.new($result,$expression.result),$expression.tree] })*		
	;

closeFile returns [result]
	:	CLOSEFILE LB! expression RB! {$result = [CloseFileTree.new($expression.result),$CLOSEFILE.tree]} 
	; 
	
openFile returns [result]
	:	OPENFILE LB! what=expression COMMA mode=expression RB! {$result = [OpenFileTree.new($what.result, $mode.result),$OPENFILE.tree]} 
	; 

sizeOf returns [result]
	:	SIZEOF LB! expression RB! {$result = [SizeofTree.new($expression.result),$SIZEOF.tree]} 
	; 	

readNumber returns [result]
	:	READNUMBER LB! expression RB! {$result = [ReadNumberTree.new($expression.result),$READNUMBER.tree]} 
	; 	

writeFile returns [result]
	:	WRITEFILE LB! where=expression COMMA what=expression RB! {$result = [WriteFileTree.new($where.result, $what.result, false),$WRITEFILE.tree]} 
	; 		
	
writeFileA returns [result]
	:	WRITEFILE LB! where=expression COMMA what=expression RB! {$result = [WriteFileTree.new($where.result, $what.result, true),$WRITEFILE.tree]} 
	; 
	
arrayIndexTarget returns [result]
	:	subexpression {$result = $subexpression.result}
	|	INT {$result = [AtomTree.new($INT.text.to_i),$INT.tree]}
	|	callVar {$result = $callVar.result}
	|	array {$result = [ArrayTree.new($array.result),$array.tree]}
	|	alloc {$result = $alloc.result}
	|	readInstruction {$result = $readInstruction.result}
	|	string {$result = [StringTree.new($string.result),$string.tree]}
	|	NULL {$result = [NilTree.new,$NULL.tree]}
	|	openFile {$result = $openFile.result}
	|	sizeOf {$result = $sizeOf.result}
	|	readNumber {$result = $readNumber.result}
	|	writeFile {$result = $writeFile.result}
	;

subexpression returns [result]
	:	LB expression RB {$result = $expression.result}
	;

array returns [result]
	:	'[' {$result = []}
		('\n'? ex1=expression {$result << $ex1.result}
		(COMMA '\n'? ex2=expression {$result << $ex2.result} )*)?
		'\n'? ']'
	;
	
alloc returns [result]
	:	ALLOC LB! expression RB! {$result = [AllocTree.new($expression.result),$ALLOC.tree]} 
	; 	

// bere vnitrek a chova se k nemu
// jako k adrese ktere prida offset
indexed	returns [result]
	:	identified {$result = $identified.result}
		// indexTree si na addressSource zavola ziskani hodnoty (Load, push on stack ...)
		('[' expression ']' {$result = [IndexTree.new($result, $expression.result),$identified.tree]})*
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

string returns [result]	
	:	STRING {$result = $STRING.text[1..-2]}
	;

STRING
    :  '"' ( ESC_SEQ | ' ' | ~('\\'|'"'|' ') )* '"'
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

SIZEOF	:	'sizeof';
ALLOC 	:	'alloc';
READNUMBER:	'readNumber';
WRITEFILE:	'writeFile';
CLOSEFILE
	:	'closeFile';
OPENFILE:	'openFile';
NULL	:	'nil';    
MAIN	:	'main';
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
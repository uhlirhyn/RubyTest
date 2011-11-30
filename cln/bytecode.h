
//====================
// BYTECODE instrukce
//====================

// push 0x01 
// vloz 1B hodnotu na zasobnik
void push(char value);

// pop 0x02
// vydej 1B hodnotu ze zasobniku
char pop();

// push_i 0x03 
// vloz 4B hodnotu na zasobnik
void push_i(int value);

// pop_i 0x04
// vydej 4B hodnotu ze zasobniku
int pop_i();

// push_p 0x07 
// vloz pointer na zasobnik
void push_p(char * value);

// pop_p 0x08
// vydej pointer ze zasobniku
char * pop_p();

// ARITMETIKA
// -- 4B operace

// iadd 0x25
void iadd();

// isub 0x26
void isub();

// imul 0x27
void imul();

// idiv 0x28
void idiv();

// imod 0x29
void imod();

// ineg 0x2a
void ineg();

// -- 1B operace

// add_char 0x05
void add_c();

// sub_char 0x06
void sub_c();

// BOOL OPERACE
// -- 4B operace

// ior 0x2b
void ior();

// iand 0x2c
void iand();

// POROVNAVANI
// -- 4B operace

// ine 0x2f
void ine();

// igt 0x30
void igt();

// ige 0x31
void ige();

// ilt 0x32
void ilt();

// ile 0x33
void ile();

// ieq 0x34
void ieq();

// jmp 0x11
void jmp(unsigned int offset); 

// jeq 0x10 
// jump if equal
void jeq(unsigned int offset);

// call 0x09
// http://unixwiz.net/techtips/win32-callconv-asm.html
// call od adresy (parametry jsou jiz ulozene na zasobniku !!!)
// POZOR -- FP ukazuje na prvni pole noveho ramce, takze pod nim
// pri volani neni adresa stareho FP - ta je adresu za nim !!! (lepe se to psalo)
void call(int address);

// return 0x0a
// navratova hodnota je int a je to posledni udaj na zasobniku
void ret();

// pop stack to locale 4B 0x1d
// locals jsou cislovane od 0
void ipsl(unsigned int offset);

// push locale on stack 4B 0x1e
// locals jsou cislovane od 0
void ipls(unsigned int offset);

// pop stack to locale 1B 0x1b
// locals jsou cislovane od 0
void psl_c(unsigned int offset);

// push locale on stack 1B 0x1c
// locals jsou cislovane od 0
void pls_c(unsigned int offset);

// store locale 1B 0x0b
// locals jsou cislovane od 0
void sl_c(char value, unsigned int offset);

// load locale 1B 0x0c
// locals jsou cislovane od 0
char ll_c(unsigned int offset);

// pop stack to argument 4B 0x2d
// argumenty jsou cislovane od 0
void psa(unsigned int offset);

// push argument to stack 4B 0x2e
// argumenty jsou cislovane od 0
void pas(unsigned int offset);

// store in arguments 1B 0x0d
// argumenty jsou cislovane od 0
void sa_c(char value, unsigned int offset);

// load from arguments 1B 0x0e
// argumenty jsou cislovane od 0
char la_c(unsigned int offset);

// control output 0x0e
void out_c();

// control output 0x12
void out();

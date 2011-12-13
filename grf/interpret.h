
//===============
// VM EXECUTION
//===============

// vezme dalsi byte z bytecodu
char next();

// proved cely program a na nic se neptej
void run();

// provede main
void run_main();

// provede instrukci
void bytecode_switch(char opcode);

// vynuluje ciselniky apod. - vyresetuje VM
void reset_vm();

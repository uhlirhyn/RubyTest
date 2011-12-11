module Opcodes
        
    # definice typu
    BOOLEAN     = 0x01
    INTEGER     = 0x02
    CHARACTER   = 0x40 
    POINTER     = 0x10
    S_POINTER   = 0x11
    NULL        = 0x1F

    # skoky, rizeni programu
    JEQ     =   0x0f
    JNEQ    =   0x10
    JMP     =   0x11
    RET     =   0x0a
    CALL    =   0x09
    RER     =   0x0b

    # pamet
    ALLOC   =   0x0c
    ST      =   0x0d
    LD      =   0x0e
    CALLOC  =   0x1c
    SZOF    =   0x1f

    # operace s lokalnimu promennymi
    PSL     =   0x1d
    PLS     =   0x1e
    
    # operace s argumenty funkci
    PSA     =   0x2d
    PAS     =   0x2e

    # operace se zasobnikem
    PUSH    =   0x03
    POP     =   0x04
    DUP     =   0x05 

    # aritmetika
    ADD     =   0x25
    SUB     =   0x26
    MUL     =   0x27
    DIV     =   0x28
    MOD     =   0x29
    NEG     =   0x2a

    # bool operace
    OR      =   0x2b
    AND     =   0x2c
    
    # porovnavani
    NE      =   0x2f
    GT      =   0x30
    GE      =   0x31
    LT      =   0x32
    LE      =   0x33
    EQ      =   0x34

    # jine
    OUT     =   0x12
    FO      =   0x13
    RN      =   0x14
    FC      =   0x15

end

# encoding: utf-8

# Operační znaky a hodnoty v bytecodu
module Opcodes
        
    # Boolean hodnota
    BOOLEAN     = 0x01
    # Celé číslo 32b
    INTEGER     = 0x02
    # Znak 32b
    CHARACTER   = 0x40 
    # Reference
    POINTER     = 0x10
    # Systémový ukazatel (pozice na stacku, ...)
    S_POINTER   = 0x11
    # Nic :)
    NULL        = 0x1F

    # Skoč pokud je údaj na stacku true
    JEQ     =   0x0f
    # Skoč pokud údaj na stacku není false
    JNEQ    =   0x10
    # Skoč na adresu na stacku
    JMP     =   0x11
    # Ukonči průběh funkce
    RET     =   0x0a
    # Proveď volání funkce na adrese, co je na stacku
    CALL    =   0x09
    # Nahraj na stack návratovou hodnotu z registru návratových hodnot
    RER     =   0x0b

    # Naalokuj pole a vlož do něj hodnoty ze zásobníku
    ALLOC   =   0x0c
    # Ulož hodnoty ze zásobníku na určenou adresu
    ST      =   0x0d
    # Nahraj hodnoty z paměti na zásobník
    LD      =   0x0e
    # Alokuj prázdné pole o určené velikosti 
    CALLOC  =   0x1c
    # Vrať velikost pole na dané adrese 
    SZOF    =   0x1f

    # Push Stack To Local
    PSL     =   0x1d
    # Push Local To Stack
    PLS     =   0x1e
    
    # Push Stack To Argument
    PSA     =   0x2d
    # Push Argument To Stack
    PAS     =   0x2e

    # Vlož na zásobník
    PUSH    =   0x03
    # Použij hodnotu ze zásobníku a odeber ji
    POP     =   0x04
    # Duplikuj vrchol zásobníku
    DUP     =   0x05 

    # Součet
    ADD     =   0x25
    # Rozdíl
    SUB     =   0x26
    # Násobení
    MUL     =   0x27
    # Dělení celých čísel
    DIV     =   0x28
    # Zbytek po dělení
    MOD     =   0x29
    # Násobení -1
    NEG     =   0x2a

    # Logický sočet
    OR      =   0x2b
    # Logický součin
    AND     =   0x2c
    # Negace 
    NOT     =   0x17
    
    # Není rovno
    NE      =   0x2f
    # Větší než
    GT      =   0x30
    # Větší rovno
    GE      =   0x31
    # Menší než
    LT      =   0x32
    # Menší rovno
    LE      =   0x33
    # Rovno
    EQ      =   0x34

    # Výpis
    OUT     =   0x12
    # Otevření souboru
    FO      =   0x13
    # Přečtení čísla ze souboru 
    RN      =   0x14
    # Uzavření souboru
    FC      =   0x15
    # Zápis do souboru
    WF      =   0x16

end

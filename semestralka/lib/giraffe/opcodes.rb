module Opcodes

    # skoky, rizeni programu
    JNEQ    =   0x10
    JMP     =   0x11
    RET     =   0x0a
    CALL    =   0x09

    # operace s lokalnimu promennymi
    IPSL    =   0x1d
    IPLS    =   0x1e
    
    # operace s argumenty funkci
    PSA     =   0x2d
    PAS     =   0x2e

    # operace se zasobnikem
    IPUSH   =   0x03
    IPOP    =   0x04

    # aritmetika
    IADD    =   0x25
    ISUB    =   0x26
    IMUL    =   0x27
    IDIV    =   0x28
    IMOD    =   0x29
    INEG    =   0x2a

    # bool operace
    IOR     =   0x2b
    IAND    =   0x2c

    # porovnavani
    INE     =   0x2f
    IGT     =   0x30
    IGE     =   0x31
    ILT     =   0x32
    ILE     =   0x33
    IEQ     =   0x34

    # jine
    OUT     =   0x12

end

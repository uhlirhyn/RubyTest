# encoding: utf-8

module Giraffe

    # Obyčejný element bytecodu - číslo, opcode
    # cokoliv z Opcodes
    class Byte

        # * <tt>value</tt> hodnota (z Opcodes), kterou má Byte uchovávat
        def initialize(value)
            @value = value
        end

        # Vrátí bytecode
        attr_reader :value
    end 

    # Hák návěští
    #
    # * kotva je misto kde je navesti
    # * hak je misto kde je zapsana adresa navesti
    #
    # Protože adresa kotvy není dopředu známa,
    # musi existovat mechanizmus jak zjistit adresu
    # dopředných skoků - proto jsou tady háky, které
    # se vyhodnocuji pri finálním vypísu tak, že 
    # se podivaji do tabulky háku a kotev a tam si 
    # najdou kde nakonec skončila jejich kotva 
    class Hook

        # * <tt>label</tt> je návěští pro které je tento hák určen
        # * <tt>hook_table</tt> je reference tabulky, kde jsou při výpisu připravené dvojice návěští - adresa
        # * <tt>byte</tt> je číslo bytu 0-4, který tento hák obsahuje (adresa je 4B a musí být rozdělena - na jedno návěští tak připadají 4 Hook objekty)
        def initialize(label, hook_table, byte)
            @label = label              
            @hook_table = hook_table    # reference na tabulku haku
            # s dvojicemi label -> adresa
            @byte = byte                # kolikaty byte ze 4 to je ?
        end

        # Vrátí adresu, která odpovídá návěští
        def value
            (@hook_table[@label] >> (@byte * 8)) & 0xFF
        end
    end

end

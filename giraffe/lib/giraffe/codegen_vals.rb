
module Giraffe

    # Kotvy a haky
    # ----------------------------------------------
    # - kotva je misto kde je navesti
    # - hak je misto kde je zapsana adresa navesti
    # protoze adresa kotvy neni dopredu znama,
    # musi existovat mechanizmus jak zjistit adresu
    # doprednych skoku - proto jsou tady haky, ktere
    # se vyhodnocuji pri finalnim vypisu tak, ze 
    # se podivaji do tabulky haku a kotev a tam si 
    # najdou kde nakonec skoncila jejich kotva 

    # obycejny element
    class Byte
        def initialize(value)
            @value = value
        end
        attr_reader :value
    end 

    # label hook
    class Hook
        def initialize(label, hook_table, byte)
            @label = label              
            @hook_table = hook_table    # reference na tabulku haku
            # s dvojicemi label -> adresa
            @byte = byte                # kolikaty byte ze 4 to je ?
        end
        def value
            (@hook_table[@label] >> (@byte * 8)) & 0xFF
        end
    end

end

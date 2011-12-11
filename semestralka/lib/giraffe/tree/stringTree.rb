require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class StringTree
    
        include Debug
        include Opcodes
        
        def initialize(string)
            @string = string
        end

        def where
            "\n\tin string on line #{@tree.line}, column #{@tree.column}\n"
        end
        
        def run(env,tree)

            @tree = tree

            dbg("run",:StringTree)
          
            # nacitej znaky
            # a vloz je na stack - je to pozpatku
            # aby se dalo ze stacku vybirat v poradi
            for char in @string.reverse.each_char do
               
                # umim jenom znaky do 4B
                if char.bytesize > 4 
                    puts red(" Error: ") + 
                        orange(">4B character") + 
                        where()
                    return nil,:error
                end

                output = []

                # nejprve dopln nulove byty
                (4-char.bytesize).times do
                    output << 0x00
                end

                # pro kazdej jeho byte to vypis
                for byte in char.bytes do
                    output << byte
                end

                # zapis do bytecodu
                env.write_opcode(PUSH)
                env.write_character(output)

            end

            # alokuj v pameti tolik kolik je 
            # velikost toho stringu
            env.write_opcode(ALLOC)      
            env.write_4B(@string.size)    

            # ALOC udela to, ze sebere ty hodnoty ze stacku
            # a rovnou je nasazi do toho pole 
            
            return nil, nil
        end

    end

end



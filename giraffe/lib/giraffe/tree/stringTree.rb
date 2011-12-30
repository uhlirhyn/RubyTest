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
                              
                # zapis do bytecodu
                env.write_opcode(PUSH)
                return_value, msg = env.write_character(char)
                if msg != nil
                    puts red(" Error: ") + 
                        orange(">4B character") + 
                        where()
                end

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



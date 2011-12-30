require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    class AllocTree
    
        include Debug
        include Opcodes
        
        def initialize(expression)
            @expression = expression
        end
        
        def run(env,tree)

            dbg("run",:AllocTree)

            # kolik prvku chci ?
            return_value, msg = @expression[0].run(env,@expression[1])
            return return_value, msg if msg != nil

            # alokuj v pameti tolik kolik je 
            # velikost toho pole
            env.write_opcode(CALLOC)      

            # CALLOC udela to, naalokuje
            # pozadovanou velikost pole
            # a vynuluje ji

            # vysledkem je pole - resp. ukazatel
            return nil, nil
        end

    end

end



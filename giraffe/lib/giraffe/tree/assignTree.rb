require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    class AssignTree
    
        include Debug
        include Opcodes
        
        def initialize(target,expression)
            @target = target
            @expression = expression
        end

        # AssignTree
        # 
        # Jeho ukolem je sparovat bytecode
        # adresovani cile a bytecode hodnot
        #
        # Na leve strane muze mit totiz:
        # Locale -> pak na konci musi byt PSL
        # Argument -> pak na konci musi byt PSA
        # Indexace -> pak na konci musi byte ST
        #
        def run(env,tree)
            
            dbg("run",:AssignTree)

            # 1.) Hodnota 
            return_value, msg = @expression[0].run(env,@expression[1])
            return return_value, msg if msg != nil
           
            # 2.) Adresa + 3.) Store
            return_value, msg = @target[0].run(env,@target[1],:store)
            return return_value, msg if msg != nil

            return nil, nil
        end

    end

end



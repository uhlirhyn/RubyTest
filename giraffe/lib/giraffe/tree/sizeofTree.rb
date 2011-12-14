require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class SizeofTree
    
        include Debug
        include Opcodes
        
        def initialize(expression)
            @expression = expression
        end
        
        def run(env,tree)

            dbg("run",:SizeofTree)

            # Co chci merit ?
            return_value, msg = @expression[0].run(env,@expression[1])
            return return_value, msg if msg != nil

            # nech to spocitat
            env.write_opcode(SZOF)      

            return nil, nil
        end

    end

end



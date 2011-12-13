require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class ReadNumberTree

        include Debug
        include Opcodes
        
        def initialize(expression)
            @expression = expression
        end

        def run(env, tree)

            dbg("run",:ReadNumberTree)

            # nech vyhodnotit ten obsah
            return_value, msg = @expression[0].run(env,@expression[1])
            return return_value, msg if msg != nil
            
            env.write_opcode(RN)

            return nil, nil
        end

    end

end



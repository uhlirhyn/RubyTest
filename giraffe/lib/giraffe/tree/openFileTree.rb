require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class OpenFileTree

        include Debug
        include Opcodes
        
        def initialize(expression, mode)
            @expression = expression
            @mode = mode
        end

        def run(env, tree)

            dbg("run",:OpenFileTree)
            dbg("expression '#{@expression}'",:OpenFileTree)

            # nech vyhodnotit ten obsah
            return_value, msg = @expression[0].run(env,@expression[1])
            return return_value, msg if msg != nil
            
            # nech vyhodnotit ten mod
            return_value, msg = @mode[0].run(env,@mode[1])
            return return_value, msg if msg != nil

            env.write_opcode(FO)

            return nil, nil
        end

    end

end



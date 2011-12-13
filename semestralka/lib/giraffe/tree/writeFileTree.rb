require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class WriteFileTree

        include Debug
        include Opcodes
        
        def initialize(fd,expression)
            @fd = fd
            @expression = expression
        end

        def run(env, tree)

            dbg("run",:WriteFileTree)

            # nech vyhodnotit ten obsah
            return_value, msg = @expression[0].run(env,@expression[1])
            return return_value, msg if msg != nil
            
            # nech vyhodnotit FD
            return_value, msg = @fd[0].run(env,@fd[1])
            return return_value, msg if msg != nil
            
            env.write_opcode(WN)

            return nil, nil
        end

    end

end



require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    class ReturnTree

        include Debug
        include Opcodes

        def initialize(expression)
            @expression = expression
        end

        def where
            "\n\tin return on line #{@tree.line}, column #{@tree.column}"
        end

        def run(env,tree)

            @tree = tree
 
            dbg("run",:ReturnTree)
            return_value, msg = @expression[0].run(env,@expression[1])
            return return_value, msg if msg != nil

            # zapis return
            env.write_opcode(RET)

            # nasel jsem return
            env.return_found

            # vraci navratovy typ
            return return_value, :return
        end

    end

end



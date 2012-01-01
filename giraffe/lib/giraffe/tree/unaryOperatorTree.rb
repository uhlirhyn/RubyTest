require_relative '../debug.rb'

module Giraffe

    class UnaryOperatorTree

        include Debug

        def initialize(op,operator)
            @op = op
            @operator = operator
        end

        def where
            "\n\tin operator '#{@operator}' on line #{@tree.line}, column #{@tree.column}"
        end

        def run(env,tree)
        
            @tree = tree

            dbg("run #{@operator}",:UnaryOperatorTree)
            
            return_value, msg = @op[0].run(env,@op[1])
            return return_value, msg if msg != nil
            
            return_value, msg = @operator.call(return_value)
            return return_value, msg if msg != nil

            # operandy by mely byt ted uz pushnute na stacku
            env.write_opcode(return_value)

            return nil, nil
        end
        
    end

end



require_relative '../debug.rb'

module Giraffe

    class BinaryOperatorTree

        include Debug

        def initialize(op1,op2,operator)
            @op1 = op1
            @op2 = op2
            @operator = operator
        end

        def where
            "\n\tin operator '#{@operator}' on line #{@tree.line}, column #{@tree.column}"
        end

        def run(env, tree)

            @tree = tree

            dbg("run #{@operator}",:BinaryOperatorTree)
           
            return_value1, msg = @op1[0].run(env,@op1[1])
            return return_value1, msg if msg != nil

            return_value2, msg = @op2[0].run(env,@op2[1])
            return return_value2, msg if msg != nil

            return_value, msg = @operator.call(return_value1,return_value2)
            return return_value, msg if msg != nil

            # operandy by mely byt ted uz pushnute na stacku
            env.write_opcode(return_value)

            return nil, nil
        end
        
    end

end



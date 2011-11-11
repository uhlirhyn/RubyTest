module Giraffe

    class BinaryOperandTree

        def initialize(op1,op2,operator)
            @op1 = op1
            @op2 = op2
            @operator = operator
        end

        def run(env)
            @operator.call(@op1.run(env),@op2.run(env))
        end
        
    end

end



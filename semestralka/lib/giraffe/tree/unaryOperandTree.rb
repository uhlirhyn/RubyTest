module Giraffe

    class UnaryOperandTree

        def initialize(op,operator)
            @op = op
            @operator = operator
        end

        def run(env)
            @operator.call(@op.run(env))
        end
        
    end

end



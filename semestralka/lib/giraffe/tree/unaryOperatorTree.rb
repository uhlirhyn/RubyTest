module Giraffe

    class UnaryOperatorTree

        def initialize(op,operator)
            @op = op
            @operator = operator
        end

        def run(env)

            # UnaryOperatorTree 
            # - nezpracovava zadnou zpravu
            # - negeneruje zadnou zpravu
            # - normalni vystup je vystup operatoru

            returnValue, msg = @op.run(env)
            return returnValue, msg if msg != nil
            @operator.call(returnValue)
        end
        
    end

end



require './lib/giraffe/debug.rb'

module Giraffe

    class BinaryOperatorTree

        include Debug

        def initialize(op1,op2,operator)
            dbg("#{operator}",:BinaryOperatorTree)
            @op1 = op1
            @op2 = op2
            @operator = operator
        end

        def run(env)

            # BinaryOperatorTree 
            # - nezpracovava zadnou zpravu
            # - neprodukuje zadnou zpravu
            # - normalni vystup je vystup operatoru

            returnValue1, msg = @op1.run(env)
            return returnValue1, msg if msg != nil

            returnValue2, msg = @op2.run(env)
            return returnValue2, msg if msg != nil

            @operator.call(returnValue1,returnValue2)
        end
        
    end

end


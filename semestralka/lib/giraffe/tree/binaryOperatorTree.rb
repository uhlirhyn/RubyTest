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

            dbg("run",:BinaryOperatorTree)
            
            return_value1, msg = @op1.run(env)
            return return_value1, msg if msg != nil

            return_value2, msg = @op2.run(env)
            return return_value2, msg if msg != nil

            dbg("operands: #{return_value1} #{return_value2}",:BinaryOperatorTree)
            
            # opet, bez nil se nejede ... 
            return @operator.call(return_value1,return_value2), nil
        end
        
    end

end



require './lib/giraffe/debug.rb'

module Giraffe

    class ReturnTree

        include Debug
        
        def initialize(expression)
            @expression = expression
        end

        def run(env)
            dbg("run",:ReturnTree)
            returnValue, msg = @expression.run(env)
            return nil, msg if msg == :exit
            return returnValue, :return
        end
        
    end

end



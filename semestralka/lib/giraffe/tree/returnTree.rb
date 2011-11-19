require './lib/giraffe/debug.rb'

module Giraffe

    class ReturnTree

        include Debug
        
        def initialize(expression)
            @expression = expression
        end

        def run(env)
            dbg("run",:ReturnTree)
            return_value, msg = @expression.run(env)
            return nil, msg if msg == :exit
            dbg("returning '#{return_value}'",yellow(:ReturnTree))
            return return_value, :return
        end
        
    end

end



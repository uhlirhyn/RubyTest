require './lib/giraffe/debug.rb'

module Giraffe

    class WhileTree
    
        include Debug

        def initialize(condition,block)
            @condition = condition
            @block = block
        end

        def run(env)
            dbg("run",:WhileTree)
            while @condition.run(env) do
                @block.run(env)
            end
        end

    end

end



module Giraffe

    class WhileTree
    
        def initialize(condition,block)
            @condition = condition
            @block = block
        end

        def run(env)
            while @condition.run(env) do
                @block.run(env)
            end
        end

    end

end



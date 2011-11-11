module Giraffe

    class DoTree
    
        def initialize(condition,block)
            @condition = condition
            @block = block            
        end

        def run(env)
            loop {
                @block.run(env)                
            } while @condition.run(env)
        end

    end

end



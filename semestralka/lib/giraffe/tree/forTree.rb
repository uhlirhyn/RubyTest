module Giraffe

    class ForTree
    
        def initialize(assignment1,condition,assignment2,instructions)
            @assignment1 = assignment1           
            @condition = condition
            @assignment2 = assignment2            
            @instructions = instructions            
        end

        def run(env)
            env.raise
            @assignment1.run(env)
            while @condition.run(env) do
                for i in @instructions do 
                    i.run(env) 
                end
                @assignment2.run(env)
            end
            env.descend
        end

    end

end



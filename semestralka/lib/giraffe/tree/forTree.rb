require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'

module Giraffe

    class ForTree
    
        include Debug

        def initialize(assignment1,condition,assignment2,instructions)
            @assignment1 = assignment1           
            @condition = condition
            @assignment2 = assignment2            
            @instructions = instructions            
        end

        def run(env)
            newEnv = Env.new(env)
            @assignment1.run(newEnv)
            while @condition.run(newEnv) do
                for i in @instructions do 
                    i.run(newEnv) 
                end
                @assignment2.run(newEnv)
            end
            newEnv.destroy
        end

    end

end



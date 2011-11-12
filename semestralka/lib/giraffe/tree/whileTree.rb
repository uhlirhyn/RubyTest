require './lib/giraffe/debug.rb'

module Giraffe

    class WhileTree

        include Debug

        def initialize(condition,instructions)
            @condition = condition
            @instructions = instructions
        end

        def run(env)
            dbg("run",:WhileTree)
            dbg("@instructions.size #{@instructions.size}",:WhileTree)
            while @condition.run(env) do
                for i in @instructions do 
                    i.run(env) 
                end
            end
        end

    end

end



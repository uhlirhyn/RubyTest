module Giraffe

    class EnvTree

        def initialize(instructions)
            @instructions = instructions
        end
        
        def run(env)
            env.raise
            for i in @instructions do 
                i.run(env) 
            end
            env.descend
        end

    end

end



require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'

module Giraffe

    class EnvTree

        include Debug

        def initialize(instructions)
            @instructions = instructions
        end
        
        def run(env)
            newEnv = Env.new(env)
            for i in @instructions do 
                i.run(newEnv) 
            end
            newEnv.destroy
        end

    end

end



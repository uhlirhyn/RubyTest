require './lib/giraffe/debug.rb'

module Giraffe

    class VarTree

        include Debug

        def initialize(id)
            @id = id
        end

        def run(env)
            dbg("run",:VarTree)
            env.var(@id)
        end
        
    end

end



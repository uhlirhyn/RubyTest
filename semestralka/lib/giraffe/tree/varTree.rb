require './lib/giraffe/debug.rb'

module Giraffe

    class VarTree

        include Debug

        def initialize(id)
            @id = id
        end

        def run(env)

            # VarTree
            # - nezpracovava zadnou zpravu
            # - negeneruje zadnou zpravu
            # - normalni vystup je hodnota promenne

            dbg("run",:VarTree)
            returnValue, msg = env.var(@id)
            return returnValue, nil
        end
        
    end

end



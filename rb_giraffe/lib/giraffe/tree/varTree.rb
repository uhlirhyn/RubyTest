require './lib/giraffe/debug.rb'

module Giraffe

    class VarTree

        include Debug

        def initialize(id)
            @id = id
        end

        def run(env,tree)

            # VarTree
            # - nezpracovava zadnou zpravu
            # - negeneruje zadnou zpravu
            # - normalni vystup je hodnota promenne

            dbg("run",:VarTree)
            return_value, msg = env.var(@id)
            return msg != nil ? [return_value, msg] : [return_value, nil]
        end
        
    end

end



require './lib/giraffe/debug.rb'

module Giraffe

    class ClassTree

        include Debug

        def initialize(id, instructions, super_class=nil)
            dbg("initialize",:ClassTree)
            @id = id
            @instructions = instructions
            @super_class = super_class
        end

        def run(env)

            # ClassTree
            # - nezpracovava zadnou zpravu
            # - negeneruje zadnou zpravu
            # - normalni vystup je hodnota promenne

            dbg("run",:ClassTree)
            env.cls!(@id,@instructions,@super_class,env)
            return nil, nil
        end
        
    end

end



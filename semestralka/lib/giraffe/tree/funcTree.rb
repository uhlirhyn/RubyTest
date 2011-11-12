require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'

module Giraffe

    class FuncTree
    
        include Debug

        def initialize(id,params,block)
            dbg("initialize",:FuncTree)
            @id = id
            @params = params
            @block = block            
        end

        def run(env)

            # probehla deklarace funkce
            func = env.func!(@id,@params,@block,env)

        end

    end

end



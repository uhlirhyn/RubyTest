module Giraffe

    class FuncTree
    
        def initialize(id,params,block)
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



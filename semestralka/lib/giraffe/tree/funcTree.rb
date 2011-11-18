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

            # U definice funkce se nevyhodnocuje vubec nic
            # zadavaji se pevne identifikatory takze tento
            # uzel neprodukuje ani zpravy ani hodnoty
            
            # FuncTree
            # - nezpracovava zadnou zpravu
            # - negeneruje zadnou zpravu
            # - normalni vystup je hodnota promenne

            # probehla deklarace funkce
            env.func!(@id,@params,@block,env)
            return nil, nil
        end

    end

end



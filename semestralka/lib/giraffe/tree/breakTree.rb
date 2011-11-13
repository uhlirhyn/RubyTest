require './lib/giraffe/debug.rb'

module Giraffe

    class BreakTree

        include Debug
        
        def run(env)

            # BreakTree
            # - produkuje :break
            # - nezpracovava zadnou zpravu
            # - normalni vystup je nil
            
            # TODO: mohl by posilat navesti aby 
            # slo vyskakovat do nadrazenych cyklu

            dbg("run",:BreakTree)
            return nil, :break
        end
        
    end

end



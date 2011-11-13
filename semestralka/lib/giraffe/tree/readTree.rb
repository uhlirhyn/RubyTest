require './lib/giraffe/debug.rb'

module Giraffe

    class ReadTree

        include Debug

        def run(env)

            # ReadTree
            # - nezpracovava zadnou zpravu
            # - neprodukuje zadnou zpravu
            # - normalni vystup je nactena hodnota

            dbg("run",:ReadTree)
            # STDIN !! jinak to bude kolidovat se zdrojakem
            # ktery nacita ANTLR3 pres ten svuj filestream
            input = (STDIN.gets).chomp!
            return input, nil
        end
        
    end

end



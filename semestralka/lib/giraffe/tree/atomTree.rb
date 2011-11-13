require './lib/giraffe/debug.rb'

module Giraffe

    class AtomTree

        include Debug
        
        def initialize(value)
            @value = value
        end

        def run(env)

            # AtomTree 
            # - nezpracovava zadnou zpravu
            # - neprodukuje zadnou zpravu
            # - normalni vystup je hodnota

            dbg("run",:AtomTree)
            @value 
        end
        
    end

end



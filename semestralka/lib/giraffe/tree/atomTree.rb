require './lib/giraffe/debug.rb'

module Giraffe

    class AtomTree

        include Debug
        
        def initialize(value)
            @value = value
            dbg("init",:AtomTree)
        end

        def run(env)

            # AtomTree 
            # - nezpracovava zadnou zpravu
            # - neprodukuje zadnou zpravu
            # - normalni vystup je hodnota

            dbg("run",:AtomTree)
            dbg("value[0] #{@value[0]}",:AtomTree)

            return @value, nil
        end

    end

end



require './lib/giraffe/debug.rb'

module Giraffe

    class AtomTree

        include Debug
        
        def initialize(evaluator)
            @evaluator = evaluator
        end

        def run(env)
            dbg("run",:AtomTree)
            @evaluator.call(env)
        end
        
    end

end



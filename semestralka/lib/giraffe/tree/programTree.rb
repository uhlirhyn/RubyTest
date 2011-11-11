require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'

module Giraffe

    class ProgramTree
    
        include Debug

        def initialize(instructions)
            dbg("ProgramTree initialized",:ProgramTree)
            @instructions = instructions
            @env = Env.new
        end
        
        def run
            dbg("run",:ProgramTree)
            dbg("@instructions.size #{@instructions.size}",:ProgramTree)
            for i in @instructions do 
                i.run(@env) 
            end
        end

    end

end



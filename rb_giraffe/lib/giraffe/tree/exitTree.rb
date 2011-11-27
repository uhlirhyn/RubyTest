require './lib/giraffe/debug.rb'

module Giraffe

    class ExitTree

        include Debug
        
        # exit ukoncuje beh programu
        # odkudkoliv je zavolan
        # je mozne aby byl volan s parametrem
        # ktery definuje navratovou hodnotu
        # programu jako takoveho

        def initialize(status)
            @status = status
        end

        def run(env)
            dbg("run",:ExitTree)
            return @status, :exit
        end
        
    end

end



module Giraffe

    class PrintTree
    
        def initialize(text)
            @text = text
        end

        def run(env)
            print(@text)
        end

    end

end



module Giraffe

    class PrintlTree
    
        def initialize(text)
            @text = text
        end

        def run(env)
            puts(@text.run(env))
        end

    end

end



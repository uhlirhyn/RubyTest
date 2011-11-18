module Giraffe

    class PrintTree

        def initialize(texts,newline=false)
            @texts = texts
            @newline = newline
        end

        def run(env)

            # PrintTree
            # - nezpracovava zadnou zpravu
            # - negeneruje zadnou zpravu
            # - normalni vystup je hodnota promenne

            if @texts != nil 
                for text in @texts
                    return_value, msg = text.run(env)
                    return return_value, msg if msg != nil
                    print return_value
                end
                puts if @newline
            end
            return nil, nil
        end

    end

end



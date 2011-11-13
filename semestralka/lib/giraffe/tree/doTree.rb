module Giraffe

    class DoTree

        def initialize(condition,instructions)
            @condition = condition
            @instructions = instructions
        end

        def run(env)

            # DoTree
            # - @instructions zpracovava :break
            # - @condition nezpracovava zadnou zpravu
            # - neprodukuje zadnou zpravu
            # - normalni vystup je nil

            begin 
                for i in @instructions do 
                    returnValue, msg = i.run(env)
                    if msg != nil 
                        return msg == :break ? [nil, nil] : [returnValue, msg]
                    end
                end

                # while podminka
                returnValue, msg = @condition.run(env)
                return returnValue, msg if msg == :exit

            end while returnValue

            return nil, nil
        end

    end

end



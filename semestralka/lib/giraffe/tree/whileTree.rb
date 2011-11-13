require './lib/giraffe/debug.rb'

module Giraffe

    class WhileTree

        include Debug

        def initialize(condition,instructions)
            @condition = condition
            @instructions = instructions
        end

        def run(env)

            # WhileTree 
            # - @condition nezpracovava zadnou zpravu
            # - @instructions zpracovava :break
            # - neprodukuje zadnou zpravu
            # - normalni vystup je nil

            dbg("run",:WhileTree)
            dbg("@instructions.size #{@instructions == nil ? nil : @instructions.size}",:WhileTree)

            # while podminka pri prvnim spusteni
            returnValue, msg = @condition.run(env)
            return returnValue, msg if msg != nil

            while returnValue do
                for i in @instructions do 
                    returnValue, msg = i.run(env) 
                    if msg != nil 
                        return msg == :break ? [nil, nil] : [returnValue, msg]
                    end
                end

                # while podminka pri testovani z cyklu
                returnValue, msg = @condition.run(env)
                return returnValue, msg if msg != nil

            end

            return nil, nil
        end

    end

end



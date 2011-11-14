require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'

module Giraffe

    class ForTree

        include Debug

        def initialize(assignment1,condition,assignment2,instructions)
            @assignment1 = assignment1           
            @condition = condition
            @assignment2 = assignment2            
            @instructions = instructions            
        end

        def run(env)
            newEnv = Env.new(env)
            returnValue, msg = innerRun(env)
            newEnv.destroy
            return returnValue, msg
        end

        private 
        def innerRun(env)

            # deklarace
            returnValue = msg = nil

            # assignment muze preposlat maximalne :exit
            returnValue, msg = @assignment1.run(env)
            return returnValue, msg if msg == :exit
            
            # exit - preposlat
            # return - preposlat
            # break - vyskocit

            returnValue, msg = @condition.run(env)
            return returnValue, msg if msg != :nil

            while returnValue do
                for i in @instructions do 
                    returnValue, msg = i.run(env)
                    if msg != nil
                        return msg == :break ? [nil, nil] : [returnValue, msg]
                    end
                end
            
                # assignment muze preposlat maximalne :exit
                returnValue, msg = @assignment2.run(env)
                return returnValue, msg if msg == :exit
            
            end

            # ForTree normalne nevraci ani hodnotu ani zpravu
            return nil, nil
        end

    end

end



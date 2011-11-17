require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'

module Giraffe

    class ForTree

        include Debug

        def initialize(assignment1,condition,assignment2,instructions)
            dbg("run",:ForTree)
            @assignment1 = assignment1           
            @condition = condition
            @assignment2 = assignment2            
            @instructions = instructions            
        end

        def run(env)
            
            # TODO viz Env.gdoc
            
            #newEnv = Env.new(env)
            #returnValue, msg = innerRun(newEnv)
            #newEnv.destroy
            returnValue, msg = innerRun(env)
            return returnValue, msg
        end

        private 
        def innerRun(env)

            dbg("run",:ForTree)

            # deklarace
            returnValue = msg = nil

            # assignment muze preposlat maximalne :exit
            returnValue, msg = @assignment1.run(env)
            return returnValue, msg if msg == :exit
            dbg("assignment1 OK",:ForTree)

            # exit - preposlat
            # return - preposlat
            # break - vyskocit

            returnValue, msg = @condition.run(env)
            return [returnValue, msg] if msg != nil
            dbg("condition OK",:ForTree)

            while returnValue do
                for i in @instructions do 
                    returnValue, msg = i.run(env)
                    dbg("INST '#{returnValue}' '#{msg}'",:ForTree)
                    if msg != nil
                        return msg == :break ? [nil, nil] : [returnValue, msg]
                    end
                end
                dbg("instructions OK",:ForTree)
            
                # assignment muze preposlat maximalne :exit
                returnValue, msg = @assignment2.run(env)
                return returnValue, msg if msg == :exit
                dbg("assignment2 OK",:ForTree)
           
                # pro vyhodnoceni while 
                returnValue, msg = @condition.run(env)
                return returnValue, msg if msg != nil
                dbg("condition '#{returnValue}' '#{msg}'",:ForTree)

            end

            # ForTree normalne nevraci ani hodnotu ani zpravu
            return nil, nil
        end

    end

end



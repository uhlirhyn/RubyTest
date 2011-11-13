require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'

module Giraffe

    class ProgramTree

        include Debug

        def initialize(instructions)
            dbg("ProgramTree initialized",:ProgramTree)
            @instructions = instructions
        end

        def run
            env = Env.new            
            dbg("run",:ProgramTree)
            dbg("@instructions.size #{@instructions == nil ? 0 : @instructions.size}",:ProgramTree)

            # deklarace
            returnValue = msg = nil

            for i in @instructions do 
                returnValue, msg = i.run(env) 
                case msg 
                when :return then raise "Unexpected return"
                when :break then raise "Unexpected break"
                when :exit then onExit(returnValue); return
                end
            end

            onExit

        end

        private 
        def onExit(code=1)
            # TODO
            dbg("exit - status: #{code}",:ProgramTree)  
        end

    end

end



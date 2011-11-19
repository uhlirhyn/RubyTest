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
            return_value = msg = nil

            for i in @instructions do 
                return_value, msg = i.run(env) 
                case msg 
                when :break 
                    puts red("RuntimeError: ") + "Unexpected break"
                    on_exit(-1)
                    return
                when :exit, :return 
                    on_exit(return_value)
                    return
                when :error 
                    puts red("RuntimeError: ") + return_value
                    on_exit(-1)
                    return 
                end
            end

            dbg("out of instructions - success",:ProgramTree)
            on_exit

        end

        private 
        def on_exit(code=1)
            # TODO
            dbg("exit - status: #{code}",:ProgramTree)  
        end

    end

end



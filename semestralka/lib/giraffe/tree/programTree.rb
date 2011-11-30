require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'

module Giraffe

    class ProgramTree

        include Debug

        def initialize(functions)
            dbg("ProgramTree initialized",:ProgramTree)
            @functions = functions
            @env = Env.new()            
        end

        def run
            dbg("run",:ProgramTree)

            # deklarace
            return_value = msg = nil

            for i in @functions do 
                return_value, msg = i[0].run(@env,i[1]) 
                case msg 
                when :break 
                    puts red("Error: ") + "Unexpected break"
                    on_exit(-1)
                    return
                when :exit, :return 
                    on_exit(return_value)
                    return
                when :error 
                    puts red("Error: ") + return_value
                    on_exit(-1)
                    return 
                end
            end

            dbg("out of instructions - success",:ProgramTree)
            on_exit

        end

        private 
        def on_exit(code=1)
           
            File.open("out.grfc","wb") do
                |f|
                print("------------------------------------\n")
                for byte in Env::bytecode do
                    f.write(byte.chr)
                    printf(":: 0x#{byte.to_s(16)}\n");
                end
                print("------------------------------------\n")
            end

            dbg("exit - status: #{code}",:ProgramTree)  
        end

    end

end



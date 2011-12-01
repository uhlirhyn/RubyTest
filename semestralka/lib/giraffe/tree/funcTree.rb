require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class FuncTree
    
        include Debug
        include Opcodes

        def initialize(id,params,instructions)
            dbg("initialize",:FuncTree)
            @id = id
            @params = params
            @instructions = instructions
        end

        def where
            "\n\tin function '#{@id}' on line #{@tree.line}, column #{@tree.column}"
        end
        
        def run(env,tree)

            dbg("run #{@id} #{tree.line},#{tree.column}",:FuncTree)
            
            # probehla deklarace funkce
            env.func!(@id, @params)
            
            # zaloz si nove izolovane prostredi
            env = Env.new(nil)

            # registruj nazvy parametru
            env.register_params(@params)
            
            for i in @instructions do 
                return_value, msg = i[0].run(env,i[1]) 
                case msg
                when :break 
                    return orange("Unexpected break") + where(), :error
                when :exit, :return 
                    break               # dead code elimination ...
                when :error 
                    puts red("Error: ") + return_value
                    on_exit(-1)
                    return 
                end
            end

            # zapis return
            env.write_opcode(RET)

            # uzavre generovani bytecodu funkce
            # presype temp_bytecode do ostreho
            # bytecodu, a da pred nej prostor
            # pro lokalni promenne
            env.seal_function
                
            return nil, nil
        end

    end

end



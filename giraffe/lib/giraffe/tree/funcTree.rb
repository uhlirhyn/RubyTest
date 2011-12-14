require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class FuncTree
    
        include Debug
        include Opcodes

        def initialize(id,params,instructions)
            @id = id
            @params = params
            @instructions = instructions
        end

        def where(place)
            "\n\tin function '#{@id}' on line #{place.line}, column #{place.column}\n"
        end
        
        def run(env,tree)

            dbg("run #{@id} #{tree.line},#{tree.column}",:FuncTree)
                
            dbg("params '#{@params}'",:FuncTree)

            # probehla deklarace funkce
            env.func!(@id, @params)
            
            # zaloz si nove izolovane prostredi
            env = Env.new

            # registruj nazvy parametru
            env.register_params(@params)
           
            # jsem v root casti
            env.return_branch_root
 
            for i in @instructions do 
                return_value, msg = i[0].run(env,i[1]) 
                return return_value, msg if msg == :error

                # tady break nema co delat
                if msg == :break
                    puts red(" Error: ") + 
                        orange("Unexpected break") + 
                        where(i[1])
                    return return_value, :error
                end

            end

            dbg("return status '#{env.return}'",:FuncTree)

            # bylo nejake return ?
            return red(" Error: ") + 
                orange("Missing return statement") + 
                where(tree), :error if env.return != true

            # uzavre generovani bytecodu funkce
            # presype temp_bytecode do ostreho
            # bytecodu, a da pred nej prostor
            # pro lokalni promenne
            env.seal_function
                
            # deklarace funkce nic nevraci 
            return nil, nil
        end

    end

end


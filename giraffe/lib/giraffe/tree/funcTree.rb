# encoding: utf-8

require_relative '../env.rb'
require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    # Generuje bytecode těla funkce
    class FuncTree
    
        include Debug
        include Opcodes

        # * <tt>id</tt> název funkce
        # * <tt>params</tt> jména argumentů
        # * <tt>instructions</tt> pole AST instrukcí
        def initialize(id,params,instructions)
            @id = id
            @params = params
            @instructions = instructions
        end

        # vrátí popis místa kde došlo k chybě
        private
        def where(place)
            "\n\tin function '#{@id}' on line #{place.line}, column #{place.column}\n"
        end
        
        # Provede traverzaci AST a vygeneruje bytecode
        # * <tt>env</tt> je předávané prostředí Env
        # * <tt>tree</tt> je soubor informací z parsersu (line, column)
        public
        def run(env,tree)

            dbg("run #{@id} #{tree.line},#{tree.column}",:FuncTree)
                
            dbg("params '#{@params}'",:FuncTree)

            # probehla deklarace funkce
            env.func!(@id, @params)
            
            # zaloz si nove izolovane prostredi
            env = Env.new(env)

            # registruj nazvy parametru
            env.register_params(@params)
           
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

            dbg("return status '#{env.is_return?}'",:FuncTree)

            # bylo nejake return ?
            return red(" Error: ") + 
                orange("Missing return statement") + 
                where(tree), :error if env.is_return? != true

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



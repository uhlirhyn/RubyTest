# encoding: utf-8

require_relative '../debug.rb'

module Giraffe

    # Spravuje veci kolem lokalnich
    # promennych a argumentu - jeho
    # ucel je vkladat na stack id
    # lokalni promenne nebo argumentu
    class VarTree

        include Debug

        # * <tt>id</tt> jméno proměnné
        def initialize(id)
            @id = id
        end

        # vrátí popis místa kde došlo k chybě
        private
        def where
            "\n\tin variable '#{@id}' on line #{@tree.line}, column #{@tree.column}\n"
        end

        # Provede traverzaci AST a vygeneruje bytecode
        # * <tt>env</tt> je předávané prostředí Env
        # * <tt>tree</tt> je soubor informací z parsersu (line, column)
        public
        def run(env,tree,direction=:load)

            @tree = tree

            dbg("run '#{@id}'",:VarTree)

            # bude se tato promenna cist ? (prava strana)
            if direction == :load

                # vloz na zasobnik svoji hodnotu
                return_value, msg = env.var(@id)
            
            else 

                # proved zapis do promenne @id
                return_value, msg = env.var!(@id)
            
            end

            # existuje takova promenna ?
            if msg == :error
                puts red("Error: ") + 
                orange("Variable '#{@id}' is not declared") +
                where 
                return nil, :error
            end

            return return_value, msg

        end

    end

end



require './lib/giraffe/debug.rb'

module Giraffe

    class VarTree

        include Debug

        def initialize(id)
            @id = id
        end

        def where
            "\n\tin variable '#{@id}' on line #{@tree.line}, column #{@tree.column}\n"
        end

        # VarTree
        #
        # Spravuje veci kolem lokalnich
        # promennych a argumentu - jeho
        # ucel je vkladat na stack id
        # lokalni promenne nebo argumentu
        # 
        def run(env,tree,direction=:load)

            @tree = tree

            dbg("run",:VarTree)

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

            # vracim typ promenne a zpravu - treba :error 
            return return_value, msg

        end

    end

end



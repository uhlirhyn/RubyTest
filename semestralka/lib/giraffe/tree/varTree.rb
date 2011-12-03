require './lib/giraffe/debug.rb'

module Giraffe

    class VarTree

        include Debug

        def initialize(id)
            @id = id
        end

        # VarTree
        #
        # Spravuje veci kolem lokalnich
        # promennych a argumentu - jeho
        # ucel je vkladat na stack id
        # lokalni promenne nebo argumentu
        # 
        def run(env,tree,direction=:load)
          
            dbg("run",:VarTree)

            # bude se tato promenna cist ? (prava strana)
            if direction == :load

                # vloz na zasobnik svoji hodnotu
                return_value, msg = env.var(@id)
                return return_value, msg if msg != nil 

            else 

                # proved zapis do promenne @id
                return_value, msg = env.var!(@id)
                return return_value, msg if msg != nil 

            end

        end
        
    end

end



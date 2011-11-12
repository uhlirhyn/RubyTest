require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'

module Giraffe

    class CallTree

        include Debug

        def initialize(id,args)
            @id = id
            @args = args
        end

        def run(env)

            # vyzvedni deklaraci funkce
            func = env.func(@id,@args)

            # vytvor novou vrstvu prostredi
            # ale na vrstve kde byla deklarovana
            # funkce, nikoliv na vrstve volani
            newEnv = Env.new(func[2])

            # zaloz promenne - argumenty
            # se vyhodnoti z volaciho prostredi
            if @args != nil 
                for i in @args.each_index do
                    newEnv.var!(func[0][i],@args[i].run(env))
                end
            end

            # spust instrukce funkce, ale opet
            # pouze v ramci jejiho prostredi
            for i in func[1] do
                i.run(newEnv)
            end

            # zavri vrstvu
            newEnv.destroy
        end

    end

end



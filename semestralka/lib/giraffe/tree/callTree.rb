module Giraffe

    class CallTree
    
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
            func[2].raise

            # zaloz promenne - argumenty
            # se vyhodnoti z volaciho prostredi
            for i in @args.each_index do
                func[2].var!(func[0][i],@args[i].run(env))
            end

            # spust instrukce funkce, ale opet
            # pouze v ramci jejiho prostredi
            for i in func[1] do
                i.run(func[2])
            end

            # zavri vrstvu
            func[2].descend
        end

    end

end



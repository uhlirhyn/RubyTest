require './lib/giraffe/debug.rb'

module Giraffe

    class Instance

        include Debug

        def initialize(clz)
            @clz = clz
        end        

        # Vytvori novou vrstvu Env - pokud je 
        # super_class, pak na jeho Env, dale
        # necha provest inicializacni instrukce
        # jako jsou staticke promenne, definice 
        # metod a obecne veskery kod, ktery se 
        # nachazi v tele tridy ... 
        def constructor
               
            super_class = @clz[2]

            # pokud mam super_class
            if super_class != nil 

                # vyzvedni deklaraci super_class
                s_clz = @clz[3].cls(super_class)

                dbg("constructing superclass '#{s_clz[0]}'",:Instance)

                # vytvor instanci super_class
                # ale uz ji nepredavej argumenty
                s_instance = Instance.new(s_clz)
                return_value, msg = s_instance.constructor
                return return_value, msg if msg != nil

                # postav novou vrstvu Env na vrstve
                # na ktere je postaven super_class
                @env = Env.new(s_instance.env)

                # TODO ... mam davat s_instance do pool ?
                # asi bych mel :)
    
            else

                @env = Env.new

            end
        
            # vykonej instrukce (zavedeni metod apod.)
            for i in @clz[1] do
                return_value, msg = i.run(@env)
                return return_value, msg if msg != nil
            end
            
            return nil, nil

        end

        def method_call(id, args, call_env)

            dbg("method_call for method '#{id}'",:Instance)
            
            # vyzvedni deklaraci 
            func = @env.func(id,args)

            # vytvor novou vrstvu prostredi
            # ale na vrstve kde byla deklarovana
            # funkce, nikoliv na vrstve volani
            # TODO env zdroj ... odkud ? Inheritance x vnorene funkce ...
            # chtelo by to neco jako kontrolu "level of Env" a vybrat max
            new_env = Env.new(@env)     # dedene funkce uvidi do obsahu tridy potomka
                                        # @env se tak ale stava nejvyssi vrstvou, takze 
                                        # nebudou fungovat vnorene funkce

            #new_evn = Env.new(func[2]) # funkce ve funkcich v potomkovi uvidi vsude po 
                                        # tride jak maji, ale dedene funkce nevidi do 
                                        # potomka 

            return_value, msg = inner_run(new_env,call_env,func,args)

            # zavri vrstvu
            new_env.destroy

            return return_value, msg

        end 

        def destructor
        end
        
        private
        def inner_run(env,call_env,func,args)

            # deklarace
            return_value = msg = nil

            # zaloz promenne - argumenty
            # se vyhodnoti z volaciho prostredi
            if args != nil 
                for i in args.each_index do
                    return_value, msg = args[i].run(call_env)
                    dbg("assigning '#{func[0][i]}' to '#{return_value}'",:Instance)
                    return return_value, msg if msg != nil

                    # zaloz ji do noveho env
                    env.var!(func[0][i],return_value)
                end
            end

            # spust instrukce metody, ale opet
            # pouze v ramci jejiho prostredi
            for i in func[1] do
                return_value, msg = i.run(env)
                case msg
                when :return then return return_value, nil
                when :exit then return return_value, msg
                when :break then raise "Unexpected break"
                end
            end

        end

        # V Ruby ma protected trochu jiny vyznam 
        # melo by fungovat podobne jako friend v C++
        # proto toho vyuziju aby se dalo chodit na 
        # env promennou primo (tim se vyresi kaskadove
        # lookup, ktery uz je implementovan v Env
        protected
        attr_reader :env

    end

end

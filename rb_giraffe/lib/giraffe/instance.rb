require './lib/giraffe/debug.rb'

module Giraffe

    class Instance

        include Debug

        def initialize(clz)
            @clz = clz
            @s_instance = nil   # instance super_class
            @env = nil
        end        

        # Vytvori novou vrstvu Env - pokud je 
        # super_class, pak na jeho Env, dale
        # necha provest inicializacni instrukce
        # jako jsou staticke promenne, definice 
        # metod a obecne veskery kod, ktery se 
        # nachazi v tele tridy ... 
        def constructor

            super_class = @clz[2]
            tree = @clz[4]

            # pokud mam super_class
            if super_class != nil 

                # vyzvedni deklaraci super_class
                return_value, msg = @clz[3].cls(super_class)
                case msg  
                when nil;
                when :error then return return_value + where("constructor of class",@clz[0],tree), msg
                else return return_value, msg
                end

                # ziskani tridy probehlo uspesne
                s_clz = return_value

                dbg("constructing superclass '#{s_clz[0]}'",:Instance)

                # vytvor instanci super_class
                # ale uz ji nepredavej argumenty
                @s_instance = Instance.new(s_clz)
                return_value, msg = @s_instance.constructor
                case msg  
                when nil;
                when :error then return return_value + where("constructor of class",@clz[0],tree), msg
                else return return_value, msg
                end

                # postav novou vrstvu Env na vrstve
                # na ktere je postaven super_class
                @env = Env.new(@s_instance.env)

                # TODO ... mam davat s_instance do pool ?
                # asi bych mel :)

            else

                @env = Env.new

            end

            # vykonej instrukce (zavedeni metod apod.)
            for i in @clz[1] do
                return_value, msg = i[0].run(@env,i[1])
                case msg  
                when nil;
                when :error then return return_value + where("constructor of class",@clz[0],tree), msg
                else return return_value, msg
                end
            end

            return nil, nil

        end

        def method_call(id, args, call_env)

            dbg("method_call for method '#{id}'",:Instance)

            # vyzvedni deklaraci 
            func, msg = @env.func(id,args)
            case msg  
            when nil;
                # pokud se hledal iniciator (metoda se stejnym nazvem jako je 
                # nazev tridy, ignoruj, ze neexistuje 
            when :error then return id == @clz[0] ? [nil, nil] : [func, msg]
            else return func, msg
            end

            # vytvor novou vrstvu prostredi
            # ale na vrstve kde byla deklarovana
            # metody, nikoliv na vrstve volani
            # 
            # Tady je potreba zjistit co je vyssi - jestli vrstva metody,
            # ze ktere se vola nebo vrstva vrstva potomka
            #
            # Dedene metody totiz musi byt povysene na Env potomka
            # ale lokalni metody zase by touhle upravou klesli pokud
            # jsou vnorene v jinych metodach
            #
            # Takze - pokud volam z potomka, urcite beru jako vychozi env
            # definicni env metody
            # 
            # Pokud volam z predka, beru jako vychozi env potomka
            new_env = Env.new(@env.level < func[2].level ? func[2] : @env)  

            return_value, msg = inner_run(new_env,call_env,func,args,id,func[3])

            # zavri vrstvu
            new_env.destroy

            return return_value, msg

        end 

        def destructor
        end

        private
        def inner_run(env,call_env,func,args,id,tree)

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
                return_value, msg = i[0].run(env,i[1])
                case msg
                when :return then return return_value, nil
                when :exit then return return_value, msg
                when :error then return return_value + where("method",id,tree), msg
                when :break then return orange("Unexpected break") + where("method",id,tree), :error
                when nil;
                else return return_value, msg
                end
            end

        end
    
        def where(place,id,tree)
            "\n\tin #{place} '#{id}' on line #{tree.line}, column #{tree.column}"
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

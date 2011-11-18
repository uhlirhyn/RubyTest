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

            dbg("run",:CallTree)
            
            # vyzvedni deklaraci funkce
            func = env.func(@id,@args)
            
            # vytvor novou vrstvu prostredi
            # ale na vrstve kde byla deklarovana
            # funkce, nikoliv na vrstve volani
            new_env = Env.new(func[2])

            return_value, msg = inner_run(new_env,env,func)

            # zavri vrstvu
            new_env.destroy

            return return_value, msg
        end

        private 
        def inner_run(env,old_env,func) 

            # deklarace
            return_value = msg = nil

            # zaloz promenne - argumenty
            # se vyhodnoti z volaciho prostredi
            if @args != nil 
                for i in @args.each_index do
                    return_value, msg = @args[i].run(old_env)
                    dbg("assigning '#{func[0][i]}' to '#{return_value}'",:CallTree)
                    return return_value, msg if msg != nil

                    # zaloz ji do noveho env
                    env.var!(func[0][i],return_value)
                end
            end

            # spust instrukce funkce, ale opet
            # pouze v ramci jejiho prostredi
            # - pokud je :return, tak ukonci blok a vycisti msg
            # - :break by tady nemel byt
            # - :exit preposilej
            for i in func[1] do
                return_value, msg = i.run(env)
                case msg
                when :return then return return_value, nil
                when :exit then return return_value, msg
                when :break then raise "Unexpected break"
                end
            end

        end

    end

end



require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'

module Giraffe

    class CallTree

        include Debug

        def initialize(id,args)
            @id = id
            @args = args
        end

        def run(env,tree)
            @tree = tree

            dbg("run #{tree.line},#{tree.column}",:CallTree)

            # vyzvedni deklaraci funkce
            func, msg = env.func(@id,@args)
            return func, msg if msg != nil

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

        def where
            "\n\tin function '#{@id}' on line #{@tree.line}, column #{@tree.column}"
        end

        def inner_run(env,old_env,func) 

            # deklarace
            return_value = msg = nil

            # zaloz promenne - argumenty
            # se vyhodnoti z volaciho prostredi
            if @args != nil 
                for i in @args.each_index do
                    return_value, msg = @args[i][0].run(old_env,@args[i][0])
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
                return_value, msg = i[0].run(env,i[1])
                case msg
                when :return then return return_value, nil
                when :exit then return return_value, msg
                when :error then return return_value + where(), msg
                when :break then return orange("Unexpected break") + where(), :error
                when nil;
                else return return_value, msg
                end
            end

        end

    end
end



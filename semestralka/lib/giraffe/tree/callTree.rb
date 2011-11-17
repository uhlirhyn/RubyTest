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

            #dbg("AST obtained with arguments #{@args}",:CallTree)
            
            # vytvor novou vrstvu prostredi
            # ale na vrstve kde byla deklarovana
            # funkce, nikoliv na vrstve volani
            newEnv = Env.new(func[2])

            returnValue, msg = innerRun(newEnv,env,func)

            # zavri vrstvu
            newEnv.destroy

            return returnValue, msg
        end

        private 
        def innerRun(env,oldEnv,func) 

            # deklarace
            returnValue = msg = nil

            # zaloz promenne - argumenty
            # se vyhodnoti z volaciho prostredi
            if @args != nil 
                for i in @args.each_index do
                    returnValue, msg = @args[i].run(oldEnv)
                    dbg("assigning '#{func[0][i]}' to '#{returnValue}'",:CallTree)
                    return returnValue, msg if msg != nil

                    # zaloz ji do noveho env
                    env.var!(func[0][i],returnValue)
                end
            end

            # spust instrukce funkce, ale opet
            # pouze v ramci jejiho prostredi
            # - pokud je :return, tak ukonci blok a vycisti msg
            # - :break by tady nemel byt
            # - :exit preposilej
            for i in func[1] do
                returnValue, msg = i.run(env)
                case msg
                when :return then return returnValue, nil
                when :exit then return returnValue, msg
                when :break then raise "Unexpected break"
                end
            end

        end

    end

end



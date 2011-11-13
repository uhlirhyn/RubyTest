require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'

module Giraffe

    # EnvTree slouzi pouze jako moznost k definovani
    # noveho prostredi pro promenne - aby tak bylo 
    # mozne mit definovanou sekci platnosti promennych
    # pro nejakou cast programu
    #
    # TODO: udelat z toho closure/proc-like vec

    class EnvTree

        include Debug

        def initialize(instructions)
            @instructions = instructions
        end

        def run(env)
            newEnv = Env.new(env)
            returnValue, msg = innerRun(newEnv)
            newEnv.destroy
            return returnValue, msg
        end

        private
        def innerRun(env)

            # deklarace
            returnValue = msg = nil

            # :exit se preposila
            # :break se preposila
            # :return se preposila
            for i in @instructions do 
                returnValue, msg = i.run(env) 
                return returnValue, msg if msg != nil
            end

        end

    end

end



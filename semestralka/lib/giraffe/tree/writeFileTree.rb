require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class WriteFileTree

        include Debug
        include Opcodes
        
        def initialize(fd,expression,alone)
            @fd = fd
            @expression = expression
            @alone = alone  # bude nekdo brat vysledek funkce ?
        end

        def run(env, tree)

            dbg("run",:WriteFileTree)

            # nech vyhodnotit ten obsah
            return_value, msg = @expression[0].run(env,@expression[1])
            return return_value, msg if msg != nil
            
            # nech vyhodnotit FD
            return_value, msg = @fd[0].run(env,@fd[1])
            return return_value, msg if msg != nil
            
            env.write_opcode(WF)

            # Az se funkce vyhodnoti, bude na stacku
            # jeji vysledek ... ten ale muze a nemusi
            # byt vyzvednut - pokud se funkce vola 
            # jako soucast vypoctu, pouzije se vysledek
            # jako operand nebo argument - jinak se 
            # ale na zasobnik zacne hromadit kupa 
            # pushnutych vypoctu, ktere nikdo neodebira
            # je proto potreba se jich zbavit, pokud 
            # je nikdo nechce
            env.write_opcode(POP) if @alone
            
            return nil, nil
        end

    end

end



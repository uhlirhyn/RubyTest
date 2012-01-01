require_relative '../env.rb'
require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    class CallTree

        include Debug
        include Opcodes

        def initialize(id,args,alone)
            @id = id
            @args = args
            @alone = alone  # bude nekdo brat vysledek funkce ?
        end

        def where
            "\n\tin call of function '#{@id}' on line #{@tree.line}, column #{@tree.column}\n"
        end

        def run(env,tree)
            @tree = tree

            dbg("run #{tree.line},#{tree.column}",:CallTree)

            # proved push argumentu pro funkci
            for a in @args
                
                return_value, msg = a[0].run(env,a[1])
                return return_value, msg if msg != nil

            end if @args != nil

            # vyzvedni deklaraci funkce
            # a vloz instrukci volani
            return_value, msg = env.func(@id,@args == nil ? 0 : @args.size)
            if msg == :error 
                puts return_value + where
                return nil, :error
            end

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

            return return_value, nil
        end

    end
end



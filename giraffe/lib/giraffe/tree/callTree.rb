# encoding: utf-8

require_relative '../env.rb'
require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    # Generuje bytecode volání funkce
    class CallTree

        include Debug
        include Opcodes

        # * <tt>id</tt> je jméno funkce, která je volána
        # * <tt>args</tt> je pole AST argumentů, se kterými se funkce volá
        # * <tt>alone</tt> je flag, udávající, zda se má po provedení funkce čistit zásobník (návratovou hodnotu nikdo neodebírá - překážela by na stacku)
        def initialize(id,args,alone)
            @id = id
            @args = args
            @alone = alone  # bude nekdo brat vysledek funkce ?
        end

        # vrátí popis místa kde došlo k chybě
        private
        def where
            "\n\tin call of function '#{@id}' on line #{@tree.line}, column #{@tree.column}\n"
        end

        # Provede traverzaci AST a vygeneruje bytecode
        # * <tt>env</tt> je předávané prostředí Env
        # * <tt>tree</tt> je soubor informací z parsersu (line, column)
        public
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



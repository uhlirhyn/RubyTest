# encoding: utf-8

require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    # Generuje bytecode ukončení provádění funkce, uložení návratové hodnoty do 
    # registru návratové hodnoty a vyčištění rámce
    class ReturnTree

        include Debug
        include Opcodes

        # * <tt>expression</tt> AST hodnoty kterou má funkce vrátit
        def initialize(expression)
            @expression = expression
        end

        # vrátí popis místa kde došlo k chybě
        private
        def where
            "\n\tin return on line #{@tree.line}, column #{@tree.column}"
        end

        # Provede traverzaci AST a vygeneruje bytecode
        # * <tt>env</tt> je předávané prostředí Env
        # * <tt>tree</tt> je soubor informací z parsersu (line, column)
        public
        def run(env,tree)

            @tree = tree
 
            dbg("run",:ReturnTree)
            return_value, msg = @expression[0].run(env,@expression[1])
            return return_value, msg if msg != nil

            # zapis return
            env.write_opcode(RET)

            # nasel jsem return
            env.return_found

            # vraci navratovy typ
            return return_value, :return
        end

    end

end



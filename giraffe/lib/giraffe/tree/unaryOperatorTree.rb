# encoding: utf-8

require_relative '../debug.rb'

module Giraffe

    # Generuje bytecode unární funkce
    class UnaryOperatorTree

        include Debug

        # * <tt>op</tt> AST operandu 
        # * <tt>operator</tt> funkce operátoru
        def initialize(op,operator)
            @op = op
            @operator = operator
        end

        # vrátí popis místa kde došlo k chybě
        private
        def where
            "\n\tin operator '#{@operator}' on line #{@tree.line}, column #{@tree.column}"
        end

        # Provede traverzaci AST a vygeneruje bytecode
        # * <tt>env</tt> je předávané prostředí Env
        # * <tt>tree</tt> je soubor informací z parsersu (line, column)
        public
        def run(env,tree)
        
            @tree = tree

            dbg("run #{@operator}",:UnaryOperatorTree)
            
            return_value, msg = @op[0].run(env,@op[1])
            return return_value, msg if msg != nil
            
            return_value, msg = @operator.call
            return return_value, msg if msg != nil

            # operandy by mely byt ted uz pushnute na stacku
            env.write_opcode(return_value)

            return nil, nil
        end
        
    end

end



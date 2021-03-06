# encoding: utf-8

require_relative '../debug.rb'

module Giraffe

    # Symbolizuje binární operaci
    class BinaryOperatorTree

        include Debug

        # * <tt>op1</tt> je AST, který generuje bytecode pro výpočet prvního operandu
        # * <tt>op2</tt> je AST, který generuje bytecode pro výpočet druhého operandu
        # * <tt>operator</tt> je funkce, která odpovídá operaci (generuje opcode operace)
        def initialize(op1,op2,operator)
            @op1 = op1
            @op2 = op2
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
        def run(env, tree)

            @tree = tree

            dbg("run #{@operator}",:BinaryOperatorTree)
           
            return_value1, msg = @op1[0].run(env,@op1[1])
            return return_value1, msg if msg != nil

            return_value2, msg = @op2[0].run(env,@op2[1])
            return return_value2, msg if msg != nil

            return_value, msg = @operator.call
            return return_value, msg if msg != nil

            # operandy by mely byt ted uz pushnute na stacku
            env.write_opcode(return_value)

            return nil, nil
        end
        
    end

end



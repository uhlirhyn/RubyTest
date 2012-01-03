# encoding: utf-8

require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    # Generuje bytecode instrukce výpisu
    class PrintTree

        include Debug
        include Opcodes

        # * <tt>texts</tt> pole AST textů k výpisu
        # * <tt>newline</tt> má se výpis ukončovat znakem nového řádku ?
        def initialize(texts,newline=false)
            @texts = texts
            @newline = newline
        end

        # Provede traverzaci AST a vygeneruje bytecode
        # * <tt>env</tt> je předávané prostředí Env
        # * <tt>tree</tt> je soubor informací z parsersu (line, column)
        def run(env,tree)
       
            dbg("run", :PrintTree)

            @tree = tree

            if @texts != nil 
                for text in @texts
                    return_value, msg = text[0].run(env,text[1])
                    return return_value, msg if msg == :error
                   
                    env.write_opcode(OUT)
                end
            end

            # nemam typ
            return nil, nil
        end
       
        # vrátí popis místa kde došlo k chybě
        private
        def where
            "\n\tin print on line #{@tree.line}, column #{@tree.column}"
        end

    end

end



# encoding: utf-8

require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    # Generuje bytecode pro zápis řetězce do paměti
    class StringTree
    
        include Debug
        include Opcodes
        
        # * <tt>string</tt> řetězec
        def initialize(string)
            @string = string
        end

        # vrátí popis místa kde došlo k chybě
        private 
        def where
            "\n\tin string on line #{@tree.line}, column #{@tree.column}\n"
        end
        
        # Provede traverzaci AST a vygeneruje bytecode
        # * <tt>env</tt> je předávané prostředí Env
        # * <tt>tree</tt> je soubor informací z parsersu (line, column)
        public
        def run(env,tree)

            @tree = tree

            dbg("run",:StringTree)
          
            # nacitej znaky
            # a vloz je na stack - je to pozpatku
            # aby se dalo ze stacku vybirat v poradi
            for char in @string.reverse.each_char do
                              
                # zapis do bytecodu
                env.write_opcode(PUSH)
                env.write_character(char)

            end

            # alokuj v pameti tolik kolik je 
            # velikost toho stringu
            env.write_opcode(ALLOC)      
            env.write_4B(@string.size)    

            # ALOC udela to, ze sebere ty hodnoty ze stacku
            # a rovnou je nasazi do toho pole 
            
            return nil, nil
        end

    end

end



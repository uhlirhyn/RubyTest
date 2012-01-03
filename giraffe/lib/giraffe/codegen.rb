# encoding: utf-8

require_relative 'opcodes.rb'
require_relative 'debug.rb'
require_relative "codegen_vals.rb"

module Giraffe

    # Třída pro generování bytecodu, zastřešuje vkládání jedno i více-bytových hodnot,
    # kontroluje celistvost bytecodu, počítá id lokálních proměnných, mapování návěští 
    # na adresy a výpis finálního bytecodu do výstupního souboru .grfc
    class Codegen 

        include Debug
        include Opcodes
        
        # založí instanci generátoru
        def initialize            
            @bytecode = [nil,nil,nil,nil]   # prvni 4byte je adresa funkce main
            @current_byte = 4               # aktualni cislo bytu ktery se bude zapisovat  

            init_function

        end

        # inicializuj pocitadla lokálních proměnných, návěští a jejich háků
        def init_function 
            @temp_bytecode = []             # bytecode pro funkce (bude se presypavat
                                            # do vysledneho bytecode, protoze funkce dopredu
                                            # nevi, kolik bude potreba locals slotu
            @locals = 0         # pocet lokalnich promennych
            @labels = 0         # pocet navesti
            @hooks = []         # mechanizmus na post-dopisovani adres navesti
        end

        attr_reader :current_byte, :locals, :bytecode

        # zvysi pocet pouzitych lokalnich promennych
        def increment_locals
            @locals += 1
        end

        private
        # spolecna metoda pro zapouzdreni Byte objektem
        def write_bytecode_to(value,target) 
            target << Byte.new(value)
            @current_byte += 1     # pricti k celkove delce
        end

        # zapíše 4B do zvoleného úložiště bytecodu (dočasné/finální)
        def write_4B_to(value,target)
            write_bytecode_to(value >> 24 & 0xFF, target)
            write_bytecode_to(value >> 16 & 0xFF, target)
            write_bytecode_to(value >> 8 & 0xFF, target)
            write_bytecode_to(value & 0xFF, target)
        end

        # zapis obecne do bytecodu
        def write_bytecode(value)
            write_bytecode_to(value, @temp_bytecode)
        end

        public
        # zapis kodu instrukce
        def write_opcode(code) 
            write_bytecode(code)
        end

        # zapis main
        def write_main(main_add)
            # POZOR !!! Tady je primo indexovani - tady se nevklada
            # takze nelze pouzit funkce write_int apod... 
            @bytecode[3] = Byte.new(main_add & 0xFF); main_add >>= 8
            @bytecode[2] = Byte.new(main_add & 0xFF); main_add >>= 8
            @bytecode[1] = Byte.new(main_add & 0xFF); main_add >>= 8
            @bytecode[0] = Byte.new(main_add & 0xFF)
        end

        # zapis nil
        def write_nil 
            write_bytecode(NULL)
            write_bytecode(0x00)
            write_bytecode(0x00)
            write_bytecode(0x00)
            write_bytecode(0x00)
        end
        
        # zapis 4B
        def write_4B(value) 
            write_4B_to(value, @temp_bytecode)
        end

        # zapis znaku (4B)
        def write_character(char) 
            write_bytecode_to(CHARACTER, @temp_bytecode)

            output = []

            # nejprve dopln nulove byty
            (4-char.bytesize).times do
                write_bytecode_to(0x00, @temp_bytecode)
            end

            # pro kazdy jeho byte to vypis
            for byte in char.bytes do
                write_bytecode_to(byte, @temp_bytecode)
            end

        end

        # zapis celeho cisla (int - 4B)
        def write_int(value) 
            write_bytecode_to(INTEGER, @temp_bytecode)
            write_4B_to(value, @temp_bytecode)
        end

        # zapis s_pointer (adresu v programu, st, ...)
        def write_s_pointer(value) 
            write_bytecode_to(S_POINTER, @temp_bytecode)
            write_4B_to(value, @temp_bytecode)
        end

        # zapis pointer
        def write_pointer(value) 
            write_bytecode_to(POINTER, @temp_bytecode)
            write_4B_to(value, @temp_bytecode)
        end

        # zapis boolean
        def write_bool(value) 
            write_bytecode_to(BOOLEAN, @temp_bytecode)
            write_4B_to(value, @temp_bytecode)
        end

        # vrati ID dalsiho navesti
        def next_label
            ret = @labels
            @labels += 1
            ret
        end

        # vlozi hak pro dany label
        def insert_hook(label)
            # aby se to mohlo korektne rozbalit pri resolve
            # je potreba udavat, kolikaty byte si to ma 
            # z kotvy brat
            # write_opcode(S_POINTER)
            @temp_bytecode << Hook.new(label,@hooks,3)
            @temp_bytecode << Hook.new(label,@hooks,2)
            @temp_bytecode << Hook.new(label,@hooks,1)
            @temp_bytecode << Hook.new(label,@hooks,0)
            @current_byte += 4 # adresa se vyhodnocuje jako 4B
        end

        # vlozi kotvu pro haky
        def insert_anchor(label)
            @hooks[label] = @current_byte
            dbg("Hooks #{@hooks} (last add '#{@current_byte}' on label '#{label}')",:Env)
        end

        # uzaviram funkci
        def seal_function
            # vloz instrukce pro vytvoreni slotu
            # pro lokalni promenne
            @locals.times do
                write_bytecode_to(PUSH, @bytecode) 
                write_bytecode_to(INTEGER, @bytecode)
                write_4B_to(0, @bytecode)  
            end

            # o ten posuv je potreba posunout i adresy 
            # navesti - takze upravit pole hooks
            # posuv je o instrukci IPUSH (1B) typ (1B)
            # a 4B 0x00 pro kazdou instrukci
            @hooks.each_index do
                |i|
                @hooks[i] += @locals * 6
            end

            # vloz puvodni bytecode funkce
            @bytecode += @temp_bytecode

            # vynuluj pocitadla
            init_function
        end

        # vypíše výsledný bytecode do výstupního souboru
        def generate(file)

            File.open(file, "wb") do
                |f|
                for byte in @bytecode do
                    f.write(byte.value.chr)
                end
            end

        end
    end
end

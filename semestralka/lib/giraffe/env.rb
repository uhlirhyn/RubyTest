require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class Env

        include Debug
        include Opcodes

        # kolik je minimalni velikost pole
        # k naalokovani ? Jinymi slovy, kdyz
        # budu alokovat a = [] tak si dopredu 
        # radeji naalokuju uz velikost napr. 2
        MIN_ALLOC = 2

        # Kotvy a haky
        # ----------------------------------------------
        # - kotva je misto kde je navesti
        # - hak je misto kde je zapsana adresa navesti
        # protoze adresa kotvy neni dopredu znama,
        # musi existovat mechanizmus jak zjistit adresu
        # doprednych skoku - proto jsou tady haky, ktere
        # se vyhodnocuji pri finalnim vypisu tak, ze 
        # se podivaji do tabulky haku a kotev a tam si 
        # najdou kde nakonec skoncila jejich kotva 

        # obycejny element
        class Byte
            def initialize(value)
                @value = value
            end
            attr_reader :value
        end 

        # label hook
        class Hook
            def initialize(label, hook_table, byte)
                @label = label
                @hook_table = hook_table
                @byte = byte
            end
            def value
                (@hook_table[@label] >> (@byte * 8)) & 0xFF
            end
        end
  
        @@functions = Hash.new(:undeclared)
        @@current_byte = 4
        @@bytecode = [0,0,0,0]    # prvni 4byte je adresa funkce main

        def initialize(super_env=nil)
            dbg("initialize (envID: #{self.object_id})",:Env)
            @variables = Hash.new(:undeclared)
            @classes = Hash.new(:undeclared)
            @arguments = Hash.new(:undeclared)
            @super_env = super_env
            @level = @super_env == nil ? 0 : @super_env.level + 1

            @temp_bytecode = []
            @locals = 0
            @labels = 0
            @hooks = []        # mechanizmus na post-dopisovani adres navesti
            
        end

        attr_reader :level, :bytecode
       
        def self.bytecode
            @@bytecode
        end

        private
        # spolecna metoda pro zapouzdreni Byte objektem
        def write_bytecode_to(value,target) 
            target << Byte.new(value)
            @@current_byte += 1     # pricti k celkove delce
        end

        def write_int_to(value,target)
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

        # zapis celeho cisla (int - 4B)
        def write_int(value) 
            write_int_to(value, @temp_bytecode)
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
            @temp_bytecode << Hook.new(label,@hooks,3)
            @temp_bytecode << Hook.new(label,@hooks,2)
            @temp_bytecode << Hook.new(label,@hooks,1)
            @temp_bytecode << Hook.new(label,@hooks,0)
            @@current_byte += 4 # adresa se vyhodnocuje jako 4B
        end

        # vlozi kotvu pro haky
        def insert_anchor(label)
            @hooks[label] = @@current_byte
            dbg("Hooks #{@hooks}",:Env)
        end

        # chci cist z lokalni promenne (nebo argumentu)
        def var(id)           
            
            # Zkus promennou najit nejprve v locals
            variable = @variables[id]

            if variable == :undeclared
               
                variable = @arguments[id]
             
                # Tak to jeste zkus v argumentech
                if variable == :undeclared
                    # tak to fakt neznam 
                    return orange("Variable '#{id}' is not declared"), :error
                else
                    write_opcode(PAS)       # budu zapisovat na zasobnik argument
                    write_int(variable)     # jeho id
                end
            else 
                write_opcode(IPLS)          # budu zapisovat na zasobnik lokalni promennou
                write_int(variable)         # jeji id
            end
        end

        # chci zapisovat do lokalni promenne (nebo argumentu)
        # dej mi jeji cislo ktere ma, pokud 
        # existuje - nebo ji vytvor a pak mi
        # dej jeji cislo ... 
        def var!(id)
            variable = @variables[id]
            
            # pokud to neni promenna
            if variable == :undeclared

                # zkontroluje jestli to neni argument
                variable = @arguments[id]
                if variable != :undeclared
                    write_opcode(PSA)
                    write_int(variable)         # jeho id
                else
                    @variables[id] = @locals    # jde zaroven o deklaraci
                    write_opcode(IPSL)          # zapis obsah zasobniku do lokalni promenne
                    write_int(@locals)
                    @locals += 1
                end
            else
                return variable
            end
        end
        
        # volam funkci
        def func(id,args) 
            function = @@functions[id]
            if function == :undeclared 
                return orange("Function '#{id}' is not declared"), :error
            elsif (args == nil ? 0 : args.size) != function[1] 
                return orange("Function '#{id}' with #{function[1]} arguments is not declared"), :error
            else 
                # zavolej funkci
                # parametry uz by tady mely byt
                # vloz call a adresu funkce
                write_opcode(CALL)
                write_int(function[0])

                # je potreba uklidit po sobe parametry
                # navratovou hodnotu tim nemazu, ta je
                # uklizena do navratoveho registru ;)
                (args == nil ? 0 : args.size).times do
                    write_opcode(IPOP)
                end

                # push obsahu navratoveho registru
                write_opcode(RER)
            end
        end

        # zakladam funkci
        def func!(id, params)
            function = @@functions[id]
            if function == :undeclared 
                # funkce je identifikovana svoji adresou
                # a poctem parametru (ten je tady jen pro compile kontrolu)
                @@functions[id] = [@@current_byte, params == nil ? 0 : params.size]
                
                # pokud jsem definoval main, pak aktualni adresu dej do hlavicky
                if id == "main" 
                    main_add = @@current_byte
                    dbg("Main found on address #{main_add}",:Env)
                    # POZOR !!! Tady je primo indexovani - tady se nevklada
                    # takze nelze pouzit funkce write_int apod... 
                    @@bytecode[3] = Byte.new(main_add & 0xFF); main_add >>= 8
                    @@bytecode[2] = Byte.new(main_add & 0xFF); main_add >>= 8
                    @@bytecode[1] = Byte.new(main_add & 0xFF); main_add >>= 8
                    @@bytecode[0] = Byte.new(main_add & 0xFF)
                end

            else 
                return orange("Function '#{id}' is already defined"), :error
            end
        end

        # zakladam argumenty pro funkci
        def register_params(params)
            return if params == nil
            arg_i = params.size - 1
            for p in params 
                @arguments[p] = arg_i
                arg_i -= 1
            end
        end

        # uzaviram funkci
        def seal_function
            # vloz instrukce pro vytvoreni slotu
            # pro lokalni promenne
            @variables.size.times do
                write_bytecode_to(IPUSH, @@bytecode)    
                write_int_to(0, @@bytecode)  
            end

            # o ten posuv je potreba posunout i adresy 
            # navesti - takze upravit pole hooks
            # posuv je o instrukci IPUSH (1B) a 4B 0x00
            # pro kazdou instrukci
            @hooks.each_index do
                |i|
                @hooks[i] += @variables.size * 5
            end

            # vloz puvodni bytecode funkce
            @@bytecode += @temp_bytecode
        end

    end

end

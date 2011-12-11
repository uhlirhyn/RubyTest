require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class Env

        include Debug
        include Opcodes
        
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

        # variable
        class Var
            def initialize(id)
                @id = id        # id na stacku
            end

            attr_reader :id
        end

        # funkce 
        class Func
            def initialize(id,args)
                @id = id        # jeji adresy v BC
                @args = args    # argumenty
            end

            def args_size 
                @args == nil ? 0 : @args.size
            end

            attr_reader :id, :args
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
            
            @return_depth = 0
            @return_branching = [0]
            @return_code_part = []
        end

        # pro kazdou hloubku je tam polozka pole 
        #  
        #  @return_branching 
        #       - do nej se zapisuje :if a :else pri nalezeni return
        #
        #  @return_code_part 
        #       - sem se pise pozice v kodu (jsem v if, else, cykl, -root-)
        #
        # - v nem je zprvu nil
        # - pokud se najde return v ifu a je tam nil, da se tam :if
        # - pokud tam uz if je nic se nedela
        # - pokud se najde return v else a je tam :if, da se tam true
        # - pokud tam je nil, nic se nedela
        # - hloubka se povazuje za uzavrenou pokud ma u sebe true

        # je tedy return pro tuto funkci ?
        def return 
            @return_branching[0]    # odpoved lezi v korenove vrstve 
        end

        # jsem v if 
        def return_branch_if
            @return_code_part[@return_depth] = :if
        end

        # jsem v else
        def return_branch_else
            @return_code_part[@return_depth] = :else
        end
    
        # jsem v cyklu
        def return_branch_cycle
            @return_code_part[@return_depth] = :cycle
        end

        # jsem v root
        def return_branch_root
            @return_code_part[@return_depth] = nil
        end

        # ponoril jsem se do vetveni
        def return_dive
            @return_depth += 1 
            @return_branching[@return_depth] = nil
            dbg("return_dive #{@return_depth}",:Env)
        end

        # vynoril jsem se z vetveni
        def return_rise
            # byla hloubka pokryta ?
            # pokud ano, je to jako bych nasel return
            # na vrstve nademnou
            if @return_branching[@return_depth] == true
                @return_depth -= 1
                return_found
            else 
                @return_depth -= 1
            end

            dbg("return_rise #{@return_depth}",:Env)
        end

        def return_found
            case @return_code_part[@return_depth]    # jsem v if, else ...
            when nil # root - return je primo na urovni kodu funkce
                @return_branching[0] = true
            when :cycle
                # cykl bych musel proverit jeho podminku a to jestli
                # se aspon jednou provede ... a to neumim - takze jakoby
                # tady return nebyl ...
                # @return_branching[0] = false
            when :if
                @return_branching[@return_depth] = :if if @return_branching[@return_depth] == nil
            when :else
                @return_branching[@return_depth] = true if @return_branching[@return_depth] == :if
            end
 
            dbg("return_found #{@return_code_part[@return_depth]}",:Env)
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
        def write_character(value) 
            write_bytecode_to(CHARACTER, @temp_bytecode)
            write_bytecode_to(value[0], @temp_bytecode)
            write_bytecode_to(value[1], @temp_bytecode)
            write_bytecode_to(value[2], @temp_bytecode)
            write_bytecode_to(value[3], @temp_bytecode)
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
            @@current_byte += 4 # adresa se vyhodnocuje jako 4B
        end

        # vlozi kotvu pro haky
        def insert_anchor(label)
            @hooks[label] = @@current_byte
            dbg("Hooks #{@hooks} (last add '#{@@current_byte}' on label '#{label}')",:Env)
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
                    return nil,:error
                else
                    write_opcode(PAS)           # budu zapisovat na zasobnik argument
                    write_4B(variable.id)      # jeho id
                    return nil, nil  
                end
            else 
                write_opcode(PLS)           # budu zapisovat na zasobnik lokalni promennou
                write_4B(variable.id)      # jeji id
                return nil, nil
            end

        end

        # deklaruje promennou
        def declare(id)

            # zjisti zda promenna jiz neexistuje
            variable = @variables[id]
            if variable != :undeclared 
                return nil,:error
            end

            # zjisti jestli promenna jiz neexistuje
            # a je deklarovana jako argument
            variable = @arguments[id]
            if variable != :undeclared 
                return nil,:error
            end

            # jinak ji deklaruj
            @variables[id] = Var.new(@locals)
            @locals += 1

            return @variables[id], nil

        end

        # chci zapisovat do lokalni promenne (nebo argumentu)
        # dej mi jeji cislo ktere ma, pokud 
        # existuje - pokud ne - chyba 
        def var!(id)
            variable = @variables[id]

            # pokud to neni promenna
            if variable == :undeclared

                # zkontroluje jestli to neni argument
                variable = @arguments[id]
                if variable != :undeclared
                    write_opcode(PSA)
                    write_4B(variable.id)      # jeho id
                    return nil, nil  
                                    
                else 
                    return_value, msg = declare(id)
                    return return_value, msg if msg != nil
                    variable = return_value
                end
            end

            # spolecne pro nove 
            # deklarovane, a uz
            # deklarovane 

            # zapis obsah zasobniku 
            # do lokalni promenne
            write_opcode(PSL)
            write_4B(variable.id)
            return nil, nil
        end

        # volam funkci
        def func(id, args)

            function = @@functions[id]

            # je deklarovana ?
            if function == :undeclared 
                return red("Error: ") + 
                    orange("Function '#{id}' is not declared"), :error
            end

            # ma stejny pocet argumentu ?
            if args.size != function.args_size
                return red("Error: ") + 
                    orange("Function '#{id}' with #{args.size} arguments is not declared"), :error
            end

            # zavolej funkci
            # parametry uz by tady mely byt
            # vloz call a adresu funkce
            write_opcode(CALL)
            write_4B(function.id)

            # je potreba uklidit po sobe parametry
            # navratovou hodnotu tim nemazu, ta je
            # uklizena do navratoveho registru ;)
            args.size.times do
                write_opcode(POP)
            end

            # push obsahu navratoveho registru
            write_opcode(RER)

            return nil, nil
        end

        # zakladam funkci
        def func!(id, params)
            function = @@functions[id]
            if function == :undeclared 

                # funkce je identifikovana svoji adresou
                # a poctem parametru (to je tady jen pro compile kontrolu)
                parameters = []
                for p in params do
                    parameters << Var.new(p)    # prevede do Var
                end
                @@functions[id] = Func.new(@@current_byte, parameters)

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
            dbg("registering params #{params}",:Env)
            return if params == nil
            arg_i = params.size - 1
            for p in params 
                @arguments[p] = Var.new(arg_i)
                arg_i -= 1
            end
        end

        # uzaviram funkci
        def seal_function
            # vloz instrukce pro vytvoreni slotu
            # pro lokalni promenne
            @variables.size.times do
                write_bytecode_to(PUSH, @@bytecode) 
                write_bytecode_to(INTEGER, @@bytecode)
                write_4B_to(0, @@bytecode)  
            end

            # o ten posuv je potreba posunout i adresy 
            # navesti - takze upravit pole hooks
            # posuv je o instrukci IPUSH (1B) typ (1B)
            # a 4B 0x00 pro kazdou instrukci
            @hooks.each_index do
                |i|
                @hooks[i] += @variables.size * 6
            end

            # vloz puvodni bytecode funkce
            @@bytecode += @temp_bytecode
        end

    end

end

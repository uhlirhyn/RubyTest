require_relative 'debug.rb'
require_relative 'codegen.rb'
require_relative 'opcodes.rb'

module Giraffe

    class Env

        include Debug
        include Opcodes
       
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

        def initialize(super_env=nil)
            dbg("initialize (envID: #{self.object_id})",:Env)
            dbg("super_envID #{super_env.object_id}",:Env) if super_env != nil
            @variables = Hash.new(:undeclared)
            @classes = Hash.new(:undeclared)
            @arguments = Hash.new(:undeclared)
            @super_env = super_env
            
            # dedeni 
            if @super_env != nil
                @level = @super_env.level + 1
                @codegen = @super_env.codegen
                @functions = @super_env.functions
            else 
                @level = 0
                @codegen = Codegen.new
                @functions = Hash.new(:undeclared)
            end
            
            dbg(red(@functions),:Env)
            @return_depth = 0
            @return_branching = [nil]
            @return_code_part = []
        end

        attr_reader :codegen, :level

        # zapis kodu instrukce
        def write_opcode(code) 
            @codegen.write_opcode(code)
        end

        # zapis nil
        def write_nil 
            @codegen.write_nil
        end
        
        # zapis 4B
        def write_4B(value) 
            @codegen.write_4B(value)
        end

        # zapis znaku (4B)
        def write_character(char) 
            @codegen.write_character(char)
        end

        # zapis celeho cisla (int - 4B)
        def write_int(value) 
            @codegen.write_int(value)
        end

        # zapis s_pointer (adresu v programu, st, ...)
        def write_s_pointer(value) 
            @codegen.write_s_pointer(value)
        end

        # zapis pointer
        def write_pointer(value) 
            @codegen.write_pointer(value)
        end

        # zapis boolean
        def write_bool(value) 
            @codegen.write_bool(value)
        end

        # vrati ID dalsiho navesti
        def next_label
            @codegen.next_label
        end

        # vlozi hak pro dany label
        def insert_hook(label)
            @codegen.insert_hook(label)
        end

        # vlozi kotvu pro haky
        def insert_anchor(label)
            @codegen.insert_anchor(label)
        end

        # uzaviram funkci
        def seal_function
            @codegen.seal_function
        end

        protected
        def functions
            @functions
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
        public
        def is_return?
            @return_branching[0]    # odpoved lezi v korenove vrstve 
        end

        # jsem v if 
        def return_branch_if
            return_dive
            @return_code_part[@return_depth] = :if
        end

        # jsem v else
        def return_branch_else
            @return_code_part[@return_depth] = :else
        end
    
        # jsem v cyklu
        def return_branch_cycle
            return_dive
            @return_code_part[@return_depth] = :cycle
        end

        private
        # ponoril jsem se do vetveni
        def return_dive
            @return_depth += 1 
            @return_branching[@return_depth] = nil
            dbg("return_dive #{@return_depth}",:Env)
        end

        public
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
                    write_4B(variable)          # jeho id
                    return nil, nil  
                end
            else 
                write_opcode(PLS)           # budu zapisovat na zasobnik lokalni promennou
                write_4B(variable)          # jeji id
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
            @variables[id] = @codegen.locals
            @codegen.increment_locals

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
                    write_4B(variable)      # jeho id
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
            write_4B(variable)
            return nil, nil
        end

        # volam funkci
        def func(id, args)

            function = @functions[id]

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

            function = @functions[id]
            if function == :undeclared 

                # funkce je identifikovana svoji adresou
                # a poctem parametru (to je tady jen pro compile kontrolu)
                parameters = []
                for p in params do
                    parameters << p     
                end
                @functions[id] = Func.new(@codegen.current_byte, parameters)

                # pokud jsem definoval main, pak aktualni adresu dej do hlavicky
                if id == "main" 
                    main_add = @codegen.current_byte
                    dbg("Main found on address #{main_add}",:Env)
                    @codegen.write_main(main_add)  
                end

            else 
                return orange("Function '#{id}' is already defined"), :error
            end
        end

        # zakladam argumenty pro funkci
        # pri deklaraci funkce
        def register_params(params)
            dbg("registering params #{params}",:Env)
            return if params == nil
            arg_i = params.size - 1
            for p in params 
                @arguments[p] = arg_i
                arg_i -= 1
            end
        end
        
    end

end

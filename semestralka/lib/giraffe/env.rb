require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class Env

        include Debug
        include Opcodes
  
        @@inst_pool = []
        @@labels = 0
        @@break_labels = 0
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
            @args = 0
            
        end

        attr_reader :level, :bytecode
       
        def self.bytecode
            @@bytecode
        end

        # zapis do bytecodu
        def write_bytecode(code) 
            @temp_bytecode << code
            @@current_byte += 1     # pricti k celkove delce
        end

        # vrati ID dalsiho navesti
        def next_label
            "L#{@@labels += 1}"
        end

        # zalozi novy break_label
        def next_break_label
            "B#{@@break_labels += 1}"
        end

        # zapise break navesti aktualniho cyklu
        def write_break_label
            write_bytecode("B#{@@break_labels}")
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
                    write_bytecode(PAS)       # budu zapisovat na zasobnik argument
                    write_bytecode(variable)  # jeho id
                end
            else 
                write_bytecode(IPLS)      # budu zapisovat na zasobnik lokalni promennou
                write_bytecode(variable)  # jeji id
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
                    write_bytecode(PSA)
                else
                    @variables[id] = @locals
                    @locals += 1
                    write_bytecode(IPSL)          # zapis obsah zasobniku do lokalni promenne
                    write_bytecode(@locals)
                end
            else
                return variable
            end
        end
        
        # volam funkci
        def func(id) 
            function = @@functions[id]
            if function == :undeclared
                return orange("Function '#{id}' is not declared"), :error
            else 
                function
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
                    @@bytecode[3] = main_add & 0xFF; main_add >>= 8
                    @@bytecode[2] = main_add & 0xFF; main_add >>= 8
                    @@bytecode[1] = main_add & 0xFF; main_add >>= 8
                    @@bytecode[0] = main_add & 0xFF
                end

            else 
                return orange("Function '#{id}' is already defined"), :error
            end
        end

        # zakladam argumenty pro funkci
        def register_params(params)
            return if params == nil
            for p in params 
                @arguments[p] = @args
                @args += 1
            end
        end

        # uzaviram funkci
        def seal_function
            # vloz instrukce pro vytvoreni slotu
            # pro lokalni promenne
            @variables.size.times do
                @@bytecode<< IPUSH
                @@current_byte += 1
            end
            @@bytecode += @temp_bytecode
        end

    end

end

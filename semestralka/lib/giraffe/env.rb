require './lib/giraffe/debug.rb'

module Giraffe

    class Env

        include Debug

        # GC - nechat si na pocatku naalokovat od Ruby nejakej blok pameti,
        # a na nem alokovat ty objekty apod. 
        #
        # Vezme se Rootset a z nej se zacne vychazet na ty objekty a tridit je
        # - staticke promenne
        # - lokalni promenne
        # - parametry volani
        # 
        # - musi se brat frame ale i vsechny hodnoty na operacnim stacku
        #
        # a.bar > b
        #
        # push a
        # call 'bar'
        # push b
        # eq
        #
        # JAVA:
        # - nema jenom objekty ale i primitivni typy ... 
        # - jak poznam rozdil mezi pointerem a integerem
        # - nema tagovane pointery ... 
        # - ???
 
        @@POOL_MAX

        @@inst_pool = []

        # TODO @@ILC = [] 

        def initialize(super_env=nil)
            dbg("initialize (envID: #{self.object_id})",:Env)
            @variables = Hash.new(:undeclared)
            @functions = Hash.new(:undeclared)
            @classes = Hash.new(:undeclared)
            @super_env = super_env
            @level = @super_env == nil ? 0 : @super_env.level + 1
        end

        attr_reader :level

        def var(id) 

            # Zkus promennou najit nejprve v tomto ENV
            variable = @variables[id]
            msg = nil
            dbg("search for var '#{id}' - found '#{variable}' (envID: #{self.object_id})",:Env)

            # Pokud jsem u sebe nenasel, zkus predka
            if variable == :undeclared 
                 variable, msg = @super_env == nil ? [:undeclared, :error] : @super_env.var(id)
            end

            # pokud jsem nasel (msg == nil) vrat obsah
            # jinak zmen obsah :undeclared na chybu a vrat error
            return variable, nil if msg == nil 
            return orange("Variable '#{id}' is not declared"), msg
        end

        def var!(id,val=nil)
            dbg("var! '#{id}' '#{val}' (envID: #{self.object_id})",:Env)
            @variables[id] = val
        end

        def funcByKey(key) 
            function = @functions[key]
            msg = nil
            dbg("search for func '#{key[0]}' '#{key[1]}' - found '#{function == :undeclared ? :undeclared : function[0]}' (envID: #{self.object_id})",:Env)
            
            if function == :undeclared 
                 function, msg = @super_env == nil ? [:undeclared, :error] : @super_env.funcByKey(key)
            end
            
            # pokud jsem nasel (msg == nil) vrat obsah
            # jinak zmen obsah :undeclared na chybu a vrat error
            return function, nil if msg == nil
            return orange("Function '#{key[0]}' with '#{key[1]}' parameters is not declared"), msg
        end

        def func(id,args) 
            argCount = args == nil ? 0 : args.size
            key = [id,argCount]
            funcByKey(key)
        end

        def func!(id,params,instructions,env,tree)
            dbg("func! '#{id}' '#{params}' (envID: #{self.object_id})",:Env)
            @functions[[id,params == nil ? 0 : params.size]] = [params,instructions,env,tree]
        end

        def cls(id) 
            clz = @classes[id]
            msg = nil
            dbg("search for class '#{id}' - found '#{clz == :undeclared ? :undeclared : id}' (envID: #{self.object_id})",:Env)
            
            if clz == :undeclared 
                 clz, msg = @super_env == nil ? [:undeclared, :error] : @super_env.cls(id)
            end

            return clz, nil if msg == nil
            return orange("Class '#{id}' is not declared"), msg
        end

        def cls!(id,instructions,super_class,env,tree)
            dbg("cls! '#{id}' (envID: #{self.object_id})",:Env)
            @classes[id] = [id,instructions,super_class,env,tree]
        end

        def inst!(instance)
            # ID instance je tak index pole
            @@inst_pool << instance
        end

        def destroy
            # TODO ... projdi objekty namapovane do tohoto env
            # a zkotroluj zda na ne existuje jeste nejaka reference
        end

    end

end

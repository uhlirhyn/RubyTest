require './lib/giraffe/debug.rb'

module Giraffe

    class Env

        include Debug

        @@inst_pool = []

        def initialize(super_env=nil)
            dbg("initialize (envID: #{self.object_id})",:Env)
            @variables = Hash.new(:undeclared)
            @functions = Hash.new(:undeclared)
            @classes = Hash.new(:undeclared)
            @super_env = super_env
        end

        def var(id) 

            # Zkus promennou najit nejprve v tomto ENV
            variable = @variables[id]
            dbg("search for var '#{id}' - found '#{variable}' (envID: #{self.object_id})",:Env)

            # Protoze vracim u nil (viz nize), je potreba tady zahodit 
            # ten nil, jinak se pri dotazu do dalsi vrstvy nabali pole 
            # s nil, nebot prirazeni probiha jen do jedne promenne
            if variable == :undeclared 
                 variable = @super_env == nil ? :undeclared : @super_env.var(id)[0]
            end
            
            # Tady se MUSI vracen i nil,
            # jinak se pole v @value rozbali do 
            # msg v rodicovskem uzlu a zpusobi xx
            return [variable, nil] if variable != :undeclared
            raise "Variable '#{id}' is not declared"
        end

        def var!(id,val=nil)
            dbg("var! '#{id}' '#{val}' (envID: #{self.object_id})",:Env)
            @variables[id] = val
        end

        def funcByKey(key) 
            function = @functions[key]
            dbg("search for func '#{key[0]}' '#{key[1]}' - found '#{function == :undeclared ? :undeclared : function[0]}' (envID: #{self.object_id})",:Env)
            
            if function == :undeclared 
                 function = @super_env == nil ? :undeclared : @super_env.funcByKey(key)
            end
            
            return function if function != :undeclared
            raise "Function '#{key[0]}' with '#{key[1]}' parameters is not declared"
        end

        def func(id,args) 
            argCount = args == nil ? 0 : args.size
            key = [id,argCount]
            funcByKey(key)
        end

        def func!(id,params,instructions,env)
            dbg("func! '#{id}' '#{params}' (envID: #{self.object_id})",:Env)
            @functions[[id,params == nil ? 0 : params.size]] = [params,instructions,env]
        end

        def cls(id) 
            clz = @classes[id]
            dbg("search for class '#{id}' - found '#{clz == :undeclared ? :undeclared : id}' (envID: #{self.object_id})",:Env)
            
            if clz == :undeclared 
                 clz = @super_env == nil ? :undeclared : @super_env.cls(id)
            end

            return clz if clz != :undeclared
            raise "Class '#{id}' is not declared"
        end

        def cls!(id,instructions,super_class,env)
            dbg("cls! '#{id}' (envID: #{self.object_id})",:Env)
            @classes[id] = [id,instructions,super_class,env]
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

require './lib/giraffe/debug.rb'

module Giraffe

    class Env

        include Debug

        def initialize(superEnv=nil)
            dbg("initialize",:Env)
            @variables = {}
            @functions = {}
            @superEnv = superEnv
        end

        def var(id) 
            dbg("varLookup",:Env)
            variable = @variables[id]
            variable ||= @superEnv == nil ? nil : @superEnv.var(id)
            return variable if variable != nil
            raise "Variable #{id} is not declared"
        end

        def var!(id,val=nil)
            dbg("var! #{id} #{val}",:Env)
            @variables[id] = val
        end

        def funcByKey(key) 
            dbg("func #{key[0]} #{key[1]}",:Env)
            function = @functions[key]
            function ||= @superEnv == nil ? nil : @superEnv.funcByKey(key) 
            return function if function != nil
            raise "Function '#{key[0]}' with #{key[1]} parameters is not declared"
        end

        def func(id,args) 
            argCount = args == nil ? 0 : args.size
            key = [id,argCount]
            funcByKey(key)
        end

        def func!(id,params,instructions,env)
            dbg("func! #{id} #{params}",:Env)
            @functions[[id,params == nil ? 0 : params.size]] = [params,instructions,env]
        end

        def destroy
            # TODO ... projdi objekty namapovane do tohoto env
            # a zkotroluj zda na ne existuje jeste nejaka reference
        end

    end

end

require './lib/giraffe/debug.rb'

module Giraffe

    class Env

        include Debug

        class EnvLayer

            def initialize(superEnv)
                @var = {}
                @func = {}
                @superEnv = superEnv
            end

            attr_reader :superEnv, :var, :func

        end

        def initialize
            # zaloz zakladni env
            @env = EnvLayer.new(nil)
        end

        def raise
            dbg("raise",:Env)
            @env = EnvLayer.new(@env)
        end

        def descend
            dbg("descend",:Env)
            destroy(@env)
            @env = @env.superEnv
        end

        def var(id) 
            lookupEnv = @env

            while lookupEnv != nil 
                var = lookupEnv.var[id]
                return var if var != nil
                lookupEnv = lookupEnv.superEnv
            end

            raise EnvVariableMiss
        end

        def var!(id,val=nil)
            dbg("#{id}=#{val}",:Env)
            @env.var[id] = val
        end

        def func(id,args) 
            lookupEnv = @env

            while lookupEnv != nil 
                func = lookupEnv.func[[id,args.size]]
                return func if func != nil
                lookupEnv = lookupEnv.superEnv
            end

            raise EnvVariableMiss
        end

        def func!(id,params,instructions,env)
            dbg("#{id} #{params}",:Env)
            @env.func[[id,params.size]] = [params,instructions,env]
        end

        private
        def destroy(env)
            # TODO ... projdi objekty namapovane do tohoto env
            # a zkotroluj zda na ne existuje jeste nejaka reference
        end

    end

end

module Giraffe

    class Env

        class EnvLayer

            def initialize(superEnv)
                @var = {}
                @superEnv = superEnv
            end

            attr_reader :superEnv, :var

        end

        def initialize
            puts "Env started"
            # zaloz zakladni env
            @env = EnvLayer.new(nil)
        end

        def raise
            puts "raise #{@env}"
            @env = EnvLayer.new(@env)
        end

        def descend
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
            puts "ENV: #{id}=#{val}"
            @env.var[id] = val
        end

        private
        def destroy(env)
            # TODO ... projdi objekty namapovane do tohoto env
            # a zkotroluj zda na ne existuje jeste nejaka reference
        end

    end

end

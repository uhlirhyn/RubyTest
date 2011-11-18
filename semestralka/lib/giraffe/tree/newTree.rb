require './lib/giraffe/debug.rb'
require_relative '../instance'

module Giraffe

    class NewTree

        include Debug

        def initialize(id,args)
            @id = id
            @args = args
        end        

        def run(env) 

            dbg("run for class '#{@id}'",:NewTree)

            # vyzvedni deklaraci tridy
            clz = env.cls(@id)

            dbg("creating an instance of '#{@id}'",:NewTree)

            # vytvor instanci
            # tady ziskam referenci na ten objekt
            instance = Instance.new(clz)

            # zavolej konstruktor
            return_value, msg = instance.constructor
            return return_value, msg if msg != nil

            if @args != nil 
                # proved inicializaci instance
                # tim ze zavolas metodu se id 
                # jako je nazev tridy
                return_value, msg = instance.method_call(@id,@args,env)
                return return_value, msg if msg != nil
            end

            # paklize vse probehlo v poradku,
            # zanes instanci do inst_pool
            env.inst!(instance)

            # vrat referenci na novy objekt
            return instance
        end

    end

end

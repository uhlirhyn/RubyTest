require './lib/giraffe/debug.rb'
require_relative '../instance'

module Giraffe

    class NewTree

        include Debug

        def initialize(id,args)
            @id = id
            @args = args
        end        

        def where
            "\n\tin new on line #{@tree.line}, column #{@tree.column}"
        end

        def run(env,tree) 

            @tree = tree

            dbg(yellow("run for class '#{@id}'"),:NewTree)          

            # vyzvedni deklaraci tridy
            return_value, msg = env.cls(@id)
            case msg  
            when nil;
            when :error then return return_value + where, msg
            else return return_value, msg
            end

            # ziskani tridy probehlo uspesne
            clz = return_value

            dbg(yellow("creating an instance of '#{@id}'"),:NewTree)

            # vytvor instanci
            # tady ziskam referenci na ten objekt
            instance = Instance.new(clz)

            dbg(yellow("calling constructor '#{@id}'"),:NewTree)

            # zavolej konstruktor
            return_value, msg = instance.constructor
            case msg  
            when nil;
            when :error then return return_value + where, msg
            else return return_value, msg
            end

            # proved inicializaci instance
            # tim ze zavolas metodu s id 
            # jako je nazev tridy
            dbg(green("calling initializer for '#{@id}' with args '#{@args}'"),:NewTree)
            return_value, msg = instance.method_call(@id,@args,env)
            case msg  
            when nil;
            when :error then return return_value + where, msg
            else return return_value, msg
            end

            # paklize vse probehlo v poradku,
            # zanes instanci do inst_pool
            env.inst!(instance)
            dbg(yellow("an instance of '#{@id}' pooled"),:NewTree)

            # vrat referenci na novy objekt
            return instance
        end
        
    end

end

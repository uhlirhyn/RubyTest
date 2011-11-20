require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'

module Giraffe

    class MethodCallTree

        include Debug

        def initialize(target,id,args)
            @target = target
            @id = id
            @args = args
        end

        def run(env,tree)
            @tree = tree

            dbg("run",:MethodCallTree)

            # ziskej referenci na cilovou instanci
            return_value, msg = @target.run(env,tree)
            return return_value, msg if msg != nil

            dbg("call at '#{return_value}' for method '#{@id}'",:MethodCallTree)

            # zavolej na cil at vykona funkci 
            return_value, msg = return_value.method_call(@id,@args,env)
            case msg  
            when nil;
            when :error then return return_value + where, msg
            else return return_value, msg
            end
            
        end
        
        def where
            "\n\tin method call on line #{@tree.line}, column #{@tree.column}"
        end

   end

end



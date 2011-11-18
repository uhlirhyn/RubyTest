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

        def run(env)

            dbg("run",:MethodCallTree)

            # ziskej referenci na cilovou instanci
            return_value, msg = @target.run(env)
            return return_value, msg if msg != nil

            dbg("call at '#{return_value}' for method '#{@id}'",:MethodCallTree)

            # zavolej na cil at vykona funkci 
            return return_value.method_call(@id,@args,env)
            
        end

   end

end



class DummyTree

    # err - ma vracet error ?
    def initialize(err=nil,retval=nil)
        @err = err
        @retval = retval
    end

    def run(env,tree,method=:load)
        @executed = true
        @method = method
        @tree = tree
        @env = env
        if @err
            return "err", :error
        else
            return @retval, nil 
        end
    end

    attr_reader :executed, :tree, :env, :method, :retval

end

class DummyAST
    def line
    end

    def column
    end
end

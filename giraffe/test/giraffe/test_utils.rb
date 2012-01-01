class DummyTree

    # err - ma vracet error ?
    def initialize(err=nil,retval=nil)
        @err = err
        @retval = retval
        @set_return = false
    end

    def set_return=(value)
        @set_return = value
    end

    def run(env,tree,method=:load)
        @executed = true
        @method = method
        @tree = tree
        @env = env
        env.return_found if @set_return
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

class DummyTree

    # err - ma vracet error ?
    def initialize(err=nil)
        @err = err
    end

    def run(env,tree)
        @executed = true
        @tree = tree
        @env = env
        if @err
            return "err", :err
        else
            return nil, nil 
        end
    end

    attr_reader :executed, :tree, :env

end

class DummyAST
end

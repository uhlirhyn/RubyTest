class A
    
    @@static = 5

    def initialize
        p "A"
    end
end

class B < A 
    def initialize
        p "B"
        p @@static
    end
end

b = B.new

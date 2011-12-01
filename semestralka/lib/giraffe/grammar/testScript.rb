class A
    
    @@cc = 25

    attr_reader :cc

    class B

        def aa
            p A::@@cc
        end
    end
end


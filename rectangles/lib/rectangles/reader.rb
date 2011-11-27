#!/usr/bin/ruby

# Nacita vstup a validuje ho

module Rectangle 

    class Reader

        attr_reader :w1, :w2, :x1, :x2, :y1, :y2

        def read 
            print "Zadejte delku hrany prvniho ctverce: "
            @w1 = check_interval(read_float,0)

            print "Zadejte x-ovou souradnici stredu prvniho ctverce: "
            @x1 = read_float

            print "Zadejte y-ovou souradnici stredu prvniho ctverce: "
            @y1 = read_float

            print "Zadejte delku hrany druheho ctverce: "
            @w2 = check_interval(read_float,0)
            
            print "Zadejte x-ovou souradnici stredu druheho ctverce: "
            @x2 = read_float

            print "Zadejte y-ovou souradnici stredu druheho ctverce: "
            @y2 = read_float
        end

        def check_interval(value,min,max=nil)
            if (max == nil && value >= min) then return value
            elsif (min == nil && value <= max) then return value
            elsif (max != nil && min != nil && value >= min && value <= max) then return value 
            else 
                print "Spatny vstup.\n"
                exit -1
            end
        end

        def read_float
            check_float(gets)
        end

        def check_float(value)
            begin 
                return Float(value)
            rescue ArgumentError, TypeError
                print "Spatny vstup.\n"
                exit -1
            end
        end

    end

end

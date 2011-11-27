class GC

    # TODO singleton

    # pointer je vlastne index pole ...

    def initialize(size)
        @mem = Array.new(size)
        @free = 0
    end

    def allocate(obj)
        
        size = obj.size

        if size < @mem.size - free
            # allocate 
            pointer = @free
            @free += size
            return @free
        else
            scavenge
        end
    end

    def scavenge
    end

end

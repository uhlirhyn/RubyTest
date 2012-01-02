module Pentomino

    class Brick

        def initialize(w,h,id,orientation)

            @w = w
            @h = h
            @id = id
            @orientation = orientation

            @slices = Array.new(w)  # init x
            @slices.map! do |x|     # init y
                x = Array.new(h) 
            end

            case orientation
            # left-top corner
            when :lt
                yo = 0
                xo = 0
            # right-top corner
            when :rt
                yo = 0
                xo = @w - 1
            # left-bottom corner
            when :lb
                yo = @h - 1
                xo = 0
            # right-bottom corner                
            when :rb
                yo = @h - 1
                xo = @w - 1
            else
                raise "Unaccaptable orientation"
            end

            for x in @slices do 
                x[yo] = id
            end
            @slices[xo] = Array.new(h,id) 
        end

        attr_reader :slices, :id, :w, :h, :orientation
        
    end
    
end

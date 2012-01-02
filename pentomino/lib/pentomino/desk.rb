module Pentomino

    class Desk

        def initialize(w,h)

            @w = w
            @h = h
            @desk = Array.new(w)                    # init x
            @desk.map! { |x| x = Array.new(h) }     # init y

            @free = w*h

        end
        
        attr_reader :free, :w, :h

        def show
            
            puts
            
            print " _"
            for x in 1...@w do
                print "__"
            end
            puts 

            for y in 0...@h do
                for x in 0...@w do
                    if x == 0 
                        print "|"
                    end

                    is_down = false

                    if @desk[x][y] != nil
                        if @desk[x][y+1] != @desk[x][y] ||
                            y == @h - 1
                            print "_"
                            is_down = true
                        else 
                            print " "
                        end
                        if @desk[x+1][y] != @desk[x][y] ||
                            x == @w - 1
                            print "|"
                        else
                            print is_down ? "_" : " " 
                        end
                    else
                        if @desk[x] != nil && 
                            @desk[x][y+1] != nil ||
                            y == @h - 1
                            print "_"
                            is_down = true
                        else 
                            print " "
                        end
                        if @desk[x+1] != nil && 
                            @desk[x+1][y] != nil ||
                            x == @w - 1
                            print "|"
                        else
                            print is_down ? "_" : " " 
                        end
                    end
                end
                puts
            end
        end

        def insert(brick,from_x=0,from_y=0)

            # projdi dil po radcich
            x_off = 0
            for x in brick.slices do
                y_off = 0
                for id in x do
                    # je zde definovana plocha kostky ?
                    if id != nil 
                        # je tam volno ?
                        if @desk[from_x + x_off][from_y + y_off] == nil 
                            @desk[from_x + x_off][from_y + y_off] = id
                            @free -= 1
                        else
                            return false # doslo ke kolizi
                        end
                    end
                    y_off += 1
                end
                x_off += 1
            end

            return true

        end
    end
end


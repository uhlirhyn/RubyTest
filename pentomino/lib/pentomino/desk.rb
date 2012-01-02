module Pentomino

    class Desk

        def initialize(w,h)

            @w = w
            @h = h
            @desk = Array.new(w)                    # init x
            @desk.map! { |x| x = Array.new(h) }     # init y

            @free = w*h

        end
        
        protected 
        attr_accessor :desk, :free

        public
        attr_reader :w, :h

        def done
            @free == 0
        end

        def clone
            desk = Desk.new(@w,@h)
            desk.desk = Array.new(@w)
            cols = @desk.each
            desk.desk.map! { |x| x = cols.next.dup}
            desk.free = @free
            return desk
        end

        def find_free

            for y in 0...@h do
                for x in 0...@w do
                    return x,y if @desk[x][y] == nil
                end
            end

        end

        def show_

            for y in 0...@h do
                for x in 0...@w do
                    val = @desk[x][y]
                    printf("%2d ",val == nil ? 0 : val)
                end
                puts
            end
        end

        def show
            
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
                        if @desk[x] != nil &&
                            @desk[x][y+1] != @desk[x][y] ||
                            y == @h - 1
                            print "_"
                            is_down = true
                        else 
                            print " "
                        end
                        if @desk[x+1] != nil &&
                            @desk[x+1][y] != @desk[x][y] ||
                            x == @w - 1
                            print "|"
                        else
                            if is_down 
                                if @desk[x+1] != nil &&
                                    @desk[x+1][y+1] != @desk[x][y+1]
                                    print " "
                                else
                                    print "_"
                                end
                            else
                                print " " 
                            end
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
                            if is_down 
                                if @desk[x+1] != nil &&
                                    @desk[x+1][y+1] != @desk[x][y+1]
                                    print " "
                                else
                                    print "_"
                                end
                            else
                                print " " 
                            end
                        end
                    end
                end
                puts
            end
        end

        def insert(brick,from_x=0,from_y=0)

            return false if from_x + brick.w > @w
            return false if from_y + brick.h > @h

            # pole do ktereho se zapisou zmeny
            changes = []

            # projdi dil po radcich
            x_off = 0
            for x in brick.slices do
                y_off = 0
                for id in x do
                    # je zde definovana plocha kostky ?
                    if id != nil 
                        # je tam volno ?
                        if @desk[from_x + x_off][from_y + y_off] == nil 
                            changes << [from_x + x_off,from_y + y_off]
                        else
                            return false # doslo ke kolizi
                        end
                    end
                    y_off += 1
                end
                x_off += 1
            end

            # vsechna pole dilku jsou nekolizni
            # muze se provest jeho zapis
            for i in changes do 
                @desk[i[0]][i[1]] = brick.id
                @free -= 1
            end

            return true

        end
    end
end


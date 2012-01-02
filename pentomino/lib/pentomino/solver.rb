require_relative 'brick'
require_relative 'desk'

module Pentomino

    class Solver

        def initialize(b_w,b_h,d_w,d_h)
            @desk = Desk.new(d_w,d_h)
            @w = b_w
            @h = b_h
        end

        def pputs(what)
            # shut up !
        end

        def search(desk,id)

            id += 1

            x,y = desk.find_free

            puts "SEARCH LEVEL: #{id} Trying #{x},#{y}" 

            puts "SEARCH LEVEL: #{id} LT"
            if (new_desk = desk.clone).insert(Brick.new(@w,@h,id,:lt),x,y)
                new_desk.show
                return new_desk if new_desk.done
                if (result = search(new_desk,id)) != :failed then return result end
            end
            puts "SEARCH LEVEL: #{id} RT"
            if (new_desk = desk.clone).insert(Brick.new(@w,@h,id,:rt),x,y) 
                new_desk.show
                return new_desk if new_desk.done
                if (result = search(new_desk,id)) != :failed then return result end
            end
            puts "SEARCH LEVEL: #{id} LB"
            if (new_desk = desk.clone).insert(Brick.new(@w,@h,id,:lb),x,y)
                new_desk.show
                return new_desk if new_desk.done
                if (result = search(new_desk,id)) != :failed then return result end
            end
            # ten posuv je tam proto, aby se prisunula kostka primo tam, kde chybi
            puts "SEARCH LEVEL: #{id} RB"
            if x >= @w && (new_desk = desk.clone).insert(Brick.new(@w,@h,id,:rb),x-@w+1,y)
                new_desk.show
                return new_desk if new_desk.done
                if (result = search(new_desk,id)) != :failed then return result end
            end

            puts "SEARCH LEVEL: #{id} failed "
            return :failed

        end

        # zacnu od 0,0 a pujdu po prazdnych polich a do
        # nich budu zkouset doplnovat ruzne konfigurace 
        def solve
            result = search(@desk.clone,0) 
            if result == :failed
                puts "Failed to find solution"
            else
                puts "Solution found\n"
            end
        end

    end

end

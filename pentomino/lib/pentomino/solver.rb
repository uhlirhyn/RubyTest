require_relative 'brick'
require_relative 'desk'

module Pentomino

    class Solver

        def initialize(b_w,b_h,d_w,d_h)
            @desk = Desk.new(d_w,d_h)
            @w = b_w
            @h = b_h
            # pokud ma kosticka stejne dlouhe strany
            # nema vyznam ji otacet ...
            @variants = @w == @h ? [0] : [0,1]
        end

        def pputs(what)
            # shut up !
        end

        def search(desk,id)

            id += 1

            x,y = desk.find_free

            #puts "SEARCH LEVEL: #{id} Trying #{x},#{y}" 

            for variant in @variants do
                w = variant == 1 ? @w : @h
                h = variant == 1 ? @h : @w
                for mode in [:lt,:rt,:lb,:rb] do
                    # ten posuv je tam proto, aby se prisunula kostka primo tam, kde chybi
                    if (mode != :rb || x >= w) && 
                        (new_desk = desk.clone).insert(
                            Brick.new(w,h,id,mode),
                            mode == :rb ? x-w+1 : x, 
                            y)
                        new_desk.show
                        return new_desk if new_desk.done
                        if (result = search(new_desk,id)) != :failed then return result end
                    end
                end
            end

            #puts "SEARCH LEVEL: #{id} failed "
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

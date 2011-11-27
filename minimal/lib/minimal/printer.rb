module Minimal

    class Printer

        @start_with_space = false

        def print_solution(solution)

            print "\n" if @start_with_space == true
            @start_with_space = true

            print "#{solution.size}\n"
            for seg in solution 
                print "#{seg[0]} #{seg[1]}\n"
            end

        end

    end

end

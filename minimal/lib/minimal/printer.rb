class Printer

    @start_with_space = false

    def print(solution)
        
        puts if @start_with_space == true
        @start_with_space = true

        p solution.size
        for seg in solution 
            puts "#{seg[0]} #{seg[1]}"
        end

    end

end

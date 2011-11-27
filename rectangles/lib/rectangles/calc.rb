#!/usr/bin/ruby

module Rectangle

	class Calc

		def initialize(rectangles)
			@r = rectangles
		end

		def calculate

            dx = count_dx
            dy = count_dy

            if dx < 0 || dy < 0
				return nil
			else
				return @r[0].s + @r[1].s - dx*dy
			end					

		end

        def count_dy

            # r0 je dal v y ~ 0
            # r1 je dal v y ~ 1
            j = @r[0].y1 > @r[1].y1 ? 0 : 1;

            # pokud v y konci dal, je to jejich prunik
            # pokud v y konci jeste v oblasti toho druheho, je to jeho sirka
			dy = @r[j].y2 > @r[1-j].y2 ? @r[1-j].y2 - @r[j].y1 : @r[j].w

        end

        def count_dx

            # r0 je dal v x ~ 0
            # r1 je dal v x ~ 1
			i = @r[0].x1 > @r[1].x1 ? 0 : 1;

            # pokud v x konci dal, je to jejich prunik
            # pokud v x konci jeste v oblasti toho druheho, je to jeho sirka
			dx = @r[i].x2 > @r[1-i].x2 ? @r[1-i].x2 - @r[i].x1 : @r[i].w

        end

	end

end

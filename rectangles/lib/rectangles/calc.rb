#!/usr/bin/ruby

module Rectangle

	class Calc

		def initialize(rectangles)
			@r = rectangles
		end

		def calculate

			i = @r[0].x1 > @r[1].x1 ? 0 : 1;
			dx = @r[1-i].x2 < @r[i].x2 ? @r[1-i].x2 - @r[i].x1 : @r[i].w

			j = @r[0].y1 > @r[1].y1 ? 0 : 1;
			dy = @r[1-j].y2 < @r[j].y2 ? @r[1-j].y2 - @r[j].y1 : @r[j].h

			if dx < 0 || dy < 0
				return nil
			else
				return @r[0].s + @r[1].s - dx*dy
			end					

		end

	end

end

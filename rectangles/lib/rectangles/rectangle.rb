#!/usr/bin/ruby

module Rectangle

	class Rectangle

		def initialize(w,x,y)
            d = w/2.0
			@x1,@y1,@x2,@y2=x-d,y-d,x+d,y+d
			@w = w
			@s = w*w
		end

		attr_reader :x1, :y1, :x2, :y2, :w, :s
	end

end

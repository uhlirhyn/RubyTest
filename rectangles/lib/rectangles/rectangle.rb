#!/usr/bin/ruby

module Rectangle

	class Rectangle

		def initialize(w,x,y)
			@x1,@y1,@x2,@y2=x-w/2,y-w/2,x+w/2,y+w/2
			@s = w*w
		end

		attr_reader :x1, :y1, :x2, :y2, :s
	end

end

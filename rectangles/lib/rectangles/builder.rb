#!/usr/bin/ruby
#
# Neni to Builder v pravem pattern slova smyslu
#

require './lib/rectangles/rectangle.rb'

module Rectangle
	
	class Builder

		def initialize(reader)

			@reader = reader

		end

		def build

			[Rectangle.new(@reader.w1,@reader.x1,@reader.y1),
 			Rectangle.new(@reader.w2,@reader.x1,@reader.y2)]

		end
		

	end

end

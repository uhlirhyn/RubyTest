#!/usr/bin/ruby

fibonacci = Fiber.new do
	call=0
	old=0
	old2=0
	while 1
		case call
		when 0 
			result = 0
		when 1 
			result = 1
		else 
			result = old + old2
		end
		Fiber.yield result
		old2 = old
		old = result
		call += 1
	end
end

for i in 0..100 do
	value = fibonacci.resume
	puts value
end

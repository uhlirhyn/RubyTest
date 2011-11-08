#!/usr/bin/ruby

module Rectangle 

	class Reader

		def w1 
			print "Zadejte delku hrany prvniho ctverce: "
			return validateW(gets)
		end

		def w2
			print "Zadejte delku hrany druheho ctverce: "
			return validateW(gets)
		end

		def x1
			print "Zadejte x-ovou souradnici stredu prvniho ctverce: "
			return validate(gets)
		end

		def y1
			print "Zadejte y-ovou souradnici stredu prvniho ctverce: "
			return validate(gets)
		end
		
		def x2
			print "Zadejte x-ovou souradnici stredu druheho ctverce: "
			return validate(gets)
		end
		
		def y2
			print "Zadejte y-ovou souradnici stredu druheho ctverce: "
			return validate(gets)
		end
		
		private 
		def validate(str)
			Float(str)
		end

		def validateW(str)
			value = validate(str)
			if value < 0 
				raise ArgumentError
			end
			value
		end
	end

end

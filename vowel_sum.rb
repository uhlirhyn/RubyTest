#!/usr/bin/ruby	

module Summable

	def vowel?(char)

		case char.downcase
		when "a" 
			return true
		when "e" 
			return true
		when "i" 
			return true
		when "o" 
			return true
		when "u"
			return true
		when "y" 
			return true
		else 
			return false
		end

	end

	def initialize (text)

		@buffer = ""
		@text = text

	end

	def sum

		@text.each_char do

			|char|

			if vowel?(char) 
				@buffer << char
			end

		end

		print "#{@buffer}\n"
	end
end

class VowelFinder

	include Summable

end

v = VowelFinder.new("the quick brown fox jumped")
v.sum

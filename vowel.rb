#!/usr/bin/ruby	

class VowelFinder

	include Enumerable

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

	def each(&blok)

		@text.each_char do

			|char|

			if vowel?(char) 
				@buffer << char
			end

		end

		print "#{@buffer}\n"

	end

end

v = VowelFinder.new("the quick brown fox jumped")
v.inject(:+)

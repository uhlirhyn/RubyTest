#!/usr/bin/ruby

require './lib/rectangles/reader.rb'
require './lib/rectangles/builder.rb'
require './lib/rectangles/calc.rb'

module Rectangle

	begin
		s = Calc.new(Builder.new(Reader.new).build).calculate
		print s != nil ? "Obsah sjednoceni dvou ctvercu je #{s}.\n" : "Ctverce se ani nedotykaji.\n"
	rescue ArgumentError
		print "Spatny vstup.\n"
	end

end

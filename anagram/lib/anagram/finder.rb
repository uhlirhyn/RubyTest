module Anagram
	class Finder
		def initialize(dict)

			if dict==nil || dict.empty? 
				@dictionary = "bin/dict"
			else 
				@dictionary = dict
			end

			@signatures = Hash.new

			File.foreach(@dictionary) do |line|
				word = line.chomp
				signature = signature_of(word)
				(@signatures[signature] ||= []) << word
			end
		end

		# convert "wombat" into "abmotw". All anagrams share a signature
		def signature_of(word)
			word.unpack("c*").sort.pack("c*")
		end

		attr_reader :signatures, :dictionary
		#attr_writer :signatures

	end

end

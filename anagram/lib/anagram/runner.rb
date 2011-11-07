require_relative 'options.rb'
require_relative 'finder.rb'

module Anagram
	class Runner

		def initialize(argv)
			@argv = argv
		end

		def run

			options = Options.new
			finder = Finder.new(options.dictionary)

			@argv.each do |word|
				signature = finder.signature_of(word)
				if finder.signatures[signature]
					puts "Anagrams of #{word}: #{finder.signatures[signature].join(', ')}"
				else
					puts "No anagrams of #{word} in #{options.dictionary}"
				end
			end

		end

	end
end

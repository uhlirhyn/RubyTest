class TennisScorer

	def initialize
		@score = "0-0"
	end

	attr_reader :score

	def rec_p
		@score = case @score
				 when "0-0" then "0-15"
				 when "15-0" then "15-15"
				 end
	end

	def ser_p
		@score = case @score
				 when "0-0" then "15-0"
				 when "0-15" then "15-15"
				 end
	end

end

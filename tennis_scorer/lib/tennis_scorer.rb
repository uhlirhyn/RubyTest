class TennisScorer

	def initialize
		@rec = 0
		@ser = 0
	end

	def score
		"#{@ser == 45 ? 40 : @ser}-#{@rec == 45 ? 40 : @rec}"
	end

	def rec_p
		@rec = (@rec + 15) % 60
	end

	def ser_p
		@ser = (@ser + 15) % 60
	end

end

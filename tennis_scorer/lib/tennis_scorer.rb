class TennisScorer

	def initialize
		@rec = 0
		@ser = 0
	end

	def score
		"#{@ser == 45 ? 40 : @ser}-#{@rec == 45 ? 40 : @rec}"
	end

	def rec_p
		if @rec != 45 
			@rec = @rec + 15
		else 
			@rec = 0
			@ser = 0
		end	
	end

	def ser_p
		if @ser != 45 
			@ser = @ser + 15
		else 
			@rec = 0
			@ser = 0
		end	
	end

end

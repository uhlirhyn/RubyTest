def sameword(file)

	s = ["",""]

	f = File.open(file,"r") 
	f.readlines.each do
		|r|
		for i in 0..(r.size-1)
			if (r[i] == ' ') || (i == r.size-1)

				if s[1] != ""
					print "s[0]=\"#{s[0]}\" s[1]=\"#{s[1]}\""
					if s[0].downcase == s[1].downcase
						print " - Dupla"
					end
					s[0] = s[1]
					s[1] = ""

					puts "\n"
				end
			else
				s[1] += r[i]
			end			
		end
	end

	f.close

end

if ARGV[0] == nil 
	print "Nebyl zadan nazev souboru\n"
else 
	sameword(ARGV[0])
end

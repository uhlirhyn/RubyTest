def sameword(file)

	s = ""
	e = {}

	f = File.open(file,"r") 
	f.readlines.each do
		|r|
		for i in 0..(r.size-1)
			if (r[i] == ' ') || (i == r.size-1)

				if s != ""
					# print "s=\"#{s}\"\n"
					s = s.downcase
					if e[s] == nil 
						e[s] = 1
					else
						e[s] += 1
					end
					s = ""
				end
			else
				s += r[i]
			end			
		end
	end

	e.each do
		|k,v| 

		print "#{k} #{v}\n"
	end

	f.close

end

if ARGV[0]==nil
	print "Nebyl zadan nazev souboru\n"
else 
	sameword(ARGV[0])
end 

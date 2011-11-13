f = File.open("logo.grf","r")
a = []
for l in f.each_line
    for c in l.split("") 
        a << c
    end
end

printf "#{a.map!{|c| c.ord}}"

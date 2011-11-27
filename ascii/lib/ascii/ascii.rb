module ASCII 

    MODULE = 256

    def ASCII.offset(char, offset)

        # spocitej rozdil
        div = char - offset % MODULE

        # pripad kdy je char mensi nez offset
        return div < 0 ? MODULE + div : div

    end

    def ASCII.shift(input, offset) 
        output = ""
        input.each_char do
            |c| output += offset(c.ord, offset).chr
        end
        return output
    end

end

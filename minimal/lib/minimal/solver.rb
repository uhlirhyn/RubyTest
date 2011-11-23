class Solver

    def tree

        @best_size = @segments.size + 1
        @best = []
        @best_merge = []

        #puts "#{@segments}"

        expand([],[],0)

    end

    # segs - applied segments (merged)
    # sis - merged segments indexes
    # index - index of @segments element to be choosen
    def expand(segs,sis,index)

        #index.times { print " " }
        #puts "segs '#{segs}', sis '#{sis}', index '#{index}'"

        # do we have a new best solution ?
        if subset(segs,@m) 
            if sis.size < @best_size
                @best = sis
                @best_merge = segs
                @best_size = sis.size

                index.times { print " " }
                #puts "new best is '#{sis}'"

                # there is no reason to try merge another segment
                return
            else 
                #puts "already have better solution: #{@best}"
            end
        end

        # there is no segments to choose
        return if index == @segments.size

        without = expand(segs.dup,sis.dup,index+1)

        # segments can be merged only if they are crossing
        if segs.empty? || crossing?(segs,@segments[index])
            with = expand(merge(segs.dup,@segments[index]),sis.dup << @segments[index],index+1)
        end

    end

    def solve(test)

        @m = test.shift

        # sort by first element
        @segments = test.sort_by { |e| e[0] }

        #throw away segments which have empty intersection with M
        i=0
        while i < @segments.size
            if crossing?(@segments[i],@m)
                #puts "#{@segments[i]} is crossing with #{@m}"
                i+=1
            else
                #puts "#{@segments[i]} out"
                @segments.delete_at(i)
            end
        end

=begin
        # delete all subsets of current segment
        # we are using the fact that we have 
        # sorted array by x[0]
        i=0
        while i < @segments.size-1 do
            j=i
            while j < @segments.size do

                # if the next segment starts after my end
                # end check for this segment - it is 
                # sorted, so it wont be better
                if @segments[i][1] <= @segments[j][0] 
                    if subset(@segments[i],@segments[j])
                        @segments.delete_at(j)
                    end
                    j+=1
                else 
                    break
                end
            end
            i+=1
        end
=end

        # B&B
        tree

        # control
        return @best
    end

    private

    # a is bigger 
    def subset(a,b)
        return a.empty? || b.empty? ? false : (a[0] <= b[0] && a[1] >= b[1])
    end

    def crossing?(a,b)
        return is_in?(a[0],b) || is_in?(a[1],b) 
    end

    def merge(a,b)
        return a if b.empty?
        return b if a.empty?
        return [ (a[0] < b[0] ? a[0] : b[0]),
            a[1] > b[1] ? a[1] : b[1] ]
    end

    def is_in?(point,seg)
        return point >= seg[0] && point <= seg[1]
    end

end

class Reader

    def initialize(max_m=5000,max_s=50000,max_i=100000)
        @max_m = max_m
        @max_s = max_s
        @max_i = max_i
    end

    def read_tests

        # read number of test cases 
        cases = read_integer("Test cases")

        # tests array init
        tests = []
        
        # read test data 
        cases.times do

            accept_blank            # must be followed by blank line
            test = []               # current test init (no segments)

            # segment border 1<M<5000
            test << [0,check_interval(read_integer("M"),1,@max_m)]

            begin
               
                # max i control
                if test.size-1 > @max_i 
                    puts "\e[31mNumber of lines in single test must not be greater than #{@max_i}\e[39m\n"
                    exit -1
                end

                # read pair and make ints
                l_r = gets.split(' ')
                l = check_interval(check_integer(l_r[0],"L"),nil,@max_s)
                r = check_interval(check_integer(l_r[1],"R"),nil,@max_s)

                # is l <= r ? Be silent 
                if l > r
                    sw = l
                    l = r
                    r = sw
                end

                # have you encountered the end pair ?
                break if l == 0 && r == 0

                # if not, add the pair into the current test array
                test << [l,r]

            end while 1 

            if test.size == 1 
                puts "\e[31mEmpty test\e[39m\n"
                exit -1
            end

            tests << test
        end

        return tests

    end

    def accept_blank
        value = gets.chop
        if value != "" 
            puts "\e[31mBlank line missing, instead '#{value}' found\e[39m\n"
            exit -1
        end
    end

    def check_interval(value,min,max)
        if (max == nil && value >= min) then return value
        elsif (min == nil && value <= max) then return value
        elsif (max != nil && min != nil && value >= min && value <= max) then return value 
        else 
            puts "\e[31mValue #{value} is expected to be between #{min} and #{max} \e[39m\n"
            exit -1
        end
    end

    def read_integer(reason)
        check_integer(gets,reason)
    end

    def check_integer(value,reason=nil)
        begin 
            return Integer(value)
        rescue ArgumentError, TypeError
            puts "\e[31mAn integer expected#{ reason == nil ? "" : " (#{reason})" }, instead of '#{value}'\e[39m\n"
            exit -1
        end
    end

end

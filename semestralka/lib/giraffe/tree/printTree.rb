module Giraffe

    class PrintTree
    
        def initialize(text,newline=false)
            @text = text
            @newline = newline
        end

        def run(env)

            # v @text muze byt cely expression,
            # takze je nutno pocita s tim, ze se
            # bude vracet zprava apod.

            returnValue, msg = @text.run(env)
            return returnValue, msg if msg != nil
            print(returnValue, @newline ? "\n" : "")
            return nil, nil
        end

    end

end



require './lib/giraffe/debug.rb'

module Giraffe

    class DerefTree
    
        include Debug

        # Ma za ukol najit nejnizsi referenci
        # a na te zmenit obsah
        # prikladem tak muze byt treba 
        #
        #   a[0][5] = 10
        #
        # V tom pripade je potreba nejprve ziskat 
        # hodnotu, kterou je to, co je na a[0]
        #
        # V teto hodnote je pak potreba zmenit 
        # 5. udaj, ktery bude nastaven na 10
        #
        # deref( index(env.var(a),0) , 5 , 10) ... asi tak nejak

        def initialize(target,index,value)
            @target = target
            @index = index      # to muze byt expression
            @value = value      # to muze byt expression
        end

        def run(env)

            # DerefTree
            # - zadnou zpravu nezpracovava
            # - neprodukuje zadnou zpravu
            # - normalni vystup je 

            # vypocitej "adresu"
            returnValue, msg = @target.run(env)
            return returnValue, msg if msg != nil

            address = returnValue

            # vypocitej index
            returnValue, msg = @index.run(env)
            return returnValue, msg if msg != nil

            index = returnValue

            # vypocitej hodnotu
            returnValue, msg = @value.run(env)
            return returnValue, msg if msg != nil

            value = returnValue

            # prirad hodnotu
            address[index] = value            
        end

    end

end



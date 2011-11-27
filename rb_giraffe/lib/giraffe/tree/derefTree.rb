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
            dbg("init",:DerefTree)
        end

        def run(env)

            # DerefTree
            # - zadnou zpravu nezpracovava
            # - neprodukuje zadnou zpravu
            # - normalni vystup je 

            # vypocitej "adresu"
            return_value, msg = @target.run(env)
            return return_value, msg if msg != nil

            address = return_value

            # vypocitej index
            return_value, msg = @index.run(env)
            return return_value, msg if msg != nil

            index = return_value

            # vypocitej hodnotu
            return_value, msg = @value.run(env)
            return return_value, msg if msg != nil

            value = return_value

            dbg("address '#{address}' index '#{index}'",:DerefTree) 

            # prirad hodnotu
            address[index] = value            
        end

    end

end



require './lib/giraffe/debug.rb'

module Giraffe

    class ArrayTree
    
        include Debug
        
        def initialize(elements)
            @elements = elements
            dbg("init",:ArrayTree)
        end

        def run(env,tree)

            # ArrayTree
            # - zadnou zpravu nezpracovava
            # - neprodukuje zadnou zpravu
            # - normalni vystup je hodnota prirazeni

            dbg("run",:ArrayTree)

            result_array = []

            # vypocitej hodnoty elementu
            for element in @elements do
                return_value, msg = element[0].run(env,element[1])
                return return_value, msg if msg != nil
                result_array << return_value
            end

            # Tady se MUSI vracen nil,
            # jinak se pole v @value rozbali do 
            # msg v rodicovskem uzlu a zpusobi xx
            return result_array, nil
        end

    end

end



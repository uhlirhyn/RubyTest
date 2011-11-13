require './lib/giraffe/debug.rb'

module Giraffe

    class ArrayTree
    
        include Debug
        
        def initialize(elements)
            @elements = elements
            dbg("init",:ArrayTree)
        end

        def run(env)

            # ArrayTree
            # - zadnou zpravu nezpracovava
            # - neprodukuje zadnou zpravu
            # - normalni vystup je hodnota prirazeni

            dbg("run",:ArrayTree)

            resultArray = []

            # vypocitej hodnoty elementu
            for element in @elements do
                returnValue, msg = element.run(env)
                return returnValue, msg if msg != nil
                resultArray << returnValue
            end

            # Tady se MUSI vracen nil,
            # jinak se pole v @value rozbali do 
            # msg v rodicovskem uzlu a zpusobi xx
            return resultArray, nil
        end

    end

end



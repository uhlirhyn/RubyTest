module Giraffe

    class Console

        def start

            # zahaj smycku REPL
            while true

                # konzole
                printf("giraffe! >")

                # READ
                command = gets 

                # EVALUATE
                # -- zavolej parser --

                # PRINT
                # -- zpracuj vysledek a proved vypis --

                # LOOP

            end

        end

        def stop
        end

    end

end

class GC

    # Je mozne ten prostor i cely zvetsovat, 
    # ale to by se melo delat az kdyz se opravdu
    # neda v tom aktualnim prostoru hybat

    KB=1024
    MB=1048576

    def initialize(size)
        @old_space = Array.new(size/2)
        @new_space = Array.new(size/2)
    end

    def alloc

        # alokuj do @new_space
        # pokud neni misto spust scavenge

    end

    def scavenge

        # vem vsechny globalni promenne (rootset)
        # a zacni prehazovat (nejlepe vidlema) objekty
        # z jednoho space do druheho

        queue << rootset

        while !queue.empty 

            object = queue.next

            # musi se updatovat pointery z kopirovanych objektu

            # forward pointer ... 
            # kdyz nechci tu informaci o typu pointeru ukladat 
            # do hlavicky, tak si ji muzu dat do nejakeho pole 
            # stareho objektu .. 

            # zkopiruj object z @new_space do @old_space
            # nastav novou referenci pro queue.next polozku
        
        end

        # switch @new_space referenci na @old_space a naopak

    end

end

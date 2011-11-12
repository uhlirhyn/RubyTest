module Debug

    @@listPolicy = :blacklist
    #@@listPolicy = :whitelist
    @@list = [:AtomTree,:VarTree]

    def dbg(out,source)

        # pokud bude :blacklist nastaven, pak pro kazdy 
        # source ktery pak bude nalezen bude zakazan vypis
        if (@@list.member?(source)) == (@@listPolicy != :blacklist)
             puts("  DBG (#{source})> #{out}")
        end

    end

end

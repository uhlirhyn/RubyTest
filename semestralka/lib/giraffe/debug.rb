module Debug

    @@defaultPolicy = :blacklist
    @@sources = []

    def dbg(out,source)

        # pokud bude :blacklist nastaven, pak pro kazdy 
        # source ktery pak bude nalezen bude zakazan vypis
        if (@@sources.member?(source)) == (@@defaultPolicy != :blacklist)
             puts("  DBG (#{source})> #{out}")
        end

    end

end

module Debug

    #@@Debugging = :on
    @@Debugging = :off
    @@listPolicy = :blacklist
    #@@listPolicy = :whitelist
    @@list = [:AtomTree,:VarTree,:AssignTree,:CallTree]

    def dbg(out,source)

        # pokud bude :blacklist nastaven, pak pro kazdy 
        # source ktery pak bude nalezen bude zakazan vypis
        if @@Debugging == :on && (@@list.member?(source)) == (@@listPolicy != :blacklist)
             puts("  DBG (#{source})> #{out}")
        end

    end

end

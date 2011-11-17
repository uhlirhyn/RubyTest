module Debug

    #@@Debugging = :on
    @@Debugging = :off
    @@listPolicy = :blacklist
    #@@listPolicy = :whitelist
    @@list = []

    def dbg(out,source)
        Debug.dbg(out,source)
    end

    # ehm ... 
    def Debug.dbg(out, source)
        # pokud bude :blacklist nastaven, pak pro kazdy 
        # source ktery pak bude nalezen bude zakazan vypis
        if @@Debugging == :on && (@@list.member?(source)) == (@@listPolicy != :blacklist)
             puts("  DBG (#{source})> #{out}")
        end
    end

    private 

    # http://kpumuk.info/ruby-on-rails/colorizing-console-ruby-script-output/
    def colorize(text, color_code)
       "#{color_code}#{text}\e[0m\e[39m"
    end

    def red(text); colorize(text, "\e[31m"); end
    def green(text); colorize(text, "\e[32m"); end
    def yellow(text); colorize(text, "\e[1m\e[33m"); end

end

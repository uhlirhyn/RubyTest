module Debug

    @@debug = false
    @@listPolicy = :blacklist
    #@@listPolicy = :whitelist
    @@list = []

    @@colors = true

    attr_accessor :debug, :colors

    def Debug.debug=(state)
        @@debug = state
    end

    def Debug.colors=(state)
        @@colors= state
    end

    def dbg(out,source)
        Debug.dbg(out,source)
    end

    # ehm ... 
    def Debug.dbg(out, source)
        # pokud bude :blacklist nastaven, pak pro kazdy 
        # source ktery pak bude nalezen bude zakazan vypis
        if @@debug && (@@list.member?(source)) == (@@listPolicy != :blacklist)
             puts("  DBG (#{source})> #{out}")
        end
    end

    # http://kpumuk.info/ruby-on-rails/colorizing-console-ruby-script-output/
    def colorize(text, color_code)
       return @@colors ? "#{color_code}#{text}\e[0m\e[39m" : "#{text}"
    end

    def red(text); colorize(text, "\e[31m"); end
    def cyan(text); colorize(text, "\e[36m"); end
    def green(text); colorize(text, "\e[1m\e[32m"); end
    def yellow(text); colorize(text, "\e[1m\e[33m"); end
    def orange(text); colorize(text, "\e[33m"); end

end

# encoding: utf-8

# Ladící modul, umožňující barevné výpisy a
# filtry (whitelist/blacklist) debug výpisů
module Debug

    @@debug = false
    @@listPolicy = :blacklist
    #@@listPolicy = :whitelist
    @@list = []

    @@colors = true

    # zapnout/vypnout ladící výpisy
    def Debug.debug=(state)
        @@debug = state
    end

    # zapnout/vypnout barvy výpisů
    def Debug.colors=(state)
        @@colors= state
    end

    # vypsat ladící výpis
    # * <tt>out</tt> co vypsat (text)
    # * <tt>source</tt> symbol zdroje (dle něj se provádí filtrování)
    def dbg(out,source)
        Debug.dbg(out,source)
    end

    # vypsat ladící výpis
    # * <tt>out</tt> co vypsat (text)
    # * <tt>source</tt> symbol zdroje (dle něj se provádí filtrování)
    def Debug.dbg(out, source)
        # pokud bude :blacklist nastaven, pak pro kazdy 
        # source ktery pak bude nalezen bude zakazan vypis
        if @@debug && (@@list.member?(source)) == (@@listPolicy != :blacklist)
             puts("  DBG (#{source})> #{out}")
        end
    end

    # Obarvení výpisu (http://kpumuk.info/ruby-on-rails/colorizing-console-ruby-script-output/)
    # * <tt>text</tt> co se obarvuje
    # * <tt>color_code</tt> kód barvy
    def colorize(text, color_code)
       return @@colors ? "#{color_code}#{text}\e[0m\e[39m" : "#{text}"
    end

    # červená
    def red(text); colorize(text, "\e[31m"); end
    # světle modrá
    def cyan(text); colorize(text, "\e[36m"); end
    # zelená
    def green(text); colorize(text, "\e[32m"); end
    # žlutá
    def yellow(text); colorize(text, "\e[1m\e[33m"); end
    # otanžová
    def orange(text); colorize(text, "\e[33m"); end

end

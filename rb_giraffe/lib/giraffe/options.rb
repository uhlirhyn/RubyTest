#
# options.rb
#
# Parsuje vstup (OptionParser se nadefinuje prehled
# moznych vstupu a jak je ma zpracovat (opts) a pak
# se na nej zavola .parse! ktery vezme parametr a 
# zpracuje ho (pri zpracovani ho modifikuje) 
#
# Documentation:
# http://www.ruby-doc.org/stdlib-1.9.3/libdoc/optparse/rdoc/OptionParser.html
#

require 'optparse'

module Giraffe

    class Options

        attr_reader :interactive, :colors, :debug

        def initialize

            @interactive = false
            @colors = true
            @debug = false

            @theme = [  10, 32, 32, 32, 32, 32, 32, 32, 
                32, 32, 32, 46, 46, 10, 32, 32, 32, 32, 32, 32, 32, 32, 32, 
                95, 124, 124, 44, 10, 32, 32, 32, 32, 32, 32, 32, 32, 32, 59, 
                92, 95, 95, 96, 44, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 
                32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 
                32, 95, 95, 95, 32, 32, 32, 32, 95, 95, 95, 10, 32, 32, 32, 
                32, 32, 32, 32, 32, 32, 47, 47, 32, 32, 32, 32, 32, 32, 32, 
                32, 32, 95, 95, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 
                32, 32, 32, 32, 32, 32, 47, 39, 95, 95, 95, 92, 32, 47, 39, 
                95, 95, 95, 92, 10, 32, 32, 32, 32, 32, 32, 32, 32, 47, 47, 
                32, 32, 32, 32, 32, 32, 95, 95, 32, 47, 92, 95, 92, 32, 32, 
                95, 32, 95, 95, 32, 32, 32, 32, 95, 95, 32, 32, 32, 47, 92, 
                32, 92, 95, 95, 47, 47, 92, 32, 92, 95, 95, 47, 32, 32, 32, 
                95, 95, 10, 32, 32, 32, 32, 32, 32, 95, 47, 47, 32, 32, 32, 
                32, 32, 47, 39, 95, 95, 96, 92, 47, 92, 32, 92, 47, 92, 96, 
                39, 95, 95, 92, 47, 39, 95, 95, 96, 92, 32, 92, 32, 92, 32, 
                44, 95, 95, 92, 32, 92, 32, 44, 95, 95, 92, 47, 39, 95, 95, 
                96, 92, 10, 32, 32, 32, 32, 44, 39, 43, 43, 41, 32, 32, 32, 
                32, 47, 92, 32, 92, 95, 92, 32, 92, 32, 92, 32, 92, 32, 92, 
                32, 92, 47, 47, 92, 32, 92, 95, 92, 32, 92, 95, 92, 32, 92, 
                32, 92, 95, 47, 92, 32, 92, 32, 92, 95, 47, 92, 32, 32, 95, 
                95, 47, 10, 32, 32, 32, 47, 43, 44, 95, 43, 124, 32, 32, 32, 
                32, 92, 32, 92, 95, 95, 95, 95, 32, 92, 32, 92, 95, 92, 32, 
                92, 95, 92, 92, 32, 92, 95, 95, 47, 92, 95, 95, 92, 92, 32, 
                92, 95, 92, 32, 32, 92, 32, 92, 95, 92, 92, 32, 92, 95, 95, 
                95, 95, 92, 10, 32, 32, 32, 124, 124, 32, 32, 124, 124, 32, 32, 
                32, 32, 32, 92, 47, 95, 95, 95, 95, 92, 32, 92, 47, 95, 47, 
                92, 47, 95, 47, 32, 92, 47, 95, 95, 47, 92, 47, 95, 47, 32, 
                92, 47, 95, 47, 32, 32, 32, 92, 47, 95, 47, 32, 92, 47, 95, 
                95, 95, 95, 47, 10, 32, 32, 32, 124, 124, 32, 32, 124, 124, 32, 
                32, 32, 32, 32, 32, 32, 47, 92, 95, 95, 95, 95, 47, 10, 32, 
                32, 32, 124, 124, 32, 32, 124, 124, 32, 32, 32, 32, 32, 32, 32, 
                92, 47, 95, 95, 95, 47, 32, 32, 45, 45, 32, 32, 72, 121, 110, 
                101, 107, 32, 85, 104, 108, 105, 114, 32, 40, 117, 104, 108, 105, 114, 
                104, 121, 110, 64, 102, 105, 116, 46, 99, 118, 117, 116, 46, 99, 122, 
                41, 32, 45, 45, 10, 10, 10 ] 

            @op = OptionParser.new do |opts|

                # co ma option paser vypisovat
                opts.banner = "Usage:  giraffe [ options ] source1.grf source2.grf ... sourceN.grf"

                # pokud je zadana moznost interaktivniho zpracovani, 
                # zapni moznost i
                opts.on("-i", "--interactive", "Interactive mode") do 
                    @interactive = true
                end

                # pokud je help, vypis tyto moznosti a ukonci program
                opts.on("-h", "--help", "Show this message") do
                    puts opts
                    exit
                end

                # maji se pouzivat barvy k vypisu hlasek apod. ?
                opts.on("-n", "--no-color", "Do not use colors in system output") do
                    @colors = false
                end

                # maji se vypisovat debug hlasky ?
                opts.on("-d", "--debug", "Print debug info") do
                    @debug = true
                end

                opts.on("-v", "--version", "Info about program version") do
                    for c in @theme
                        printf c.chr
                    end

                    puts "    This Giraffe ..."
                    puts
                    puts "\t- is 0.1 version old"
                    puts "\t- has multiple inner functions"
                    puts "\t- has objects and inheritance"
                    puts "\t- has conditions, cycles and other common stuff ..."
                    puts

                    exit
                end

            end
        end

        def parse!(args)

            # pokud nejsou zadane zadne vstupy, pridej tam vstup -h
            # pro help a pust parser znova
            begin
                args << "-h" if args.empty?
                @op.parse!(args)
            rescue OptionParser::ParseError => e
                STDERR.puts e.message, "\n" 
                @op.parse!(["-h"])
                exit(-1)
            end

        end

        attr_reader :interactive

    end

end

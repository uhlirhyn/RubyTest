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

        def initialize

            @interactive = false

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

            end
        end

        def parse!(args)

            # pokud nejsou zadane zadne vstupy, pridej tam vstup -h
            # pro help a pust parser znova
            begin
                args << "-h" if args.empty?
                @op.parse!(args)
            rescue OptionParser::ParseError => e
                STDERR.puts e.message, "\n", opts
                exit(-1)
            end

        end

        attr_reader :interactive

    end

end

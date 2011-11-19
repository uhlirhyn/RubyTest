#!/usr/bin/ruby

require './lib/giraffe/grammar/GiraffeParser'
require './lib/giraffe/options.rb'
require './lib/giraffe/console.rb'
require './lib/giraffe/debug.rb'

module Giraffe

    def Giraffe.launch

        # zpracuje nejprve argumenty options
        # z ARGV tak budou odebrany zpracovatelne
        # options a bude tam tak ponechan list zdrojaku
        options = Options.new
        options.parse!(ARGV)

        Debug.debug = options.debug
        Debug.colors= options.colors

        t = Time.new
        printf "==[ #{t.strftime('%k:%M:%S.%9N')} ]===========<[ giraffe! ]>======================\n\n"

        # pokud je zapnuty interaktivni rezim, prejdi do konzole
        if options.interactive  

            Console.new.start

        else # jinak proved normalni interpretaci zdrojaku

            # vem nazvy zdrojaku z ARGV a postupne je zpracuj
            for file in ARGV
                input = ANTLR3::FileStream.new( file )
                parser = Parser.new( input )
                program = parser.program.result

                program.run
            end

        end

        t = Time.new
        printf "\n==[ #{t.strftime('%k:%M:%S.%9N')} ]===========<[ giraffe! ]>======================\n"

    end

end


Giraffe.launch


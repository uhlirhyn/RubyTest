#!/usr/bin/ruby
# encoding: utf-8

require './lib/giraffe/grammar/GiraffeParser'
require './lib/giraffe/options.rb'
require './lib/giraffe/debug.rb'
require './lib/giraffe/codegen.rb'

module Giraffe

    # Hlavní startovací objekt překladače,
    # načte přepínače, vstupní soubor k přeložení,
    # inicializuje parser a nechá vygenerovat bytecode z AST
    class Launcher 

        include Debug

        # Provede překlad
        def launch

            begin

                # zpracuje nejprve argumenty options
                # z ARGV tak budou odebrany zpracovatelne
                # options a bude tam tak ponechan list zdrojaku
                options = Options.new
                options.parse!(ARGV)

                Debug.debug = options.debug
                Debug.colors = options.colors

                input = ANTLR3::FileStream.new( ARGV[0] )
                parser = Parser.new( input )
                program = parser.program

                codegen, msg = program.result.run

                if msg != :error 
                    codegen.generate(options.output)
                    puts green("\n BUILD SUCCESS ...\n")
                else 
                    puts red("\n BUILD FAILED ...\n")
                end

            rescue Interrupt

                print "\n\n  --- Iterrupted ---\n"

            end
        end
    end
end
   
launcher =  Giraffe::Launcher.new
launcher.launch


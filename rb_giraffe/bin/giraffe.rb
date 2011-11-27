#!/usr/bin/ruby

require './lib/giraffe/grammar/GiraffeParser'
require './lib/giraffe/options.rb'
require './lib/giraffe/console.rb'
require './lib/giraffe/debug.rb'

module Giraffe

=begin
    def Giraffe.traverse(tree,level)
        for node in tree.children
            print("[#{node.line},#{node.column}]:  \t")
            level.times { printf("  ") } 
            puts("#{node.text}")
            traverse(node,level+1)
        end

    end
=end

    def Giraffe.launch

        begin

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
                program = parser.program

                # traverse(program.tree,0)

                program.result.run
            end

        end

        rescue Interrupt
        
            print "\n\n  --- Iterrupted ---\n"

        end
    
        t = Time.new
        printf "\n==[ #{t.strftime('%k:%M:%S.%9N')} ]===========<[ giraffe! ]>======================\n"
        
    end

end


Giraffe.launch


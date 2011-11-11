#!/usr/bin/ruby

require './lib/giraffe/grammar/GiraffeParser'
require './lib/giraffe/options.rb'
require './lib/giraffe/console.rb'

printf "======================<[ giraffe! ]>======================\n"


module Giraffe

    def Giraffe.traverse(tree,level)

        (level+1).times { printf("  ") } 
        puts("[#{tree.type}]: #{tree.text}")
        tree.children.each do
            |c|
            traverse(c,level+1)
        end

    end

    def Giraffe.launch

        # zpracuje nejprve argumenty options
        # z ARGV tak budou odebrany zpracovatelne
        # options a bude tam tak ponechan list zdrojaku
        options = Options.new
        options.parse!(ARGV)

        # pokud je zapnuty interaktivni rezim, prejdi do konzole
        if options.interactive  

            Console.new.start

        else # jinak proved normalni interpretaci zdrojaku

            # vem nazvy zdrojaku z ARGV a postupne je zpracuj
            for file in ARGV
                input = ANTLR3::FileStream.new( file )
                parser = Parser.new( input )
                tree = parser.program.tree
                puts( "tree: #{ tree.inspect }" )
                nodes = ANTLR3::AST::CommonTreeNodeStream.new(
                    tree, :token_stream => parser.input
                )
                #GiraffeWalker::TreeParser.new( nodes ).program

                traverse(tree,0)

            end

        end

    end

end

Giraffe.launch

#!/usr/bin/ruby

require './GiraffeParser'

printf "======================<[ giraffe! ]>======================\n"

module Giraffe

	for file in ARGV
		input = ANTLR3::FileStream.new( file )
		parser = Parser.new( input )
		tree = parser.start.tree
		puts( "tree: #{ tree.inspect }" )
		nodes = ANTLR3::AST::CommonTreeNodeStream.new(
			tree, :token_stream => parser.input
		)
		#LangDumpDecl::TreeParser.new( nodes ).decl
	end

end

#!/usr/bin/ruby

def debug(msg)
	# print "DEBUG: "
	# print msg
end

class Node
	def initialize(id)
		@id = id
		@nodes = []
	end

	def addEdge(node)
		@nodes[@nodes.size] = node
	end

	attr_reader :id, :nodes

end

class Graph 
	def initialize(n)
		@nodes = []
	end

	# vytvor nebo najdi node daneho id
	def getOrCreateNode(id)
		if @nodes[id-1] == nil
			@nodes[id-1] = Node.new(id)
			debug("Node #{id} added\n")			
		end
		return @nodes[id-1]			
	end

	def readBFS(root_id)

		open = [@nodes[root_id-1]]
		closed = {}

		print "#{root_id} "			# vypis jeho navstevu
		closed[root_id-1] = 1	# toto id bylo navstiveno			

		begin 
			first = open[0] 		# je to vlastne fronta
			open.delete_at(0)		# zmensi pole
			first.nodes.each do		# do open pridej sousedy aktualniho uzlu, pokud uz nejsou v closed
				|n|
				if closed[n.id-1] == nil
					open[open.size] = n
					closed[n.id-1] = 1		# toto id bylo navstiveno			
					print "#{n.id} "		# vypis jeho navstevu
				end 
			end


			#	print "( "
			#	open.each do
			#		|o|
			#		print "#{o.id} "
			#	end
			#	print ") "		

		end until closed.size == @nodes.size || open.size == 0

		#print " e: #{@nodes.size} == #{closed.size} || #{open.size == 0} "

		print "\n"

	end

	def readDFS(root_id)

		open = [@nodes[root_id-1]]
		closed = {}

		begin 
			first = open[0] 		# je to vlastne zasobnik
			open.delete_at(0)		# zmensi pole
			if closed[first.id-1] == nil	
				closed[first.id-1] = 1		# toto id bylo navstiveno			
				print "#{first.id} "		# vypis jeho navstevu
				open = first.nodes + open	# do open pridej sousedy aktualniho uzlu, pokud uz nejsou v closed
			end

			# print "( "
			# open.each do
			#	|o|
			#	print "#{o.id} "
			# end
			# print ") "		

		end until closed.size == @nodes.size || open.size == 0

		#print " e: #{@nodes.size} == #{closed.size} || #{open.size == 0} "

		print "\n"

	end

	attr_reader :nodes
	attr_accessor :bd

	private
	def innerReadDFS(node,closed)

		while closed.size == @nodes.size  
			closed[node.id-1] = 1		# toto id bylo navstiveno			
			print "#{node.id} "			# vypis jeho navstevu

			node.nodes.each do			# pro kazdeho potomka proved zanoreni 
				|n|						# rekurze se postara o backtracking 
				if closed[n.id-1] == nil
					innerReadDFS(n,closed)
				end 
			end

		end 

		print "\n"

	end

end

# init
graphs = []

# nacti vstupy
t = gets.to_i	# the number of graphs <= 100

# nacitej grafy
for i in 1..t 

	buf_a2 = []
	buf_a = []

	n = gets.to_i	# 1 <= n <= 1000 the number of graph vertices

	# zaloz novy graf a zadej ho do registru
	newgraph = Graph.new(n)
	graphs[graphs.size] = newgraph 

	# nacitej pro uzly jejich sousedy
	n.times do

		# nacti radek s uzlem a jeho sousedy
		buf = gets
		buf_a2 = buf_a.dup
		buf_a = buf.split(' ')

		debug("BUF:\t#{buf}\n")
		debug("BUF_A:\t#{buf_a}\n")
		debug("BUF_A2:\t#{buf_a2}\n")

		# zaloz nebo ziskej uzel ke kteremu budeme davat sousedy 
		node = newgraph.getOrCreateNode(buf_a[0].to_i)

		# over jestli neni list sousedu prazdny
		if buf_a[1] != "0" 
			for u in 1..buf_a.size-1
				node_b = newgraph.getOrCreateNode(buf_a[u].to_i)
				node.addEdge(node_b)
				node_b.addEdge(node)
			end
		end
	end 

	# uzly a jejich sousede jsou nacteni
	# ted se bude vypisovat podle predpisu -pocatek- 

	print "graph #{i}\n"

	while true

		buf = gets
		buf_a = buf.split(' ')

		if buf_a.size != 2 || buf_a[0].to_i != 0 || buf_a[1].to_i != 0

			# BFS=1, DFS=0
			if buf_a[1].to_i == 1 
				newgraph.readBFS(buf_a[0].to_i)
			else 
				newgraph.readDFS(buf_a[0].to_i)
			end

		else 
			break
		end

	end 

end 

=begin

print "Status:\n\n \tgraphs:\t#{graphs.size}\n"
graphs.each do
	|g|
	print "\t\tnodes:\t#{g.nodes.size}\n\t\tBFS/DFS:\t#{g.bd == 1 ? "BFS" : "DFS"}\n"
end
=end

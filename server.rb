#!/usr/bin/ruby

require 'gserver'

class MyServer < GServer
	def initialize(port=9999, *args)
		super(port, *args)
	end
	def serve(io)
		io.puts(Time.now.to_s)
		f = File.open("./server.rb","r")
		print f.read
	end
end

server = MyServer.new
server.audit = true                  
server.start

a = gets

server.stop

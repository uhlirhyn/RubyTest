class BlockSaver
				def save_block(&block)
								@aBlock = block
				end
				def call_block_with_param(n)
								@aBlock.call(n)
				end
end

obj = BlockSaver.new

y = 10

obj.save_block do
				|x|
				y = y + x
end

puts obj.call_block_with_param(10)
puts obj.call_block_with_param(10)

# test objektu jako Proc

a = Proc.new {|c| print "number #{c}"}

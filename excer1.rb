def oddElements(a)

				b = []

				if block_given? 
								# vrati pole ale jeste predtim na tech lichych provede ten blok
								for i in 0..(a.count)
												if i%2==0
																b[b.count]=a[i]
																yield	a[i]
												end
								end
				else 
								# vrati nove pole s prvky na lichych pozicich
								for i in 0..(a.count)
												if i%2==0
																b[b.count]=a[i]
												end
								end
								return b
				end
end

puts oddElements([1,2,3,4,5,6])
oddElements([1,2,3,4,5,6]) do |x|
				puts x
end

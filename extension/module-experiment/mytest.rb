# Load in the extension (on OS X this loads ./MyTest/mytest.bundle - unsure about Linux, possibly mytest.so)
require './GC/gc'

module Giraffe 

a = GC.new
a.test(20)


end

#!/usr/bin/ruby

class MyError < StandardError
end

begin
raise MyError
rescue StandardError=>e
puts "StandardError"
rescue MyError=>e
puts "MyError"
end

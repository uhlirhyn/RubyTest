#!/usr/bin/env ruby

require_relative '../lib/anagram/runner.rb'
runner = Anagram::Runner.new(ARGV)
runner.run

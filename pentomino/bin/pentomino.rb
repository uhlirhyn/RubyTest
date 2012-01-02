#!/usr/bin/ruby

require_relative '../lib/pentomino/solver'

module Pentomino

    solver = Solver.new(ARGV[0].to_i, 
                        ARGV[1].to_i, 
                        ARGV[2].to_i, 
                        ARGV[3].to_i)
    solver.solve

end

    

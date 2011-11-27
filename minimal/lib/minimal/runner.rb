#!/usr/bin/ruby

require_relative "../../lib/minimal/reader.rb"
require_relative "../../lib/minimal/solver.rb"
require_relative "../../lib/minimal/printer.rb"

module Minimal

    class Runner 

        def run
            
            # read (veni)
            reader = Reader.new
            tests = reader.read_tests

            printer = Printer.new

            for test in tests do

                # solve (vidi)
                solver = Solver.new
                solution = solver.solve(test)

                # print (vici)
                printer.print_solution(solution)

            end
        end

    end

end

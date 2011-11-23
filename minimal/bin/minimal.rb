require_relative "../lib/minimal/reader.rb"
require_relative "../lib/minimal/solver.rb"
require_relative "../lib/minimal/printer.rb"

# read (veni)
reader = Reader.new
tests = reader.read_tests

printer = Printer.new

for test in tests do

    # solve (vidi)
    solver = Solver.new
    solution = solver.solve(test)

    # print (vici)
    printer.print(solution)

end

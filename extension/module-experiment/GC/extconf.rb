# Loads mkmf which is used to make makefiles for Ruby extensions
require 'mkmf'

# The destination
dir_config("gc")

# Do the work
create_makefile("gc")

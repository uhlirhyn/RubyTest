tree grammar GiraffeWalker

options { 
language = Ruby; 
output = AST;
}

@header {
require './lib/giraffe/env.rb'
}

@members {
@@progEnv = Env.new
}

	
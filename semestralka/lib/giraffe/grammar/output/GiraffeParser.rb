#!/usr/bin/env ruby
#
# /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g
# --
# Generated using ANTLR version: 3.4
# Ruby runtime library version: 
# Input grammar file: /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g
# Generated at: 2011-11-13 13:55:04
#

# ~~~> start load path setup
this_directory = File.expand_path( File.dirname( __FILE__ ) )
$LOAD_PATH.unshift( this_directory ) unless $LOAD_PATH.include?( this_directory )

antlr_load_failed = proc do
  load_path = $LOAD_PATH.map { |dir| '  - ' << dir }.join( $/ )
  raise LoadError, <<-END.strip!

Failed to load the ANTLR3 runtime library (version ):

Ensure the library has been installed on your system and is available
on the load path. If rubygems is available on your system, this can
be done with the command:

  gem install antlr3

Current load path:
#{ load_path }

  END
end

defined?( ANTLR3 ) or begin

  # 1: try to load the ruby antlr3 runtime library from the system path
  require 'antlr3'

rescue LoadError

  # 2: try to load rubygems if it isn't already loaded
  defined?( Gem ) or begin
    require 'rubygems'
  rescue LoadError
    antlr_load_failed.call
  end

  # 3: try to activate the antlr3 gem
  begin
    Gem.activate( 'antlr3', '~> ' )
  rescue Gem::LoadError
    antlr_load_failed.call
  end

  require 'antlr3'

end
# <~~~ end load path setup


module Giraffe
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :EOF => -1, :T__57 => 57, :T__58 => 58, :AND => 4, :ASSIGN => 5, 
                   :BREAK => 6, :CHAR => 7, :COLON => 8, :COMMA => 9, :COMMENT => 10, 
                   :DIV => 11, :DO => 12, :ELIF => 13, :ELSE => 14, :ELSEIF => 15, 
                   :EQ => 16, :ESC_SEQ => 17, :EXIT => 18, :EXPONENT => 19, 
                   :FALSE => 20, :FLOAT => 21, :FOR => 22, :GE => 23, :GT => 24, 
                   :HEX_DIGIT => 25, :ID => 26, :IF => 27, :INT => 28, :LB => 29, 
                   :LCB => 30, :LE => 31, :LT => 32, :MINUS => 33, :MOD => 34, 
                   :MUL => 35, :NE => 36, :NOT => 37, :OCTAL_ESC => 38, 
                   :OR => 39, :PLUS => 40, :PRINT => 41, :PRINTL => 42, 
                   :PRINTLN => 43, :QUOTE => 44, :RB => 45, :RCB => 46, 
                   :READ => 47, :RETURN => 48, :SEMICOLON => 49, :STRING => 50, 
                   :TO_FLOAT => 51, :TO_INT => 52, :TRUE => 53, :UNICODE_ESC => 54, 
                   :WHILE => 55, :WS => 56 )


    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "AND", "ASSIGN", "BREAK", "CHAR", "COLON", "COMMA", 
                    "COMMENT", "DIV", "DO", "ELIF", "ELSE", "ELSEIF", "EQ", 
                    "ESC_SEQ", "EXIT", "EXPONENT", "FALSE", "FLOAT", "FOR", 
                    "GE", "GT", "HEX_DIGIT", "ID", "IF", "INT", "LB", "LCB", 
                    "LE", "LT", "MINUS", "MOD", "MUL", "NE", "NOT", "OCTAL_ESC", 
                    "OR", "PLUS", "PRINT", "PRINTL", "PRINTLN", "QUOTE", 
                    "RB", "RCB", "READ", "RETURN", "SEMICOLON", "STRING", 
                    "TO_FLOAT", "TO_INT", "TRUE", "UNICODE_ESC", "WHILE", 
                    "WS", "'\\n'", "'\\r'" )


  end


  class Parser < ANTLR3::Parser
  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end


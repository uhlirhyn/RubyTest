#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-11-14 00:00:27
# 

# ~~~> start load path setup
this_directory = File.expand_path( File.dirname( __FILE__ ) )
$LOAD_PATH.unshift( this_directory ) unless $LOAD_PATH.include?( this_directory )

antlr_load_failed = proc do
  load_path = $LOAD_PATH.map { |dir| '  - ' << dir }.join( $/ )
  raise LoadError, <<-END.strip!
  
Failed to load the ANTLR3 runtime library (version 1.8.11):

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
    Gem.activate( 'antlr3', '~> 1.8.11' )
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
    define_tokens( :EXPONENT => 51, :LT => 34, :RB => 13, :WHILE => 24, 
                   :MOD => 40, :OCTAL_ESC => 50, :FOR => 26, :DO => 25, 
                   :FLOAT => 43, :NOT => 31, :AND => 30, :ID => 28, :RCB => 5, 
                   :EOF => -1, :TO_INT => 41, :BREAK => 9, :IF => 20, :TO_FLOAT => 42, 
                   :T__55 => 55, :T__56 => 56, :T__57 => 57, :T__58 => 58, 
                   :ESC_SEQ => 47, :T__54 => 54, :LCB => 4, :COMMA => 27, 
                   :PRINTLN => 19, :RETURN => 10, :PLUS => 14, :EQ => 32, 
                   :COMMENT => 6, :NE => 33, :EXIT => 11, :GE => 37, :UNICODE_ESC => 49, 
                   :ELSE => 21, :HEX_DIGIT => 48, :SEMICOLON => 7, :INT => 16, 
                   :MINUS => 15, :MUL => 38, :TRUE => 45, :PRINT => 17, 
                   :ELSEIF => 22, :PRINTL => 18, :COLON => 53, :ELIF => 23, 
                   :WS => 52, :READ => 8, :OR => 29, :ASSIGN => 44, :GT => 35, 
                   :LB => 12, :DIV => 39, :FALSE => 46, :LE => 36 )
    
  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = Giraffe
    include TokenData

    
    begin
      generated_using( "Giraffe.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end
    
    RULE_NAMES   = [ "T__54", "T__55", "T__56", "T__57", "T__58", "HEX_DIGIT", 
                     "ESC_SEQ", "OCTAL_ESC", "UNICODE_ESC", "TO_INT", "TO_FLOAT", 
                     "READ", "PRINT", "PRINTL", "PRINTLN", "TRUE", "FALSE", 
                     "FOR", "IF", "ELSE", "ELIF", "ELSEIF", "WHILE", "DO", 
                     "RETURN", "EXIT", "BREAK", "ID", "INT", "FLOAT", "COMMENT", 
                     "WS", "EXPONENT", "LB", "RB", "LCB", "RCB", "COMMA", 
                     "COLON", "SEMICOLON", "ASSIGN", "PLUS", "MINUS", "MUL", 
                     "DIV", "MOD", "EQ", "NE", "LT", "GT", "LE", "GE", "AND", 
                     "OR", "NOT" ].freeze
    RULE_METHODS = [ :t__54!, :t__55!, :t__56!, :t__57!, :t__58!, :hex_digit!, 
                     :esc_seq!, :octal_esc!, :unicode_esc!, :to_int!, :to_float!, 
                     :read!, :print!, :printl!, :println!, :true!, :false!, 
                     :for!, :if!, :else!, :elif!, :elseif!, :while!, :do!, 
                     :return!, :exit!, :break!, :id!, :int!, :float!, :comment!, 
                     :ws!, :exponent!, :lb!, :rb!, :lcb!, :rcb!, :comma!, 
                     :colon!, :semicolon!, :assign!, :plus!, :minus!, :mul!, 
                     :div!, :mod!, :eq!, :ne!, :lt!, :gt!, :le!, :ge!, :and!, 
                     :or!, :not! ].freeze

    
    def initialize( input=nil, options = {} )
      super( input, options )

    end
    
    
    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule t__54! (T__54)
    # (in Giraffe.g)
    def t__54!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      type = T__54
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 7:9: '\\r'
      match( 0xd )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 1 )

    end

    # lexer rule t__55! (T__55)
    # (in Giraffe.g)
    def t__55!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      type = T__55
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 8:9: '\\n'
      match( 0xa )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 2 )

    end

    # lexer rule t__56! (T__56)
    # (in Giraffe.g)
    def t__56!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      type = T__56
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 9:9: '['
      match( 0x5b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )

    end

    # lexer rule t__57! (T__57)
    # (in Giraffe.g)
    def t__57!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      type = T__57
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 10:9: ']'
      match( 0x5d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )

    end

    # lexer rule t__58! (T__58)
    # (in Giraffe.g)
    def t__58!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )

      type = T__58
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 11:9: '\"'
      match( 0x22 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )

    end

    # lexer rule hex_digit! (HEX_DIGIT)
    # (in Giraffe.g)
    def hex_digit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )

      
      # - - - - main rule block - - - -
      # at line 281:13: ( '0' .. '9' | 'a' .. 'f' | 'A' .. 'F' )
      if @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x46 ) || @input.peek( 1 ).between?( 0x61, 0x66 )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )

    end

    # lexer rule esc_seq! (ESC_SEQ)
    # (in Giraffe.g)
    def esc_seq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )

      
      # - - - - main rule block - - - -
      # at line 285:5: ( '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' ) | UNICODE_ESC | OCTAL_ESC )
      alt_1 = 3
      look_1_0 = @input.peek( 1 )

      if ( look_1_0 == 0x5c )
        case look_1 = @input.peek( 2 )
        when 0x22, 0x27, 0x5c, 0x62, 0x66, 0x6e, 0x72, 0x74 then alt_1 = 1
        when 0x75 then alt_1 = 2
        when 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37 then alt_1 = 3
        else
          raise NoViableAlternative( "", 1, 1 )
        end
      else
        raise NoViableAlternative( "", 1, 0 )
      end
      case alt_1
      when 1
        # at line 285:9: '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' )
        match( 0x5c )
        if @input.peek(1) == 0x22 || @input.peek(1) == 0x27 || @input.peek(1) == 0x5c || @input.peek(1) == 0x62 || @input.peek(1) == 0x66 || @input.peek(1) == 0x6e || @input.peek(1) == 0x72 || @input.peek(1) == 0x74
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse
        end



      when 2
        # at line 286:9: UNICODE_ESC
        unicode_esc!

      when 3
        # at line 287:9: OCTAL_ESC
        octal_esc!

      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )

    end

    # lexer rule octal_esc! (OCTAL_ESC)
    # (in Giraffe.g)
    def octal_esc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )

      
      # - - - - main rule block - - - -
      # at line 292:5: ( '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) )
      alt_2 = 3
      look_2_0 = @input.peek( 1 )

      if ( look_2_0 == 0x5c )
        look_2_1 = @input.peek( 2 )

        if ( look_2_1.between?( 0x30, 0x33 ) )
          look_2_2 = @input.peek( 3 )

          if ( look_2_2.between?( 0x30, 0x37 ) )
            look_2_4 = @input.peek( 4 )

            if ( look_2_4.between?( 0x30, 0x37 ) )
              alt_2 = 1
            else
              alt_2 = 2
            end
          else
            alt_2 = 3
          end
        elsif ( look_2_1.between?( 0x34, 0x37 ) )
          look_2_3 = @input.peek( 3 )

          if ( look_2_3.between?( 0x30, 0x37 ) )
            alt_2 = 2
          else
            alt_2 = 3
          end
        else
          raise NoViableAlternative( "", 2, 1 )
        end
      else
        raise NoViableAlternative( "", 2, 0 )
      end
      case alt_2
      when 1
        # at line 292:9: '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 292:14: ( '0' .. '3' )
        # at line 292:15: '0' .. '3'
        match_range( 0x30, 0x33 )

        # at line 292:25: ( '0' .. '7' )
        # at line 292:26: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 292:36: ( '0' .. '7' )
        # at line 292:37: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 2
        # at line 293:9: '\\\\' ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 293:14: ( '0' .. '7' )
        # at line 293:15: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 293:25: ( '0' .. '7' )
        # at line 293:26: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 3
        # at line 294:9: '\\\\' ( '0' .. '7' )
        match( 0x5c )
        # at line 294:14: ( '0' .. '7' )
        # at line 294:15: '0' .. '7'
        match_range( 0x30, 0x37 )


      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )

    end

    # lexer rule unicode_esc! (UNICODE_ESC)
    # (in Giraffe.g)
    def unicode_esc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )

      
      # - - - - main rule block - - - -
      # at line 299:9: '\\\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
      match( 0x5c )
      match( 0x75 )
      hex_digit!
      hex_digit!
      hex_digit!
      hex_digit!

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )

    end

    # lexer rule to_int! (TO_INT)
    # (in Giraffe.g)
    def to_int!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )

      type = TO_INT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 302:10: 'int:'
      match( "int:" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )

    end

    # lexer rule to_float! (TO_FLOAT)
    # (in Giraffe.g)
    def to_float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )

      type = TO_FLOAT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 303:11: 'float:'
      match( "float:" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )

    end

    # lexer rule read! (READ)
    # (in Giraffe.g)
    def read!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )

      type = READ
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 304:8: 'read'
      match( "read" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )

    end

    # lexer rule print! (PRINT)
    # (in Giraffe.g)
    def print!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      type = PRINT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 305:9: 'print'
      match( "print" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )

    end

    # lexer rule printl! (PRINTL)
    # (in Giraffe.g)
    def printl!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )

      type = PRINTL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 306:10: 'printl'
      match( "printl" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )

    end

    # lexer rule println! (PRINTLN)
    # (in Giraffe.g)
    def println!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      type = PRINTLN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 307:11: 'println'
      match( "println" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )

    end

    # lexer rule true! (TRUE)
    # (in Giraffe.g)
    def true!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      type = TRUE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 308:8: 'true'
      match( "true" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )

    end

    # lexer rule false! (FALSE)
    # (in Giraffe.g)
    def false!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )

      type = FALSE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 309:9: 'false'
      match( "false" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )

    end

    # lexer rule for! (FOR)
    # (in Giraffe.g)
    def for!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )

      type = FOR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 310:7: 'for'
      match( "for" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )

    end

    # lexer rule if! (IF)
    # (in Giraffe.g)
    def if!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )

      type = IF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 311:6: 'if'
      match( "if" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 19 )

    end

    # lexer rule else! (ELSE)
    # (in Giraffe.g)
    def else!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )

      type = ELSE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 312:8: 'else'
      match( "else" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 20 )

    end

    # lexer rule elif! (ELIF)
    # (in Giraffe.g)
    def elif!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )

      type = ELIF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 313:8: 'elif'
      match( "elif" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 21 )

    end

    # lexer rule elseif! (ELSEIF)
    # (in Giraffe.g)
    def elseif!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )

      type = ELSEIF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 314:10: 'elseif'
      match( "elseif" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 22 )

    end

    # lexer rule while! (WHILE)
    # (in Giraffe.g)
    def while!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )

      type = WHILE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 315:9: 'while'
      match( "while" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 23 )

    end

    # lexer rule do! (DO)
    # (in Giraffe.g)
    def do!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )

      type = DO
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 316:6: 'do'
      match( "do" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 24 )

    end

    # lexer rule return! (RETURN)
    # (in Giraffe.g)
    def return!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )

      type = RETURN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 317:10: 'return'
      match( "return" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 25 )

    end

    # lexer rule exit! (EXIT)
    # (in Giraffe.g)
    def exit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )

      type = EXIT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 318:8: 'exit'
      match( "exit" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 26 )

    end

    # lexer rule break! (BREAK)
    # (in Giraffe.g)
    def break!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )

      type = BREAK
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 319:9: 'break'
      match( "break" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 27 )

    end

    # lexer rule id! (ID)
    # (in Giraffe.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )

      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 321:7: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 321:31: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      while true # decision 3
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0.between?( 0x30, 0x39 ) || look_3_0.between?( 0x41, 0x5a ) || look_3_0 == 0x5f || look_3_0.between?( 0x61, 0x7a ) )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse
          end



        else
          break # out of loop for decision 3
        end
      end # loop for decision 3

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 28 )

    end

    # lexer rule int! (INT)
    # (in Giraffe.g)
    def int!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )

      type = INT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 324:7: ( '0' .. '9' )+
      # at file 324:7: ( '0' .. '9' )+
      match_count_4 = 0
      while true
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0.between?( 0x30, 0x39 ) )
          alt_4 = 1

        end
        case alt_4
        when 1
          # at line 324:7: '0' .. '9'
          match_range( 0x30, 0x39 )

        else
          match_count_4 > 0 and break
          eee = EarlyExit(4)


          raise eee
        end
        match_count_4 += 1
      end


      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 29 )

    end

    # lexer rule float! (FLOAT)
    # (in Giraffe.g)
    def float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )

      
      # - - - - main rule block - - - -
      # at line 329:5: ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT )
      alt_11 = 3
      alt_11 = @dfa11.predict( @input )
      case alt_11
      when 1
        # at line 329:9: ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )?
        # at file 329:9: ( '0' .. '9' )+
        match_count_5 = 0
        while true
          alt_5 = 2
          look_5_0 = @input.peek( 1 )

          if ( look_5_0.between?( 0x30, 0x39 ) )
            alt_5 = 1

          end
          case alt_5
          when 1
            # at line 329:10: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_5 > 0 and break
            eee = EarlyExit(5)


            raise eee
          end
          match_count_5 += 1
        end

        match( 0x2e )
        # at line 329:25: ( '0' .. '9' )*
        while true # decision 6
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0.between?( 0x30, 0x39 ) )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 329:26: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            break # out of loop for decision 6
          end
        end # loop for decision 6
        # at line 329:37: ( EXPONENT )?
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == 0x45 || look_7_0 == 0x65 )
          alt_7 = 1
        end
        case alt_7
        when 1
          # at line 329:37: EXPONENT
          exponent!

        end

      when 2
        # at line 330:9: '.' ( '0' .. '9' )+ ( EXPONENT )?
        match( 0x2e )
        # at file 330:13: ( '0' .. '9' )+
        match_count_8 = 0
        while true
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0.between?( 0x30, 0x39 ) )
            alt_8 = 1

          end
          case alt_8
          when 1
            # at line 330:14: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_8 > 0 and break
            eee = EarlyExit(8)


            raise eee
          end
          match_count_8 += 1
        end

        # at line 330:25: ( EXPONENT )?
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == 0x45 || look_9_0 == 0x65 )
          alt_9 = 1
        end
        case alt_9
        when 1
          # at line 330:25: EXPONENT
          exponent!

        end

      when 3
        # at line 331:9: ( '0' .. '9' )+ EXPONENT
        # at file 331:9: ( '0' .. '9' )+
        match_count_10 = 0
        while true
          alt_10 = 2
          look_10_0 = @input.peek( 1 )

          if ( look_10_0.between?( 0x30, 0x39 ) )
            alt_10 = 1

          end
          case alt_10
          when 1
            # at line 331:10: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_10 > 0 and break
            eee = EarlyExit(10)


            raise eee
          end
          match_count_10 += 1
        end

        exponent!

      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 30 )

    end

    # lexer rule comment! (COMMENT)
    # (in Giraffe.g)
    def comment!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )

      type = COMMENT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 335:9: '#' (~ ( '\\n' | '\\r' ) )*
      match( 0x23 )
      # at line 335:13: (~ ( '\\n' | '\\r' ) )*
      while true # decision 12
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0.between?( 0x0, 0x9 ) || look_12_0.between?( 0xb, 0xc ) || look_12_0.between?( 0xe, 0xffff ) )
          alt_12 = 1

        end
        case alt_12
        when 1
          # at line 335:13: ~ ( '\\n' | '\\r' )
          if @input.peek( 1 ).between?( 0x0, 0x9 ) || @input.peek( 1 ).between?( 0xb, 0xc ) || @input.peek( 1 ).between?( 0xe, 0xff )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse
          end



        else
          break # out of loop for decision 12
        end
      end # loop for decision 12
      # --> action
      channel=HIDDEN;
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 31 )

    end

    # lexer rule ws! (WS)
    # (in Giraffe.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )

      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 338:9: ( ' ' | '\\t' | '\\r' | '\\n' )
      if @input.peek( 1 ).between?( 0x9, 0xa ) || @input.peek(1) == 0xd || @input.peek(1) == 0x20
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # --> action
      channel=HIDDEN;
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )

    end

    # lexer rule exponent! (EXPONENT)
    # (in Giraffe.g)
    def exponent!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )

      
      # - - - - main rule block - - - -
      # at line 346:12: ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+
      if @input.peek(1) == 0x45 || @input.peek(1) == 0x65
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 346:22: ( '+' | '-' )?
      alt_13 = 2
      look_13_0 = @input.peek( 1 )

      if ( look_13_0 == 0x2b || look_13_0 == 0x2d )
        alt_13 = 1
      end
      case alt_13
      when 1
        # at line 
        if @input.peek(1) == 0x2b || @input.peek(1) == 0x2d
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse
        end



      end
      # at file 346:33: ( '0' .. '9' )+
      match_count_14 = 0
      while true
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0.between?( 0x30, 0x39 ) )
          alt_14 = 1

        end
        case alt_14
        when 1
          # at line 346:34: '0' .. '9'
          match_range( 0x30, 0x39 )

        else
          match_count_14 > 0 and break
          eee = EarlyExit(14)


          raise eee
        end
        match_count_14 += 1
      end


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )

    end

    # lexer rule lb! (LB)
    # (in Giraffe.g)
    def lb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )

      type = LB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 348:6: '('
      match( 0x28 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 34 )

    end

    # lexer rule rb! (RB)
    # (in Giraffe.g)
    def rb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )

      type = RB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 349:6: ')'
      match( 0x29 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 35 )

    end

    # lexer rule lcb! (LCB)
    # (in Giraffe.g)
    def lcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )

      type = LCB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 350:7: '{'
      match( 0x7b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 36 )

    end

    # lexer rule rcb! (RCB)
    # (in Giraffe.g)
    def rcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )

      type = RCB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 351:7: '}'
      match( 0x7d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 37 )

    end

    # lexer rule comma! (COMMA)
    # (in Giraffe.g)
    def comma!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )

      type = COMMA
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 352:9: ','
      match( 0x2c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 38 )

    end

    # lexer rule colon! (COLON)
    # (in Giraffe.g)
    def colon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )

      type = COLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 353:9: ':'
      match( 0x3a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 39 )

    end

    # lexer rule semicolon! (SEMICOLON)
    # (in Giraffe.g)
    def semicolon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )

      type = SEMICOLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 355:4: ';'
      match( 0x3b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 40 )

    end

    # lexer rule assign! (ASSIGN)
    # (in Giraffe.g)
    def assign!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )

      type = ASSIGN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 356:10: '='
      match( 0x3d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 41 )

    end

    # lexer rule plus! (PLUS)
    # (in Giraffe.g)
    def plus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )

      type = PLUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 357:8: '+'
      match( 0x2b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 42 )

    end

    # lexer rule minus! (MINUS)
    # (in Giraffe.g)
    def minus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )

      type = MINUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 358:9: '-'
      match( 0x2d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 43 )

    end

    # lexer rule mul! (MUL)
    # (in Giraffe.g)
    def mul!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )

      type = MUL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 359:7: '*'
      match( 0x2a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 44 )

    end

    # lexer rule div! (DIV)
    # (in Giraffe.g)
    def div!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )

      type = DIV
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 360:7: '/'
      match( 0x2f )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 45 )

    end

    # lexer rule mod! (MOD)
    # (in Giraffe.g)
    def mod!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )

      type = MOD
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 361:7: '%'
      match( 0x25 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 46 )

    end

    # lexer rule eq! (EQ)
    # (in Giraffe.g)
    def eq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )

      type = EQ
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 363:6: '=='
      match( "==" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 47 )

    end

    # lexer rule ne! (NE)
    # (in Giraffe.g)
    def ne!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )

      type = NE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 364:6: '!='
      match( "!=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 48 )

    end

    # lexer rule lt! (LT)
    # (in Giraffe.g)
    def lt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )

      type = LT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 365:6: '<'
      match( 0x3c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 49 )

    end

    # lexer rule gt! (GT)
    # (in Giraffe.g)
    def gt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )

      type = GT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 366:6: '>'
      match( 0x3e )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 50 )

    end

    # lexer rule le! (LE)
    # (in Giraffe.g)
    def le!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )

      type = LE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 367:6: '<='
      match( "<=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 51 )

    end

    # lexer rule ge! (GE)
    # (in Giraffe.g)
    def ge!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 52 )

      type = GE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 368:6: '>='
      match( ">=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 52 )

    end

    # lexer rule and! (AND)
    # (in Giraffe.g)
    def and!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )

      type = AND
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 370:7: '&&'
      match( "&&" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 53 )

    end

    # lexer rule or! (OR)
    # (in Giraffe.g)
    def or!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )

      type = OR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 371:6: '||'
      match( "||" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 54 )

    end

    # lexer rule not! (NOT)
    # (in Giraffe.g)
    def not!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )

      type = NOT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 372:7: '!'
      match( 0x21 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 55 )

    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    # 
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( T__54 | T__55 | T__56 | T__57 | T__58 | TO_INT | TO_FLOAT | READ | PRINT | PRINTL | PRINTLN | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | RETURN | EXIT | BREAK | ID | INT | COMMENT | WS | LB | RB | LCB | RCB | COMMA | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT )
      alt_15 = 49
      alt_15 = @dfa15.predict( @input )
      case alt_15
      when 1
        # at line 1:10: T__54
        t__54!

      when 2
        # at line 1:16: T__55
        t__55!

      when 3
        # at line 1:22: T__56
        t__56!

      when 4
        # at line 1:28: T__57
        t__57!

      when 5
        # at line 1:34: T__58
        t__58!

      when 6
        # at line 1:40: TO_INT
        to_int!

      when 7
        # at line 1:47: TO_FLOAT
        to_float!

      when 8
        # at line 1:56: READ
        read!

      when 9
        # at line 1:61: PRINT
        print!

      when 10
        # at line 1:67: PRINTL
        printl!

      when 11
        # at line 1:74: PRINTLN
        println!

      when 12
        # at line 1:82: TRUE
        true!

      when 13
        # at line 1:87: FALSE
        false!

      when 14
        # at line 1:93: FOR
        for!

      when 15
        # at line 1:97: IF
        if!

      when 16
        # at line 1:100: ELSE
        else!

      when 17
        # at line 1:105: ELIF
        elif!

      when 18
        # at line 1:110: ELSEIF
        elseif!

      when 19
        # at line 1:117: WHILE
        while!

      when 20
        # at line 1:123: DO
        do!

      when 21
        # at line 1:126: RETURN
        return!

      when 22
        # at line 1:133: EXIT
        exit!

      when 23
        # at line 1:138: BREAK
        break!

      when 24
        # at line 1:144: ID
        id!

      when 25
        # at line 1:147: INT
        int!

      when 26
        # at line 1:151: COMMENT
        comment!

      when 27
        # at line 1:159: WS
        ws!

      when 28
        # at line 1:162: LB
        lb!

      when 29
        # at line 1:165: RB
        rb!

      when 30
        # at line 1:168: LCB
        lcb!

      when 31
        # at line 1:172: RCB
        rcb!

      when 32
        # at line 1:176: COMMA
        comma!

      when 33
        # at line 1:182: COLON
        colon!

      when 34
        # at line 1:188: SEMICOLON
        semicolon!

      when 35
        # at line 1:198: ASSIGN
        assign!

      when 36
        # at line 1:205: PLUS
        plus!

      when 37
        # at line 1:210: MINUS
        minus!

      when 38
        # at line 1:216: MUL
        mul!

      when 39
        # at line 1:220: DIV
        div!

      when 40
        # at line 1:224: MOD
        mod!

      when 41
        # at line 1:228: EQ
        eq!

      when 42
        # at line 1:231: NE
        ne!

      when 43
        # at line 1:234: LT
        lt!

      when 44
        # at line 1:237: GT
        gt!

      when 45
        # at line 1:240: LE
        le!

      when 46
        # at line 1:243: GE
        ge!

      when 47
        # at line 1:246: AND
        and!

      when 48
        # at line 1:250: OR
        or!

      when 49
        # at line 1:253: NOT
        not!

      end
    end

    
    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA11 < ANTLR3::DFA
      EOT = unpack( 5, -1 )
      EOF = unpack( 5, -1 )
      MIN = unpack( 2, 46, 3, -1 )
      MAX = unpack( 1, 57, 1, 101, 3, -1 )
      ACCEPT = unpack( 2, -1, 1, 2, 1, 1, 1, 3 )
      SPECIAL = unpack( 5, -1 )
      TRANSITION = [
        unpack( 1, 2, 1, -1, 10, 1 ),
        unpack( 1, 3, 1, -1, 10, 1, 11, -1, 1, 4, 31, -1, 1, 4 ),
        unpack(  ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 11
      

      def description
        <<-'__dfa_description__'.strip!
          327:1: fragment FLOAT : ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT );
        __dfa_description__
      end
    end
    class DFA15 < ANTLR3::DFA
      EOT = unpack( 6, -1, 9, 15, 11, -1, 1, 53, 5, -1, 1, 55, 1, 57, 1, 
                    59, 4, -1, 1, 15, 1, 61, 9, 15, 1, 73, 1, 15, 8, -1, 
                    1, 15, 1, -1, 2, 15, 1, 78, 8, 15, 1, -1, 1, 15, 1, 
                    -1, 2, 15, 1, -1, 1, 90, 2, 15, 1, 93, 1, 95, 1, 96, 
                    1, 97, 3, 15, 1, 101, 1, -1, 1, 15, 1, 104, 1, -1, 1, 
                    15, 3, -1, 1, 106, 1, 107, 2, -1, 1, 108, 1, 110, 1, 
                    -1, 1, 111, 3, -1, 1, 112, 3, -1 )
      EOF = unpack( 113, -1 )
      MIN = unpack( 1, 9, 5, -1, 1, 102, 1, 97, 1, 101, 2, 114, 1, 108, 
                    1, 104, 1, 111, 1, 114, 11, -1, 1, 61, 5, -1, 3, 61, 
                    4, -1, 1, 116, 1, 48, 1, 111, 1, 108, 1, 114, 1, 97, 
                    1, 105, 1, 117, 3, 105, 1, 48, 1, 101, 8, -1, 1, 58, 
                    1, -1, 1, 97, 1, 115, 1, 48, 1, 100, 1, 117, 1, 110, 
                    2, 101, 1, 102, 1, 116, 1, 108, 1, -1, 1, 97, 1, -1, 
                    1, 116, 1, 101, 1, -1, 1, 48, 1, 114, 1, 116, 4, 48, 
                    1, 101, 1, 107, 1, 58, 1, 48, 1, -1, 1, 110, 1, 48, 
                    1, -1, 1, 102, 3, -1, 2, 48, 2, -1, 2, 48, 1, -1, 1, 
                    48, 3, -1, 1, 48, 3, -1 )
      MAX = unpack( 1, 125, 5, -1, 1, 110, 1, 111, 1, 101, 2, 114, 1, 120, 
                    1, 104, 1, 111, 1, 114, 11, -1, 1, 61, 5, -1, 3, 61, 
                    4, -1, 1, 116, 1, 122, 1, 111, 1, 108, 1, 114, 1, 116, 
                    1, 105, 1, 117, 1, 115, 2, 105, 1, 122, 1, 101, 8, -1, 
                    1, 58, 1, -1, 1, 97, 1, 115, 1, 122, 1, 100, 1, 117, 
                    1, 110, 2, 101, 1, 102, 1, 116, 1, 108, 1, -1, 1, 97, 
                    1, -1, 1, 116, 1, 101, 1, -1, 1, 122, 1, 114, 1, 116, 
                    4, 122, 1, 101, 1, 107, 1, 58, 1, 122, 1, -1, 1, 110, 
                    1, 122, 1, -1, 1, 102, 3, -1, 2, 122, 2, -1, 2, 122, 
                    1, -1, 1, 122, 3, -1, 1, 122, 3, -1 )
      ACCEPT = unpack( 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 9, -1, 1, 24, 
                       1, 25, 1, 26, 1, 27, 1, 28, 1, 29, 1, 30, 1, 31, 
                       1, 32, 1, 33, 1, 34, 1, -1, 1, 36, 1, 37, 1, 38, 
                       1, 39, 1, 40, 3, -1, 1, 47, 1, 48, 1, 1, 1, 2, 13, 
                       -1, 1, 41, 1, 35, 1, 42, 1, 49, 1, 45, 1, 43, 1, 
                       46, 1, 44, 1, -1, 1, 15, 11, -1, 1, 20, 1, -1, 1, 
                       6, 2, -1, 1, 14, 11, -1, 1, 8, 2, -1, 1, 12, 1, -1, 
                       1, 16, 1, 17, 1, 22, 2, -1, 1, 7, 1, 13, 2, -1, 1, 
                       9, 1, -1, 1, 19, 1, 23, 1, 21, 1, -1, 1, 10, 1, 18, 
                       1, 11 )
      SPECIAL = unpack( 113, -1 )
      TRANSITION = [
        unpack( 1, 18, 1, 2, 2, -1, 1, 1, 18, -1, 1, 18, 1, 32, 1, 5, 1, 
                17, 1, -1, 1, 31, 1, 35, 1, -1, 1, 19, 1, 20, 1, 29, 1, 
                27, 1, 23, 1, 28, 1, -1, 1, 30, 10, 16, 1, 24, 1, 25, 1, 
                33, 1, 26, 1, 34, 2, -1, 26, 15, 1, 3, 1, -1, 1, 4, 1, -1, 
                1, 15, 1, -1, 1, 15, 1, 14, 1, 15, 1, 13, 1, 11, 1, 7, 2, 
                15, 1, 6, 6, 15, 1, 9, 1, 15, 1, 8, 1, 15, 1, 10, 2, 15, 
                1, 12, 3, 15, 1, 21, 1, 36, 1, 22 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 40, 7, -1, 1, 39 ),
        unpack( 1, 42, 10, -1, 1, 41, 2, -1, 1, 43 ),
        unpack( 1, 44 ),
        unpack( 1, 45 ),
        unpack( 1, 46 ),
        unpack( 1, 47, 11, -1, 1, 48 ),
        unpack( 1, 49 ),
        unpack( 1, 50 ),
        unpack( 1, 51 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 52 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 54 ),
        unpack( 1, 56 ),
        unpack( 1, 58 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 60 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 1, 62 ),
        unpack( 1, 63 ),
        unpack( 1, 64 ),
        unpack( 1, 65, 18, -1, 1, 66 ),
        unpack( 1, 67 ),
        unpack( 1, 68 ),
        unpack( 1, 70, 9, -1, 1, 69 ),
        unpack( 1, 71 ),
        unpack( 1, 72 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 1, 74 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 75 ),
        unpack(  ),
        unpack( 1, 76 ),
        unpack( 1, 77 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 1, 79 ),
        unpack( 1, 80 ),
        unpack( 1, 81 ),
        unpack( 1, 82 ),
        unpack( 1, 83 ),
        unpack( 1, 84 ),
        unpack( 1, 85 ),
        unpack( 1, 86 ),
        unpack(  ),
        unpack( 1, 87 ),
        unpack(  ),
        unpack( 1, 88 ),
        unpack( 1, 89 ),
        unpack(  ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 1, 91 ),
        unpack( 1, 92 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 8, 15, 1, 94, 
                 17, 15 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 1, 98 ),
        unpack( 1, 99 ),
        unpack( 1, 100 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack(  ),
        unpack( 1, 102 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 11, 15, 1, 
                 103, 14, 15 ),
        unpack(  ),
        unpack( 1, 105 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 13, 15, 1, 
                 109, 12, 15 ),
        unpack(  ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack(  ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 15
      

      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( T__54 | T__55 | T__56 | T__57 | T__58 | TO_INT | TO_FLOAT | READ | PRINT | PRINTL | PRINTLN | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | RETURN | EXIT | BREAK | ID | INT | COMMENT | WS | LB | RB | LCB | RCB | COMMA | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT );
        __dfa_description__
      end
    end

    
    private
    
    def initialize_dfas
      super rescue nil
      @dfa11 = DFA11.new( self, 11 )
      @dfa15 = DFA15.new( self, 15 )

    end
  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0
end


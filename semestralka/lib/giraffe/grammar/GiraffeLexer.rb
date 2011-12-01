#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-12-01 23:36:49
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
    define_tokens( :EXPONENT => 57, :CLASS => 51, :LT => 35, :T__64 => 64, 
                   :T__65 => 65, :T__62 => 62, :WHILE => 25, :T__63 => 63, 
                   :RB => 11, :MOD => 41, :OCTAL_ESC => 55, :NEW => 45, 
                   :FOR => 27, :DO => 26, :FLOAT => 44, :NOT => 32, :RCB => 21, 
                   :ID => 28, :AND => 31, :EOF => -1, :TO_INT => 42, :BREAK => 7, 
                   :IF => 19, :TO_FLOAT => 43, :QUOTE => 59, :ESC_SEQ => 50, 
                   :CONTINUE => 56, :QM => 61, :COMMA => 18, :LCB => 20, 
                   :PRINTLN => 17, :RETURN => 8, :PLUS => 12, :SUPERCLASS => 52, 
                   :EQ => 33, :COMMENT => 4, :DOT => 29, :NE => 34, :EXIT => 9, 
                   :GE => 38, :UNICODE_ESC => 54, :ELSE => 22, :HEX_DIGIT => 53, 
                   :SEMICOLON => 5, :INT => 14, :MINUS => 13, :MUL => 39, 
                   :TRUE => 47, :PRINT => 15, :ELSEIF => 23, :PRINTL => 16, 
                   :COLON => 60, :ELIF => 24, :WS => 58, :READ => 6, :OR => 30, 
                   :ASSIGN => 46, :GT => 36, :LB => 10, :DIV => 40, :FALSE => 48, 
                   :LE => 37, :STRING => 49 )
    
  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = Giraffe
    include TokenData

    
    begin
      generated_using( "Giraffe.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end
    
    RULE_NAMES   = [ "T__62", "T__63", "T__64", "T__65", "STRING", "HEX_DIGIT", 
                     "ESC_SEQ", "OCTAL_ESC", "UNICODE_ESC", "TO_INT", "TO_FLOAT", 
                     "READ", "PRINT", "PRINTL", "PRINTLN", "TRUE", "FALSE", 
                     "FOR", "IF", "ELSE", "ELIF", "ELSEIF", "WHILE", "DO", 
                     "RETURN", "EXIT", "BREAK", "CONTINUE", "CLASS", "SUPERCLASS", 
                     "NEW", "ID", "INT", "FLOAT", "COMMENT", "WS", "EXPONENT", 
                     "LB", "RB", "LCB", "RCB", "QUOTE", "COMMA", "DOT", 
                     "COLON", "SEMICOLON", "ASSIGN", "PLUS", "MINUS", "MUL", 
                     "DIV", "MOD", "EQ", "NE", "LT", "GT", "LE", "GE", "AND", 
                     "OR", "NOT", "QM" ].freeze
    RULE_METHODS = [ :t__62!, :t__63!, :t__64!, :t__65!, :string!, :hex_digit!, 
                     :esc_seq!, :octal_esc!, :unicode_esc!, :to_int!, :to_float!, 
                     :read!, :print!, :printl!, :println!, :true!, :false!, 
                     :for!, :if!, :else!, :elif!, :elseif!, :while!, :do!, 
                     :return!, :exit!, :break!, :continue!, :class!, :superclass!, 
                     :new!, :id!, :int!, :float!, :comment!, :ws!, :exponent!, 
                     :lb!, :rb!, :lcb!, :rcb!, :quote!, :comma!, :dot!, 
                     :colon!, :semicolon!, :assign!, :plus!, :minus!, :mul!, 
                     :div!, :mod!, :eq!, :ne!, :lt!, :gt!, :le!, :ge!, :and!, 
                     :or!, :not!, :qm! ].freeze

    
    def initialize( input=nil, options = {} )
      super( input, options )

    end
    
    
    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule t__62! (T__62)
    # (in Giraffe.g)
    def t__62!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      type = T__62
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

    # lexer rule t__63! (T__63)
    # (in Giraffe.g)
    def t__63!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      type = T__63
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

    # lexer rule t__64! (T__64)
    # (in Giraffe.g)
    def t__64!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      type = T__64
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

    # lexer rule t__65! (T__65)
    # (in Giraffe.g)
    def t__65!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      type = T__65
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

    # lexer rule string! (STRING)
    # (in Giraffe.g)
    def string!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )

      type = STRING
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 298:8: '\"' ( ESC_SEQ | ' ' | ~ ( '\\\\' | '\"' | ' ' ) )* '\"'
      match( 0x22 )
      # at line 298:12: ( ESC_SEQ | ' ' | ~ ( '\\\\' | '\"' | ' ' ) )*
      while true # decision 1
        alt_1 = 4
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == 0x5c )
          alt_1 = 1
        elsif ( look_1_0 == 0x20 )
          alt_1 = 2
        elsif ( look_1_0.between?( 0x0, 0x1f ) || look_1_0 == 0x21 || look_1_0.between?( 0x23, 0x5b ) || look_1_0.between?( 0x5d, 0xffff ) )
          alt_1 = 3

        end
        case alt_1
        when 1
          # at line 298:14: ESC_SEQ
          esc_seq!

        when 2
          # at line 298:24: ' '
          match( 0x20 )

        when 3
          # at line 298:30: ~ ( '\\\\' | '\"' | ' ' )
          if @input.peek( 1 ).between?( 0x0, 0x1f ) || @input.peek(1) == 0x21 || @input.peek( 1 ).between?( 0x23, 0x5b ) || @input.peek( 1 ).between?( 0x5d, 0xff )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse
          end



        else
          break # out of loop for decision 1
        end
      end # loop for decision 1
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
      # at line 309:13: ( '0' .. '9' | 'a' .. 'f' | 'A' .. 'F' )
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
      # at line 313:5: ( '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' | 'e' ) | UNICODE_ESC | OCTAL_ESC )
      alt_2 = 3
      look_2_0 = @input.peek( 1 )

      if ( look_2_0 == 0x5c )
        case look_2 = @input.peek( 2 )
        when 0x22, 0x27, 0x5c, 0x62, 0x65, 0x66, 0x6e, 0x72, 0x74 then alt_2 = 1
        when 0x75 then alt_2 = 2
        when 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37 then alt_2 = 3
        else
          raise NoViableAlternative( "", 2, 1 )
        end
      else
        raise NoViableAlternative( "", 2, 0 )
      end
      case alt_2
      when 1
        # at line 313:9: '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' | 'e' )
        match( 0x5c )
        if @input.peek(1) == 0x22 || @input.peek(1) == 0x27 || @input.peek(1) == 0x5c || @input.peek(1) == 0x62 || @input.peek( 1 ).between?( 0x65, 0x66 ) || @input.peek(1) == 0x6e || @input.peek(1) == 0x72 || @input.peek(1) == 0x74
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse
        end



      when 2
        # at line 314:9: UNICODE_ESC
        unicode_esc!

      when 3
        # at line 315:9: OCTAL_ESC
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
      # at line 320:5: ( '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) )
      alt_3 = 3
      look_3_0 = @input.peek( 1 )

      if ( look_3_0 == 0x5c )
        look_3_1 = @input.peek( 2 )

        if ( look_3_1.between?( 0x30, 0x33 ) )
          look_3_2 = @input.peek( 3 )

          if ( look_3_2.between?( 0x30, 0x37 ) )
            look_3_4 = @input.peek( 4 )

            if ( look_3_4.between?( 0x30, 0x37 ) )
              alt_3 = 1
            else
              alt_3 = 2
            end
          else
            alt_3 = 3
          end
        elsif ( look_3_1.between?( 0x34, 0x37 ) )
          look_3_3 = @input.peek( 3 )

          if ( look_3_3.between?( 0x30, 0x37 ) )
            alt_3 = 2
          else
            alt_3 = 3
          end
        else
          raise NoViableAlternative( "", 3, 1 )
        end
      else
        raise NoViableAlternative( "", 3, 0 )
      end
      case alt_3
      when 1
        # at line 320:9: '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 320:14: ( '0' .. '3' )
        # at line 320:15: '0' .. '3'
        match_range( 0x30, 0x33 )

        # at line 320:25: ( '0' .. '7' )
        # at line 320:26: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 320:36: ( '0' .. '7' )
        # at line 320:37: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 2
        # at line 321:9: '\\\\' ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 321:14: ( '0' .. '7' )
        # at line 321:15: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 321:25: ( '0' .. '7' )
        # at line 321:26: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 3
        # at line 322:9: '\\\\' ( '0' .. '7' )
        match( 0x5c )
        # at line 322:14: ( '0' .. '7' )
        # at line 322:15: '0' .. '7'
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
      # at line 327:9: '\\\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
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
      # at line 330:10: 'int:'
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
      # at line 331:11: 'float:'
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
      # at line 332:8: 'read'
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
      # at line 333:9: 'print'
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
      # at line 334:10: 'printl'
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
      # at line 335:11: 'println'
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
      # at line 336:8: 'true'
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
      # at line 337:9: 'false'
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
      # at line 338:7: 'for'
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
      # at line 339:6: 'if'
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
      # at line 340:8: 'else'
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
      # at line 341:8: 'elif'
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
      # at line 342:10: 'elseif'
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
      # at line 343:9: 'while'
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
      # at line 344:6: 'do'
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
      # at line 345:10: 'return'
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
      # at line 346:8: 'exit'
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
      # at line 347:9: 'break'
      match( "break" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 27 )

    end

    # lexer rule continue! (CONTINUE)
    # (in Giraffe.g)
    def continue!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )

      type = CONTINUE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 348:11: 'continue'
      match( "continue" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 28 )

    end

    # lexer rule class! (CLASS)
    # (in Giraffe.g)
    def class!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )

      type = CLASS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 349:9: 'class'
      match( "class" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 29 )

    end

    # lexer rule superclass! (SUPERCLASS)
    # (in Giraffe.g)
    def superclass!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )

      type = SUPERCLASS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 351:4: 'superclass'
      match( "superclass" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 30 )

    end

    # lexer rule new! (NEW)
    # (in Giraffe.g)
    def new!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )

      type = NEW
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 352:7: 'new'
      match( "new" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 31 )

    end

    # lexer rule id! (ID)
    # (in Giraffe.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )

      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 354:7: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 354:31: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      while true # decision 4
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0.between?( 0x30, 0x39 ) || look_4_0.between?( 0x41, 0x5a ) || look_4_0 == 0x5f || look_4_0.between?( 0x61, 0x7a ) )
          alt_4 = 1

        end
        case alt_4
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
          break # out of loop for decision 4
        end
      end # loop for decision 4

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )

    end

    # lexer rule int! (INT)
    # (in Giraffe.g)
    def int!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )

      type = INT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 357:7: ( '0' .. '9' )+
      # at file 357:7: ( '0' .. '9' )+
      match_count_5 = 0
      while true
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0.between?( 0x30, 0x39 ) )
          alt_5 = 1

        end
        case alt_5
        when 1
          # at line 357:7: '0' .. '9'
          match_range( 0x30, 0x39 )

        else
          match_count_5 > 0 and break
          eee = EarlyExit(5)


          raise eee
        end
        match_count_5 += 1
      end


      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )

    end

    # lexer rule float! (FLOAT)
    # (in Giraffe.g)
    def float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )

      
      # - - - - main rule block - - - -
      # at line 362:5: ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT )
      alt_12 = 3
      alt_12 = @dfa12.predict( @input )
      case alt_12
      when 1
        # at line 362:9: ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )?
        # at file 362:9: ( '0' .. '9' )+
        match_count_6 = 0
        while true
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0.between?( 0x30, 0x39 ) )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 362:10: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_6 > 0 and break
            eee = EarlyExit(6)


            raise eee
          end
          match_count_6 += 1
        end

        match( 0x2e )
        # at line 362:25: ( '0' .. '9' )*
        while true # decision 7
          alt_7 = 2
          look_7_0 = @input.peek( 1 )

          if ( look_7_0.between?( 0x30, 0x39 ) )
            alt_7 = 1

          end
          case alt_7
          when 1
            # at line 362:26: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            break # out of loop for decision 7
          end
        end # loop for decision 7
        # at line 362:37: ( EXPONENT )?
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == 0x45 || look_8_0 == 0x65 )
          alt_8 = 1
        end
        case alt_8
        when 1
          # at line 362:37: EXPONENT
          exponent!

        end

      when 2
        # at line 363:9: '.' ( '0' .. '9' )+ ( EXPONENT )?
        match( 0x2e )
        # at file 363:13: ( '0' .. '9' )+
        match_count_9 = 0
        while true
          alt_9 = 2
          look_9_0 = @input.peek( 1 )

          if ( look_9_0.between?( 0x30, 0x39 ) )
            alt_9 = 1

          end
          case alt_9
          when 1
            # at line 363:14: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_9 > 0 and break
            eee = EarlyExit(9)


            raise eee
          end
          match_count_9 += 1
        end

        # at line 363:25: ( EXPONENT )?
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0 == 0x45 || look_10_0 == 0x65 )
          alt_10 = 1
        end
        case alt_10
        when 1
          # at line 363:25: EXPONENT
          exponent!

        end

      when 3
        # at line 364:9: ( '0' .. '9' )+ EXPONENT
        # at file 364:9: ( '0' .. '9' )+
        match_count_11 = 0
        while true
          alt_11 = 2
          look_11_0 = @input.peek( 1 )

          if ( look_11_0.between?( 0x30, 0x39 ) )
            alt_11 = 1

          end
          case alt_11
          when 1
            # at line 364:10: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_11 > 0 and break
            eee = EarlyExit(11)


            raise eee
          end
          match_count_11 += 1
        end

        exponent!

      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 34 )

    end

    # lexer rule comment! (COMMENT)
    # (in Giraffe.g)
    def comment!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )

      type = COMMENT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 368:9: '#' (~ ( '\\n' | '\\r' ) )*
      match( 0x23 )
      # at line 368:13: (~ ( '\\n' | '\\r' ) )*
      while true # decision 13
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0.between?( 0x0, 0x9 ) || look_13_0.between?( 0xb, 0xc ) || look_13_0.between?( 0xe, 0xffff ) )
          alt_13 = 1

        end
        case alt_13
        when 1
          # at line 368:13: ~ ( '\\n' | '\\r' )
          if @input.peek( 1 ).between?( 0x0, 0x9 ) || @input.peek( 1 ).between?( 0xb, 0xc ) || @input.peek( 1 ).between?( 0xe, 0xff )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse
          end



        else
          break # out of loop for decision 13
        end
      end # loop for decision 13
      # --> action
      channel=HIDDEN;
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 35 )

    end

    # lexer rule ws! (WS)
    # (in Giraffe.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )

      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 371:9: ( ' ' | '\\t' | '\\r' | '\\n' )
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
      # trace_out( __method__, 36 )

    end

    # lexer rule exponent! (EXPONENT)
    # (in Giraffe.g)
    def exponent!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )

      
      # - - - - main rule block - - - -
      # at line 379:12: ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+
      if @input.peek(1) == 0x45 || @input.peek(1) == 0x65
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 379:22: ( '+' | '-' )?
      alt_14 = 2
      look_14_0 = @input.peek( 1 )

      if ( look_14_0 == 0x2b || look_14_0 == 0x2d )
        alt_14 = 1
      end
      case alt_14
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
      # at file 379:33: ( '0' .. '9' )+
      match_count_15 = 0
      while true
        alt_15 = 2
        look_15_0 = @input.peek( 1 )

        if ( look_15_0.between?( 0x30, 0x39 ) )
          alt_15 = 1

        end
        case alt_15
        when 1
          # at line 379:34: '0' .. '9'
          match_range( 0x30, 0x39 )

        else
          match_count_15 > 0 and break
          eee = EarlyExit(15)


          raise eee
        end
        match_count_15 += 1
      end


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 37 )

    end

    # lexer rule lb! (LB)
    # (in Giraffe.g)
    def lb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )

      type = LB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 381:6: '('
      match( 0x28 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 38 )

    end

    # lexer rule rb! (RB)
    # (in Giraffe.g)
    def rb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )

      type = RB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 382:6: ')'
      match( 0x29 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 39 )

    end

    # lexer rule lcb! (LCB)
    # (in Giraffe.g)
    def lcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )

      type = LCB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 383:7: '{'
      match( 0x7b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 40 )

    end

    # lexer rule rcb! (RCB)
    # (in Giraffe.g)
    def rcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )

      type = RCB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 384:7: '}'
      match( 0x7d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 41 )

    end

    # lexer rule quote! (QUOTE)
    # (in Giraffe.g)
    def quote!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )

      type = QUOTE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 385:9: '\"'
      match( 0x22 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 42 )

    end

    # lexer rule comma! (COMMA)
    # (in Giraffe.g)
    def comma!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )

      type = COMMA
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 386:9: ','
      match( 0x2c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 43 )

    end

    # lexer rule dot! (DOT)
    # (in Giraffe.g)
    def dot!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )

      type = DOT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 387:7: '.'
      match( 0x2e )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 44 )

    end

    # lexer rule colon! (COLON)
    # (in Giraffe.g)
    def colon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )

      type = COLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 388:9: ':'
      match( 0x3a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 45 )

    end

    # lexer rule semicolon! (SEMICOLON)
    # (in Giraffe.g)
    def semicolon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )

      type = SEMICOLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 390:4: ';'
      match( 0x3b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 46 )

    end

    # lexer rule assign! (ASSIGN)
    # (in Giraffe.g)
    def assign!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )

      type = ASSIGN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 391:10: '='
      match( 0x3d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 47 )

    end

    # lexer rule plus! (PLUS)
    # (in Giraffe.g)
    def plus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )

      type = PLUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 392:8: '+'
      match( 0x2b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 48 )

    end

    # lexer rule minus! (MINUS)
    # (in Giraffe.g)
    def minus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )

      type = MINUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 393:9: '-'
      match( 0x2d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 49 )

    end

    # lexer rule mul! (MUL)
    # (in Giraffe.g)
    def mul!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )

      type = MUL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 394:7: '*'
      match( 0x2a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 50 )

    end

    # lexer rule div! (DIV)
    # (in Giraffe.g)
    def div!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )

      type = DIV
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 395:7: '/'
      match( 0x2f )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 51 )

    end

    # lexer rule mod! (MOD)
    # (in Giraffe.g)
    def mod!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 52 )

      type = MOD
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 396:7: '%'
      match( 0x25 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 52 )

    end

    # lexer rule eq! (EQ)
    # (in Giraffe.g)
    def eq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )

      type = EQ
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 398:6: '=='
      match( "==" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 53 )

    end

    # lexer rule ne! (NE)
    # (in Giraffe.g)
    def ne!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )

      type = NE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 399:6: '!='
      match( "!=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 54 )

    end

    # lexer rule lt! (LT)
    # (in Giraffe.g)
    def lt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )

      type = LT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 400:6: '<'
      match( 0x3c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 55 )

    end

    # lexer rule gt! (GT)
    # (in Giraffe.g)
    def gt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 56 )

      type = GT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 401:6: '>'
      match( 0x3e )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 56 )

    end

    # lexer rule le! (LE)
    # (in Giraffe.g)
    def le!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 57 )

      type = LE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 402:6: '<='
      match( "<=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 57 )

    end

    # lexer rule ge! (GE)
    # (in Giraffe.g)
    def ge!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 58 )

      type = GE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 403:6: '>='
      match( ">=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 58 )

    end

    # lexer rule and! (AND)
    # (in Giraffe.g)
    def and!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 59 )

      type = AND
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 405:7: '&&'
      match( "&&" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 59 )

    end

    # lexer rule or! (OR)
    # (in Giraffe.g)
    def or!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 60 )

      type = OR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 406:6: '||'
      match( "||" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 60 )

    end

    # lexer rule not! (NOT)
    # (in Giraffe.g)
    def not!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 61 )

      type = NOT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 407:7: '!'
      match( 0x21 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 61 )

    end

    # lexer rule qm! (QM)
    # (in Giraffe.g)
    def qm!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 62 )

      type = QM
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 409:6: '?'
      match( 0x3f )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 62 )

    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    # 
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( T__62 | T__63 | T__64 | T__65 | STRING | TO_INT | TO_FLOAT | READ | PRINT | PRINTL | PRINTLN | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | RETURN | EXIT | BREAK | CONTINUE | CLASS | SUPERCLASS | NEW | ID | INT | COMMENT | WS | LB | RB | LCB | RCB | QUOTE | COMMA | DOT | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT | QM )
      alt_16 = 56
      alt_16 = @dfa16.predict( @input )
      case alt_16
      when 1
        # at line 1:10: T__62
        t__62!

      when 2
        # at line 1:16: T__63
        t__63!

      when 3
        # at line 1:22: T__64
        t__64!

      when 4
        # at line 1:28: T__65
        t__65!

      when 5
        # at line 1:34: STRING
        string!

      when 6
        # at line 1:41: TO_INT
        to_int!

      when 7
        # at line 1:48: TO_FLOAT
        to_float!

      when 8
        # at line 1:57: READ
        read!

      when 9
        # at line 1:62: PRINT
        print!

      when 10
        # at line 1:68: PRINTL
        printl!

      when 11
        # at line 1:75: PRINTLN
        println!

      when 12
        # at line 1:83: TRUE
        true!

      when 13
        # at line 1:88: FALSE
        false!

      when 14
        # at line 1:94: FOR
        for!

      when 15
        # at line 1:98: IF
        if!

      when 16
        # at line 1:101: ELSE
        else!

      when 17
        # at line 1:106: ELIF
        elif!

      when 18
        # at line 1:111: ELSEIF
        elseif!

      when 19
        # at line 1:118: WHILE
        while!

      when 20
        # at line 1:124: DO
        do!

      when 21
        # at line 1:127: RETURN
        return!

      when 22
        # at line 1:134: EXIT
        exit!

      when 23
        # at line 1:139: BREAK
        break!

      when 24
        # at line 1:145: CONTINUE
        continue!

      when 25
        # at line 1:154: CLASS
        class!

      when 26
        # at line 1:160: SUPERCLASS
        superclass!

      when 27
        # at line 1:171: NEW
        new!

      when 28
        # at line 1:175: ID
        id!

      when 29
        # at line 1:178: INT
        int!

      when 30
        # at line 1:182: COMMENT
        comment!

      when 31
        # at line 1:190: WS
        ws!

      when 32
        # at line 1:193: LB
        lb!

      when 33
        # at line 1:196: RB
        rb!

      when 34
        # at line 1:199: LCB
        lcb!

      when 35
        # at line 1:203: RCB
        rcb!

      when 36
        # at line 1:207: QUOTE
        quote!

      when 37
        # at line 1:213: COMMA
        comma!

      when 38
        # at line 1:219: DOT
        dot!

      when 39
        # at line 1:223: COLON
        colon!

      when 40
        # at line 1:229: SEMICOLON
        semicolon!

      when 41
        # at line 1:239: ASSIGN
        assign!

      when 42
        # at line 1:246: PLUS
        plus!

      when 43
        # at line 1:251: MINUS
        minus!

      when 44
        # at line 1:257: MUL
        mul!

      when 45
        # at line 1:261: DIV
        div!

      when 46
        # at line 1:265: MOD
        mod!

      when 47
        # at line 1:269: EQ
        eq!

      when 48
        # at line 1:272: NE
        ne!

      when 49
        # at line 1:275: LT
        lt!

      when 50
        # at line 1:278: GT
        gt!

      when 51
        # at line 1:281: LE
        le!

      when 52
        # at line 1:284: GE
        ge!

      when 53
        # at line 1:287: AND
        and!

      when 54
        # at line 1:291: OR
        or!

      when 55
        # at line 1:294: NOT
        not!

      when 56
        # at line 1:298: QM
        qm!

      end
    end

    
    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA12 < ANTLR3::DFA
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
      
      @decision = 12
      

      def description
        <<-'__dfa_description__'.strip!
          360:1: fragment FLOAT : ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT );
        __dfa_description__
      end
    end
    class DFA16 < ANTLR3::DFA
      EOT = unpack( 5, -1, 1, 45, 12, 18, 12, -1, 1, 64, 5, -1, 1, 66, 1, 
                    68, 1, 70, 7, -1, 1, 18, 1, 72, 9, 18, 1, 84, 5, 18, 
                    8, -1, 1, 18, 1, -1, 2, 18, 1, 93, 8, 18, 1, -1, 4, 
                    18, 1, 106, 1, -1, 2, 18, 1, -1, 1, 109, 2, 18, 1, 112, 
                    1, 114, 1, 115, 1, 116, 5, 18, 1, -1, 1, 18, 1, 123, 
                    1, -1, 1, 18, 1, 126, 1, -1, 1, 18, 3, -1, 1, 128, 1, 
                    129, 1, 18, 1, 131, 1, 18, 2, -1, 1, 133, 1, 135, 1, 
                    -1, 1, 136, 2, -1, 1, 18, 1, -1, 1, 18, 1, -1, 1, 139, 
                    2, -1, 2, 18, 1, -1, 1, 142, 1, 18, 1, -1, 1, 18, 1, 
                    145, 1, -1 )
      EOF = unpack( 146, -1 )
      MIN = unpack( 1, 9, 4, -1, 1, 0, 1, 102, 1, 97, 1, 101, 2, 114, 1, 
                    108, 1, 104, 1, 111, 1, 114, 1, 108, 1, 117, 1, 101, 
                    12, -1, 1, 61, 5, -1, 3, 61, 7, -1, 1, 116, 1, 48, 1, 
                    111, 1, 108, 1, 114, 1, 97, 1, 105, 1, 117, 3, 105, 
                    1, 48, 1, 101, 1, 110, 1, 97, 1, 112, 1, 119, 8, -1, 
                    1, 58, 1, -1, 1, 97, 1, 115, 1, 48, 1, 100, 1, 117, 
                    1, 110, 2, 101, 1, 102, 1, 116, 1, 108, 1, -1, 1, 97, 
                    1, 116, 1, 115, 1, 101, 1, 48, 1, -1, 1, 116, 1, 101, 
                    1, -1, 1, 48, 1, 114, 1, 116, 4, 48, 1, 101, 1, 107, 
                    1, 105, 1, 115, 1, 114, 1, -1, 1, 58, 1, 48, 1, -1, 
                    1, 110, 1, 48, 1, -1, 1, 102, 3, -1, 2, 48, 1, 110, 
                    1, 48, 1, 99, 2, -1, 2, 48, 1, -1, 1, 48, 2, -1, 1, 
                    117, 1, -1, 1, 108, 1, -1, 1, 48, 2, -1, 1, 101, 1, 
                    97, 1, -1, 1, 48, 1, 115, 1, -1, 1, 115, 1, 48, 1, -1 )
      MAX = unpack( 1, 125, 4, -1, 1, -1, 1, 110, 1, 111, 1, 101, 2, 114, 
                    1, 120, 1, 104, 1, 111, 1, 114, 1, 111, 1, 117, 1, 101, 
                    12, -1, 1, 61, 5, -1, 3, 61, 7, -1, 1, 116, 1, 122, 
                    1, 111, 1, 108, 1, 114, 1, 116, 1, 105, 1, 117, 1, 115, 
                    2, 105, 1, 122, 1, 101, 1, 110, 1, 97, 1, 112, 1, 119, 
                    8, -1, 1, 58, 1, -1, 1, 97, 1, 115, 1, 122, 1, 100, 
                    1, 117, 1, 110, 2, 101, 1, 102, 1, 116, 1, 108, 1, -1, 
                    1, 97, 1, 116, 1, 115, 1, 101, 1, 122, 1, -1, 1, 116, 
                    1, 101, 1, -1, 1, 122, 1, 114, 1, 116, 4, 122, 1, 101, 
                    1, 107, 1, 105, 1, 115, 1, 114, 1, -1, 1, 58, 1, 122, 
                    1, -1, 1, 110, 1, 122, 1, -1, 1, 102, 3, -1, 2, 122, 
                    1, 110, 1, 122, 1, 99, 2, -1, 2, 122, 1, -1, 1, 122, 
                    2, -1, 1, 117, 1, -1, 1, 108, 1, -1, 1, 122, 2, -1, 
                    1, 101, 1, 97, 1, -1, 1, 122, 1, 115, 1, -1, 1, 115, 
                    1, 122, 1, -1 )
      ACCEPT = unpack( 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 13, -1, 1, 28, 1, 
                       29, 1, 30, 1, 31, 1, 32, 1, 33, 1, 34, 1, 35, 1, 
                       37, 1, 38, 1, 39, 1, 40, 1, -1, 1, 42, 1, 43, 1, 
                       44, 1, 45, 1, 46, 3, -1, 1, 53, 1, 54, 1, 56, 1, 
                       1, 1, 2, 1, 5, 1, 36, 17, -1, 1, 47, 1, 41, 1, 48, 
                       1, 55, 1, 51, 1, 49, 1, 52, 1, 50, 1, -1, 1, 15, 
                       11, -1, 1, 20, 5, -1, 1, 6, 2, -1, 1, 14, 12, -1, 
                       1, 27, 2, -1, 1, 8, 2, -1, 1, 12, 1, -1, 1, 16, 1, 
                       17, 1, 22, 5, -1, 1, 7, 1, 13, 2, -1, 1, 9, 1, -1, 
                       1, 19, 1, 23, 1, -1, 1, 25, 1, -1, 1, 21, 1, -1, 
                       1, 10, 1, 18, 2, -1, 1, 11, 2, -1, 1, 24, 2, -1, 
                       1, 26 )
      SPECIAL = unpack( 5, -1, 1, 0, 140, -1 )
      TRANSITION = [
        unpack( 1, 21, 1, 2, 2, -1, 1, 1, 18, -1, 1, 21, 1, 36, 1, 5, 1, 
                20, 1, -1, 1, 35, 1, 39, 1, -1, 1, 22, 1, 23, 1, 33, 1, 
                31, 1, 26, 1, 32, 1, 27, 1, 34, 10, 19, 1, 28, 1, 29, 1, 
                37, 1, 30, 1, 38, 1, 41, 1, -1, 26, 18, 1, 3, 1, -1, 1, 
                4, 1, -1, 1, 18, 1, -1, 1, 18, 1, 14, 1, 15, 1, 13, 1, 11, 
                1, 7, 2, 18, 1, 6, 4, 18, 1, 17, 1, 18, 1, 9, 1, 18, 1, 
                8, 1, 16, 1, 10, 2, 18, 1, 12, 3, 18, 1, 24, 1, 40, 1, 25 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 0, 44 ),
        unpack( 1, 47, 7, -1, 1, 46 ),
        unpack( 1, 49, 10, -1, 1, 48, 2, -1, 1, 50 ),
        unpack( 1, 51 ),
        unpack( 1, 52 ),
        unpack( 1, 53 ),
        unpack( 1, 54, 11, -1, 1, 55 ),
        unpack( 1, 56 ),
        unpack( 1, 57 ),
        unpack( 1, 58 ),
        unpack( 1, 60, 2, -1, 1, 59 ),
        unpack( 1, 61 ),
        unpack( 1, 62 ),
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
        unpack(  ),
        unpack( 1, 63 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 65 ),
        unpack( 1, 67 ),
        unpack( 1, 69 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 71 ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 26, 18 ),
        unpack( 1, 73 ),
        unpack( 1, 74 ),
        unpack( 1, 75 ),
        unpack( 1, 76, 18, -1, 1, 77 ),
        unpack( 1, 78 ),
        unpack( 1, 79 ),
        unpack( 1, 81, 9, -1, 1, 80 ),
        unpack( 1, 82 ),
        unpack( 1, 83 ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 26, 18 ),
        unpack( 1, 85 ),
        unpack( 1, 86 ),
        unpack( 1, 87 ),
        unpack( 1, 88 ),
        unpack( 1, 89 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 90 ),
        unpack(  ),
        unpack( 1, 91 ),
        unpack( 1, 92 ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 26, 18 ),
        unpack( 1, 94 ),
        unpack( 1, 95 ),
        unpack( 1, 96 ),
        unpack( 1, 97 ),
        unpack( 1, 98 ),
        unpack( 1, 99 ),
        unpack( 1, 100 ),
        unpack( 1, 101 ),
        unpack(  ),
        unpack( 1, 102 ),
        unpack( 1, 103 ),
        unpack( 1, 104 ),
        unpack( 1, 105 ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 26, 18 ),
        unpack(  ),
        unpack( 1, 107 ),
        unpack( 1, 108 ),
        unpack(  ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 26, 18 ),
        unpack( 1, 110 ),
        unpack( 1, 111 ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 26, 18 ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 8, 18, 1, 113, 
                 17, 18 ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 26, 18 ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 26, 18 ),
        unpack( 1, 117 ),
        unpack( 1, 118 ),
        unpack( 1, 119 ),
        unpack( 1, 120 ),
        unpack( 1, 121 ),
        unpack(  ),
        unpack( 1, 122 ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 26, 18 ),
        unpack(  ),
        unpack( 1, 124 ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 11, 18, 1, 
                 125, 14, 18 ),
        unpack(  ),
        unpack( 1, 127 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 26, 18 ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 26, 18 ),
        unpack( 1, 130 ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 26, 18 ),
        unpack( 1, 132 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 26, 18 ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 13, 18, 1, 
                 134, 12, 18 ),
        unpack(  ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 26, 18 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 137 ),
        unpack(  ),
        unpack( 1, 138 ),
        unpack(  ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 26, 18 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 140 ),
        unpack( 1, 141 ),
        unpack(  ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 26, 18 ),
        unpack( 1, 143 ),
        unpack(  ),
        unpack( 1, 144 ),
        unpack( 10, 18, 7, -1, 26, 18, 4, -1, 1, 18, 1, -1, 26, 18 ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 16
      

      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( T__62 | T__63 | T__64 | T__65 | STRING | TO_INT | TO_FLOAT | READ | PRINT | PRINTL | PRINTLN | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | RETURN | EXIT | BREAK | CONTINUE | CLASS | SUPERCLASS | NEW | ID | INT | COMMENT | WS | LB | RB | LCB | RCB | QUOTE | COMMA | DOT | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT | QM );
        __dfa_description__
      end
    end

    
    private
    
    def initialize_dfas
      super rescue nil
      @dfa12 = DFA12.new( self, 12 )
      @dfa16 = DFA16.new( self, 16 ) do |s|
        case s
        when 0
          look_16_5 = @input.peek
          s = -1
          if ( look_16_5.between?( 0x0, 0xffff ) )
            s = 44
          else
            s = 45
          end

        end
        
        if s < 0
          nva = ANTLR3::Error::NoViableAlternative.new( @dfa16.description, 16, s, input )
          @dfa16.error( nva )
          raise nva
        end
        
        s
      end

    end
  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0
end


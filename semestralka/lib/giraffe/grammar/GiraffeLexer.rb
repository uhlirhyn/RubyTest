#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-12-11 23:25:10
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
    define_tokens( :T__66 => 66, :LT => 34, :EXPONENT => 58, :T__67 => 67, 
                   :MAIN => 27, :T__64 => 64, :T__65 => 65, :WHILE => 23, 
                   :RB => 11, :MOD => 40, :OPENFILE => 42, :READNUMBER => 44, 
                   :OCTAL_ESC => 54, :FOR => 25, :DO => 24, :FLOAT => 59, 
                   :NOT => 31, :RCB => 19, :ID => 26, :AND => 30, :EOF => -1, 
                   :BREAK => 7, :IF => 17, :QUOTE => 61, :ESC_SEQ => 51, 
                   :CONTINUE => 57, :QM => 63, :COMMA => 16, :LCB => 18, 
                   :PRINTLN => 56, :RETURN => 8, :PLUS => 12, :EQ => 32, 
                   :COMMENT => 4, :DOT => 28, :NE => 33, :EXIT => 9, :GE => 37, 
                   :UNICODE_ESC => 53, :NULL => 45, :ELSE => 20, :HEX_DIGIT => 52, 
                   :SEMICOLON => 5, :INT => 14, :MINUS => 13, :MUL => 38, 
                   :TRUE => 48, :PRINT => 15, :ELSEIF => 21, :PRINTL => 55, 
                   :COLON => 62, :ELIF => 22, :WS => 60, :READ => 6, :OR => 29, 
                   :ASSIGN => 47, :SIZEOF => 43, :ALLOC => 46, :GT => 35, 
                   :LB => 10, :CLOSEFILE => 41, :DIV => 39, :FALSE => 49, 
                   :LE => 36, :STRING => 50 )
    
  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = Giraffe
    include TokenData

    
    begin
      generated_using( "Giraffe.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end
    
    RULE_NAMES   = [ "T__64", "T__65", "T__66", "T__67", "STRING", "HEX_DIGIT", 
                     "ESC_SEQ", "OCTAL_ESC", "UNICODE_ESC", "SIZEOF", "ALLOC", 
                     "READNUMBER", "CLOSEFILE", "OPENFILE", "NULL", "MAIN", 
                     "READ", "PRINT", "PRINTL", "PRINTLN", "TRUE", "FALSE", 
                     "FOR", "IF", "ELSE", "ELIF", "ELSEIF", "WHILE", "DO", 
                     "RETURN", "EXIT", "BREAK", "CONTINUE", "ID", "INT", 
                     "FLOAT", "COMMENT", "WS", "EXPONENT", "LB", "RB", "LCB", 
                     "RCB", "QUOTE", "COMMA", "DOT", "COLON", "SEMICOLON", 
                     "ASSIGN", "PLUS", "MINUS", "MUL", "DIV", "MOD", "EQ", 
                     "NE", "LT", "GT", "LE", "GE", "AND", "OR", "NOT", "QM" ].freeze
    RULE_METHODS = [ :t__64!, :t__65!, :t__66!, :t__67!, :string!, :hex_digit!, 
                     :esc_seq!, :octal_esc!, :unicode_esc!, :sizeof!, :alloc!, 
                     :readnumber!, :closefile!, :openfile!, :null!, :main!, 
                     :read!, :print!, :printl!, :println!, :true!, :false!, 
                     :for!, :if!, :else!, :elif!, :elseif!, :while!, :do!, 
                     :return!, :exit!, :break!, :continue!, :id!, :int!, 
                     :float!, :comment!, :ws!, :exponent!, :lb!, :rb!, :lcb!, 
                     :rcb!, :quote!, :comma!, :dot!, :colon!, :semicolon!, 
                     :assign!, :plus!, :minus!, :mul!, :div!, :mod!, :eq!, 
                     :ne!, :lt!, :gt!, :le!, :ge!, :and!, :or!, :not!, :qm! ].freeze

    
    def initialize( input=nil, options = {} )
      super( input, options )

    end
    
    
    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule t__64! (T__64)
    # (in Giraffe.g)
    def t__64!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      type = T__64
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

    # lexer rule t__65! (T__65)
    # (in Giraffe.g)
    def t__65!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      type = T__65
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

    # lexer rule t__66! (T__66)
    # (in Giraffe.g)
    def t__66!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      type = T__66
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

    # lexer rule t__67! (T__67)
    # (in Giraffe.g)
    def t__67!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      type = T__67
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
      # at line 326:8: '\"' ( ESC_SEQ | ' ' | ~ ( '\\\\' | '\"' | ' ' ) )* '\"'
      match( 0x22 )
      # at line 326:12: ( ESC_SEQ | ' ' | ~ ( '\\\\' | '\"' | ' ' ) )*
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
          # at line 326:14: ESC_SEQ
          esc_seq!

        when 2
          # at line 326:24: ' '
          match( 0x20 )

        when 3
          # at line 326:30: ~ ( '\\\\' | '\"' | ' ' )
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
      # at line 330:13: ( '0' .. '9' | 'a' .. 'f' | 'A' .. 'F' )
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
      # at line 334:5: ( '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' | 'e' ) | UNICODE_ESC | OCTAL_ESC )
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
        # at line 334:9: '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' | 'e' )
        match( 0x5c )
        if @input.peek(1) == 0x22 || @input.peek(1) == 0x27 || @input.peek(1) == 0x5c || @input.peek(1) == 0x62 || @input.peek( 1 ).between?( 0x65, 0x66 ) || @input.peek(1) == 0x6e || @input.peek(1) == 0x72 || @input.peek(1) == 0x74
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse
        end



      when 2
        # at line 335:9: UNICODE_ESC
        unicode_esc!

      when 3
        # at line 336:9: OCTAL_ESC
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
      # at line 341:5: ( '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) )
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
        # at line 341:9: '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 341:14: ( '0' .. '3' )
        # at line 341:15: '0' .. '3'
        match_range( 0x30, 0x33 )

        # at line 341:25: ( '0' .. '7' )
        # at line 341:26: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 341:36: ( '0' .. '7' )
        # at line 341:37: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 2
        # at line 342:9: '\\\\' ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 342:14: ( '0' .. '7' )
        # at line 342:15: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 342:25: ( '0' .. '7' )
        # at line 342:26: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 3
        # at line 343:9: '\\\\' ( '0' .. '7' )
        match( 0x5c )
        # at line 343:14: ( '0' .. '7' )
        # at line 343:15: '0' .. '7'
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
      # at line 348:9: '\\\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
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

    # lexer rule sizeof! (SIZEOF)
    # (in Giraffe.g)
    def sizeof!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )

      type = SIZEOF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 351:10: 'sizeof'
      match( "sizeof" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )

    end

    # lexer rule alloc! (ALLOC)
    # (in Giraffe.g)
    def alloc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )

      type = ALLOC
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 352:10: 'alloc'
      match( "alloc" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )

    end

    # lexer rule readnumber! (READNUMBER)
    # (in Giraffe.g)
    def readnumber!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )

      type = READNUMBER
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 353:13: 'readNumber'
      match( "readNumber" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )

    end

    # lexer rule closefile! (CLOSEFILE)
    # (in Giraffe.g)
    def closefile!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      type = CLOSEFILE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 355:4: 'closeFile'
      match( "closeFile" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )

    end

    # lexer rule openfile! (OPENFILE)
    # (in Giraffe.g)
    def openfile!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )

      type = OPENFILE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 356:11: 'openFile'
      match( "openFile" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )

    end

    # lexer rule null! (NULL)
    # (in Giraffe.g)
    def null!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      type = NULL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 357:8: 'nil'
      match( "nil" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )

    end

    # lexer rule main! (MAIN)
    # (in Giraffe.g)
    def main!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      type = MAIN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 358:8: 'main'
      match( "main" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )

    end

    # lexer rule read! (READ)
    # (in Giraffe.g)
    def read!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )

      type = READ
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 359:8: 'read'
      match( "read" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )

    end

    # lexer rule print! (PRINT)
    # (in Giraffe.g)
    def print!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )

      type = PRINT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 360:9: 'print'
      match( "print" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )

    end

    # lexer rule printl! (PRINTL)
    # (in Giraffe.g)
    def printl!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )

      type = PRINTL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 361:10: 'printl'
      match( "printl" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 19 )

    end

    # lexer rule println! (PRINTLN)
    # (in Giraffe.g)
    def println!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )

      type = PRINTLN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 362:11: 'println'
      match( "println" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 20 )

    end

    # lexer rule true! (TRUE)
    # (in Giraffe.g)
    def true!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )

      type = TRUE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 363:8: 'true'
      match( "true" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 21 )

    end

    # lexer rule false! (FALSE)
    # (in Giraffe.g)
    def false!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )

      type = FALSE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 364:9: 'false'
      match( "false" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 22 )

    end

    # lexer rule for! (FOR)
    # (in Giraffe.g)
    def for!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )

      type = FOR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 365:7: 'for'
      match( "for" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 23 )

    end

    # lexer rule if! (IF)
    # (in Giraffe.g)
    def if!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )

      type = IF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 366:6: 'if'
      match( "if" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 24 )

    end

    # lexer rule else! (ELSE)
    # (in Giraffe.g)
    def else!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )

      type = ELSE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 367:8: 'else'
      match( "else" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 25 )

    end

    # lexer rule elif! (ELIF)
    # (in Giraffe.g)
    def elif!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )

      type = ELIF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 368:8: 'elif'
      match( "elif" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 26 )

    end

    # lexer rule elseif! (ELSEIF)
    # (in Giraffe.g)
    def elseif!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )

      type = ELSEIF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 369:10: 'elseif'
      match( "elseif" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 27 )

    end

    # lexer rule while! (WHILE)
    # (in Giraffe.g)
    def while!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )

      type = WHILE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 370:9: 'while'
      match( "while" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 28 )

    end

    # lexer rule do! (DO)
    # (in Giraffe.g)
    def do!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )

      type = DO
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 371:6: 'do'
      match( "do" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 29 )

    end

    # lexer rule return! (RETURN)
    # (in Giraffe.g)
    def return!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )

      type = RETURN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 372:10: 'return'
      match( "return" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 30 )

    end

    # lexer rule exit! (EXIT)
    # (in Giraffe.g)
    def exit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )

      type = EXIT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 373:8: 'exit'
      match( "exit" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 31 )

    end

    # lexer rule break! (BREAK)
    # (in Giraffe.g)
    def break!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )

      type = BREAK
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 374:9: 'break'
      match( "break" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )

    end

    # lexer rule continue! (CONTINUE)
    # (in Giraffe.g)
    def continue!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )

      type = CONTINUE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 375:11: 'continue'
      match( "continue" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )

    end

    # lexer rule id! (ID)
    # (in Giraffe.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )

      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 378:7: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 378:31: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
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
      # trace_out( __method__, 34 )

    end

    # lexer rule int! (INT)
    # (in Giraffe.g)
    def int!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )

      type = INT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 381:7: ( '0' .. '9' )+
      # at file 381:7: ( '0' .. '9' )+
      match_count_5 = 0
      while true
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0.between?( 0x30, 0x39 ) )
          alt_5 = 1

        end
        case alt_5
        when 1
          # at line 381:7: '0' .. '9'
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
      # trace_out( __method__, 35 )

    end

    # lexer rule float! (FLOAT)
    # (in Giraffe.g)
    def float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )

      
      # - - - - main rule block - - - -
      # at line 386:5: ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT )
      alt_12 = 3
      alt_12 = @dfa12.predict( @input )
      case alt_12
      when 1
        # at line 386:9: ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )?
        # at file 386:9: ( '0' .. '9' )+
        match_count_6 = 0
        while true
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0.between?( 0x30, 0x39 ) )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 386:10: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_6 > 0 and break
            eee = EarlyExit(6)


            raise eee
          end
          match_count_6 += 1
        end

        match( 0x2e )
        # at line 386:25: ( '0' .. '9' )*
        while true # decision 7
          alt_7 = 2
          look_7_0 = @input.peek( 1 )

          if ( look_7_0.between?( 0x30, 0x39 ) )
            alt_7 = 1

          end
          case alt_7
          when 1
            # at line 386:26: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            break # out of loop for decision 7
          end
        end # loop for decision 7
        # at line 386:37: ( EXPONENT )?
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == 0x45 || look_8_0 == 0x65 )
          alt_8 = 1
        end
        case alt_8
        when 1
          # at line 386:37: EXPONENT
          exponent!

        end

      when 2
        # at line 387:9: '.' ( '0' .. '9' )+ ( EXPONENT )?
        match( 0x2e )
        # at file 387:13: ( '0' .. '9' )+
        match_count_9 = 0
        while true
          alt_9 = 2
          look_9_0 = @input.peek( 1 )

          if ( look_9_0.between?( 0x30, 0x39 ) )
            alt_9 = 1

          end
          case alt_9
          when 1
            # at line 387:14: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_9 > 0 and break
            eee = EarlyExit(9)


            raise eee
          end
          match_count_9 += 1
        end

        # at line 387:25: ( EXPONENT )?
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0 == 0x45 || look_10_0 == 0x65 )
          alt_10 = 1
        end
        case alt_10
        when 1
          # at line 387:25: EXPONENT
          exponent!

        end

      when 3
        # at line 388:9: ( '0' .. '9' )+ EXPONENT
        # at file 388:9: ( '0' .. '9' )+
        match_count_11 = 0
        while true
          alt_11 = 2
          look_11_0 = @input.peek( 1 )

          if ( look_11_0.between?( 0x30, 0x39 ) )
            alt_11 = 1

          end
          case alt_11
          when 1
            # at line 388:10: '0' .. '9'
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
      # trace_out( __method__, 36 )

    end

    # lexer rule comment! (COMMENT)
    # (in Giraffe.g)
    def comment!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )

      type = COMMENT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 392:5: ( '#' (~ ( '\\n' | '\\r' ) )* | '/*' (~ ( '*/' ) )* '*/' )
      alt_15 = 2
      look_15_0 = @input.peek( 1 )

      if ( look_15_0 == 0x23 )
        alt_15 = 1
      elsif ( look_15_0 == 0x2f )
        alt_15 = 2
      else
        raise NoViableAlternative( "", 15, 0 )
      end
      case alt_15
      when 1
        # at line 392:9: '#' (~ ( '\\n' | '\\r' ) )*
        match( 0x23 )
        # at line 392:13: (~ ( '\\n' | '\\r' ) )*
        while true # decision 13
          alt_13 = 2
          look_13_0 = @input.peek( 1 )

          if ( look_13_0.between?( 0x0, 0x9 ) || look_13_0.between?( 0xb, 0xc ) || look_13_0.between?( 0xe, 0xffff ) )
            alt_13 = 1

          end
          case alt_13
          when 1
            # at line 392:13: ~ ( '\\n' | '\\r' )
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

      when 2
        # at line 393:7: '/*' (~ ( '*/' ) )* '*/'
        match( "/*" )
        # at line 393:12: (~ ( '*/' ) )*
        while true # decision 14
          alt_14 = 2
          look_14_0 = @input.peek( 1 )

          if ( look_14_0 == 0x2a )
            look_14_1 = @input.peek( 2 )

            if ( look_14_1 == 0x2f )
              look_14_3 = @input.peek( 3 )

              if ( look_14_3.between?( 0x0, 0xffff ) )
                alt_14 = 1

              end
            elsif ( look_14_1.between?( 0x0, 0x2e ) || look_14_1.between?( 0x30, 0xffff ) )
              alt_14 = 1

            end
          elsif ( look_14_0.between?( 0x0, 0x29 ) || look_14_0.between?( 0x2b, 0xffff ) )
            alt_14 = 1

          end
          case alt_14
          when 1
            # at line 393:12: ~ ( '*/' )
            if @input.peek( 1 ).between?( 0x0, 0xff )
              @input.consume
            else
              mse = MismatchedSet( nil )
              recover mse
              raise mse
            end



          else
            break # out of loop for decision 14
          end
        end # loop for decision 14
        match( "*/" )
        # --> action
        channel=HIDDEN;
        # <-- action

      end
      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 37 )

    end

    # lexer rule ws! (WS)
    # (in Giraffe.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )

      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 396:9: ( ' ' | '\\t' | '\\r' | '\\n' )
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
      # trace_out( __method__, 38 )

    end

    # lexer rule exponent! (EXPONENT)
    # (in Giraffe.g)
    def exponent!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )

      
      # - - - - main rule block - - - -
      # at line 404:12: ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+
      if @input.peek(1) == 0x45 || @input.peek(1) == 0x65
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 404:22: ( '+' | '-' )?
      alt_16 = 2
      look_16_0 = @input.peek( 1 )

      if ( look_16_0 == 0x2b || look_16_0 == 0x2d )
        alt_16 = 1
      end
      case alt_16
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
      # at file 404:33: ( '0' .. '9' )+
      match_count_17 = 0
      while true
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0.between?( 0x30, 0x39 ) )
          alt_17 = 1

        end
        case alt_17
        when 1
          # at line 404:34: '0' .. '9'
          match_range( 0x30, 0x39 )

        else
          match_count_17 > 0 and break
          eee = EarlyExit(17)


          raise eee
        end
        match_count_17 += 1
      end


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 39 )

    end

    # lexer rule lb! (LB)
    # (in Giraffe.g)
    def lb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )

      type = LB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 406:6: '('
      match( 0x28 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 40 )

    end

    # lexer rule rb! (RB)
    # (in Giraffe.g)
    def rb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )

      type = RB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 407:6: ')'
      match( 0x29 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 41 )

    end

    # lexer rule lcb! (LCB)
    # (in Giraffe.g)
    def lcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )

      type = LCB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 408:7: '{'
      match( 0x7b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 42 )

    end

    # lexer rule rcb! (RCB)
    # (in Giraffe.g)
    def rcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )

      type = RCB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 409:7: '}'
      match( 0x7d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 43 )

    end

    # lexer rule quote! (QUOTE)
    # (in Giraffe.g)
    def quote!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )

      type = QUOTE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 410:9: '\"'
      match( 0x22 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 44 )

    end

    # lexer rule comma! (COMMA)
    # (in Giraffe.g)
    def comma!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )

      type = COMMA
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 411:9: ','
      match( 0x2c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 45 )

    end

    # lexer rule dot! (DOT)
    # (in Giraffe.g)
    def dot!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )

      type = DOT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 412:7: '.'
      match( 0x2e )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 46 )

    end

    # lexer rule colon! (COLON)
    # (in Giraffe.g)
    def colon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )

      type = COLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 413:9: ':'
      match( 0x3a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 47 )

    end

    # lexer rule semicolon! (SEMICOLON)
    # (in Giraffe.g)
    def semicolon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )

      type = SEMICOLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 415:4: ';'
      match( 0x3b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 48 )

    end

    # lexer rule assign! (ASSIGN)
    # (in Giraffe.g)
    def assign!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )

      type = ASSIGN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 416:10: '='
      match( 0x3d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 49 )

    end

    # lexer rule plus! (PLUS)
    # (in Giraffe.g)
    def plus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )

      type = PLUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 417:8: '+'
      match( 0x2b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 50 )

    end

    # lexer rule minus! (MINUS)
    # (in Giraffe.g)
    def minus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )

      type = MINUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 418:9: '-'
      match( 0x2d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 51 )

    end

    # lexer rule mul! (MUL)
    # (in Giraffe.g)
    def mul!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 52 )

      type = MUL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 419:7: '*'
      match( 0x2a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 52 )

    end

    # lexer rule div! (DIV)
    # (in Giraffe.g)
    def div!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )

      type = DIV
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 420:7: '/'
      match( 0x2f )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 53 )

    end

    # lexer rule mod! (MOD)
    # (in Giraffe.g)
    def mod!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )

      type = MOD
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 421:7: '%'
      match( 0x25 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 54 )

    end

    # lexer rule eq! (EQ)
    # (in Giraffe.g)
    def eq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )

      type = EQ
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 423:6: '=='
      match( "==" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 55 )

    end

    # lexer rule ne! (NE)
    # (in Giraffe.g)
    def ne!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 56 )

      type = NE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 424:6: '!='
      match( "!=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 56 )

    end

    # lexer rule lt! (LT)
    # (in Giraffe.g)
    def lt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 57 )

      type = LT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 425:6: '<'
      match( 0x3c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 57 )

    end

    # lexer rule gt! (GT)
    # (in Giraffe.g)
    def gt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 58 )

      type = GT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 426:6: '>'
      match( 0x3e )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 58 )

    end

    # lexer rule le! (LE)
    # (in Giraffe.g)
    def le!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 59 )

      type = LE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 427:6: '<='
      match( "<=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 59 )

    end

    # lexer rule ge! (GE)
    # (in Giraffe.g)
    def ge!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 60 )

      type = GE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 428:6: '>='
      match( ">=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 60 )

    end

    # lexer rule and! (AND)
    # (in Giraffe.g)
    def and!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 61 )

      type = AND
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 430:7: '&&'
      match( "&&" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 61 )

    end

    # lexer rule or! (OR)
    # (in Giraffe.g)
    def or!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 62 )

      type = OR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 431:6: '||'
      match( "||" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 62 )

    end

    # lexer rule not! (NOT)
    # (in Giraffe.g)
    def not!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 63 )

      type = NOT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 432:7: '!'
      match( 0x21 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 63 )

    end

    # lexer rule qm! (QM)
    # (in Giraffe.g)
    def qm!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 64 )

      type = QM
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 434:6: '?'
      match( 0x3f )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 64 )

    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    # 
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( T__64 | T__65 | T__66 | T__67 | STRING | SIZEOF | ALLOC | READNUMBER | CLOSEFILE | OPENFILE | NULL | MAIN | READ | PRINT | PRINTL | PRINTLN | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | RETURN | EXIT | BREAK | CONTINUE | ID | INT | COMMENT | WS | LB | RB | LCB | RCB | QUOTE | COMMA | DOT | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT | QM )
      alt_18 = 58
      alt_18 = @dfa18.predict( @input )
      case alt_18
      when 1
        # at line 1:10: T__64
        t__64!

      when 2
        # at line 1:16: T__65
        t__65!

      when 3
        # at line 1:22: T__66
        t__66!

      when 4
        # at line 1:28: T__67
        t__67!

      when 5
        # at line 1:34: STRING
        string!

      when 6
        # at line 1:41: SIZEOF
        sizeof!

      when 7
        # at line 1:48: ALLOC
        alloc!

      when 8
        # at line 1:54: READNUMBER
        readnumber!

      when 9
        # at line 1:65: CLOSEFILE
        closefile!

      when 10
        # at line 1:75: OPENFILE
        openfile!

      when 11
        # at line 1:84: NULL
        null!

      when 12
        # at line 1:89: MAIN
        main!

      when 13
        # at line 1:94: READ
        read!

      when 14
        # at line 1:99: PRINT
        print!

      when 15
        # at line 1:105: PRINTL
        printl!

      when 16
        # at line 1:112: PRINTLN
        println!

      when 17
        # at line 1:120: TRUE
        true!

      when 18
        # at line 1:125: FALSE
        false!

      when 19
        # at line 1:131: FOR
        for!

      when 20
        # at line 1:135: IF
        if!

      when 21
        # at line 1:138: ELSE
        else!

      when 22
        # at line 1:143: ELIF
        elif!

      when 23
        # at line 1:148: ELSEIF
        elseif!

      when 24
        # at line 1:155: WHILE
        while!

      when 25
        # at line 1:161: DO
        do!

      when 26
        # at line 1:164: RETURN
        return!

      when 27
        # at line 1:171: EXIT
        exit!

      when 28
        # at line 1:176: BREAK
        break!

      when 29
        # at line 1:182: CONTINUE
        continue!

      when 30
        # at line 1:191: ID
        id!

      when 31
        # at line 1:194: INT
        int!

      when 32
        # at line 1:198: COMMENT
        comment!

      when 33
        # at line 1:206: WS
        ws!

      when 34
        # at line 1:209: LB
        lb!

      when 35
        # at line 1:212: RB
        rb!

      when 36
        # at line 1:215: LCB
        lcb!

      when 37
        # at line 1:219: RCB
        rcb!

      when 38
        # at line 1:223: QUOTE
        quote!

      when 39
        # at line 1:229: COMMA
        comma!

      when 40
        # at line 1:235: DOT
        dot!

      when 41
        # at line 1:239: COLON
        colon!

      when 42
        # at line 1:245: SEMICOLON
        semicolon!

      when 43
        # at line 1:255: ASSIGN
        assign!

      when 44
        # at line 1:262: PLUS
        plus!

      when 45
        # at line 1:267: MINUS
        minus!

      when 46
        # at line 1:273: MUL
        mul!

      when 47
        # at line 1:277: DIV
        div!

      when 48
        # at line 1:281: MOD
        mod!

      when 49
        # at line 1:285: EQ
        eq!

      when 50
        # at line 1:288: NE
        ne!

      when 51
        # at line 1:291: LT
        lt!

      when 52
        # at line 1:294: GT
        gt!

      when 53
        # at line 1:297: LE
        le!

      when 54
        # at line 1:300: GE
        ge!

      when 55
        # at line 1:303: AND
        and!

      when 56
        # at line 1:307: OR
        or!

      when 57
        # at line 1:310: NOT
        not!

      when 58
        # at line 1:314: QM
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
          384:1: fragment FLOAT : ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT );
        __dfa_description__
      end
    end
    class DFA18 < ANTLR3::DFA
      EOT = unpack( 5, -1, 1, 48, 15, 21, 3, -1, 1, 67, 9, -1, 1, 69, 4, 
                    -1, 1, 71, 1, 73, 1, 75, 7, -1, 12, 21, 1, 89, 3, 21, 
                    1, 94, 1, 21, 9, -1, 7, 21, 1, 103, 4, 21, 1, 108, 1, 
                    -1, 4, 21, 1, -1, 3, 21, 1, 117, 4, 21, 1, -1, 1, 122, 
                    1, 21, 1, 124, 1, 21, 1, -1, 1, 127, 1, 128, 1, 129, 
                    3, 21, 1, 133, 1, 21, 1, -1, 4, 21, 1, -1, 1, 140, 1, 
                    -1, 1, 141, 1, 21, 3, -1, 1, 143, 1, 144, 1, 145, 1, 
                    -1, 1, 21, 1, 147, 3, 21, 1, 152, 2, -1, 1, 153, 3, 
                    -1, 1, 21, 1, -1, 3, 21, 1, 158, 2, -1, 2, 21, 1, 161, 
                    1, 162, 1, -1, 1, 21, 1, 164, 2, -1, 1, 165, 2, -1 )
      EOF = unpack( 166, -1 )
      MIN = unpack( 1, 9, 4, -1, 1, 0, 1, 105, 1, 108, 1, 101, 1, 108, 1, 
                    112, 1, 105, 1, 97, 2, 114, 1, 97, 1, 102, 1, 108, 1, 
                    104, 1, 111, 1, 114, 3, -1, 1, 42, 9, -1, 1, 61, 4, 
                    -1, 3, 61, 7, -1, 1, 122, 1, 108, 1, 97, 1, 111, 1, 
                    110, 1, 101, 1, 108, 2, 105, 1, 117, 1, 108, 1, 114, 
                    1, 48, 3, 105, 1, 48, 1, 101, 9, -1, 1, 101, 1, 111, 
                    1, 100, 1, 117, 1, 115, 1, 116, 1, 110, 1, 48, 2, 110, 
                    1, 101, 1, 115, 1, 48, 1, -1, 1, 101, 1, 102, 1, 116, 
                    1, 108, 1, -1, 1, 97, 1, 111, 1, 99, 1, 48, 1, 114, 
                    1, 101, 1, 105, 1, 70, 1, -1, 1, 48, 1, 116, 1, 48, 
                    1, 101, 1, -1, 3, 48, 1, 101, 1, 107, 1, 102, 1, 48, 
                    1, 117, 1, -1, 1, 110, 1, 70, 1, 110, 1, 105, 1, -1, 
                    1, 48, 1, -1, 1, 48, 1, 102, 3, -1, 3, 48, 1, -1, 1, 
                    109, 1, 48, 1, 105, 1, 117, 1, 108, 1, 48, 2, -1, 1, 
                    48, 3, -1, 1, 98, 1, -1, 1, 108, 2, 101, 1, 48, 2, -1, 
                    2, 101, 2, 48, 1, -1, 1, 114, 1, 48, 2, -1, 1, 48, 2, 
                    -1 )
      MAX = unpack( 1, 125, 4, -1, 1, -1, 1, 105, 1, 108, 1, 101, 1, 111, 
                    1, 112, 1, 105, 1, 97, 2, 114, 1, 111, 1, 102, 1, 120, 
                    1, 104, 1, 111, 1, 114, 3, -1, 1, 42, 9, -1, 1, 61, 
                    4, -1, 3, 61, 7, -1, 1, 122, 1, 108, 1, 116, 1, 111, 
                    1, 110, 1, 101, 1, 108, 2, 105, 1, 117, 1, 108, 1, 114, 
                    1, 122, 1, 115, 2, 105, 1, 122, 1, 101, 9, -1, 1, 101, 
                    1, 111, 1, 100, 1, 117, 1, 115, 1, 116, 1, 110, 1, 122, 
                    2, 110, 1, 101, 1, 115, 1, 122, 1, -1, 1, 101, 1, 102, 
                    1, 116, 1, 108, 1, -1, 1, 97, 1, 111, 1, 99, 1, 122, 
                    1, 114, 1, 101, 1, 105, 1, 70, 1, -1, 1, 122, 1, 116, 
                    1, 122, 1, 101, 1, -1, 3, 122, 1, 101, 1, 107, 1, 102, 
                    1, 122, 1, 117, 1, -1, 1, 110, 1, 70, 1, 110, 1, 105, 
                    1, -1, 1, 122, 1, -1, 1, 122, 1, 102, 3, -1, 3, 122, 
                    1, -1, 1, 109, 1, 122, 1, 105, 1, 117, 1, 108, 1, 122, 
                    2, -1, 1, 122, 3, -1, 1, 98, 1, -1, 1, 108, 2, 101, 
                    1, 122, 2, -1, 2, 101, 2, 122, 1, -1, 1, 114, 1, 122, 
                    2, -1, 1, 122, 2, -1 )
      ACCEPT = unpack( 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 16, -1, 1, 30, 1, 
                       31, 1, 32, 1, -1, 1, 33, 1, 34, 1, 35, 1, 36, 1, 
                       37, 1, 39, 1, 40, 1, 41, 1, 42, 1, -1, 1, 44, 1, 
                       45, 1, 46, 1, 48, 3, -1, 1, 55, 1, 56, 1, 58, 1, 
                       1, 1, 2, 1, 5, 1, 38, 18, -1, 1, 47, 1, 49, 1, 43, 
                       1, 50, 1, 57, 1, 53, 1, 51, 1, 54, 1, 52, 13, -1, 
                       1, 20, 4, -1, 1, 25, 8, -1, 1, 11, 4, -1, 1, 19, 
                       8, -1, 1, 13, 4, -1, 1, 12, 1, -1, 1, 17, 2, -1, 
                       1, 21, 1, 22, 1, 27, 3, -1, 1, 7, 6, -1, 1, 14, 1, 
                       18, 1, -1, 1, 24, 1, 28, 1, 6, 1, -1, 1, 26, 4, -1, 
                       1, 15, 1, 23, 4, -1, 1, 16, 2, -1, 1, 29, 1, 10, 
                       1, -1, 1, 9, 1, 8 )
      SPECIAL = unpack( 5, -1, 1, 0, 160, -1 )
      TRANSITION = [
        unpack( 1, 25, 1, 2, 2, -1, 1, 1, 18, -1, 1, 25, 1, 39, 1, 5, 1, 
                23, 1, -1, 1, 38, 1, 42, 1, -1, 1, 26, 1, 27, 1, 37, 1, 
                35, 1, 30, 1, 36, 1, 31, 1, 24, 10, 22, 1, 32, 1, 33, 1, 
                40, 1, 34, 1, 41, 1, 44, 1, -1, 26, 21, 1, 3, 1, -1, 1, 
                4, 1, -1, 1, 21, 1, -1, 1, 7, 1, 20, 1, 9, 1, 19, 1, 17, 
                1, 15, 2, 21, 1, 16, 3, 21, 1, 12, 1, 11, 1, 10, 1, 13, 
                1, 21, 1, 8, 1, 6, 1, 14, 2, 21, 1, 18, 3, 21, 1, 28, 1, 
                43, 1, 29 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 0, 47 ),
        unpack( 1, 49 ),
        unpack( 1, 50 ),
        unpack( 1, 51 ),
        unpack( 1, 52, 2, -1, 1, 53 ),
        unpack( 1, 54 ),
        unpack( 1, 55 ),
        unpack( 1, 56 ),
        unpack( 1, 57 ),
        unpack( 1, 58 ),
        unpack( 1, 59, 13, -1, 1, 60 ),
        unpack( 1, 61 ),
        unpack( 1, 62, 11, -1, 1, 63 ),
        unpack( 1, 64 ),
        unpack( 1, 65 ),
        unpack( 1, 66 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 23 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 68 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 70 ),
        unpack( 1, 72 ),
        unpack( 1, 74 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 76 ),
        unpack( 1, 77 ),
        unpack( 1, 78, 18, -1, 1, 79 ),
        unpack( 1, 80 ),
        unpack( 1, 81 ),
        unpack( 1, 82 ),
        unpack( 1, 83 ),
        unpack( 1, 84 ),
        unpack( 1, 85 ),
        unpack( 1, 86 ),
        unpack( 1, 87 ),
        unpack( 1, 88 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 91, 9, -1, 1, 90 ),
        unpack( 1, 92 ),
        unpack( 1, 93 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 95 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 96 ),
        unpack( 1, 97 ),
        unpack( 1, 98 ),
        unpack( 1, 99 ),
        unpack( 1, 100 ),
        unpack( 1, 101 ),
        unpack( 1, 102 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 104 ),
        unpack( 1, 105 ),
        unpack( 1, 106 ),
        unpack( 1, 107 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack(  ),
        unpack( 1, 109 ),
        unpack( 1, 110 ),
        unpack( 1, 111 ),
        unpack( 1, 112 ),
        unpack(  ),
        unpack( 1, 113 ),
        unpack( 1, 114 ),
        unpack( 1, 115 ),
        unpack( 10, 21, 7, -1, 13, 21, 1, 116, 12, 21, 4, -1, 1, 21, 1, 
                 -1, 26, 21 ),
        unpack( 1, 118 ),
        unpack( 1, 119 ),
        unpack( 1, 120 ),
        unpack( 1, 121 ),
        unpack(  ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 123 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 125 ),
        unpack(  ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 8, 21, 1, 126, 
                 17, 21 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 130 ),
        unpack( 1, 131 ),
        unpack( 1, 132 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 134 ),
        unpack(  ),
        unpack( 1, 135 ),
        unpack( 1, 136 ),
        unpack( 1, 137 ),
        unpack( 1, 138 ),
        unpack(  ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 11, 21, 1, 
                 139, 14, 21 ),
        unpack(  ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 142 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack(  ),
        unpack( 1, 146 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 148 ),
        unpack( 1, 149 ),
        unpack( 1, 150 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 13, 21, 1, 
                 151, 12, 21 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 154 ),
        unpack(  ),
        unpack( 1, 155 ),
        unpack( 1, 156 ),
        unpack( 1, 157 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 159 ),
        unpack( 1, 160 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack(  ),
        unpack( 1, 163 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 18
      

      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( T__64 | T__65 | T__66 | T__67 | STRING | SIZEOF | ALLOC | READNUMBER | CLOSEFILE | OPENFILE | NULL | MAIN | READ | PRINT | PRINTL | PRINTLN | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | RETURN | EXIT | BREAK | CONTINUE | ID | INT | COMMENT | WS | LB | RB | LCB | RCB | QUOTE | COMMA | DOT | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT | QM );
        __dfa_description__
      end
    end

    
    private
    
    def initialize_dfas
      super rescue nil
      @dfa12 = DFA12.new( self, 12 )
      @dfa18 = DFA18.new( self, 18 ) do |s|
        case s
        when 0
          look_18_5 = @input.peek
          s = -1
          if ( look_18_5.between?( 0x0, 0xffff ) )
            s = 47
          else
            s = 48
          end

        end
        
        if s < 0
          nva = ANTLR3::Error::NoViableAlternative.new( @dfa18.description, 18, s, input )
          @dfa18.error( nva )
          raise nva
        end
        
        s
      end

    end
  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0
end


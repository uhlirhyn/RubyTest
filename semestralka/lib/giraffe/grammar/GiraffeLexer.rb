#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-12-13 22:44:49
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
    define_tokens( :T__68 => 68, :T__66 => 66, :LT => 30, :MAIN => 25, :EXPONENT => 58, 
                   :T__67 => 67, :T__65 => 65, :WHILE => 21, :RB => 13, 
                   :MOD => 37, :OPENFILE => 39, :READNUMBER => 41, :OCTAL_ESC => 52, 
                   :FOR => 23, :DO => 22, :FLOAT => 59, :NOT => 34, :RCB => 17, 
                   :ID => 24, :AND => 27, :EOF => -1, :BREAK => 56, :IF => 15, 
                   :QUOTE => 61, :ESC_SEQ => 49, :CONTINUE => 57, :QM => 64, 
                   :COMMA => 14, :LCB => 16, :PRINTLN => 54, :RETURN => 7, 
                   :PLUS => 8, :EQ => 28, :DOT => 62, :COMMENT => 4, :NE => 29, 
                   :EXIT => 55, :GE => 33, :UNICODE_ESC => 51, :NULL => 43, 
                   :ELSE => 18, :HEX_DIGIT => 50, :SEMICOLON => 5, :INT => 10, 
                   :MINUS => 9, :MUL => 35, :TRUE => 46, :PRINT => 11, :ELSEIF => 19, 
                   :PRINTL => 53, :COLON => 63, :ELIF => 20, :WS => 60, 
                   :WRITEFILE => 42, :READ => 6, :OR => 26, :ASSIGN => 45, 
                   :SIZEOF => 40, :ALLOC => 44, :GT => 31, :LB => 12, :CLOSEFILE => 38, 
                   :DIV => 36, :FALSE => 47, :LE => 32, :STRING => 48 )
    
  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = Giraffe
    include TokenData

    
    begin
      generated_using( "Giraffe.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end
    
    RULE_NAMES   = [ "T__65", "T__66", "T__67", "T__68", "STRING", "HEX_DIGIT", 
                     "ESC_SEQ", "OCTAL_ESC", "UNICODE_ESC", "SIZEOF", "ALLOC", 
                     "READNUMBER", "WRITEFILE", "CLOSEFILE", "OPENFILE", 
                     "NULL", "MAIN", "READ", "PRINT", "PRINTL", "PRINTLN", 
                     "TRUE", "FALSE", "FOR", "IF", "ELSE", "ELIF", "ELSEIF", 
                     "WHILE", "DO", "RETURN", "EXIT", "BREAK", "CONTINUE", 
                     "ID", "INT", "FLOAT", "COMMENT", "WS", "EXPONENT", 
                     "LB", "RB", "LCB", "RCB", "QUOTE", "COMMA", "DOT", 
                     "COLON", "SEMICOLON", "ASSIGN", "PLUS", "MINUS", "MUL", 
                     "DIV", "MOD", "EQ", "NE", "LT", "GT", "LE", "GE", "AND", 
                     "OR", "NOT", "QM" ].freeze
    RULE_METHODS = [ :t__65!, :t__66!, :t__67!, :t__68!, :string!, :hex_digit!, 
                     :esc_seq!, :octal_esc!, :unicode_esc!, :sizeof!, :alloc!, 
                     :readnumber!, :writefile!, :closefile!, :openfile!, 
                     :null!, :main!, :read!, :print!, :printl!, :println!, 
                     :true!, :false!, :for!, :if!, :else!, :elif!, :elseif!, 
                     :while!, :do!, :return!, :exit!, :break!, :continue!, 
                     :id!, :int!, :float!, :comment!, :ws!, :exponent!, 
                     :lb!, :rb!, :lcb!, :rcb!, :quote!, :comma!, :dot!, 
                     :colon!, :semicolon!, :assign!, :plus!, :minus!, :mul!, 
                     :div!, :mod!, :eq!, :ne!, :lt!, :gt!, :le!, :ge!, :and!, 
                     :or!, :not!, :qm! ].freeze

    
    def initialize( input=nil, options = {} )
      super( input, options )

    end
    
    
    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule t__65! (T__65)
    # (in Giraffe.g)
    def t__65!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      type = T__65
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

    # lexer rule t__66! (T__66)
    # (in Giraffe.g)
    def t__66!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      type = T__66
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

    # lexer rule t__67! (T__67)
    # (in Giraffe.g)
    def t__67!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      type = T__67
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

    # lexer rule t__68! (T__68)
    # (in Giraffe.g)
    def t__68!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      type = T__68
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
      # at line 338:8: '\"' ( ESC_SEQ | ' ' | ~ ( '\\\\' | '\"' | ' ' ) )* '\"'
      match( 0x22 )
      # at line 338:12: ( ESC_SEQ | ' ' | ~ ( '\\\\' | '\"' | ' ' ) )*
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
          # at line 338:14: ESC_SEQ
          esc_seq!

        when 2
          # at line 338:24: ' '
          match( 0x20 )

        when 3
          # at line 338:30: ~ ( '\\\\' | '\"' | ' ' )
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
      # at line 342:13: ( '0' .. '9' | 'a' .. 'f' | 'A' .. 'F' )
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
      # at line 346:5: ( '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' | 'e' ) | UNICODE_ESC | OCTAL_ESC )
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
        # at line 346:9: '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' | 'e' )
        match( 0x5c )
        if @input.peek(1) == 0x22 || @input.peek(1) == 0x27 || @input.peek(1) == 0x5c || @input.peek(1) == 0x62 || @input.peek( 1 ).between?( 0x65, 0x66 ) || @input.peek(1) == 0x6e || @input.peek(1) == 0x72 || @input.peek(1) == 0x74
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse
        end



      when 2
        # at line 347:9: UNICODE_ESC
        unicode_esc!

      when 3
        # at line 348:9: OCTAL_ESC
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
      # at line 353:5: ( '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) )
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
        # at line 353:9: '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 353:14: ( '0' .. '3' )
        # at line 353:15: '0' .. '3'
        match_range( 0x30, 0x33 )

        # at line 353:25: ( '0' .. '7' )
        # at line 353:26: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 353:36: ( '0' .. '7' )
        # at line 353:37: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 2
        # at line 354:9: '\\\\' ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 354:14: ( '0' .. '7' )
        # at line 354:15: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 354:25: ( '0' .. '7' )
        # at line 354:26: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 3
        # at line 355:9: '\\\\' ( '0' .. '7' )
        match( 0x5c )
        # at line 355:14: ( '0' .. '7' )
        # at line 355:15: '0' .. '7'
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
      # at line 360:9: '\\\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
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
      # at line 363:10: 'sizeof'
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
      # at line 364:10: 'alloc'
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
      # at line 365:13: 'readNumber'
      match( "readNumber" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )

    end

    # lexer rule writefile! (WRITEFILE)
    # (in Giraffe.g)
    def writefile!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      type = WRITEFILE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 366:12: 'writeFile'
      match( "writeFile" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )

    end

    # lexer rule closefile! (CLOSEFILE)
    # (in Giraffe.g)
    def closefile!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )

      type = CLOSEFILE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 368:4: 'closeFile'
      match( "closeFile" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )

    end

    # lexer rule openfile! (OPENFILE)
    # (in Giraffe.g)
    def openfile!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      type = OPENFILE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 369:11: 'openFile'
      match( "openFile" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )

    end

    # lexer rule null! (NULL)
    # (in Giraffe.g)
    def null!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      type = NULL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 370:8: 'nil'
      match( "nil" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )

    end

    # lexer rule main! (MAIN)
    # (in Giraffe.g)
    def main!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )

      type = MAIN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 371:8: 'main'
      match( "main" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )

    end

    # lexer rule read! (READ)
    # (in Giraffe.g)
    def read!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )

      type = READ
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 372:8: 'read'
      match( "read" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )

    end

    # lexer rule print! (PRINT)
    # (in Giraffe.g)
    def print!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )

      type = PRINT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 373:9: 'print'
      match( "print" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 19 )

    end

    # lexer rule printl! (PRINTL)
    # (in Giraffe.g)
    def printl!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )

      type = PRINTL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 374:10: 'printl'
      match( "printl" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 20 )

    end

    # lexer rule println! (PRINTLN)
    # (in Giraffe.g)
    def println!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )

      type = PRINTLN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 375:11: 'println'
      match( "println" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 21 )

    end

    # lexer rule true! (TRUE)
    # (in Giraffe.g)
    def true!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )

      type = TRUE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 376:8: 'true'
      match( "true" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 22 )

    end

    # lexer rule false! (FALSE)
    # (in Giraffe.g)
    def false!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )

      type = FALSE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 377:9: 'false'
      match( "false" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 23 )

    end

    # lexer rule for! (FOR)
    # (in Giraffe.g)
    def for!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )

      type = FOR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 378:7: 'for'
      match( "for" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 24 )

    end

    # lexer rule if! (IF)
    # (in Giraffe.g)
    def if!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )

      type = IF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 379:6: 'if'
      match( "if" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 25 )

    end

    # lexer rule else! (ELSE)
    # (in Giraffe.g)
    def else!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )

      type = ELSE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 380:8: 'else'
      match( "else" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 26 )

    end

    # lexer rule elif! (ELIF)
    # (in Giraffe.g)
    def elif!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )

      type = ELIF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 381:8: 'elif'
      match( "elif" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 27 )

    end

    # lexer rule elseif! (ELSEIF)
    # (in Giraffe.g)
    def elseif!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )

      type = ELSEIF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 382:10: 'elseif'
      match( "elseif" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 28 )

    end

    # lexer rule while! (WHILE)
    # (in Giraffe.g)
    def while!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )

      type = WHILE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 383:9: 'while'
      match( "while" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 29 )

    end

    # lexer rule do! (DO)
    # (in Giraffe.g)
    def do!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )

      type = DO
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 384:6: 'do'
      match( "do" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 30 )

    end

    # lexer rule return! (RETURN)
    # (in Giraffe.g)
    def return!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )

      type = RETURN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 385:10: 'return'
      match( "return" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 31 )

    end

    # lexer rule exit! (EXIT)
    # (in Giraffe.g)
    def exit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )

      type = EXIT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 386:8: 'exit'
      match( "exit" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )

    end

    # lexer rule break! (BREAK)
    # (in Giraffe.g)
    def break!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )

      type = BREAK
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 387:9: 'break'
      match( "break" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )

    end

    # lexer rule continue! (CONTINUE)
    # (in Giraffe.g)
    def continue!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )

      type = CONTINUE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 388:11: 'continue'
      match( "continue" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 34 )

    end

    # lexer rule id! (ID)
    # (in Giraffe.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )

      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 391:7: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 391:31: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
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
      # trace_out( __method__, 35 )

    end

    # lexer rule int! (INT)
    # (in Giraffe.g)
    def int!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )

      type = INT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 394:7: ( '0' .. '9' )+
      # at file 394:7: ( '0' .. '9' )+
      match_count_5 = 0
      while true
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0.between?( 0x30, 0x39 ) )
          alt_5 = 1

        end
        case alt_5
        when 1
          # at line 394:7: '0' .. '9'
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
      # trace_out( __method__, 36 )

    end

    # lexer rule float! (FLOAT)
    # (in Giraffe.g)
    def float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )

      
      # - - - - main rule block - - - -
      # at line 399:5: ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT )
      alt_12 = 3
      alt_12 = @dfa12.predict( @input )
      case alt_12
      when 1
        # at line 399:9: ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )?
        # at file 399:9: ( '0' .. '9' )+
        match_count_6 = 0
        while true
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0.between?( 0x30, 0x39 ) )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 399:10: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_6 > 0 and break
            eee = EarlyExit(6)


            raise eee
          end
          match_count_6 += 1
        end

        match( 0x2e )
        # at line 399:25: ( '0' .. '9' )*
        while true # decision 7
          alt_7 = 2
          look_7_0 = @input.peek( 1 )

          if ( look_7_0.between?( 0x30, 0x39 ) )
            alt_7 = 1

          end
          case alt_7
          when 1
            # at line 399:26: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            break # out of loop for decision 7
          end
        end # loop for decision 7
        # at line 399:37: ( EXPONENT )?
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == 0x45 || look_8_0 == 0x65 )
          alt_8 = 1
        end
        case alt_8
        when 1
          # at line 399:37: EXPONENT
          exponent!

        end

      when 2
        # at line 400:9: '.' ( '0' .. '9' )+ ( EXPONENT )?
        match( 0x2e )
        # at file 400:13: ( '0' .. '9' )+
        match_count_9 = 0
        while true
          alt_9 = 2
          look_9_0 = @input.peek( 1 )

          if ( look_9_0.between?( 0x30, 0x39 ) )
            alt_9 = 1

          end
          case alt_9
          when 1
            # at line 400:14: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_9 > 0 and break
            eee = EarlyExit(9)


            raise eee
          end
          match_count_9 += 1
        end

        # at line 400:25: ( EXPONENT )?
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0 == 0x45 || look_10_0 == 0x65 )
          alt_10 = 1
        end
        case alt_10
        when 1
          # at line 400:25: EXPONENT
          exponent!

        end

      when 3
        # at line 401:9: ( '0' .. '9' )+ EXPONENT
        # at file 401:9: ( '0' .. '9' )+
        match_count_11 = 0
        while true
          alt_11 = 2
          look_11_0 = @input.peek( 1 )

          if ( look_11_0.between?( 0x30, 0x39 ) )
            alt_11 = 1

          end
          case alt_11
          when 1
            # at line 401:10: '0' .. '9'
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
      # trace_out( __method__, 37 )

    end

    # lexer rule comment! (COMMENT)
    # (in Giraffe.g)
    def comment!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )

      type = COMMENT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 405:9: '#' (~ ( '\\n' | '\\r' ) )*
      match( 0x23 )
      # at line 405:13: (~ ( '\\n' | '\\r' ) )*
      while true # decision 13
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0.between?( 0x0, 0x9 ) || look_13_0.between?( 0xb, 0xc ) || look_13_0.between?( 0xe, 0xffff ) )
          alt_13 = 1

        end
        case alt_13
        when 1
          # at line 405:13: ~ ( '\\n' | '\\r' )
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
      # trace_out( __method__, 38 )

    end

    # lexer rule ws! (WS)
    # (in Giraffe.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )

      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 408:9: ( ' ' | '\\t' | '\\r' | '\\n' )
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
      # trace_out( __method__, 39 )

    end

    # lexer rule exponent! (EXPONENT)
    # (in Giraffe.g)
    def exponent!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )

      
      # - - - - main rule block - - - -
      # at line 416:12: ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+
      if @input.peek(1) == 0x45 || @input.peek(1) == 0x65
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 416:22: ( '+' | '-' )?
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
      # at file 416:33: ( '0' .. '9' )+
      match_count_15 = 0
      while true
        alt_15 = 2
        look_15_0 = @input.peek( 1 )

        if ( look_15_0.between?( 0x30, 0x39 ) )
          alt_15 = 1

        end
        case alt_15
        when 1
          # at line 416:34: '0' .. '9'
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
      # trace_out( __method__, 40 )

    end

    # lexer rule lb! (LB)
    # (in Giraffe.g)
    def lb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )

      type = LB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 418:6: '('
      match( 0x28 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 41 )

    end

    # lexer rule rb! (RB)
    # (in Giraffe.g)
    def rb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )

      type = RB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 419:6: ')'
      match( 0x29 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 42 )

    end

    # lexer rule lcb! (LCB)
    # (in Giraffe.g)
    def lcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )

      type = LCB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 420:7: '{'
      match( 0x7b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 43 )

    end

    # lexer rule rcb! (RCB)
    # (in Giraffe.g)
    def rcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )

      type = RCB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 421:7: '}'
      match( 0x7d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 44 )

    end

    # lexer rule quote! (QUOTE)
    # (in Giraffe.g)
    def quote!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )

      type = QUOTE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 422:9: '\"'
      match( 0x22 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 45 )

    end

    # lexer rule comma! (COMMA)
    # (in Giraffe.g)
    def comma!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )

      type = COMMA
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 423:9: ','
      match( 0x2c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 46 )

    end

    # lexer rule dot! (DOT)
    # (in Giraffe.g)
    def dot!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )

      type = DOT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 424:7: '.'
      match( 0x2e )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 47 )

    end

    # lexer rule colon! (COLON)
    # (in Giraffe.g)
    def colon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )

      type = COLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 425:9: ':'
      match( 0x3a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 48 )

    end

    # lexer rule semicolon! (SEMICOLON)
    # (in Giraffe.g)
    def semicolon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )

      type = SEMICOLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 427:4: ';'
      match( 0x3b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 49 )

    end

    # lexer rule assign! (ASSIGN)
    # (in Giraffe.g)
    def assign!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )

      type = ASSIGN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 428:10: '='
      match( 0x3d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 50 )

    end

    # lexer rule plus! (PLUS)
    # (in Giraffe.g)
    def plus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )

      type = PLUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 429:8: '+'
      match( 0x2b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 51 )

    end

    # lexer rule minus! (MINUS)
    # (in Giraffe.g)
    def minus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 52 )

      type = MINUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 430:9: '-'
      match( 0x2d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 52 )

    end

    # lexer rule mul! (MUL)
    # (in Giraffe.g)
    def mul!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )

      type = MUL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 431:7: '*'
      match( 0x2a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 53 )

    end

    # lexer rule div! (DIV)
    # (in Giraffe.g)
    def div!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )

      type = DIV
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 432:7: '/'
      match( 0x2f )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 54 )

    end

    # lexer rule mod! (MOD)
    # (in Giraffe.g)
    def mod!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )

      type = MOD
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 433:7: '%'
      match( 0x25 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 55 )

    end

    # lexer rule eq! (EQ)
    # (in Giraffe.g)
    def eq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 56 )

      type = EQ
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 435:6: '=='
      match( "==" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 56 )

    end

    # lexer rule ne! (NE)
    # (in Giraffe.g)
    def ne!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 57 )

      type = NE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 436:6: '!='
      match( "!=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 57 )

    end

    # lexer rule lt! (LT)
    # (in Giraffe.g)
    def lt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 58 )

      type = LT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 437:6: '<'
      match( 0x3c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 58 )

    end

    # lexer rule gt! (GT)
    # (in Giraffe.g)
    def gt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 59 )

      type = GT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 438:6: '>'
      match( 0x3e )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 59 )

    end

    # lexer rule le! (LE)
    # (in Giraffe.g)
    def le!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 60 )

      type = LE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 439:6: '<='
      match( "<=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 60 )

    end

    # lexer rule ge! (GE)
    # (in Giraffe.g)
    def ge!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 61 )

      type = GE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 440:6: '>='
      match( ">=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 61 )

    end

    # lexer rule and! (AND)
    # (in Giraffe.g)
    def and!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 62 )

      type = AND
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 442:7: '&&'
      match( "&&" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 62 )

    end

    # lexer rule or! (OR)
    # (in Giraffe.g)
    def or!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 63 )

      type = OR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 443:6: '||'
      match( "||" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 63 )

    end

    # lexer rule not! (NOT)
    # (in Giraffe.g)
    def not!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 64 )

      type = NOT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 444:7: '!'
      match( 0x21 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 64 )

    end

    # lexer rule qm! (QM)
    # (in Giraffe.g)
    def qm!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 65 )

      type = QM
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 446:6: '?'
      match( 0x3f )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 65 )

    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    # 
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( T__65 | T__66 | T__67 | T__68 | STRING | SIZEOF | ALLOC | READNUMBER | WRITEFILE | CLOSEFILE | OPENFILE | NULL | MAIN | READ | PRINT | PRINTL | PRINTLN | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | RETURN | EXIT | BREAK | CONTINUE | ID | INT | COMMENT | WS | LB | RB | LCB | RCB | QUOTE | COMMA | DOT | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT | QM )
      alt_16 = 59
      alt_16 = @dfa16.predict( @input )
      case alt_16
      when 1
        # at line 1:10: T__65
        t__65!

      when 2
        # at line 1:16: T__66
        t__66!

      when 3
        # at line 1:22: T__67
        t__67!

      when 4
        # at line 1:28: T__68
        t__68!

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
        # at line 1:65: WRITEFILE
        writefile!

      when 10
        # at line 1:75: CLOSEFILE
        closefile!

      when 11
        # at line 1:85: OPENFILE
        openfile!

      when 12
        # at line 1:94: NULL
        null!

      when 13
        # at line 1:99: MAIN
        main!

      when 14
        # at line 1:104: READ
        read!

      when 15
        # at line 1:109: PRINT
        print!

      when 16
        # at line 1:115: PRINTL
        printl!

      when 17
        # at line 1:122: PRINTLN
        println!

      when 18
        # at line 1:130: TRUE
        true!

      when 19
        # at line 1:135: FALSE
        false!

      when 20
        # at line 1:141: FOR
        for!

      when 21
        # at line 1:145: IF
        if!

      when 22
        # at line 1:148: ELSE
        else!

      when 23
        # at line 1:153: ELIF
        elif!

      when 24
        # at line 1:158: ELSEIF
        elseif!

      when 25
        # at line 1:165: WHILE
        while!

      when 26
        # at line 1:171: DO
        do!

      when 27
        # at line 1:174: RETURN
        return!

      when 28
        # at line 1:181: EXIT
        exit!

      when 29
        # at line 1:186: BREAK
        break!

      when 30
        # at line 1:192: CONTINUE
        continue!

      when 31
        # at line 1:201: ID
        id!

      when 32
        # at line 1:204: INT
        int!

      when 33
        # at line 1:208: COMMENT
        comment!

      when 34
        # at line 1:216: WS
        ws!

      when 35
        # at line 1:219: LB
        lb!

      when 36
        # at line 1:222: RB
        rb!

      when 37
        # at line 1:225: LCB
        lcb!

      when 38
        # at line 1:229: RCB
        rcb!

      when 39
        # at line 1:233: QUOTE
        quote!

      when 40
        # at line 1:239: COMMA
        comma!

      when 41
        # at line 1:245: DOT
        dot!

      when 42
        # at line 1:249: COLON
        colon!

      when 43
        # at line 1:255: SEMICOLON
        semicolon!

      when 44
        # at line 1:265: ASSIGN
        assign!

      when 45
        # at line 1:272: PLUS
        plus!

      when 46
        # at line 1:277: MINUS
        minus!

      when 47
        # at line 1:283: MUL
        mul!

      when 48
        # at line 1:287: DIV
        div!

      when 49
        # at line 1:291: MOD
        mod!

      when 50
        # at line 1:295: EQ
        eq!

      when 51
        # at line 1:298: NE
        ne!

      when 52
        # at line 1:301: LT
        lt!

      when 53
        # at line 1:304: GT
        gt!

      when 54
        # at line 1:307: LE
        le!

      when 55
        # at line 1:310: GE
        ge!

      when 56
        # at line 1:313: AND
        and!

      when 57
        # at line 1:317: OR
        or!

      when 58
        # at line 1:320: NOT
        not!

      when 59
        # at line 1:324: QM
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
          397:1: fragment FLOAT : ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT );
        __dfa_description__
      end
    end
    class DFA16 < ANTLR3::DFA
      EOT = unpack( 5, -1, 1, 48, 15, 21, 12, -1, 1, 69, 5, -1, 1, 71, 1, 
                    73, 1, 75, 7, -1, 14, 21, 1, 91, 2, 21, 1, 95, 1, 21, 
                    8, -1, 9, 21, 1, 106, 4, 21, 1, 111, 1, -1, 3, 21, 1, 
                    -1, 3, 21, 1, 119, 6, 21, 1, -1, 1, 126, 1, 21, 1, 128, 
                    1, 21, 1, -1, 1, 131, 1, 132, 1, 133, 2, 21, 1, 136, 
                    1, 21, 1, -1, 2, 21, 1, 140, 3, 21, 1, -1, 1, 145, 1, 
                    -1, 1, 146, 1, 21, 3, -1, 1, 148, 1, 149, 1, -1, 1, 
                    21, 1, 151, 1, 21, 1, -1, 3, 21, 1, 157, 2, -1, 1, 158, 
                    2, -1, 1, 21, 1, -1, 4, 21, 1, 164, 2, -1, 3, 21, 1, 
                    168, 1, 169, 1, -1, 1, 21, 1, 171, 1, 172, 2, -1, 1, 
                    173, 3, -1 )
      EOF = unpack( 174, -1 )
      MIN = unpack( 1, 9, 4, -1, 1, 0, 1, 105, 1, 108, 1, 101, 1, 104, 1, 
                    108, 1, 112, 1, 105, 1, 97, 2, 114, 1, 97, 1, 102, 1, 
                    108, 1, 111, 1, 114, 12, -1, 1, 61, 5, -1, 3, 61, 7, 
                    -1, 1, 122, 1, 108, 1, 97, 2, 105, 1, 111, 1, 110, 1, 
                    101, 1, 108, 2, 105, 1, 117, 1, 108, 1, 114, 1, 48, 
                    2, 105, 1, 48, 1, 101, 8, -1, 1, 101, 1, 111, 1, 100, 
                    1, 117, 1, 116, 1, 108, 1, 115, 1, 116, 1, 110, 1, 48, 
                    2, 110, 1, 101, 1, 115, 1, 48, 1, -1, 1, 101, 1, 102, 
                    1, 116, 1, -1, 1, 97, 1, 111, 1, 99, 1, 48, 1, 114, 
                    3, 101, 1, 105, 1, 70, 1, -1, 1, 48, 1, 116, 1, 48, 
                    1, 101, 1, -1, 3, 48, 1, 107, 1, 102, 1, 48, 1, 117, 
                    1, -1, 1, 110, 1, 70, 1, 48, 1, 70, 1, 110, 1, 105, 
                    1, -1, 1, 48, 1, -1, 1, 48, 1, 102, 3, -1, 2, 48, 1, 
                    -1, 1, 109, 1, 48, 1, 105, 1, -1, 1, 105, 1, 117, 1, 
                    108, 1, 48, 2, -1, 1, 48, 2, -1, 1, 98, 1, -1, 2, 108, 
                    2, 101, 1, 48, 2, -1, 3, 101, 2, 48, 1, -1, 1, 114, 
                    2, 48, 2, -1, 1, 48, 3, -1 )
      MAX = unpack( 1, 125, 4, -1, 1, -1, 1, 105, 1, 108, 1, 101, 1, 114, 
                    1, 111, 1, 112, 1, 105, 1, 97, 2, 114, 1, 111, 1, 102, 
                    1, 120, 1, 111, 1, 114, 12, -1, 1, 61, 5, -1, 3, 61, 
                    7, -1, 1, 122, 1, 108, 1, 116, 2, 105, 1, 111, 1, 110, 
                    1, 101, 1, 108, 2, 105, 1, 117, 1, 108, 1, 114, 1, 122, 
                    1, 115, 1, 105, 1, 122, 1, 101, 8, -1, 1, 101, 1, 111, 
                    1, 100, 1, 117, 1, 116, 1, 108, 1, 115, 1, 116, 1, 110, 
                    1, 122, 2, 110, 1, 101, 1, 115, 1, 122, 1, -1, 1, 101, 
                    1, 102, 1, 116, 1, -1, 1, 97, 1, 111, 1, 99, 1, 122, 
                    1, 114, 3, 101, 1, 105, 1, 70, 1, -1, 1, 122, 1, 116, 
                    1, 122, 1, 101, 1, -1, 3, 122, 1, 107, 1, 102, 1, 122, 
                    1, 117, 1, -1, 1, 110, 1, 70, 1, 122, 1, 70, 1, 110, 
                    1, 105, 1, -1, 1, 122, 1, -1, 1, 122, 1, 102, 3, -1, 
                    2, 122, 1, -1, 1, 109, 1, 122, 1, 105, 1, -1, 1, 105, 
                    1, 117, 1, 108, 1, 122, 2, -1, 1, 122, 2, -1, 1, 98, 
                    1, -1, 2, 108, 2, 101, 1, 122, 2, -1, 3, 101, 2, 122, 
                    1, -1, 1, 114, 2, 122, 2, -1, 1, 122, 3, -1 )
      ACCEPT = unpack( 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 16, -1, 1, 31, 1, 
                       32, 1, 33, 1, 34, 1, 35, 1, 36, 1, 37, 1, 38, 1, 
                       40, 1, 41, 1, 42, 1, 43, 1, -1, 1, 45, 1, 46, 1, 
                       47, 1, 48, 1, 49, 3, -1, 1, 56, 1, 57, 1, 59, 1, 
                       1, 1, 2, 1, 5, 1, 39, 19, -1, 1, 50, 1, 44, 1, 51, 
                       1, 58, 1, 54, 1, 52, 1, 55, 1, 53, 15, -1, 1, 21, 
                       3, -1, 1, 26, 10, -1, 1, 12, 4, -1, 1, 20, 7, -1, 
                       1, 14, 6, -1, 1, 13, 1, -1, 1, 18, 2, -1, 1, 22, 
                       1, 23, 1, 28, 2, -1, 1, 7, 3, -1, 1, 25, 4, -1, 1, 
                       15, 1, 19, 1, -1, 1, 29, 1, 6, 1, -1, 1, 27, 5, -1, 
                       1, 16, 1, 24, 5, -1, 1, 17, 3, -1, 1, 30, 1, 11, 
                       1, -1, 1, 9, 1, 10, 1, 8 )
      SPECIAL = unpack( 5, -1, 1, 0, 168, -1 )
      TRANSITION = [
        unpack( 1, 24, 1, 2, 2, -1, 1, 1, 18, -1, 1, 24, 1, 39, 1, 5, 1, 
                23, 1, -1, 1, 38, 1, 42, 1, -1, 1, 25, 1, 26, 1, 36, 1, 
                34, 1, 29, 1, 35, 1, 30, 1, 37, 10, 22, 1, 31, 1, 32, 1, 
                40, 1, 33, 1, 41, 1, 44, 1, -1, 26, 21, 1, 3, 1, -1, 1, 
                4, 1, -1, 1, 21, 1, -1, 1, 7, 1, 20, 1, 10, 1, 19, 1, 18, 
                1, 16, 2, 21, 1, 17, 3, 21, 1, 13, 1, 12, 1, 11, 1, 14, 
                1, 21, 1, 8, 1, 6, 1, 15, 2, 21, 1, 9, 3, 21, 1, 27, 1, 
                43, 1, 28 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 0, 47 ),
        unpack( 1, 49 ),
        unpack( 1, 50 ),
        unpack( 1, 51 ),
        unpack( 1, 53, 9, -1, 1, 52 ),
        unpack( 1, 54, 2, -1, 1, 55 ),
        unpack( 1, 56 ),
        unpack( 1, 57 ),
        unpack( 1, 58 ),
        unpack( 1, 59 ),
        unpack( 1, 60 ),
        unpack( 1, 61, 13, -1, 1, 62 ),
        unpack( 1, 63 ),
        unpack( 1, 64, 11, -1, 1, 65 ),
        unpack( 1, 66 ),
        unpack( 1, 67 ),
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
        unpack( 1, 68 ),
        unpack(  ),
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
        unpack( 1, 89 ),
        unpack( 1, 90 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 93, 9, -1, 1, 92 ),
        unpack( 1, 94 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 96 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 97 ),
        unpack( 1, 98 ),
        unpack( 1, 99 ),
        unpack( 1, 100 ),
        unpack( 1, 101 ),
        unpack( 1, 102 ),
        unpack( 1, 103 ),
        unpack( 1, 104 ),
        unpack( 1, 105 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 107 ),
        unpack( 1, 108 ),
        unpack( 1, 109 ),
        unpack( 1, 110 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack(  ),
        unpack( 1, 112 ),
        unpack( 1, 113 ),
        unpack( 1, 114 ),
        unpack(  ),
        unpack( 1, 115 ),
        unpack( 1, 116 ),
        unpack( 1, 117 ),
        unpack( 10, 21, 7, -1, 13, 21, 1, 118, 12, 21, 4, -1, 1, 21, 1, 
                 -1, 26, 21 ),
        unpack( 1, 120 ),
        unpack( 1, 121 ),
        unpack( 1, 122 ),
        unpack( 1, 123 ),
        unpack( 1, 124 ),
        unpack( 1, 125 ),
        unpack(  ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 127 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 129 ),
        unpack(  ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 8, 21, 1, 130, 
                 17, 21 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 134 ),
        unpack( 1, 135 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 137 ),
        unpack(  ),
        unpack( 1, 138 ),
        unpack( 1, 139 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 141 ),
        unpack( 1, 142 ),
        unpack( 1, 143 ),
        unpack(  ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 11, 21, 1, 
                 144, 14, 21 ),
        unpack(  ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 147 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack(  ),
        unpack( 1, 150 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 1, 152 ),
        unpack(  ),
        unpack( 1, 153 ),
        unpack( 1, 154 ),
        unpack( 1, 155 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 13, 21, 1, 
                 156, 12, 21 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 159 ),
        unpack(  ),
        unpack( 1, 160 ),
        unpack( 1, 161 ),
        unpack( 1, 162 ),
        unpack( 1, 163 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 165 ),
        unpack( 1, 166 ),
        unpack( 1, 167 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack(  ),
        unpack( 1, 170 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 21, 7, -1, 26, 21, 4, -1, 1, 21, 1, -1, 26, 21 ),
        unpack(  ),
        unpack(  ),
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
          1:1: Tokens : ( T__65 | T__66 | T__67 | T__68 | STRING | SIZEOF | ALLOC | READNUMBER | WRITEFILE | CLOSEFILE | OPENFILE | NULL | MAIN | READ | PRINT | PRINTL | PRINTLN | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | RETURN | EXIT | BREAK | CONTINUE | ID | INT | COMMENT | WS | LB | RB | LCB | RCB | QUOTE | COMMA | DOT | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT | QM );
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
            s = 47
          else
            s = 48
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


#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-11-12 23:12:54
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
    define_tokens( :EXPONENT => 46, :LT => 35, :RB => 12, :WHILE => 24, 
                   :MOD => 41, :OCTAL_ESC => 51, :CHAR => 29, :FOR => 26, 
                   :DO => 25, :FLOAT => 42, :NOT => 32, :AND => 31, :ID => 28, 
                   :RCB => 5, :EOF => -1, :BREAK => 8, :IF => 20, :ESC_SEQ => 48, 
                   :T__53 => 53, :T__54 => 54, :LCB => 4, :COMMA => 27, 
                   :PRINTLN => 19, :RETURN => 9, :PLUS => 13, :EQ => 33, 
                   :COMMENT => 6, :NE => 34, :EXIT => 10, :GE => 38, :UNICODE_ESC => 50, 
                   :ELSE => 21, :HEX_DIGIT => 49, :INT => 15, :SEMICOLON => 7, 
                   :MINUS => 14, :TRUE => 44, :MUL => 39, :PRINT => 16, 
                   :PRINTL => 18, :ELSEIF => 22, :COLON => 52, :ELIF => 23, 
                   :WS => 47, :OR => 30, :ASSIGN => 43, :GT => 36, :LB => 11, 
                   :DIV => 40, :FALSE => 45, :LE => 37, :STRING => 17 )
    
  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = Giraffe
    include TokenData

    
    begin
      generated_using( "Giraffe.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end
    
    RULE_NAMES   = [ "T__53", "T__54", "PRINT", "PRINTL", "PRINTLN", "TRUE", 
                     "FALSE", "FOR", "IF", "ELSE", "ELIF", "ELSEIF", "WHILE", 
                     "DO", "RETURN", "EXIT", "BREAK", "ID", "INT", "FLOAT", 
                     "COMMENT", "WS", "STRING", "CHAR", "EXPONENT", "HEX_DIGIT", 
                     "ESC_SEQ", "OCTAL_ESC", "UNICODE_ESC", "LB", "RB", 
                     "LCB", "RCB", "COMMA", "COLON", "SEMICOLON", "ASSIGN", 
                     "PLUS", "MINUS", "MUL", "DIV", "MOD", "EQ", "NE", "LT", 
                     "GT", "LE", "GE", "AND", "OR", "NOT" ].freeze
    RULE_METHODS = [ :t__53!, :t__54!, :print!, :printl!, :println!, :true!, 
                     :false!, :for!, :if!, :else!, :elif!, :elseif!, :while!, 
                     :do!, :return!, :exit!, :break!, :id!, :int!, :float!, 
                     :comment!, :ws!, :string!, :char!, :exponent!, :hex_digit!, 
                     :esc_seq!, :octal_esc!, :unicode_esc!, :lb!, :rb!, 
                     :lcb!, :rcb!, :comma!, :colon!, :semicolon!, :assign!, 
                     :plus!, :minus!, :mul!, :div!, :mod!, :eq!, :ne!, :lt!, 
                     :gt!, :le!, :ge!, :and!, :or!, :not! ].freeze

    
    def initialize( input=nil, options = {} )
      super( input, options )

    end
    
    
    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule t__53! (T__53)
    # (in Giraffe.g)
    def t__53!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      type = T__53
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

    # lexer rule t__54! (T__54)
    # (in Giraffe.g)
    def t__54!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      type = T__54
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

    # lexer rule print! (PRINT)
    # (in Giraffe.g)
    def print!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      type = PRINT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 242:9: 'print'
      match( "print" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )

    end

    # lexer rule printl! (PRINTL)
    # (in Giraffe.g)
    def printl!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      type = PRINTL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 243:10: 'printl'
      match( "printl" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )

    end

    # lexer rule println! (PRINTLN)
    # (in Giraffe.g)
    def println!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )

      type = PRINTLN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 244:11: 'println'
      match( "println" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )

    end

    # lexer rule true! (TRUE)
    # (in Giraffe.g)
    def true!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )

      type = TRUE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 245:8: 'true'
      match( "true" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )

    end

    # lexer rule false! (FALSE)
    # (in Giraffe.g)
    def false!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )

      type = FALSE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 246:9: 'false'
      match( "false" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )

    end

    # lexer rule for! (FOR)
    # (in Giraffe.g)
    def for!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )

      type = FOR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 247:7: 'for'
      match( "for" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )

    end

    # lexer rule if! (IF)
    # (in Giraffe.g)
    def if!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )

      type = IF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 248:6: 'if'
      match( "if" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )

    end

    # lexer rule else! (ELSE)
    # (in Giraffe.g)
    def else!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )

      type = ELSE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 249:8: 'else'
      match( "else" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )

    end

    # lexer rule elif! (ELIF)
    # (in Giraffe.g)
    def elif!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )

      type = ELIF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 250:8: 'elif'
      match( "elif" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )

    end

    # lexer rule elseif! (ELSEIF)
    # (in Giraffe.g)
    def elseif!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )

      type = ELSEIF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 251:10: 'elseif'
      match( "elseif" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )

    end

    # lexer rule while! (WHILE)
    # (in Giraffe.g)
    def while!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      type = WHILE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 252:9: 'while'
      match( "while" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )

    end

    # lexer rule do! (DO)
    # (in Giraffe.g)
    def do!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )

      type = DO
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 253:6: 'do'
      match( "do" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )

    end

    # lexer rule return! (RETURN)
    # (in Giraffe.g)
    def return!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      type = RETURN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 254:10: 'return'
      match( "return" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )

    end

    # lexer rule exit! (EXIT)
    # (in Giraffe.g)
    def exit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      type = EXIT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 255:8: 'exit'
      match( "exit" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )

    end

    # lexer rule break! (BREAK)
    # (in Giraffe.g)
    def break!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )

      type = BREAK
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 256:9: 'break'
      match( "break" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )

    end

    # lexer rule id! (ID)
    # (in Giraffe.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )

      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 258:7: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 258:31: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      while true # decision 1
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0.between?( 0x30, 0x39 ) || look_1_0.between?( 0x41, 0x5a ) || look_1_0 == 0x5f || look_1_0.between?( 0x61, 0x7a ) )
          alt_1 = 1

        end
        case alt_1
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
          break # out of loop for decision 1
        end
      end # loop for decision 1

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )

    end

    # lexer rule int! (INT)
    # (in Giraffe.g)
    def int!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )

      type = INT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 261:7: ( '0' .. '9' )+
      # at file 261:7: ( '0' .. '9' )+
      match_count_2 = 0
      while true
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0.between?( 0x30, 0x39 ) )
          alt_2 = 1

        end
        case alt_2
        when 1
          # at line 261:7: '0' .. '9'
          match_range( 0x30, 0x39 )

        else
          match_count_2 > 0 and break
          eee = EarlyExit(2)


          raise eee
        end
        match_count_2 += 1
      end


      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 19 )

    end

    # lexer rule float! (FLOAT)
    # (in Giraffe.g)
    def float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )

      
      # - - - - main rule block - - - -
      # at line 266:5: ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT )
      alt_9 = 3
      alt_9 = @dfa9.predict( @input )
      case alt_9
      when 1
        # at line 266:9: ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )?
        # at file 266:9: ( '0' .. '9' )+
        match_count_3 = 0
        while true
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0.between?( 0x30, 0x39 ) )
            alt_3 = 1

          end
          case alt_3
          when 1
            # at line 266:10: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_3 > 0 and break
            eee = EarlyExit(3)


            raise eee
          end
          match_count_3 += 1
        end

        match( 0x2e )
        # at line 266:25: ( '0' .. '9' )*
        while true # decision 4
          alt_4 = 2
          look_4_0 = @input.peek( 1 )

          if ( look_4_0.between?( 0x30, 0x39 ) )
            alt_4 = 1

          end
          case alt_4
          when 1
            # at line 266:26: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            break # out of loop for decision 4
          end
        end # loop for decision 4
        # at line 266:37: ( EXPONENT )?
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == 0x45 || look_5_0 == 0x65 )
          alt_5 = 1
        end
        case alt_5
        when 1
          # at line 266:37: EXPONENT
          exponent!

        end

      when 2
        # at line 267:9: '.' ( '0' .. '9' )+ ( EXPONENT )?
        match( 0x2e )
        # at file 267:13: ( '0' .. '9' )+
        match_count_6 = 0
        while true
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0.between?( 0x30, 0x39 ) )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 267:14: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_6 > 0 and break
            eee = EarlyExit(6)


            raise eee
          end
          match_count_6 += 1
        end

        # at line 267:25: ( EXPONENT )?
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == 0x45 || look_7_0 == 0x65 )
          alt_7 = 1
        end
        case alt_7
        when 1
          # at line 267:25: EXPONENT
          exponent!

        end

      when 3
        # at line 268:9: ( '0' .. '9' )+ EXPONENT
        # at file 268:9: ( '0' .. '9' )+
        match_count_8 = 0
        while true
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0.between?( 0x30, 0x39 ) )
            alt_8 = 1

          end
          case alt_8
          when 1
            # at line 268:10: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_8 > 0 and break
            eee = EarlyExit(8)


            raise eee
          end
          match_count_8 += 1
        end

        exponent!

      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 20 )

    end

    # lexer rule comment! (COMMENT)
    # (in Giraffe.g)
    def comment!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )

      type = COMMENT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 272:9: '#' (~ ( '\\n' | '\\r' ) )*
      match( 0x23 )
      # at line 272:13: (~ ( '\\n' | '\\r' ) )*
      while true # decision 10
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0.between?( 0x0, 0x9 ) || look_10_0.between?( 0xb, 0xc ) || look_10_0.between?( 0xe, 0xffff ) )
          alt_10 = 1

        end
        case alt_10
        when 1
          # at line 272:13: ~ ( '\\n' | '\\r' )
          if @input.peek( 1 ).between?( 0x0, 0x9 ) || @input.peek( 1 ).between?( 0xb, 0xc ) || @input.peek( 1 ).between?( 0xe, 0xff )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse
          end



        else
          break # out of loop for decision 10
        end
      end # loop for decision 10
      # --> action
      channel=HIDDEN;
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 21 )

    end

    # lexer rule ws! (WS)
    # (in Giraffe.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )

      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 275:9: ( ' ' | '\\t' | '\\r' | '\\n' )
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
      # trace_out( __method__, 22 )

    end

    # lexer rule string! (STRING)
    # (in Giraffe.g)
    def string!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )

      type = STRING
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 283:8: '\"' ( ESC_SEQ | ~ ( '\\\\' | '\"' ) )* '\"'
      match( 0x22 )
      # at line 283:12: ( ESC_SEQ | ~ ( '\\\\' | '\"' ) )*
      while true # decision 11
        alt_11 = 3
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == 0x5c )
          alt_11 = 1
        elsif ( look_11_0.between?( 0x0, 0x21 ) || look_11_0.between?( 0x23, 0x5b ) || look_11_0.between?( 0x5d, 0xffff ) )
          alt_11 = 2

        end
        case alt_11
        when 1
          # at line 283:14: ESC_SEQ
          esc_seq!

        when 2
          # at line 283:24: ~ ( '\\\\' | '\"' )
          if @input.peek( 1 ).between?( 0x0, 0x21 ) || @input.peek( 1 ).between?( 0x23, 0x5b ) || @input.peek( 1 ).between?( 0x5d, 0xff )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse
          end



        else
          break # out of loop for decision 11
        end
      end # loop for decision 11
      match( 0x22 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 23 )

    end

    # lexer rule char! (CHAR)
    # (in Giraffe.g)
    def char!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )

      type = CHAR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 286:8: '\\'' ( ESC_SEQ | ~ ( '\\'' | '\\\\' ) ) '\\''
      match( 0x27 )
      # at line 286:13: ( ESC_SEQ | ~ ( '\\'' | '\\\\' ) )
      alt_12 = 2
      look_12_0 = @input.peek( 1 )

      if ( look_12_0 == 0x5c )
        alt_12 = 1
      elsif ( look_12_0.between?( 0x0, 0x26 ) || look_12_0.between?( 0x28, 0x5b ) || look_12_0.between?( 0x5d, 0xffff ) )
        alt_12 = 2
      else
        raise NoViableAlternative( "", 12, 0 )
      end
      case alt_12
      when 1
        # at line 286:15: ESC_SEQ
        esc_seq!

      when 2
        # at line 286:25: ~ ( '\\'' | '\\\\' )
        if @input.peek( 1 ).between?( 0x0, 0x26 ) || @input.peek( 1 ).between?( 0x28, 0x5b ) || @input.peek( 1 ).between?( 0x5d, 0xff )
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse
        end



      end
      match( 0x27 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 24 )

    end

    # lexer rule exponent! (EXPONENT)
    # (in Giraffe.g)
    def exponent!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )

      
      # - - - - main rule block - - - -
      # at line 290:12: ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+
      if @input.peek(1) == 0x45 || @input.peek(1) == 0x65
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 290:22: ( '+' | '-' )?
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
      # at file 290:33: ( '0' .. '9' )+
      match_count_14 = 0
      while true
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0.between?( 0x30, 0x39 ) )
          alt_14 = 1

        end
        case alt_14
        when 1
          # at line 290:34: '0' .. '9'
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
      # trace_out( __method__, 25 )

    end

    # lexer rule hex_digit! (HEX_DIGIT)
    # (in Giraffe.g)
    def hex_digit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )

      
      # - - - - main rule block - - - -
      # at line 293:13: ( '0' .. '9' | 'a' .. 'f' | 'A' .. 'F' )
      if @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x46 ) || @input.peek( 1 ).between?( 0x61, 0x66 )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 26 )

    end

    # lexer rule esc_seq! (ESC_SEQ)
    # (in Giraffe.g)
    def esc_seq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )

      
      # - - - - main rule block - - - -
      # at line 297:5: ( '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' ) | UNICODE_ESC | OCTAL_ESC )
      alt_15 = 3
      look_15_0 = @input.peek( 1 )

      if ( look_15_0 == 0x5c )
        case look_15 = @input.peek( 2 )
        when 0x22, 0x27, 0x5c, 0x62, 0x66, 0x6e, 0x72, 0x74 then alt_15 = 1
        when 0x75 then alt_15 = 2
        when 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37 then alt_15 = 3
        else
          raise NoViableAlternative( "", 15, 1 )
        end
      else
        raise NoViableAlternative( "", 15, 0 )
      end
      case alt_15
      when 1
        # at line 297:9: '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' )
        match( 0x5c )
        if @input.peek(1) == 0x22 || @input.peek(1) == 0x27 || @input.peek(1) == 0x5c || @input.peek(1) == 0x62 || @input.peek(1) == 0x66 || @input.peek(1) == 0x6e || @input.peek(1) == 0x72 || @input.peek(1) == 0x74
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse
        end



      when 2
        # at line 298:9: UNICODE_ESC
        unicode_esc!

      when 3
        # at line 299:9: OCTAL_ESC
        octal_esc!

      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 27 )

    end

    # lexer rule octal_esc! (OCTAL_ESC)
    # (in Giraffe.g)
    def octal_esc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )

      
      # - - - - main rule block - - - -
      # at line 304:5: ( '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) )
      alt_16 = 3
      look_16_0 = @input.peek( 1 )

      if ( look_16_0 == 0x5c )
        look_16_1 = @input.peek( 2 )

        if ( look_16_1.between?( 0x30, 0x33 ) )
          look_16_2 = @input.peek( 3 )

          if ( look_16_2.between?( 0x30, 0x37 ) )
            look_16_4 = @input.peek( 4 )

            if ( look_16_4.between?( 0x30, 0x37 ) )
              alt_16 = 1
            else
              alt_16 = 2
            end
          else
            alt_16 = 3
          end
        elsif ( look_16_1.between?( 0x34, 0x37 ) )
          look_16_3 = @input.peek( 3 )

          if ( look_16_3.between?( 0x30, 0x37 ) )
            alt_16 = 2
          else
            alt_16 = 3
          end
        else
          raise NoViableAlternative( "", 16, 1 )
        end
      else
        raise NoViableAlternative( "", 16, 0 )
      end
      case alt_16
      when 1
        # at line 304:9: '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 304:14: ( '0' .. '3' )
        # at line 304:15: '0' .. '3'
        match_range( 0x30, 0x33 )

        # at line 304:25: ( '0' .. '7' )
        # at line 304:26: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 304:36: ( '0' .. '7' )
        # at line 304:37: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 2
        # at line 305:9: '\\\\' ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 305:14: ( '0' .. '7' )
        # at line 305:15: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 305:25: ( '0' .. '7' )
        # at line 305:26: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 3
        # at line 306:9: '\\\\' ( '0' .. '7' )
        match( 0x5c )
        # at line 306:14: ( '0' .. '7' )
        # at line 306:15: '0' .. '7'
        match_range( 0x30, 0x37 )


      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 28 )

    end

    # lexer rule unicode_esc! (UNICODE_ESC)
    # (in Giraffe.g)
    def unicode_esc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )

      
      # - - - - main rule block - - - -
      # at line 311:9: '\\\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
      match( 0x5c )
      match( 0x75 )
      hex_digit!
      hex_digit!
      hex_digit!
      hex_digit!

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 29 )

    end

    # lexer rule lb! (LB)
    # (in Giraffe.g)
    def lb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )

      type = LB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 314:6: '('
      match( 0x28 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 30 )

    end

    # lexer rule rb! (RB)
    # (in Giraffe.g)
    def rb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )

      type = RB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 315:6: ')'
      match( 0x29 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 31 )

    end

    # lexer rule lcb! (LCB)
    # (in Giraffe.g)
    def lcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )

      type = LCB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 316:7: '{'
      match( 0x7b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )

    end

    # lexer rule rcb! (RCB)
    # (in Giraffe.g)
    def rcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )

      type = RCB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 317:7: '}'
      match( 0x7d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )

    end

    # lexer rule comma! (COMMA)
    # (in Giraffe.g)
    def comma!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )

      type = COMMA
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 318:9: ','
      match( 0x2c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 34 )

    end

    # lexer rule colon! (COLON)
    # (in Giraffe.g)
    def colon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )

      type = COLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 319:9: ':'
      match( 0x3a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 35 )

    end

    # lexer rule semicolon! (SEMICOLON)
    # (in Giraffe.g)
    def semicolon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )

      type = SEMICOLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 321:4: ';'
      match( 0x3b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 36 )

    end

    # lexer rule assign! (ASSIGN)
    # (in Giraffe.g)
    def assign!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )

      type = ASSIGN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 322:10: '='
      match( 0x3d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 37 )

    end

    # lexer rule plus! (PLUS)
    # (in Giraffe.g)
    def plus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )

      type = PLUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 323:8: '+'
      match( 0x2b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 38 )

    end

    # lexer rule minus! (MINUS)
    # (in Giraffe.g)
    def minus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )

      type = MINUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 324:9: '-'
      match( 0x2d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 39 )

    end

    # lexer rule mul! (MUL)
    # (in Giraffe.g)
    def mul!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )

      type = MUL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 325:7: '*'
      match( 0x2a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 40 )

    end

    # lexer rule div! (DIV)
    # (in Giraffe.g)
    def div!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )

      type = DIV
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 326:7: '/'
      match( 0x2f )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 41 )

    end

    # lexer rule mod! (MOD)
    # (in Giraffe.g)
    def mod!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )

      type = MOD
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 327:7: '%'
      match( 0x25 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 42 )

    end

    # lexer rule eq! (EQ)
    # (in Giraffe.g)
    def eq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )

      type = EQ
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 329:6: '=='
      match( "==" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 43 )

    end

    # lexer rule ne! (NE)
    # (in Giraffe.g)
    def ne!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )

      type = NE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 330:6: '!='
      match( "!=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 44 )

    end

    # lexer rule lt! (LT)
    # (in Giraffe.g)
    def lt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )

      type = LT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 331:6: '<'
      match( 0x3c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 45 )

    end

    # lexer rule gt! (GT)
    # (in Giraffe.g)
    def gt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )

      type = GT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 332:6: '>'
      match( 0x3e )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 46 )

    end

    # lexer rule le! (LE)
    # (in Giraffe.g)
    def le!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )

      type = LE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 333:6: '<='
      match( "<=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 47 )

    end

    # lexer rule ge! (GE)
    # (in Giraffe.g)
    def ge!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )

      type = GE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 334:6: '>='
      match( ">=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 48 )

    end

    # lexer rule and! (AND)
    # (in Giraffe.g)
    def and!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )

      type = AND
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 336:7: '&&'
      match( "&&" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 49 )

    end

    # lexer rule or! (OR)
    # (in Giraffe.g)
    def or!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )

      type = OR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 337:6: '||'
      match( "||" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 50 )

    end

    # lexer rule not! (NOT)
    # (in Giraffe.g)
    def not!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )

      type = NOT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 338:7: '!'
      match( 0x21 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 51 )

    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    # 
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( T__53 | T__54 | PRINT | PRINTL | PRINTLN | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | RETURN | EXIT | BREAK | ID | INT | COMMENT | WS | STRING | CHAR | LB | RB | LCB | RCB | COMMA | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT )
      alt_17 = 45
      alt_17 = @dfa17.predict( @input )
      case alt_17
      when 1
        # at line 1:10: T__53
        t__53!

      when 2
        # at line 1:16: T__54
        t__54!

      when 3
        # at line 1:22: PRINT
        print!

      when 4
        # at line 1:28: PRINTL
        printl!

      when 5
        # at line 1:35: PRINTLN
        println!

      when 6
        # at line 1:43: TRUE
        true!

      when 7
        # at line 1:48: FALSE
        false!

      when 8
        # at line 1:54: FOR
        for!

      when 9
        # at line 1:58: IF
        if!

      when 10
        # at line 1:61: ELSE
        else!

      when 11
        # at line 1:66: ELIF
        elif!

      when 12
        # at line 1:71: ELSEIF
        elseif!

      when 13
        # at line 1:78: WHILE
        while!

      when 14
        # at line 1:84: DO
        do!

      when 15
        # at line 1:87: RETURN
        return!

      when 16
        # at line 1:94: EXIT
        exit!

      when 17
        # at line 1:99: BREAK
        break!

      when 18
        # at line 1:105: ID
        id!

      when 19
        # at line 1:108: INT
        int!

      when 20
        # at line 1:112: COMMENT
        comment!

      when 21
        # at line 1:120: WS
        ws!

      when 22
        # at line 1:123: STRING
        string!

      when 23
        # at line 1:130: CHAR
        char!

      when 24
        # at line 1:135: LB
        lb!

      when 25
        # at line 1:138: RB
        rb!

      when 26
        # at line 1:141: LCB
        lcb!

      when 27
        # at line 1:145: RCB
        rcb!

      when 28
        # at line 1:149: COMMA
        comma!

      when 29
        # at line 1:155: COLON
        colon!

      when 30
        # at line 1:161: SEMICOLON
        semicolon!

      when 31
        # at line 1:171: ASSIGN
        assign!

      when 32
        # at line 1:178: PLUS
        plus!

      when 33
        # at line 1:183: MINUS
        minus!

      when 34
        # at line 1:189: MUL
        mul!

      when 35
        # at line 1:193: DIV
        div!

      when 36
        # at line 1:197: MOD
        mod!

      when 37
        # at line 1:201: EQ
        eq!

      when 38
        # at line 1:204: NE
        ne!

      when 39
        # at line 1:207: LT
        lt!

      when 40
        # at line 1:210: GT
        gt!

      when 41
        # at line 1:213: LE
        le!

      when 42
        # at line 1:216: GE
        ge!

      when 43
        # at line 1:219: AND
        and!

      when 44
        # at line 1:223: OR
        or!

      when 45
        # at line 1:226: NOT
        not!

      end
    end

    
    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA9 < ANTLR3::DFA
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
      
      @decision = 9
      

      def description
        <<-'__dfa_description__'.strip!
          264:1: fragment FLOAT : ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT );
        __dfa_description__
      end
    end
    class DFA17 < ANTLR3::DFA
      EOT = unpack( 3, -1, 9, 12, 13, -1, 1, 50, 5, -1, 1, 52, 1, 54, 1, 
                    56, 4, -1, 4, 12, 1, 61, 3, 12, 1, 66, 2, 12, 8, -1, 
                    3, 12, 1, 72, 1, -1, 4, 12, 1, -1, 3, 12, 1, 80, 1, 
                    12, 1, -1, 1, 83, 1, 84, 1, 85, 3, 12, 1, 90, 1, -1, 
                    1, 91, 1, 12, 3, -1, 1, 93, 1, 12, 1, 95, 1, 97, 2, 
                    -1, 1, 98, 1, -1, 1, 99, 1, -1, 1, 100, 4, -1 )
      EOF = unpack( 101, -1 )
      MIN = unpack( 1, 9, 2, -1, 2, 114, 1, 97, 1, 102, 1, 108, 1, 104, 
                    1, 111, 1, 101, 1, 114, 13, -1, 1, 61, 5, -1, 3, 61, 
                    4, -1, 1, 105, 1, 117, 1, 108, 1, 114, 1, 48, 3, 105, 
                    1, 48, 1, 116, 1, 101, 8, -1, 1, 110, 1, 101, 1, 115, 
                    1, 48, 1, -1, 1, 101, 1, 102, 1, 116, 1, 108, 1, -1, 
                    1, 117, 1, 97, 1, 116, 1, 48, 1, 101, 1, -1, 3, 48, 
                    1, 101, 1, 114, 1, 107, 1, 48, 1, -1, 1, 48, 1, 102, 
                    3, -1, 1, 48, 1, 110, 2, 48, 2, -1, 1, 48, 1, -1, 1, 
                    48, 1, -1, 1, 48, 4, -1 )
      MAX = unpack( 1, 125, 2, -1, 2, 114, 1, 111, 1, 102, 1, 120, 1, 104, 
                    1, 111, 1, 101, 1, 114, 13, -1, 1, 61, 5, -1, 3, 61, 
                    4, -1, 1, 105, 1, 117, 1, 108, 1, 114, 1, 122, 1, 115, 
                    2, 105, 1, 122, 1, 116, 1, 101, 8, -1, 1, 110, 1, 101, 
                    1, 115, 1, 122, 1, -1, 1, 101, 1, 102, 1, 116, 1, 108, 
                    1, -1, 1, 117, 1, 97, 1, 116, 1, 122, 1, 101, 1, -1, 
                    3, 122, 1, 101, 1, 114, 1, 107, 1, 122, 1, -1, 1, 122, 
                    1, 102, 3, -1, 1, 122, 1, 110, 2, 122, 2, -1, 1, 122, 
                    1, -1, 1, 122, 1, -1, 1, 122, 4, -1 )
      ACCEPT = unpack( 1, -1, 1, 1, 1, 2, 9, -1, 1, 18, 1, 19, 1, 20, 1, 
                       21, 1, 22, 1, 23, 1, 24, 1, 25, 1, 26, 1, 27, 1, 
                       28, 1, 29, 1, 30, 1, -1, 1, 32, 1, 33, 1, 34, 1, 
                       35, 1, 36, 3, -1, 1, 43, 1, 44, 1, 1, 1, 2, 11, -1, 
                       1, 37, 1, 31, 1, 38, 1, 45, 1, 41, 1, 39, 1, 42, 
                       1, 40, 4, -1, 1, 9, 4, -1, 1, 14, 5, -1, 1, 8, 7, 
                       -1, 1, 6, 2, -1, 1, 10, 1, 11, 1, 16, 4, -1, 1, 3, 
                       1, 7, 1, -1, 1, 13, 1, -1, 1, 17, 1, -1, 1, 4, 1, 
                       12, 1, 15, 1, 5 )
      SPECIAL = unpack( 101, -1 )
      TRANSITION = [
        unpack( 1, 15, 1, 2, 2, -1, 1, 1, 18, -1, 1, 15, 1, 31, 1, 16, 1, 
                14, 1, -1, 1, 30, 1, 34, 1, 17, 1, 18, 1, 19, 1, 28, 1, 
                26, 1, 22, 1, 27, 1, -1, 1, 29, 10, 13, 1, 23, 1, 24, 1, 
                32, 1, 25, 1, 33, 2, -1, 26, 12, 4, -1, 1, 12, 1, -1, 1, 
                12, 1, 11, 1, 12, 1, 9, 1, 7, 1, 5, 2, 12, 1, 6, 6, 12, 
                1, 3, 1, 12, 1, 10, 1, 12, 1, 4, 2, 12, 1, 8, 3, 12, 1, 
                20, 1, 35, 1, 21 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 38 ),
        unpack( 1, 39 ),
        unpack( 1, 40, 13, -1, 1, 41 ),
        unpack( 1, 42 ),
        unpack( 1, 43, 11, -1, 1, 44 ),
        unpack( 1, 45 ),
        unpack( 1, 46 ),
        unpack( 1, 47 ),
        unpack( 1, 48 ),
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
        unpack(  ),
        unpack( 1, 49 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 51 ),
        unpack( 1, 53 ),
        unpack( 1, 55 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 57 ),
        unpack( 1, 58 ),
        unpack( 1, 59 ),
        unpack( 1, 60 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 1, 63, 9, -1, 1, 62 ),
        unpack( 1, 64 ),
        unpack( 1, 65 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 1, 67 ),
        unpack( 1, 68 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 69 ),
        unpack( 1, 70 ),
        unpack( 1, 71 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack(  ),
        unpack( 1, 73 ),
        unpack( 1, 74 ),
        unpack( 1, 75 ),
        unpack( 1, 76 ),
        unpack(  ),
        unpack( 1, 77 ),
        unpack( 1, 78 ),
        unpack( 1, 79 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 1, 81 ),
        unpack(  ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 8, 12, 1, 82, 
                 17, 12 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 1, 86 ),
        unpack( 1, 87 ),
        unpack( 1, 88 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 11, 12, 1, 
                 89, 14, 12 ),
        unpack(  ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 1, 92 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 1, 94 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 13, 12, 1, 
                 96, 12, 12 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack(  ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack(  ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 17
      

      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( T__53 | T__54 | PRINT | PRINTL | PRINTLN | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | RETURN | EXIT | BREAK | ID | INT | COMMENT | WS | STRING | CHAR | LB | RB | LCB | RCB | COMMA | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT );
        __dfa_description__
      end
    end

    
    private
    
    def initialize_dfas
      super rescue nil
      @dfa9 = DFA9.new( self, 9 )
      @dfa17 = DFA17.new( self, 17 )

    end
  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0
end


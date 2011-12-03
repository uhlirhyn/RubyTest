#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-12-03 19:40:44
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
    define_tokens( :EXPONENT => 47, :LT => 35, :RB => 11, :WHILE => 25, 
                   :MOD => 41, :FOR => 27, :DO => 26, :FLOAT => 42, :NOT => 32, 
                   :AND => 31, :ID => 28, :RCB => 21, :EOF => -1, :BREAK => 7, 
                   :IF => 19, :T__55 => 55, :QUOTE => 49, :T__52 => 52, 
                   :T__53 => 53, :T__54 => 54, :CONTINUE => 46, :QM => 51, 
                   :COMMA => 18, :LCB => 20, :PRINTLN => 17, :RETURN => 8, 
                   :PLUS => 12, :EQ => 33, :COMMENT => 4, :DOT => 29, :NE => 34, 
                   :EXIT => 9, :GE => 38, :ELSE => 22, :INT => 14, :SEMICOLON => 5, 
                   :MINUS => 13, :TRUE => 44, :MUL => 39, :PRINT => 15, 
                   :ELSEIF => 23, :PRINTL => 16, :COLON => 50, :ELIF => 24, 
                   :WS => 48, :READ => 6, :OR => 30, :ASSIGN => 43, :GT => 36, 
                   :LB => 10, :DIV => 40, :FALSE => 45, :LE => 37 )
    
  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = Giraffe
    include TokenData

    
    begin
      generated_using( "Giraffe.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end
    
    RULE_NAMES   = [ "T__52", "T__53", "T__54", "T__55", "READ", "PRINT", 
                     "PRINTL", "PRINTLN", "TRUE", "FALSE", "FOR", "IF", 
                     "ELSE", "ELIF", "ELSEIF", "WHILE", "DO", "RETURN", 
                     "EXIT", "BREAK", "CONTINUE", "ID", "INT", "FLOAT", 
                     "COMMENT", "WS", "EXPONENT", "LB", "RB", "LCB", "RCB", 
                     "QUOTE", "COMMA", "DOT", "COLON", "SEMICOLON", "ASSIGN", 
                     "PLUS", "MINUS", "MUL", "DIV", "MOD", "EQ", "NE", "LT", 
                     "GT", "LE", "GE", "AND", "OR", "NOT", "QM" ].freeze
    RULE_METHODS = [ :t__52!, :t__53!, :t__54!, :t__55!, :read!, :print!, 
                     :printl!, :println!, :true!, :false!, :for!, :if!, 
                     :else!, :elif!, :elseif!, :while!, :do!, :return!, 
                     :exit!, :break!, :continue!, :id!, :int!, :float!, 
                     :comment!, :ws!, :exponent!, :lb!, :rb!, :lcb!, :rcb!, 
                     :quote!, :comma!, :dot!, :colon!, :semicolon!, :assign!, 
                     :plus!, :minus!, :mul!, :div!, :mod!, :eq!, :ne!, :lt!, 
                     :gt!, :le!, :ge!, :and!, :or!, :not!, :qm! ].freeze

    
    def initialize( input=nil, options = {} )
      super( input, options )

    end
    
    
    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule t__52! (T__52)
    # (in Giraffe.g)
    def t__52!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      type = T__52
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

    # lexer rule t__53! (T__53)
    # (in Giraffe.g)
    def t__53!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      type = T__53
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

    # lexer rule t__54! (T__54)
    # (in Giraffe.g)
    def t__54!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      type = T__54
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

    # lexer rule t__55! (T__55)
    # (in Giraffe.g)
    def t__55!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      type = T__55
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

    # lexer rule read! (READ)
    # (in Giraffe.g)
    def read!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )

      type = READ
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 290:8: 'read'
      match( "read" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )

    end

    # lexer rule print! (PRINT)
    # (in Giraffe.g)
    def print!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )

      type = PRINT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 291:9: 'print'
      match( "print" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )

    end

    # lexer rule printl! (PRINTL)
    # (in Giraffe.g)
    def printl!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )

      type = PRINTL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 292:10: 'printl'
      match( "printl" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )

    end

    # lexer rule println! (PRINTLN)
    # (in Giraffe.g)
    def println!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )

      type = PRINTLN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 293:11: 'println'
      match( "println" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )

    end

    # lexer rule true! (TRUE)
    # (in Giraffe.g)
    def true!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )

      type = TRUE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 294:8: 'true'
      match( "true" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )

    end

    # lexer rule false! (FALSE)
    # (in Giraffe.g)
    def false!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )

      type = FALSE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 295:9: 'false'
      match( "false" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )

    end

    # lexer rule for! (FOR)
    # (in Giraffe.g)
    def for!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )

      type = FOR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 296:7: 'for'
      match( "for" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )

    end

    # lexer rule if! (IF)
    # (in Giraffe.g)
    def if!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )

      type = IF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 297:6: 'if'
      match( "if" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )

    end

    # lexer rule else! (ELSE)
    # (in Giraffe.g)
    def else!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      type = ELSE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 298:8: 'else'
      match( "else" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )

    end

    # lexer rule elif! (ELIF)
    # (in Giraffe.g)
    def elif!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )

      type = ELIF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 299:8: 'elif'
      match( "elif" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )

    end

    # lexer rule elseif! (ELSEIF)
    # (in Giraffe.g)
    def elseif!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      type = ELSEIF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 300:10: 'elseif'
      match( "elseif" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )

    end

    # lexer rule while! (WHILE)
    # (in Giraffe.g)
    def while!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      type = WHILE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 301:9: 'while'
      match( "while" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )

    end

    # lexer rule do! (DO)
    # (in Giraffe.g)
    def do!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )

      type = DO
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 302:6: 'do'
      match( "do" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )

    end

    # lexer rule return! (RETURN)
    # (in Giraffe.g)
    def return!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )

      type = RETURN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 303:10: 'return'
      match( "return" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )

    end

    # lexer rule exit! (EXIT)
    # (in Giraffe.g)
    def exit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )

      type = EXIT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 304:8: 'exit'
      match( "exit" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 19 )

    end

    # lexer rule break! (BREAK)
    # (in Giraffe.g)
    def break!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )

      type = BREAK
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 305:9: 'break'
      match( "break" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 20 )

    end

    # lexer rule continue! (CONTINUE)
    # (in Giraffe.g)
    def continue!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )

      type = CONTINUE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 306:11: 'continue'
      match( "continue" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 21 )

    end

    # lexer rule id! (ID)
    # (in Giraffe.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )

      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 309:7: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 309:31: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
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
      # trace_out( __method__, 22 )

    end

    # lexer rule int! (INT)
    # (in Giraffe.g)
    def int!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )

      type = INT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 312:7: ( '0' .. '9' )+
      # at file 312:7: ( '0' .. '9' )+
      match_count_2 = 0
      while true
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0.between?( 0x30, 0x39 ) )
          alt_2 = 1

        end
        case alt_2
        when 1
          # at line 312:7: '0' .. '9'
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
      # trace_out( __method__, 23 )

    end

    # lexer rule float! (FLOAT)
    # (in Giraffe.g)
    def float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )

      
      # - - - - main rule block - - - -
      # at line 317:5: ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT )
      alt_9 = 3
      alt_9 = @dfa9.predict( @input )
      case alt_9
      when 1
        # at line 317:9: ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )?
        # at file 317:9: ( '0' .. '9' )+
        match_count_3 = 0
        while true
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0.between?( 0x30, 0x39 ) )
            alt_3 = 1

          end
          case alt_3
          when 1
            # at line 317:10: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_3 > 0 and break
            eee = EarlyExit(3)


            raise eee
          end
          match_count_3 += 1
        end

        match( 0x2e )
        # at line 317:25: ( '0' .. '9' )*
        while true # decision 4
          alt_4 = 2
          look_4_0 = @input.peek( 1 )

          if ( look_4_0.between?( 0x30, 0x39 ) )
            alt_4 = 1

          end
          case alt_4
          when 1
            # at line 317:26: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            break # out of loop for decision 4
          end
        end # loop for decision 4
        # at line 317:37: ( EXPONENT )?
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == 0x45 || look_5_0 == 0x65 )
          alt_5 = 1
        end
        case alt_5
        when 1
          # at line 317:37: EXPONENT
          exponent!

        end

      when 2
        # at line 318:9: '.' ( '0' .. '9' )+ ( EXPONENT )?
        match( 0x2e )
        # at file 318:13: ( '0' .. '9' )+
        match_count_6 = 0
        while true
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0.between?( 0x30, 0x39 ) )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 318:14: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_6 > 0 and break
            eee = EarlyExit(6)


            raise eee
          end
          match_count_6 += 1
        end

        # at line 318:25: ( EXPONENT )?
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == 0x45 || look_7_0 == 0x65 )
          alt_7 = 1
        end
        case alt_7
        when 1
          # at line 318:25: EXPONENT
          exponent!

        end

      when 3
        # at line 319:9: ( '0' .. '9' )+ EXPONENT
        # at file 319:9: ( '0' .. '9' )+
        match_count_8 = 0
        while true
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0.between?( 0x30, 0x39 ) )
            alt_8 = 1

          end
          case alt_8
          when 1
            # at line 319:10: '0' .. '9'
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
      # trace_out( __method__, 24 )

    end

    # lexer rule comment! (COMMENT)
    # (in Giraffe.g)
    def comment!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )

      type = COMMENT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 323:9: '#' (~ ( '\\n' | '\\r' ) )*
      match( 0x23 )
      # at line 323:13: (~ ( '\\n' | '\\r' ) )*
      while true # decision 10
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0.between?( 0x0, 0x9 ) || look_10_0.between?( 0xb, 0xc ) || look_10_0.between?( 0xe, 0xffff ) )
          alt_10 = 1

        end
        case alt_10
        when 1
          # at line 323:13: ~ ( '\\n' | '\\r' )
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
      # trace_out( __method__, 25 )

    end

    # lexer rule ws! (WS)
    # (in Giraffe.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )

      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 326:9: ( ' ' | '\\t' | '\\r' | '\\n' )
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
      # trace_out( __method__, 26 )

    end

    # lexer rule exponent! (EXPONENT)
    # (in Giraffe.g)
    def exponent!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )

      
      # - - - - main rule block - - - -
      # at line 334:12: ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+
      if @input.peek(1) == 0x45 || @input.peek(1) == 0x65
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 334:22: ( '+' | '-' )?
      alt_11 = 2
      look_11_0 = @input.peek( 1 )

      if ( look_11_0 == 0x2b || look_11_0 == 0x2d )
        alt_11 = 1
      end
      case alt_11
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
      # at file 334:33: ( '0' .. '9' )+
      match_count_12 = 0
      while true
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0.between?( 0x30, 0x39 ) )
          alt_12 = 1

        end
        case alt_12
        when 1
          # at line 334:34: '0' .. '9'
          match_range( 0x30, 0x39 )

        else
          match_count_12 > 0 and break
          eee = EarlyExit(12)


          raise eee
        end
        match_count_12 += 1
      end


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 27 )

    end

    # lexer rule lb! (LB)
    # (in Giraffe.g)
    def lb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )

      type = LB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 336:6: '('
      match( 0x28 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 28 )

    end

    # lexer rule rb! (RB)
    # (in Giraffe.g)
    def rb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )

      type = RB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 337:6: ')'
      match( 0x29 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 29 )

    end

    # lexer rule lcb! (LCB)
    # (in Giraffe.g)
    def lcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )

      type = LCB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 338:7: '{'
      match( 0x7b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 30 )

    end

    # lexer rule rcb! (RCB)
    # (in Giraffe.g)
    def rcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )

      type = RCB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 339:7: '}'
      match( 0x7d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 31 )

    end

    # lexer rule quote! (QUOTE)
    # (in Giraffe.g)
    def quote!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )

      type = QUOTE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 340:9: '\"'
      match( 0x22 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )

    end

    # lexer rule comma! (COMMA)
    # (in Giraffe.g)
    def comma!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )

      type = COMMA
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 341:9: ','
      match( 0x2c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )

    end

    # lexer rule dot! (DOT)
    # (in Giraffe.g)
    def dot!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )

      type = DOT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 342:7: '.'
      match( 0x2e )

      
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
      # at line 343:9: ':'
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
      # at line 345:4: ';'
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
      # at line 346:10: '='
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
      # at line 347:8: '+'
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
      # at line 348:9: '-'
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
      # at line 349:7: '*'
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
      # at line 350:7: '/'
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
      # at line 351:7: '%'
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
      # at line 353:6: '=='
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
      # at line 354:6: '!='
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
      # at line 355:6: '<'
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
      # at line 356:6: '>'
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
      # at line 357:6: '<='
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
      # at line 358:6: '>='
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
      # at line 360:7: '&&'
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
      # at line 361:6: '||'
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
      # at line 362:7: '!'
      match( 0x21 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 51 )

    end

    # lexer rule qm! (QM)
    # (in Giraffe.g)
    def qm!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 52 )

      type = QM
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 364:6: '?'
      match( 0x3f )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 52 )

    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    # 
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( T__52 | T__53 | T__54 | T__55 | READ | PRINT | PRINTL | PRINTLN | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | RETURN | EXIT | BREAK | CONTINUE | ID | INT | COMMENT | WS | LB | RB | LCB | RCB | QUOTE | COMMA | DOT | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT | QM )
      alt_13 = 50
      alt_13 = @dfa13.predict( @input )
      case alt_13
      when 1
        # at line 1:10: T__52
        t__52!

      when 2
        # at line 1:16: T__53
        t__53!

      when 3
        # at line 1:22: T__54
        t__54!

      when 4
        # at line 1:28: T__55
        t__55!

      when 5
        # at line 1:34: READ
        read!

      when 6
        # at line 1:39: PRINT
        print!

      when 7
        # at line 1:45: PRINTL
        printl!

      when 8
        # at line 1:52: PRINTLN
        println!

      when 9
        # at line 1:60: TRUE
        true!

      when 10
        # at line 1:65: FALSE
        false!

      when 11
        # at line 1:71: FOR
        for!

      when 12
        # at line 1:75: IF
        if!

      when 13
        # at line 1:78: ELSE
        else!

      when 14
        # at line 1:83: ELIF
        elif!

      when 15
        # at line 1:88: ELSEIF
        elseif!

      when 16
        # at line 1:95: WHILE
        while!

      when 17
        # at line 1:101: DO
        do!

      when 18
        # at line 1:104: RETURN
        return!

      when 19
        # at line 1:111: EXIT
        exit!

      when 20
        # at line 1:116: BREAK
        break!

      when 21
        # at line 1:122: CONTINUE
        continue!

      when 22
        # at line 1:131: ID
        id!

      when 23
        # at line 1:134: INT
        int!

      when 24
        # at line 1:138: COMMENT
        comment!

      when 25
        # at line 1:146: WS
        ws!

      when 26
        # at line 1:149: LB
        lb!

      when 27
        # at line 1:152: RB
        rb!

      when 28
        # at line 1:155: LCB
        lcb!

      when 29
        # at line 1:159: RCB
        rcb!

      when 30
        # at line 1:163: QUOTE
        quote!

      when 31
        # at line 1:169: COMMA
        comma!

      when 32
        # at line 1:175: DOT
        dot!

      when 33
        # at line 1:179: COLON
        colon!

      when 34
        # at line 1:185: SEMICOLON
        semicolon!

      when 35
        # at line 1:195: ASSIGN
        assign!

      when 36
        # at line 1:202: PLUS
        plus!

      when 37
        # at line 1:207: MINUS
        minus!

      when 38
        # at line 1:213: MUL
        mul!

      when 39
        # at line 1:217: DIV
        div!

      when 40
        # at line 1:221: MOD
        mod!

      when 41
        # at line 1:225: EQ
        eq!

      when 42
        # at line 1:228: NE
        ne!

      when 43
        # at line 1:231: LT
        lt!

      when 44
        # at line 1:234: GT
        gt!

      when 45
        # at line 1:237: LE
        le!

      when 46
        # at line 1:240: GE
        ge!

      when 47
        # at line 1:243: AND
        and!

      when 48
        # at line 1:247: OR
        or!

      when 49
        # at line 1:250: NOT
        not!

      when 50
        # at line 1:254: QM
        qm!

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
          315:1: fragment FLOAT : ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT );
        __dfa_description__
      end
    end
    class DFA13 < ANTLR3::DFA
      EOT = unpack( 5, -1, 10, 15, 13, -1, 1, 55, 5, -1, 1, 57, 1, 59, 1, 
                    61, 5, -1, 5, 15, 1, 68, 3, 15, 1, 73, 2, 15, 8, -1, 
                    5, 15, 1, 81, 1, -1, 4, 15, 1, -1, 2, 15, 1, 88, 2, 
                    15, 1, 91, 1, 15, 1, -1, 1, 94, 1, 95, 1, 96, 3, 15, 
                    1, -1, 1, 15, 1, 102, 1, -1, 1, 103, 1, 15, 3, -1, 1, 
                    105, 1, 106, 1, 15, 1, 108, 1, 110, 2, -1, 1, 111, 2, 
                    -1, 1, 15, 1, -1, 1, 113, 2, -1, 1, 15, 1, -1, 1, 115, 
                    1, -1 )
      EOF = unpack( 116, -1 )
      MIN = unpack( 1, 9, 4, -1, 1, 101, 2, 114, 1, 97, 1, 102, 1, 108, 
                    1, 104, 1, 111, 1, 114, 1, 111, 13, -1, 1, 61, 5, -1, 
                    3, 61, 5, -1, 1, 97, 1, 105, 1, 117, 1, 108, 1, 114, 
                    1, 48, 3, 105, 1, 48, 1, 101, 1, 110, 8, -1, 1, 100, 
                    1, 117, 1, 110, 1, 101, 1, 115, 1, 48, 1, -1, 1, 101, 
                    1, 102, 1, 116, 1, 108, 1, -1, 1, 97, 1, 116, 1, 48, 
                    1, 114, 1, 116, 1, 48, 1, 101, 1, -1, 3, 48, 1, 101, 
                    1, 107, 1, 105, 1, -1, 1, 110, 1, 48, 1, -1, 1, 48, 
                    1, 102, 3, -1, 2, 48, 1, 110, 2, 48, 2, -1, 1, 48, 2, 
                    -1, 1, 117, 1, -1, 1, 48, 2, -1, 1, 101, 1, -1, 1, 48, 
                    1, -1 )
      MAX = unpack( 1, 125, 4, -1, 1, 101, 2, 114, 1, 111, 1, 102, 1, 120, 
                    1, 104, 1, 111, 1, 114, 1, 111, 13, -1, 1, 61, 5, -1, 
                    3, 61, 5, -1, 1, 116, 1, 105, 1, 117, 1, 108, 1, 114, 
                    1, 122, 1, 115, 2, 105, 1, 122, 1, 101, 1, 110, 8, -1, 
                    1, 100, 1, 117, 1, 110, 1, 101, 1, 115, 1, 122, 1, -1, 
                    1, 101, 1, 102, 1, 116, 1, 108, 1, -1, 1, 97, 1, 116, 
                    1, 122, 1, 114, 1, 116, 1, 122, 1, 101, 1, -1, 3, 122, 
                    1, 101, 1, 107, 1, 105, 1, -1, 1, 110, 1, 122, 1, -1, 
                    1, 122, 1, 102, 3, -1, 2, 122, 1, 110, 2, 122, 2, -1, 
                    1, 122, 2, -1, 1, 117, 1, -1, 1, 122, 2, -1, 1, 101, 
                    1, -1, 1, 122, 1, -1 )
      ACCEPT = unpack( 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 10, -1, 1, 22, 1, 
                       23, 1, 24, 1, 25, 1, 26, 1, 27, 1, 28, 1, 29, 1, 
                       30, 1, 31, 1, 32, 1, 33, 1, 34, 1, -1, 1, 36, 1, 
                       37, 1, 38, 1, 39, 1, 40, 3, -1, 1, 47, 1, 48, 1, 
                       50, 1, 1, 1, 2, 12, -1, 1, 41, 1, 35, 1, 42, 1, 49, 
                       1, 45, 1, 43, 1, 46, 1, 44, 6, -1, 1, 12, 4, -1, 
                       1, 17, 7, -1, 1, 11, 6, -1, 1, 5, 2, -1, 1, 9, 2, 
                       -1, 1, 13, 1, 14, 1, 19, 5, -1, 1, 6, 1, 10, 1, -1, 
                       1, 16, 1, 20, 1, -1, 1, 18, 1, -1, 1, 7, 1, 15, 1, 
                       -1, 1, 8, 1, -1, 1, 21 )
      SPECIAL = unpack( 116, -1 )
      TRANSITION = [
        unpack( 1, 18, 1, 2, 2, -1, 1, 1, 18, -1, 1, 18, 1, 34, 1, 23, 1, 
                17, 1, -1, 1, 33, 1, 37, 1, -1, 1, 19, 1, 20, 1, 31, 1, 
                29, 1, 24, 1, 30, 1, 25, 1, 32, 10, 16, 1, 26, 1, 27, 1, 
                35, 1, 28, 1, 36, 1, 39, 1, -1, 26, 15, 1, 3, 1, -1, 1, 
                4, 1, -1, 1, 15, 1, -1, 1, 15, 1, 13, 1, 14, 1, 12, 1, 10, 
                1, 8, 2, 15, 1, 9, 6, 15, 1, 6, 1, 15, 1, 5, 1, 15, 1, 7, 
                2, 15, 1, 11, 3, 15, 1, 21, 1, 38, 1, 22 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 42 ),
        unpack( 1, 43 ),
        unpack( 1, 44 ),
        unpack( 1, 45, 13, -1, 1, 46 ),
        unpack( 1, 47 ),
        unpack( 1, 48, 11, -1, 1, 49 ),
        unpack( 1, 50 ),
        unpack( 1, 51 ),
        unpack( 1, 52 ),
        unpack( 1, 53 ),
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
        unpack( 1, 54 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 56 ),
        unpack( 1, 58 ),
        unpack( 1, 60 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 62, 18, -1, 1, 63 ),
        unpack( 1, 64 ),
        unpack( 1, 65 ),
        unpack( 1, 66 ),
        unpack( 1, 67 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 1, 70, 9, -1, 1, 69 ),
        unpack( 1, 71 ),
        unpack( 1, 72 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 1, 74 ),
        unpack( 1, 75 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 76 ),
        unpack( 1, 77 ),
        unpack( 1, 78 ),
        unpack( 1, 79 ),
        unpack( 1, 80 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack(  ),
        unpack( 1, 82 ),
        unpack( 1, 83 ),
        unpack( 1, 84 ),
        unpack( 1, 85 ),
        unpack(  ),
        unpack( 1, 86 ),
        unpack( 1, 87 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 1, 89 ),
        unpack( 1, 90 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 1, 92 ),
        unpack(  ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 8, 15, 1, 93, 
                 17, 15 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 1, 97 ),
        unpack( 1, 98 ),
        unpack( 1, 99 ),
        unpack(  ),
        unpack( 1, 100 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 11, 15, 1, 
                 101, 14, 15 ),
        unpack(  ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 1, 104 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 1, 107 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 13, 15, 1, 
                 109, 12, 15 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 112 ),
        unpack(  ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 114 ),
        unpack(  ),
        unpack( 10, 15, 7, -1, 26, 15, 4, -1, 1, 15, 1, -1, 26, 15 ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 13
      

      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( T__52 | T__53 | T__54 | T__55 | READ | PRINT | PRINTL | PRINTLN | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | RETURN | EXIT | BREAK | CONTINUE | ID | INT | COMMENT | WS | LB | RB | LCB | RCB | QUOTE | COMMA | DOT | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT | QM );
        __dfa_description__
      end
    end

    
    private
    
    def initialize_dfas
      super rescue nil
      @dfa9 = DFA9.new( self, 9 )
      @dfa13 = DFA13.new( self, 13 )

    end
  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0
end


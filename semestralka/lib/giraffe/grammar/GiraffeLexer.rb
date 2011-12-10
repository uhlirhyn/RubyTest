#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-12-10 23:11:34
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
    define_tokens( :EXPONENT => 49, :MAIN => 27, :LT => 36, :WHILE => 23, 
                   :RB => 11, :MOD => 42, :FOR => 25, :DO => 24, :FLOAT => 50, 
                   :NOT => 33, :AND => 32, :ID => 26, :RCB => 19, :EOF => -1, 
                   :BREAK => 7, :IF => 17, :T__55 => 55, :T__56 => 56, :QUOTE => 52, 
                   :T__57 => 57, :T__58 => 58, :CONTINUE => 48, :QM => 54, 
                   :COMMA => 16, :LCB => 18, :ATYPE => 29, :PRINTLN => 47, 
                   :RETURN => 8, :PLUS => 12, :EQ => 34, :COMMENT => 4, 
                   :DOT => 30, :NE => 35, :EXIT => 9, :GE => 39, :ELSE => 20, 
                   :INT => 14, :SEMICOLON => 5, :MINUS => 13, :TRUE => 44, 
                   :MUL => 40, :PRINT => 15, :ELSEIF => 21, :PRINTL => 46, 
                   :COLON => 53, :ELIF => 22, :WS => 51, :ITYPE => 28, :READ => 6, 
                   :OR => 31, :ASSIGN => 43, :GT => 37, :LB => 10, :DIV => 41, 
                   :FALSE => 45, :LE => 38 )
    
  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = Giraffe
    include TokenData

    
    begin
      generated_using( "Giraffe.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end
    
    RULE_NAMES   = [ "T__55", "T__56", "T__57", "T__58", "ITYPE", "ATYPE", 
                     "MAIN", "READ", "PRINT", "PRINTL", "PRINTLN", "TRUE", 
                     "FALSE", "FOR", "IF", "ELSE", "ELIF", "ELSEIF", "WHILE", 
                     "DO", "RETURN", "EXIT", "BREAK", "CONTINUE", "ID", 
                     "INT", "FLOAT", "COMMENT", "WS", "EXPONENT", "LB", 
                     "RB", "LCB", "RCB", "QUOTE", "COMMA", "DOT", "COLON", 
                     "SEMICOLON", "ASSIGN", "PLUS", "MINUS", "MUL", "DIV", 
                     "MOD", "EQ", "NE", "LT", "GT", "LE", "GE", "AND", "OR", 
                     "NOT", "QM" ].freeze
    RULE_METHODS = [ :t__55!, :t__56!, :t__57!, :t__58!, :itype!, :atype!, 
                     :main!, :read!, :print!, :printl!, :println!, :true!, 
                     :false!, :for!, :if!, :else!, :elif!, :elseif!, :while!, 
                     :do!, :return!, :exit!, :break!, :continue!, :id!, 
                     :int!, :float!, :comment!, :ws!, :exponent!, :lb!, 
                     :rb!, :lcb!, :rcb!, :quote!, :comma!, :dot!, :colon!, 
                     :semicolon!, :assign!, :plus!, :minus!, :mul!, :div!, 
                     :mod!, :eq!, :ne!, :lt!, :gt!, :le!, :ge!, :and!, :or!, 
                     :not!, :qm! ].freeze

    
    def initialize( input=nil, options = {} )
      super( input, options )

    end
    
    
    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule t__55! (T__55)
    # (in Giraffe.g)
    def t__55!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      type = T__55
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

    # lexer rule t__56! (T__56)
    # (in Giraffe.g)
    def t__56!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      type = T__56
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

    # lexer rule t__57! (T__57)
    # (in Giraffe.g)
    def t__57!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      type = T__57
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

    # lexer rule t__58! (T__58)
    # (in Giraffe.g)
    def t__58!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      type = T__58
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

    # lexer rule itype! (ITYPE)
    # (in Giraffe.g)
    def itype!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )

      type = ITYPE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 297:9: 'int'
      match( "int" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )

    end

    # lexer rule atype! (ATYPE)
    # (in Giraffe.g)
    def atype!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )

      type = ATYPE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 298:9: 'arr'
      match( "arr" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )

    end

    # lexer rule main! (MAIN)
    # (in Giraffe.g)
    def main!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )

      type = MAIN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 300:8: 'main'
      match( "main" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )

    end

    # lexer rule read! (READ)
    # (in Giraffe.g)
    def read!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )

      type = READ
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 301:8: 'read'
      match( "read" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )

    end

    # lexer rule print! (PRINT)
    # (in Giraffe.g)
    def print!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )

      type = PRINT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 302:9: 'print'
      match( "print" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )

    end

    # lexer rule printl! (PRINTL)
    # (in Giraffe.g)
    def printl!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )

      type = PRINTL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 303:10: 'printl'
      match( "printl" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )

    end

    # lexer rule println! (PRINTLN)
    # (in Giraffe.g)
    def println!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )

      type = PRINTLN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 304:11: 'println'
      match( "println" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )

    end

    # lexer rule true! (TRUE)
    # (in Giraffe.g)
    def true!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )

      type = TRUE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 305:8: 'true'
      match( "true" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )

    end

    # lexer rule false! (FALSE)
    # (in Giraffe.g)
    def false!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      type = FALSE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 306:9: 'false'
      match( "false" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )

    end

    # lexer rule for! (FOR)
    # (in Giraffe.g)
    def for!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )

      type = FOR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 307:7: 'for'
      match( "for" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )

    end

    # lexer rule if! (IF)
    # (in Giraffe.g)
    def if!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      type = IF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 308:6: 'if'
      match( "if" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )

    end

    # lexer rule else! (ELSE)
    # (in Giraffe.g)
    def else!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      type = ELSE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 309:8: 'else'
      match( "else" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )

    end

    # lexer rule elif! (ELIF)
    # (in Giraffe.g)
    def elif!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )

      type = ELIF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 310:8: 'elif'
      match( "elif" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )

    end

    # lexer rule elseif! (ELSEIF)
    # (in Giraffe.g)
    def elseif!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )

      type = ELSEIF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 311:10: 'elseif'
      match( "elseif" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )

    end

    # lexer rule while! (WHILE)
    # (in Giraffe.g)
    def while!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )

      type = WHILE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 312:9: 'while'
      match( "while" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 19 )

    end

    # lexer rule do! (DO)
    # (in Giraffe.g)
    def do!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )

      type = DO
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 313:6: 'do'
      match( "do" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 20 )

    end

    # lexer rule return! (RETURN)
    # (in Giraffe.g)
    def return!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )

      type = RETURN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 314:10: 'return'
      match( "return" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 21 )

    end

    # lexer rule exit! (EXIT)
    # (in Giraffe.g)
    def exit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )

      type = EXIT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 315:8: 'exit'
      match( "exit" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 22 )

    end

    # lexer rule break! (BREAK)
    # (in Giraffe.g)
    def break!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )

      type = BREAK
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 316:9: 'break'
      match( "break" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 23 )

    end

    # lexer rule continue! (CONTINUE)
    # (in Giraffe.g)
    def continue!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )

      type = CONTINUE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 317:11: 'continue'
      match( "continue" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 24 )

    end

    # lexer rule id! (ID)
    # (in Giraffe.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )

      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 320:7: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 320:31: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
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
      # trace_out( __method__, 25 )

    end

    # lexer rule int! (INT)
    # (in Giraffe.g)
    def int!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )

      type = INT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 323:7: ( '0' .. '9' )+
      # at file 323:7: ( '0' .. '9' )+
      match_count_2 = 0
      while true
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0.between?( 0x30, 0x39 ) )
          alt_2 = 1

        end
        case alt_2
        when 1
          # at line 323:7: '0' .. '9'
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
      # trace_out( __method__, 26 )

    end

    # lexer rule float! (FLOAT)
    # (in Giraffe.g)
    def float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )

      
      # - - - - main rule block - - - -
      # at line 328:5: ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT )
      alt_9 = 3
      alt_9 = @dfa9.predict( @input )
      case alt_9
      when 1
        # at line 328:9: ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )?
        # at file 328:9: ( '0' .. '9' )+
        match_count_3 = 0
        while true
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0.between?( 0x30, 0x39 ) )
            alt_3 = 1

          end
          case alt_3
          when 1
            # at line 328:10: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_3 > 0 and break
            eee = EarlyExit(3)


            raise eee
          end
          match_count_3 += 1
        end

        match( 0x2e )
        # at line 328:25: ( '0' .. '9' )*
        while true # decision 4
          alt_4 = 2
          look_4_0 = @input.peek( 1 )

          if ( look_4_0.between?( 0x30, 0x39 ) )
            alt_4 = 1

          end
          case alt_4
          when 1
            # at line 328:26: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            break # out of loop for decision 4
          end
        end # loop for decision 4
        # at line 328:37: ( EXPONENT )?
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == 0x45 || look_5_0 == 0x65 )
          alt_5 = 1
        end
        case alt_5
        when 1
          # at line 328:37: EXPONENT
          exponent!

        end

      when 2
        # at line 329:9: '.' ( '0' .. '9' )+ ( EXPONENT )?
        match( 0x2e )
        # at file 329:13: ( '0' .. '9' )+
        match_count_6 = 0
        while true
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0.between?( 0x30, 0x39 ) )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 329:14: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_6 > 0 and break
            eee = EarlyExit(6)


            raise eee
          end
          match_count_6 += 1
        end

        # at line 329:25: ( EXPONENT )?
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == 0x45 || look_7_0 == 0x65 )
          alt_7 = 1
        end
        case alt_7
        when 1
          # at line 329:25: EXPONENT
          exponent!

        end

      when 3
        # at line 330:9: ( '0' .. '9' )+ EXPONENT
        # at file 330:9: ( '0' .. '9' )+
        match_count_8 = 0
        while true
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0.between?( 0x30, 0x39 ) )
            alt_8 = 1

          end
          case alt_8
          when 1
            # at line 330:10: '0' .. '9'
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
      # trace_out( __method__, 27 )

    end

    # lexer rule comment! (COMMENT)
    # (in Giraffe.g)
    def comment!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )

      type = COMMENT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 334:9: '#' (~ ( '\\n' | '\\r' ) )*
      match( 0x23 )
      # at line 334:13: (~ ( '\\n' | '\\r' ) )*
      while true # decision 10
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0.between?( 0x0, 0x9 ) || look_10_0.between?( 0xb, 0xc ) || look_10_0.between?( 0xe, 0xffff ) )
          alt_10 = 1

        end
        case alt_10
        when 1
          # at line 334:13: ~ ( '\\n' | '\\r' )
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
      # trace_out( __method__, 28 )

    end

    # lexer rule ws! (WS)
    # (in Giraffe.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )

      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 337:9: ( ' ' | '\\t' | '\\r' | '\\n' )
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
      # trace_out( __method__, 29 )

    end

    # lexer rule exponent! (EXPONENT)
    # (in Giraffe.g)
    def exponent!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )

      
      # - - - - main rule block - - - -
      # at line 345:12: ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+
      if @input.peek(1) == 0x45 || @input.peek(1) == 0x65
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 345:22: ( '+' | '-' )?
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
      # at file 345:33: ( '0' .. '9' )+
      match_count_12 = 0
      while true
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0.between?( 0x30, 0x39 ) )
          alt_12 = 1

        end
        case alt_12
        when 1
          # at line 345:34: '0' .. '9'
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
      # trace_out( __method__, 30 )

    end

    # lexer rule lb! (LB)
    # (in Giraffe.g)
    def lb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )

      type = LB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 347:6: '('
      match( 0x28 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 31 )

    end

    # lexer rule rb! (RB)
    # (in Giraffe.g)
    def rb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )

      type = RB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 348:6: ')'
      match( 0x29 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )

    end

    # lexer rule lcb! (LCB)
    # (in Giraffe.g)
    def lcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )

      type = LCB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 349:7: '{'
      match( 0x7b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )

    end

    # lexer rule rcb! (RCB)
    # (in Giraffe.g)
    def rcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )

      type = RCB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 350:7: '}'
      match( 0x7d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 34 )

    end

    # lexer rule quote! (QUOTE)
    # (in Giraffe.g)
    def quote!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )

      type = QUOTE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 351:9: '\"'
      match( 0x22 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 35 )

    end

    # lexer rule comma! (COMMA)
    # (in Giraffe.g)
    def comma!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )

      type = COMMA
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 352:9: ','
      match( 0x2c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 36 )

    end

    # lexer rule dot! (DOT)
    # (in Giraffe.g)
    def dot!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )

      type = DOT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 353:7: '.'
      match( 0x2e )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 37 )

    end

    # lexer rule colon! (COLON)
    # (in Giraffe.g)
    def colon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )

      type = COLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 354:9: ':'
      match( 0x3a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 38 )

    end

    # lexer rule semicolon! (SEMICOLON)
    # (in Giraffe.g)
    def semicolon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )

      type = SEMICOLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 356:4: ';'
      match( 0x3b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 39 )

    end

    # lexer rule assign! (ASSIGN)
    # (in Giraffe.g)
    def assign!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )

      type = ASSIGN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 357:10: '='
      match( 0x3d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 40 )

    end

    # lexer rule plus! (PLUS)
    # (in Giraffe.g)
    def plus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )

      type = PLUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 358:8: '+'
      match( 0x2b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 41 )

    end

    # lexer rule minus! (MINUS)
    # (in Giraffe.g)
    def minus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )

      type = MINUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 359:9: '-'
      match( 0x2d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 42 )

    end

    # lexer rule mul! (MUL)
    # (in Giraffe.g)
    def mul!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )

      type = MUL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 360:7: '*'
      match( 0x2a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 43 )

    end

    # lexer rule div! (DIV)
    # (in Giraffe.g)
    def div!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )

      type = DIV
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 361:7: '/'
      match( 0x2f )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 44 )

    end

    # lexer rule mod! (MOD)
    # (in Giraffe.g)
    def mod!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )

      type = MOD
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 362:7: '%'
      match( 0x25 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 45 )

    end

    # lexer rule eq! (EQ)
    # (in Giraffe.g)
    def eq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )

      type = EQ
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 364:6: '=='
      match( "==" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 46 )

    end

    # lexer rule ne! (NE)
    # (in Giraffe.g)
    def ne!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )

      type = NE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 365:6: '!='
      match( "!=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 47 )

    end

    # lexer rule lt! (LT)
    # (in Giraffe.g)
    def lt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )

      type = LT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 366:6: '<'
      match( 0x3c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 48 )

    end

    # lexer rule gt! (GT)
    # (in Giraffe.g)
    def gt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )

      type = GT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 367:6: '>'
      match( 0x3e )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 49 )

    end

    # lexer rule le! (LE)
    # (in Giraffe.g)
    def le!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )

      type = LE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 368:6: '<='
      match( "<=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 50 )

    end

    # lexer rule ge! (GE)
    # (in Giraffe.g)
    def ge!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )

      type = GE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 369:6: '>='
      match( ">=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 51 )

    end

    # lexer rule and! (AND)
    # (in Giraffe.g)
    def and!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 52 )

      type = AND
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 371:7: '&&'
      match( "&&" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 52 )

    end

    # lexer rule or! (OR)
    # (in Giraffe.g)
    def or!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )

      type = OR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 372:6: '||'
      match( "||" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 53 )

    end

    # lexer rule not! (NOT)
    # (in Giraffe.g)
    def not!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )

      type = NOT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 373:7: '!'
      match( 0x21 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 54 )

    end

    # lexer rule qm! (QM)
    # (in Giraffe.g)
    def qm!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )

      type = QM
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 375:6: '?'
      match( 0x3f )

      
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
      # at line 1:8: ( T__55 | T__56 | T__57 | T__58 | ITYPE | ATYPE | MAIN | READ | PRINT | PRINTL | PRINTLN | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | RETURN | EXIT | BREAK | CONTINUE | ID | INT | COMMENT | WS | LB | RB | LCB | RCB | QUOTE | COMMA | DOT | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT | QM )
      alt_13 = 53
      alt_13 = @dfa13.predict( @input )
      case alt_13
      when 1
        # at line 1:10: T__55
        t__55!

      when 2
        # at line 1:16: T__56
        t__56!

      when 3
        # at line 1:22: T__57
        t__57!

      when 4
        # at line 1:28: T__58
        t__58!

      when 5
        # at line 1:34: ITYPE
        itype!

      when 6
        # at line 1:40: ATYPE
        atype!

      when 7
        # at line 1:46: MAIN
        main!

      when 8
        # at line 1:51: READ
        read!

      when 9
        # at line 1:56: PRINT
        print!

      when 10
        # at line 1:62: PRINTL
        printl!

      when 11
        # at line 1:69: PRINTLN
        println!

      when 12
        # at line 1:77: TRUE
        true!

      when 13
        # at line 1:82: FALSE
        false!

      when 14
        # at line 1:88: FOR
        for!

      when 15
        # at line 1:92: IF
        if!

      when 16
        # at line 1:95: ELSE
        else!

      when 17
        # at line 1:100: ELIF
        elif!

      when 18
        # at line 1:105: ELSEIF
        elseif!

      when 19
        # at line 1:112: WHILE
        while!

      when 20
        # at line 1:118: DO
        do!

      when 21
        # at line 1:121: RETURN
        return!

      when 22
        # at line 1:128: EXIT
        exit!

      when 23
        # at line 1:133: BREAK
        break!

      when 24
        # at line 1:139: CONTINUE
        continue!

      when 25
        # at line 1:148: ID
        id!

      when 26
        # at line 1:151: INT
        int!

      when 27
        # at line 1:155: COMMENT
        comment!

      when 28
        # at line 1:163: WS
        ws!

      when 29
        # at line 1:166: LB
        lb!

      when 30
        # at line 1:169: RB
        rb!

      when 31
        # at line 1:172: LCB
        lcb!

      when 32
        # at line 1:176: RCB
        rcb!

      when 33
        # at line 1:180: QUOTE
        quote!

      when 34
        # at line 1:186: COMMA
        comma!

      when 35
        # at line 1:192: DOT
        dot!

      when 36
        # at line 1:196: COLON
        colon!

      when 37
        # at line 1:202: SEMICOLON
        semicolon!

      when 38
        # at line 1:212: ASSIGN
        assign!

      when 39
        # at line 1:219: PLUS
        plus!

      when 40
        # at line 1:224: MINUS
        minus!

      when 41
        # at line 1:230: MUL
        mul!

      when 42
        # at line 1:234: DIV
        div!

      when 43
        # at line 1:238: MOD
        mod!

      when 44
        # at line 1:242: EQ
        eq!

      when 45
        # at line 1:245: NE
        ne!

      when 46
        # at line 1:248: LT
        lt!

      when 47
        # at line 1:251: GT
        gt!

      when 48
        # at line 1:254: LE
        le!

      when 49
        # at line 1:257: GE
        ge!

      when 50
        # at line 1:260: AND
        and!

      when 51
        # at line 1:264: OR
        or!

      when 52
        # at line 1:267: NOT
        not!

      when 53
        # at line 1:271: QM
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
          326:1: fragment FLOAT : ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT );
        __dfa_description__
      end
    end
    class DFA13 < ANTLR3::DFA
      EOT = unpack( 5, -1, 12, 17, 13, -1, 1, 60, 5, -1, 1, 62, 1, 64, 1, 
                    66, 5, -1, 1, 17, 1, 68, 10, 17, 1, 81, 2, 17, 8, -1, 
                    1, 84, 1, -1, 1, 85, 6, 17, 1, 92, 4, 17, 1, -1, 2, 
                    17, 2, -1, 1, 99, 1, 100, 2, 17, 1, 103, 1, 17, 1, -1, 
                    1, 106, 1, 107, 1, 108, 3, 17, 2, -1, 1, 17, 1, 114, 
                    1, -1, 1, 115, 1, 17, 3, -1, 1, 117, 1, 118, 1, 17, 
                    1, 120, 1, 122, 2, -1, 1, 123, 2, -1, 1, 17, 1, -1, 
                    1, 125, 2, -1, 1, 17, 1, -1, 1, 127, 1, -1 )
      EOF = unpack( 128, -1 )
      MIN = unpack( 1, 9, 4, -1, 1, 102, 1, 114, 1, 97, 1, 101, 2, 114, 
                    1, 97, 1, 108, 1, 104, 1, 111, 1, 114, 1, 111, 13, -1, 
                    1, 61, 5, -1, 3, 61, 5, -1, 1, 116, 1, 48, 1, 114, 1, 
                    105, 1, 97, 1, 105, 1, 117, 1, 108, 1, 114, 3, 105, 
                    1, 48, 1, 101, 1, 110, 8, -1, 1, 48, 1, -1, 1, 48, 1, 
                    110, 1, 100, 1, 117, 1, 110, 1, 101, 1, 115, 1, 48, 
                    1, 101, 1, 102, 1, 116, 1, 108, 1, -1, 1, 97, 1, 116, 
                    2, -1, 2, 48, 1, 114, 1, 116, 1, 48, 1, 101, 1, -1, 
                    3, 48, 1, 101, 1, 107, 1, 105, 2, -1, 1, 110, 1, 48, 
                    1, -1, 1, 48, 1, 102, 3, -1, 2, 48, 1, 110, 2, 48, 2, 
                    -1, 1, 48, 2, -1, 1, 117, 1, -1, 1, 48, 2, -1, 1, 101, 
                    1, -1, 1, 48, 1, -1 )
      MAX = unpack( 1, 125, 4, -1, 1, 110, 1, 114, 1, 97, 1, 101, 2, 114, 
                    1, 111, 1, 120, 1, 104, 1, 111, 1, 114, 1, 111, 13, 
                    -1, 1, 61, 5, -1, 3, 61, 5, -1, 1, 116, 1, 122, 1, 114, 
                    1, 105, 1, 116, 1, 105, 1, 117, 1, 108, 1, 114, 1, 115, 
                    2, 105, 1, 122, 1, 101, 1, 110, 8, -1, 1, 122, 1, -1, 
                    1, 122, 1, 110, 1, 100, 1, 117, 1, 110, 1, 101, 1, 115, 
                    1, 122, 1, 101, 1, 102, 1, 116, 1, 108, 1, -1, 1, 97, 
                    1, 116, 2, -1, 2, 122, 1, 114, 1, 116, 1, 122, 1, 101, 
                    1, -1, 3, 122, 1, 101, 1, 107, 1, 105, 2, -1, 1, 110, 
                    1, 122, 1, -1, 1, 122, 1, 102, 3, -1, 2, 122, 1, 110, 
                    2, 122, 2, -1, 1, 122, 2, -1, 1, 117, 1, -1, 1, 122, 
                    2, -1, 1, 101, 1, -1, 1, 122, 1, -1 )
      ACCEPT = unpack( 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 12, -1, 1, 25, 1, 
                       26, 1, 27, 1, 28, 1, 29, 1, 30, 1, 31, 1, 32, 1, 
                       33, 1, 34, 1, 35, 1, 36, 1, 37, 1, -1, 1, 39, 1, 
                       40, 1, 41, 1, 42, 1, 43, 3, -1, 1, 50, 1, 51, 1, 
                       53, 1, 1, 1, 2, 15, -1, 1, 44, 1, 38, 1, 45, 1, 52, 
                       1, 48, 1, 46, 1, 49, 1, 47, 1, -1, 1, 15, 12, -1, 
                       1, 20, 2, -1, 1, 5, 1, 6, 6, -1, 1, 14, 6, -1, 1, 
                       7, 1, 8, 2, -1, 1, 12, 2, -1, 1, 16, 1, 17, 1, 22, 
                       5, -1, 1, 9, 1, 13, 1, -1, 1, 19, 1, 23, 1, -1, 1, 
                       21, 1, -1, 1, 10, 1, 18, 1, -1, 1, 11, 1, -1, 1, 
                       24 )
      SPECIAL = unpack( 128, -1 )
      TRANSITION = [
        unpack( 1, 20, 1, 2, 2, -1, 1, 1, 18, -1, 1, 20, 1, 36, 1, 25, 1, 
                19, 1, -1, 1, 35, 1, 39, 1, -1, 1, 21, 1, 22, 1, 33, 1, 
                31, 1, 26, 1, 32, 1, 27, 1, 34, 10, 18, 1, 28, 1, 29, 1, 
                37, 1, 30, 1, 38, 1, 41, 1, -1, 26, 17, 1, 3, 1, -1, 1, 
                4, 1, -1, 1, 17, 1, -1, 1, 6, 1, 15, 1, 16, 1, 14, 1, 12, 
                1, 11, 2, 17, 1, 5, 3, 17, 1, 7, 2, 17, 1, 9, 1, 17, 1, 
                8, 1, 17, 1, 10, 2, 17, 1, 13, 3, 17, 1, 23, 1, 40, 1, 24 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 45, 7, -1, 1, 44 ),
        unpack( 1, 46 ),
        unpack( 1, 47 ),
        unpack( 1, 48 ),
        unpack( 1, 49 ),
        unpack( 1, 50 ),
        unpack( 1, 51, 13, -1, 1, 52 ),
        unpack( 1, 53, 11, -1, 1, 54 ),
        unpack( 1, 55 ),
        unpack( 1, 56 ),
        unpack( 1, 57 ),
        unpack( 1, 58 ),
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
        unpack( 1, 59 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 61 ),
        unpack( 1, 63 ),
        unpack( 1, 65 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 67 ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 26, 17 ),
        unpack( 1, 69 ),
        unpack( 1, 70 ),
        unpack( 1, 71, 18, -1, 1, 72 ),
        unpack( 1, 73 ),
        unpack( 1, 74 ),
        unpack( 1, 75 ),
        unpack( 1, 76 ),
        unpack( 1, 78, 9, -1, 1, 77 ),
        unpack( 1, 79 ),
        unpack( 1, 80 ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 26, 17 ),
        unpack( 1, 82 ),
        unpack( 1, 83 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 26, 17 ),
        unpack(  ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 26, 17 ),
        unpack( 1, 86 ),
        unpack( 1, 87 ),
        unpack( 1, 88 ),
        unpack( 1, 89 ),
        unpack( 1, 90 ),
        unpack( 1, 91 ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 26, 17 ),
        unpack( 1, 93 ),
        unpack( 1, 94 ),
        unpack( 1, 95 ),
        unpack( 1, 96 ),
        unpack(  ),
        unpack( 1, 97 ),
        unpack( 1, 98 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 26, 17 ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 26, 17 ),
        unpack( 1, 101 ),
        unpack( 1, 102 ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 26, 17 ),
        unpack( 1, 104 ),
        unpack(  ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 8, 17, 1, 105, 
                 17, 17 ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 26, 17 ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 26, 17 ),
        unpack( 1, 109 ),
        unpack( 1, 110 ),
        unpack( 1, 111 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 112 ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 11, 17, 1, 
                 113, 14, 17 ),
        unpack(  ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 26, 17 ),
        unpack( 1, 116 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 26, 17 ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 26, 17 ),
        unpack( 1, 119 ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 26, 17 ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 13, 17, 1, 
                 121, 12, 17 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 26, 17 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 124 ),
        unpack(  ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 26, 17 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 126 ),
        unpack(  ),
        unpack( 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, -1, 26, 17 ),
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
          1:1: Tokens : ( T__55 | T__56 | T__57 | T__58 | ITYPE | ATYPE | MAIN | READ | PRINT | PRINTL | PRINTLN | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | RETURN | EXIT | BREAK | CONTINUE | ID | INT | COMMENT | WS | LB | RB | LCB | RCB | QUOTE | COMMA | DOT | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT | QM );
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


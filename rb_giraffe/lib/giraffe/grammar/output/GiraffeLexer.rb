#!/usr/bin/env ruby
#
# /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g
# --
# Generated using ANTLR version: 3.4
# Ruby runtime library version: 
# Input grammar file: /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g
# Generated at: 2011-11-13 13:55:05
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

  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = Giraffe
    include TokenData

    begin
      generated_using( "/home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g", "3.4", "" )
    rescue NoMethodError => error
      # ignore
    end

    RULE_NAMES   = [ "T__57", "T__58", "STRING", "TO_INT", "TO_FLOAT", "READ", 
                     "PRINT", "PRINTL", "PRINTLN", "TRUE", "FALSE", "FOR", 
                     "IF", "ELSE", "ELIF", "ELSEIF", "WHILE", "DO", "RETURN", 
                     "EXIT", "BREAK", "ID", "INT", "FLOAT", "COMMENT", "WS", 
                     "CHAR", "EXPONENT", "HEX_DIGIT", "ESC_SEQ", "OCTAL_ESC", 
                     "UNICODE_ESC", "QUOTE", "LB", "RB", "LCB", "RCB", "COMMA", 
                     "COLON", "SEMICOLON", "ASSIGN", "PLUS", "MINUS", "MUL", 
                     "DIV", "MOD", "EQ", "NE", "LT", "GT", "LE", "GE", "AND", 
                     "OR", "NOT" ].freeze
    RULE_METHODS = [ :t__57!, :t__58!, :string!, :to_int!, :to_float!, :read!, 
                     :print!, :printl!, :println!, :true!, :false!, :for!, 
                     :if!, :else!, :elif!, :elseif!, :while!, :do!, :return!, 
                     :exit!, :break!, :id!, :int!, :float!, :comment!, :ws!, 
                     :char!, :exponent!, :hex_digit!, :esc_seq!, :octal_esc!, 
                     :unicode_esc!, :quote!, :lb!, :rb!, :lcb!, :rcb!, :comma!, 
                     :colon!, :semicolon!, :assign!, :plus!, :minus!, :mul!, 
                     :div!, :mod!, :eq!, :ne!, :lt!, :gt!, :le!, :ge!, :and!, 
                     :or!, :not! ].freeze

    def initialize( input=nil, options = {} )
      super( input, options )
    end


    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule t__57! (T__57)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def t__57!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )



      type = T__57
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 7:9: '\\n'
      match( 0xa )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 1 )


    end

    # lexer rule t__58! (T__58)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def t__58!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )



      type = T__58
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 8:9: '\\r'
      match( 0xd )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 2 )


    end

    # lexer rule string! (STRING)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def string!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 245:8: ( ESC_SEQ |~ ( '\\\\' | '\"' ) )*
      # at line 245:8: ( ESC_SEQ |~ ( '\\\\' | '\"' ) )*
      while true # decision 1
        alt_1 = 3
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == 0x5c )
          alt_1 = 1
        elsif ( look_1_0.between?( 0x0, 0x21 ) || look_1_0.between?( 0x23, 0x5b ) || look_1_0.between?( 0x5d, 0xffff ) )
          alt_1 = 2

        end
        case alt_1
        when 1
          # at line 245:10: ESC_SEQ
          esc_seq!


        when 2
          # at line 245:20: ~ ( '\\\\' | '\"' )
          if @input.peek( 1 ).between?( 0x0, 0x21 ) || @input.peek( 1 ).between?( 0x23, 0x5b ) || @input.peek( 1 ).between?( 0x5d, 0xff )
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


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )


    end

    # lexer rule to_int! (TO_INT)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def to_int!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )



      type = TO_INT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 247:10: 'int'
      match( "int" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )


    end

    # lexer rule to_float! (TO_FLOAT)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def to_float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )



      type = TO_FLOAT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 248:11: 'float'
      match( "float" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )


    end

    # lexer rule read! (READ)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def read!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )



      type = READ
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 249:8: 'read'
      match( "read" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )


    end

    # lexer rule print! (PRINT)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def print!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )



      type = PRINT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 250:9: 'print'
      match( "print" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )


    end

    # lexer rule printl! (PRINTL)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def printl!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )



      type = PRINTL
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 251:10: 'printl'
      match( "printl" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )


    end

    # lexer rule println! (PRINTLN)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def println!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )



      type = PRINTLN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 252:11: 'println'
      match( "println" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )


    end

    # lexer rule true! (TRUE)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def true!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )



      type = TRUE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 253:8: 'true'
      match( "true" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )


    end

    # lexer rule false! (FALSE)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def false!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )



      type = FALSE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 254:9: 'false'
      match( "false" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )


    end

    # lexer rule for! (FOR)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def for!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )



      type = FOR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 255:7: 'for'
      match( "for" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )


    end

    # lexer rule if! (IF)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def if!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )



      type = IF
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 256:6: 'if'
      match( "if" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )


    end

    # lexer rule else! (ELSE)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def else!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )



      type = ELSE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 257:8: 'else'
      match( "else" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )


    end

    # lexer rule elif! (ELIF)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def elif!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )



      type = ELIF
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 258:8: 'elif'
      match( "elif" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )


    end

    # lexer rule elseif! (ELSEIF)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def elseif!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )



      type = ELSEIF
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 259:10: 'elseif'
      match( "elseif" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )


    end

    # lexer rule while! (WHILE)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def while!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )



      type = WHILE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 260:9: 'while'
      match( "while" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )


    end

    # lexer rule do! (DO)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def do!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )



      type = DO
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 261:6: 'do'
      match( "do" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )


    end

    # lexer rule return! (RETURN)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def return!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )



      type = RETURN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 262:10: 'return'
      match( "return" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 19 )


    end

    # lexer rule exit! (EXIT)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def exit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )



      type = EXIT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 263:8: 'exit'
      match( "exit" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 20 )


    end

    # lexer rule break! (BREAK)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def break!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )



      type = BREAK
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 264:9: 'break'
      match( "break" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 21 )


    end

    # lexer rule id! (ID)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )



      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 266:7: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end


      # at line 266:31: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      while true # decision 2
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0.between?( 0x30, 0x39 ) || look_2_0.between?( 0x41, 0x5a ) || look_2_0 == 0x5f || look_2_0.between?( 0x61, 0x7a ) )
          alt_2 = 1

        end
        case alt_2
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
          break # out of loop for decision 2
        end
      end # loop for decision 2



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 22 )


    end

    # lexer rule int! (INT)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def int!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )



      type = INT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 269:7: ( '0' .. '9' )+
      # at file 269:7: ( '0' .. '9' )+
      match_count_3 = 0
      while true
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0.between?( 0x30, 0x39 ) )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x30, 0x39 )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          match_count_3 > 0 and break
          eee = EarlyExit(3)


          raise eee
        end
        match_count_3 += 1
      end




      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 23 )


    end

    # lexer rule float! (FLOAT)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 275:5: ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT )
      alt_10 = 3
      alt_10 = @dfa10.predict( @input )
      case alt_10
      when 1
        # at line 275:9: ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )?
        # at file 275:9: ( '0' .. '9' )+
        match_count_4 = 0
        while true
          alt_4 = 2
          look_4_0 = @input.peek( 1 )

          if ( look_4_0.between?( 0x30, 0x39 ) )
            alt_4 = 1

          end
          case alt_4
          when 1
            # at line 
            if @input.peek( 1 ).between?( 0x30, 0x39 )
              @input.consume
            else
              mse = MismatchedSet( nil )
              recover mse
              raise mse

            end



          else
            match_count_4 > 0 and break
            eee = EarlyExit(4)


            raise eee
          end
          match_count_4 += 1
        end


        match( 0x2e )
        # at line 275:25: ( '0' .. '9' )*
        while true # decision 5
          alt_5 = 2
          look_5_0 = @input.peek( 1 )

          if ( look_5_0.between?( 0x30, 0x39 ) )
            alt_5 = 1

          end
          case alt_5
          when 1
            # at line 
            if @input.peek( 1 ).between?( 0x30, 0x39 )
              @input.consume
            else
              mse = MismatchedSet( nil )
              recover mse
              raise mse

            end



          else
            break # out of loop for decision 5
          end
        end # loop for decision 5

        # at line 275:37: ( EXPONENT )?
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == 0x45 || look_6_0 == 0x65 )
          alt_6 = 1
        end
        case alt_6
        when 1
          # at line 275:37: EXPONENT
          exponent!


        end

      when 2
        # at line 276:9: '.' ( '0' .. '9' )+ ( EXPONENT )?
        match( 0x2e )
        # at file 276:13: ( '0' .. '9' )+
        match_count_7 = 0
        while true
          alt_7 = 2
          look_7_0 = @input.peek( 1 )

          if ( look_7_0.between?( 0x30, 0x39 ) )
            alt_7 = 1

          end
          case alt_7
          when 1
            # at line 
            if @input.peek( 1 ).between?( 0x30, 0x39 )
              @input.consume
            else
              mse = MismatchedSet( nil )
              recover mse
              raise mse

            end



          else
            match_count_7 > 0 and break
            eee = EarlyExit(7)


            raise eee
          end
          match_count_7 += 1
        end


        # at line 276:25: ( EXPONENT )?
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == 0x45 || look_8_0 == 0x65 )
          alt_8 = 1
        end
        case alt_8
        when 1
          # at line 276:25: EXPONENT
          exponent!


        end

      when 3
        # at line 277:9: ( '0' .. '9' )+ EXPONENT
        # at file 277:9: ( '0' .. '9' )+
        match_count_9 = 0
        while true
          alt_9 = 2
          look_9_0 = @input.peek( 1 )

          if ( look_9_0.between?( 0x30, 0x39 ) )
            alt_9 = 1

          end
          case alt_9
          when 1
            # at line 
            if @input.peek( 1 ).between?( 0x30, 0x39 )
              @input.consume
            else
              mse = MismatchedSet( nil )
              recover mse
              raise mse

            end



          else
            match_count_9 > 0 and break
            eee = EarlyExit(9)


            raise eee
          end
          match_count_9 += 1
        end



        exponent!


      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 24 )


    end

    # lexer rule comment! (COMMENT)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def comment!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )



      type = COMMENT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 280:9: '#' (~ ( '\\n' | '\\r' ) )*
      match( 0x23 )
      # at line 280:13: (~ ( '\\n' | '\\r' ) )*
      while true # decision 11
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0.between?( 0x0, 0x9 ) || look_11_0.between?( 0xb, 0xc ) || look_11_0.between?( 0xe, 0xffff ) )
          alt_11 = 1

        end
        case alt_11
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x0, 0x9 ) || @input.peek( 1 ).between?( 0xb, 0xc ) || @input.peek( 1 ).between?( 0xe, 0xffff )
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
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )



      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 283:9: ( ' ' | '\\t' | '\\r' | '\\n' )
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

    # lexer rule char! (CHAR)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def char!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )



      type = CHAR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 290:8: '\\'' ( ESC_SEQ |~ ( '\\'' | '\\\\' ) ) '\\''
      match( 0x27 )
      # at line 290:13: ( ESC_SEQ |~ ( '\\'' | '\\\\' ) )
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
        # at line 290:15: ESC_SEQ
        esc_seq!


      when 2
        # at line 290:25: ~ ( '\\'' | '\\\\' )
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
      # trace_out( __method__, 27 )


    end

    # lexer rule exponent! (EXPONENT)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def exponent!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 295:12: ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+
      if @input.peek(1) == 0x45 || @input.peek(1) == 0x65
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end


      # at line 295:22: ( '+' | '-' )?
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
      # at file 295:33: ( '0' .. '9' )+
      match_count_14 = 0
      while true
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0.between?( 0x30, 0x39 ) )
          alt_14 = 1

        end
        case alt_14
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x30, 0x39 )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          match_count_14 > 0 and break
          eee = EarlyExit(14)


          raise eee
        end
        match_count_14 += 1
      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 28 )


    end

    # lexer rule hex_digit! (HEX_DIGIT)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def hex_digit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 
      if @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x46 ) || @input.peek( 1 ).between?( 0x61, 0x66 )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 29 )


    end

    # lexer rule esc_seq! (ESC_SEQ)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def esc_seq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 302:5: ( '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' ) | UNICODE_ESC | OCTAL_ESC )
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
        # at line 302:9: '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' )
        match( 0x5c )
        if @input.peek(1) == 0x22 || @input.peek(1) == 0x27 || @input.peek(1) == 0x5c || @input.peek(1) == 0x62 || @input.peek(1) == 0x66 || @input.peek(1) == 0x6e || @input.peek(1) == 0x72 || @input.peek(1) == 0x74
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse

        end



      when 2
        # at line 303:9: UNICODE_ESC
        unicode_esc!


      when 3
        # at line 304:9: OCTAL_ESC
        octal_esc!


      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 30 )


    end

    # lexer rule octal_esc! (OCTAL_ESC)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def octal_esc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 309:5: ( '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) )
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
        # at line 309:9: '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        if @input.peek( 1 ).between?( 0x30, 0x33 )
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse

        end


        if @input.peek( 1 ).between?( 0x30, 0x37 )
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse

        end


        if @input.peek( 1 ).between?( 0x30, 0x37 )
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse

        end



      when 2
        # at line 310:9: '\\\\' ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        if @input.peek( 1 ).between?( 0x30, 0x37 )
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse

        end


        if @input.peek( 1 ).between?( 0x30, 0x37 )
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse

        end



      when 3
        # at line 311:9: '\\\\' ( '0' .. '7' )
        match( 0x5c )
        if @input.peek( 1 ).between?( 0x30, 0x37 )
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse

        end



      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 31 )


    end

    # lexer rule unicode_esc! (UNICODE_ESC)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def unicode_esc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 316:9: '\\\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
      match( 0x5c )
      match( 0x75 )

      hex_digit!


      hex_digit!


      hex_digit!


      hex_digit!


    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )


    end

    # lexer rule quote! (QUOTE)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def quote!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )



      type = QUOTE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 318:9: '\"'
      match( 0x22 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )


    end

    # lexer rule lb! (LB)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def lb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )



      type = LB
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 319:6: '('
      match( 0x28 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 34 )


    end

    # lexer rule rb! (RB)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def rb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )



      type = RB
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 320:6: ')'
      match( 0x29 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 35 )


    end

    # lexer rule lcb! (LCB)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def lcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )



      type = LCB
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 321:7: '{'
      match( 0x7b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 36 )


    end

    # lexer rule rcb! (RCB)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def rcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )



      type = RCB
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 322:7: '}'
      match( 0x7d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 37 )


    end

    # lexer rule comma! (COMMA)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def comma!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )



      type = COMMA
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 323:9: ','
      match( 0x2c )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 38 )


    end

    # lexer rule colon! (COLON)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def colon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )



      type = COLON
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 324:9: ':'
      match( 0x3a )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 39 )


    end

    # lexer rule semicolon! (SEMICOLON)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def semicolon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )



      type = SEMICOLON
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 326:4: ';'
      match( 0x3b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 40 )


    end

    # lexer rule assign! (ASSIGN)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def assign!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )



      type = ASSIGN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 327:10: '='
      match( 0x3d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 41 )


    end

    # lexer rule plus! (PLUS)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def plus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )



      type = PLUS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 328:8: '+'
      match( 0x2b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 42 )


    end

    # lexer rule minus! (MINUS)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def minus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )



      type = MINUS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 329:9: '-'
      match( 0x2d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 43 )


    end

    # lexer rule mul! (MUL)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def mul!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )



      type = MUL
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 330:7: '*'
      match( 0x2a )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 44 )


    end

    # lexer rule div! (DIV)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def div!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )



      type = DIV
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 331:7: '/'
      match( 0x2f )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 45 )


    end

    # lexer rule mod! (MOD)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def mod!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )



      type = MOD
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 332:7: '%'
      match( 0x25 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 46 )


    end

    # lexer rule eq! (EQ)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def eq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )



      type = EQ
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 334:6: '=='
      match( "==" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 47 )


    end

    # lexer rule ne! (NE)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def ne!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )



      type = NE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 335:6: '!='
      match( "!=" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 48 )


    end

    # lexer rule lt! (LT)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def lt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )



      type = LT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 336:6: '<'
      match( 0x3c )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 49 )


    end

    # lexer rule gt! (GT)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def gt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )



      type = GT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 337:6: '>'
      match( 0x3e )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 50 )


    end

    # lexer rule le! (LE)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def le!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )



      type = LE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 338:6: '<='
      match( "<=" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 51 )


    end

    # lexer rule ge! (GE)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def ge!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 52 )



      type = GE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 339:6: '>='
      match( ">=" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 52 )


    end

    # lexer rule and! (AND)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def and!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )



      type = AND
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 341:7: '&&'
      match( "&&" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 53 )


    end

    # lexer rule or! (OR)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def or!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )



      type = OR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 342:6: '||'
      match( "||" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 54 )


    end

    # lexer rule not! (NOT)
    # (in /home/gatt/fit/RUB/semestralka/lib/giraffe/grammar/Giraffe.g)
    def not!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )



      type = NOT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 343:7: '!'
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
      # at line 1:8: ( T__57 | T__58 | TO_INT | TO_FLOAT | READ | PRINT | PRINTL | PRINTLN | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | RETURN | EXIT | BREAK | ID | INT | COMMENT | WS | CHAR | QUOTE | LB | RB | LCB | RCB | COMMA | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT )
      alt_17 = 48
      alt_17 = @dfa17.predict( @input )
      case alt_17
      when 1
        # at line 1:10: T__57
        t__57!


      when 2
        # at line 1:16: T__58
        t__58!


      when 3
        # at line 1:22: TO_INT
        to_int!


      when 4
        # at line 1:29: TO_FLOAT
        to_float!


      when 5
        # at line 1:38: READ
        read!


      when 6
        # at line 1:43: PRINT
        print!


      when 7
        # at line 1:49: PRINTL
        printl!


      when 8
        # at line 1:56: PRINTLN
        println!


      when 9
        # at line 1:64: TRUE
        true!


      when 10
        # at line 1:69: FALSE
        false!


      when 11
        # at line 1:75: FOR
        for!


      when 12
        # at line 1:79: IF
        if!


      when 13
        # at line 1:82: ELSE
        else!


      when 14
        # at line 1:87: ELIF
        elif!


      when 15
        # at line 1:92: ELSEIF
        elseif!


      when 16
        # at line 1:99: WHILE
        while!


      when 17
        # at line 1:105: DO
        do!


      when 18
        # at line 1:108: RETURN
        return!


      when 19
        # at line 1:115: EXIT
        exit!


      when 20
        # at line 1:120: BREAK
        break!


      when 21
        # at line 1:126: ID
        id!


      when 22
        # at line 1:129: INT
        int!


      when 23
        # at line 1:133: COMMENT
        comment!


      when 24
        # at line 1:141: WS
        ws!


      when 25
        # at line 1:144: CHAR
        char!


      when 26
        # at line 1:149: QUOTE
        quote!


      when 27
        # at line 1:155: LB
        lb!


      when 28
        # at line 1:158: RB
        rb!


      when 29
        # at line 1:161: LCB
        lcb!


      when 30
        # at line 1:165: RCB
        rcb!


      when 31
        # at line 1:169: COMMA
        comma!


      when 32
        # at line 1:175: COLON
        colon!


      when 33
        # at line 1:181: SEMICOLON
        semicolon!


      when 34
        # at line 1:191: ASSIGN
        assign!


      when 35
        # at line 1:198: PLUS
        plus!


      when 36
        # at line 1:203: MINUS
        minus!


      when 37
        # at line 1:209: MUL
        mul!


      when 38
        # at line 1:213: DIV
        div!


      when 39
        # at line 1:217: MOD
        mod!


      when 40
        # at line 1:221: EQ
        eq!


      when 41
        # at line 1:224: NE
        ne!


      when 42
        # at line 1:227: LT
        lt!


      when 43
        # at line 1:230: GT
        gt!


      when 44
        # at line 1:233: LE
        le!


      when 45
        # at line 1:236: GE
        ge!


      when 46
        # at line 1:239: AND
        and!


      when 47
        # at line 1:243: OR
        or!


      when 48
        # at line 1:246: NOT
        not!


      end
    end


    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA10 < ANTLR3::DFA
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

      @decision = 10


      def description
        <<-'__dfa_description__'.strip!
          274:1: fragment FLOAT : ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT );
        __dfa_description__
      end

    end
    class DFA17 < ANTLR3::DFA
      EOT = unpack( 3, -1, 9, 12, 13, -1, 1, 52, 5, -1, 1, 54, 1, 56, 1, 
                    58, 4, -1, 1, 12, 1, 60, 9, 12, 1, 72, 1, 12, 8, -1, 
                    1, 74, 1, -1, 2, 12, 1, 77, 8, 12, 1, -1, 1, 12, 1, 
                    -1, 2, 12, 1, -1, 1, 89, 2, 12, 1, 92, 1, 94, 1, 95, 
                    1, 96, 2, 12, 1, 99, 1, 100, 1, -1, 1, 12, 1, 103, 1, 
                    -1, 1, 12, 3, -1, 1, 105, 1, 106, 2, -1, 1, 107, 1, 
                    109, 1, -1, 1, 110, 3, -1, 1, 111, 3, -1 )
      EOF = unpack( 112, -1 )
      MIN = unpack( 1, 9, 2, -1, 1, 102, 1, 97, 1, 101, 2, 114, 1, 108, 
                    1, 104, 1, 111, 1, 114, 13, -1, 1, 61, 5, -1, 3, 61, 
                    4, -1, 1, 116, 1, 48, 1, 111, 1, 108, 1, 114, 1, 97, 
                    1, 105, 1, 117, 3, 105, 1, 48, 1, 101, 8, -1, 1, 48, 
                    1, -1, 1, 97, 1, 115, 1, 48, 1, 100, 1, 117, 1, 110, 
                    2, 101, 1, 102, 1, 116, 1, 108, 1, -1, 1, 97, 1, -1, 
                    1, 116, 1, 101, 1, -1, 1, 48, 1, 114, 1, 116, 4, 48, 
                    1, 101, 1, 107, 2, 48, 1, -1, 1, 110, 1, 48, 1, -1, 
                    1, 102, 3, -1, 2, 48, 2, -1, 2, 48, 1, -1, 1, 48, 3, 
                    -1, 1, 48, 3, -1 )
      MAX = unpack( 1, 125, 2, -1, 1, 110, 1, 111, 1, 101, 2, 114, 1, 120, 
                    1, 104, 1, 111, 1, 114, 13, -1, 1, 61, 5, -1, 3, 61, 
                    4, -1, 1, 116, 1, 122, 1, 111, 1, 108, 1, 114, 1, 116, 
                    1, 105, 1, 117, 1, 115, 2, 105, 1, 122, 1, 101, 8, -1, 
                    1, 122, 1, -1, 1, 97, 1, 115, 1, 122, 1, 100, 1, 117, 
                    1, 110, 2, 101, 1, 102, 1, 116, 1, 108, 1, -1, 1, 97, 
                    1, -1, 1, 116, 1, 101, 1, -1, 1, 122, 1, 114, 1, 116, 
                    4, 122, 1, 101, 1, 107, 2, 122, 1, -1, 1, 110, 1, 122, 
                    1, -1, 1, 102, 3, -1, 2, 122, 2, -1, 2, 122, 1, -1, 
                    1, 122, 3, -1, 1, 122, 3, -1 )
      ACCEPT = unpack( 1, -1, 1, 1, 1, 2, 9, -1, 1, 21, 1, 22, 1, 23, 1, 
                       24, 1, 25, 1, 26, 1, 27, 1, 28, 1, 29, 1, 30, 1, 
                       31, 1, 32, 1, 33, 1, -1, 1, 35, 1, 36, 1, 37, 1, 
                       38, 1, 39, 3, -1, 1, 46, 1, 47, 1, 1, 1, 2, 13, -1, 
                       1, 40, 1, 34, 1, 41, 1, 48, 1, 44, 1, 42, 1, 45, 
                       1, 43, 1, -1, 1, 12, 11, -1, 1, 17, 1, -1, 1, 3, 
                       2, -1, 1, 11, 11, -1, 1, 5, 2, -1, 1, 9, 1, -1, 1, 
                       13, 1, 14, 1, 19, 2, -1, 1, 4, 1, 10, 2, -1, 1, 6, 
                       1, -1, 1, 16, 1, 20, 1, 18, 1, -1, 1, 7, 1, 15, 1, 
                       8 )
      SPECIAL = unpack( 112, -1 )
      TRANSITION = [
        unpack( 1, 15, 1, 1, 2, -1, 1, 2, 18, -1, 1, 15, 1, 31, 1, 17, 1, 
                14, 1, -1, 1, 30, 1, 34, 1, 16, 1, 18, 1, 19, 1, 28, 1, 
                26, 1, 22, 1, 27, 1, -1, 1, 29, 10, 13, 1, 23, 1, 24, 1, 
                32, 1, 25, 1, 33, 2, -1, 26, 12, 4, -1, 1, 12, 1, -1, 1, 
                12, 1, 11, 1, 12, 1, 10, 1, 8, 1, 4, 2, 12, 1, 3, 6, 12, 
                1, 6, 1, 12, 1, 5, 1, 12, 1, 7, 2, 12, 1, 9, 3, 12, 1, 20, 
                1, 35, 1, 21 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 39, 7, -1, 1, 38 ),
        unpack( 1, 41, 10, -1, 1, 40, 2, -1, 1, 42 ),
        unpack( 1, 43 ),
        unpack( 1, 44 ),
        unpack( 1, 45 ),
        unpack( 1, 46, 11, -1, 1, 47 ),
        unpack( 1, 48 ),
        unpack( 1, 49 ),
        unpack( 1, 50 ),
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
        unpack( 1, 51 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 53 ),
        unpack( 1, 55 ),
        unpack( 1, 57 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 59 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 1, 61 ),
        unpack( 1, 62 ),
        unpack( 1, 63 ),
        unpack( 1, 64, 18, -1, 1, 65 ),
        unpack( 1, 66 ),
        unpack( 1, 67 ),
        unpack( 1, 69, 9, -1, 1, 68 ),
        unpack( 1, 70 ),
        unpack( 1, 71 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 1, 73 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack(  ),
        unpack( 1, 75 ),
        unpack( 1, 76 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 1, 78 ),
        unpack( 1, 79 ),
        unpack( 1, 80 ),
        unpack( 1, 81 ),
        unpack( 1, 82 ),
        unpack( 1, 83 ),
        unpack( 1, 84 ),
        unpack( 1, 85 ),
        unpack(  ),
        unpack( 1, 86 ),
        unpack(  ),
        unpack( 1, 87 ),
        unpack( 1, 88 ),
        unpack(  ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 1, 90 ),
        unpack( 1, 91 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 8, 12, 1, 93, 
                 17, 12 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 1, 97 ),
        unpack( 1, 98 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack(  ),
        unpack( 1, 101 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 11, 12, 1, 
                 102, 14, 12 ),
        unpack(  ),
        unpack( 1, 104 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 13, 12, 1, 
                 108, 12, 12 ),
        unpack(  ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 12, 7, -1, 26, 12, 4, -1, 1, 12, 1, -1, 26, 12 ),
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
          1:1: Tokens : ( T__57 | T__58 | TO_INT | TO_FLOAT | READ | PRINT | PRINTL | PRINTLN | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | RETURN | EXIT | BREAK | ID | INT | COMMENT | WS | CHAR | QUOTE | LB | RB | LCB | RCB | COMMA | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT );
        __dfa_description__
      end

    end


    private

    def initialize_dfas
      super rescue nil
      @dfa10 = DFA10.new( self, 10 )

      @dfa17 = DFA17.new( self, 17 )


    end

  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0

end


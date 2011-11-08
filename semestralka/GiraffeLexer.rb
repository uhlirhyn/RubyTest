#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-11-07 22:31:23
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
    define_tokens( :LT => 34, :EXPONENT => 40, :WHILE => 12, :RB => 18, 
                   :MOD => 28, :OCTAL_ESC => 45, :CHAR => 30, :DO => 13, 
                   :FOR => 14, :FLOAT => 25, :NOT => 21, :AND => 20, :RCB => 5, 
                   :ID => 16, :EOF => -1, :IF => 8, :ESC_SEQ => 42, :COMMA => 15, 
                   :LCB => 4, :PLUS => 22, :EQ => 32, :COMMENT => 6, :NE => 33, 
                   :GE => 37, :T__47 => 47, :T__48 => 48, :UNICODE_ESC => 44, 
                   :ELSE => 9, :HEX_DIGIT => 43, :SEMICOLON => 7, :INT => 24, 
                   :MINUS => 23, :MUL => 26, :TRUE => 38, :ELSEIF => 10, 
                   :COLON => 46, :ELIF => 11, :WS => 41, :OR => 19, :ASSIGN => 31, 
                   :GT => 35, :LB => 17, :DIV => 27, :FALSE => 39, :LE => 36, 
                   :STRING => 29 )
    
  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = Giraffe
    include TokenData

    
    begin
      generated_using( "Giraffe.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end
    
    RULE_NAMES   = [ "T__47", "T__48", "TRUE", "FALSE", "FOR", "IF", "ELSE", 
                     "ELIF", "ELSEIF", "WHILE", "DO", "ID", "INT", "FLOAT", 
                     "COMMENT", "WS", "STRING", "CHAR", "EXPONENT", "HEX_DIGIT", 
                     "ESC_SEQ", "OCTAL_ESC", "UNICODE_ESC", "LB", "RB", 
                     "LCB", "RCB", "COMMA", "COLON", "SEMICOLON", "ASSIGN", 
                     "PLUS", "MINUS", "MUL", "DIV", "MOD", "EQ", "NE", "LT", 
                     "GT", "LE", "GE", "AND", "OR", "NOT" ].freeze
    RULE_METHODS = [ :t__47!, :t__48!, :true!, :false!, :for!, :if!, :else!, 
                     :elif!, :elseif!, :while!, :do!, :id!, :int!, :float!, 
                     :comment!, :ws!, :string!, :char!, :exponent!, :hex_digit!, 
                     :esc_seq!, :octal_esc!, :unicode_esc!, :lb!, :rb!, 
                     :lcb!, :rcb!, :comma!, :colon!, :semicolon!, :assign!, 
                     :plus!, :minus!, :mul!, :div!, :mod!, :eq!, :ne!, :lt!, 
                     :gt!, :le!, :ge!, :and!, :or!, :not! ].freeze

    
    def initialize( input=nil, options = {} )
      super( input, options )

    end
    
    
    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule t__47! (T__47)
    # (in Giraffe.g)
    def t__47!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      type = T__47
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

    # lexer rule t__48! (T__48)
    # (in Giraffe.g)
    def t__48!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      type = T__48
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

    # lexer rule true! (TRUE)
    # (in Giraffe.g)
    def true!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      type = TRUE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 141:8: 'true'
      match( "true" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )

    end

    # lexer rule false! (FALSE)
    # (in Giraffe.g)
    def false!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      type = FALSE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 142:9: 'false'
      match( "false" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )

    end

    # lexer rule for! (FOR)
    # (in Giraffe.g)
    def for!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )

      type = FOR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 143:7: 'for'
      match( "for" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )

    end

    # lexer rule if! (IF)
    # (in Giraffe.g)
    def if!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )

      type = IF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 144:6: 'if'
      match( "if" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )

    end

    # lexer rule else! (ELSE)
    # (in Giraffe.g)
    def else!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )

      type = ELSE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 145:8: 'else'
      match( "else" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )

    end

    # lexer rule elif! (ELIF)
    # (in Giraffe.g)
    def elif!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )

      type = ELIF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 146:8: 'elif'
      match( "elif" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )

    end

    # lexer rule elseif! (ELSEIF)
    # (in Giraffe.g)
    def elseif!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )

      type = ELSEIF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 147:10: 'elseif'
      match( "elseif" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )

    end

    # lexer rule while! (WHILE)
    # (in Giraffe.g)
    def while!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )

      type = WHILE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 148:9: 'while'
      match( "while" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )

    end

    # lexer rule do! (DO)
    # (in Giraffe.g)
    def do!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )

      type = DO
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 149:6: 'do'
      match( "do" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )

    end

    # lexer rule id! (ID)
    # (in Giraffe.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )

      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 151:7: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 151:31: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
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
      # trace_out( __method__, 12 )

    end

    # lexer rule int! (INT)
    # (in Giraffe.g)
    def int!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      type = INT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 154:7: ( '0' .. '9' )+
      # at file 154:7: ( '0' .. '9' )+
      match_count_2 = 0
      while true
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0.between?( 0x30, 0x39 ) )
          alt_2 = 1

        end
        case alt_2
        when 1
          # at line 154:7: '0' .. '9'
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
      # trace_out( __method__, 13 )

    end

    # lexer rule float! (FLOAT)
    # (in Giraffe.g)
    def float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )

      type = FLOAT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 158:5: ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT )
      alt_9 = 3
      alt_9 = @dfa9.predict( @input )
      case alt_9
      when 1
        # at line 158:9: ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )?
        # at file 158:9: ( '0' .. '9' )+
        match_count_3 = 0
        while true
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0.between?( 0x30, 0x39 ) )
            alt_3 = 1

          end
          case alt_3
          when 1
            # at line 158:10: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_3 > 0 and break
            eee = EarlyExit(3)


            raise eee
          end
          match_count_3 += 1
        end

        match( 0x2e )
        # at line 158:25: ( '0' .. '9' )*
        while true # decision 4
          alt_4 = 2
          look_4_0 = @input.peek( 1 )

          if ( look_4_0.between?( 0x30, 0x39 ) )
            alt_4 = 1

          end
          case alt_4
          when 1
            # at line 158:26: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            break # out of loop for decision 4
          end
        end # loop for decision 4
        # at line 158:37: ( EXPONENT )?
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == 0x45 || look_5_0 == 0x65 )
          alt_5 = 1
        end
        case alt_5
        when 1
          # at line 158:37: EXPONENT
          exponent!

        end

      when 2
        # at line 159:9: '.' ( '0' .. '9' )+ ( EXPONENT )?
        match( 0x2e )
        # at file 159:13: ( '0' .. '9' )+
        match_count_6 = 0
        while true
          alt_6 = 2
          look_6_0 = @input.peek( 1 )

          if ( look_6_0.between?( 0x30, 0x39 ) )
            alt_6 = 1

          end
          case alt_6
          when 1
            # at line 159:14: '0' .. '9'
            match_range( 0x30, 0x39 )

          else
            match_count_6 > 0 and break
            eee = EarlyExit(6)


            raise eee
          end
          match_count_6 += 1
        end

        # at line 159:25: ( EXPONENT )?
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == 0x45 || look_7_0 == 0x65 )
          alt_7 = 1
        end
        case alt_7
        when 1
          # at line 159:25: EXPONENT
          exponent!

        end

      when 3
        # at line 160:9: ( '0' .. '9' )+ EXPONENT
        # at file 160:9: ( '0' .. '9' )+
        match_count_8 = 0
        while true
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0.between?( 0x30, 0x39 ) )
            alt_8 = 1

          end
          case alt_8
          when 1
            # at line 160:10: '0' .. '9'
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
      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )

    end

    # lexer rule comment! (COMMENT)
    # (in Giraffe.g)
    def comment!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      type = COMMENT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 164:9: '#' (~ ( '\\n' | '\\r' ) )*
      match( 0x23 )
      # at line 164:13: (~ ( '\\n' | '\\r' ) )*
      while true # decision 10
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0.between?( 0x0, 0x9 ) || look_10_0.between?( 0xb, 0xc ) || look_10_0.between?( 0xe, 0xffff ) )
          alt_10 = 1

        end
        case alt_10
        when 1
          # at line 164:13: ~ ( '\\n' | '\\r' )
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
      # trace_out( __method__, 15 )

    end

    # lexer rule ws! (WS)
    # (in Giraffe.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 167:9: ( ' ' | '\\t' | '\\r' | '\\n' )
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
      # trace_out( __method__, 16 )

    end

    # lexer rule string! (STRING)
    # (in Giraffe.g)
    def string!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )

      type = STRING
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 175:8: '\"' ( ESC_SEQ | ~ ( '\\\\' | '\"' ) )* '\"'
      match( 0x22 )
      # at line 175:12: ( ESC_SEQ | ~ ( '\\\\' | '\"' ) )*
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
          # at line 175:14: ESC_SEQ
          esc_seq!

        when 2
          # at line 175:24: ~ ( '\\\\' | '\"' )
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
      # trace_out( __method__, 17 )

    end

    # lexer rule char! (CHAR)
    # (in Giraffe.g)
    def char!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )

      type = CHAR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 178:8: '\\'' ( ESC_SEQ | ~ ( '\\'' | '\\\\' ) ) '\\''
      match( 0x27 )
      # at line 178:13: ( ESC_SEQ | ~ ( '\\'' | '\\\\' ) )
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
        # at line 178:15: ESC_SEQ
        esc_seq!

      when 2
        # at line 178:25: ~ ( '\\'' | '\\\\' )
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
      # trace_out( __method__, 18 )

    end

    # lexer rule exponent! (EXPONENT)
    # (in Giraffe.g)
    def exponent!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )

      
      # - - - - main rule block - - - -
      # at line 182:12: ( 'e' | 'E' ) ( '+' | '-' )? ( '0' .. '9' )+
      if @input.peek(1) == 0x45 || @input.peek(1) == 0x65
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end


      # at line 182:22: ( '+' | '-' )?
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
      # at file 182:33: ( '0' .. '9' )+
      match_count_14 = 0
      while true
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0.between?( 0x30, 0x39 ) )
          alt_14 = 1

        end
        case alt_14
        when 1
          # at line 182:34: '0' .. '9'
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
      # trace_out( __method__, 19 )

    end

    # lexer rule hex_digit! (HEX_DIGIT)
    # (in Giraffe.g)
    def hex_digit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )

      
      # - - - - main rule block - - - -
      # at line 185:13: ( '0' .. '9' | 'a' .. 'f' | 'A' .. 'F' )
      if @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x46 ) || @input.peek( 1 ).between?( 0x61, 0x66 )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 20 )

    end

    # lexer rule esc_seq! (ESC_SEQ)
    # (in Giraffe.g)
    def esc_seq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )

      
      # - - - - main rule block - - - -
      # at line 189:5: ( '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' ) | UNICODE_ESC | OCTAL_ESC )
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
        # at line 189:9: '\\\\' ( 'b' | 't' | 'n' | 'f' | 'r' | '\\\"' | '\\'' | '\\\\' )
        match( 0x5c )
        if @input.peek(1) == 0x22 || @input.peek(1) == 0x27 || @input.peek(1) == 0x5c || @input.peek(1) == 0x62 || @input.peek(1) == 0x66 || @input.peek(1) == 0x6e || @input.peek(1) == 0x72 || @input.peek(1) == 0x74
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse
        end



      when 2
        # at line 190:9: UNICODE_ESC
        unicode_esc!

      when 3
        # at line 191:9: OCTAL_ESC
        octal_esc!

      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 21 )

    end

    # lexer rule octal_esc! (OCTAL_ESC)
    # (in Giraffe.g)
    def octal_esc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )

      
      # - - - - main rule block - - - -
      # at line 196:5: ( '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) ( '0' .. '7' ) | '\\\\' ( '0' .. '7' ) )
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
        # at line 196:9: '\\\\' ( '0' .. '3' ) ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 196:14: ( '0' .. '3' )
        # at line 196:15: '0' .. '3'
        match_range( 0x30, 0x33 )

        # at line 196:25: ( '0' .. '7' )
        # at line 196:26: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 196:36: ( '0' .. '7' )
        # at line 196:37: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 2
        # at line 197:9: '\\\\' ( '0' .. '7' ) ( '0' .. '7' )
        match( 0x5c )
        # at line 197:14: ( '0' .. '7' )
        # at line 197:15: '0' .. '7'
        match_range( 0x30, 0x37 )

        # at line 197:25: ( '0' .. '7' )
        # at line 197:26: '0' .. '7'
        match_range( 0x30, 0x37 )


      when 3
        # at line 198:9: '\\\\' ( '0' .. '7' )
        match( 0x5c )
        # at line 198:14: ( '0' .. '7' )
        # at line 198:15: '0' .. '7'
        match_range( 0x30, 0x37 )


      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 22 )

    end

    # lexer rule unicode_esc! (UNICODE_ESC)
    # (in Giraffe.g)
    def unicode_esc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )

      
      # - - - - main rule block - - - -
      # at line 203:9: '\\\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
      match( 0x5c )
      match( 0x75 )
      hex_digit!
      hex_digit!
      hex_digit!
      hex_digit!

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 23 )

    end

    # lexer rule lb! (LB)
    # (in Giraffe.g)
    def lb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )

      type = LB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 206:6: '('
      match( 0x28 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 24 )

    end

    # lexer rule rb! (RB)
    # (in Giraffe.g)
    def rb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )

      type = RB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 207:6: ')'
      match( 0x29 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 25 )

    end

    # lexer rule lcb! (LCB)
    # (in Giraffe.g)
    def lcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )

      type = LCB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 208:7: '{'
      match( 0x7b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 26 )

    end

    # lexer rule rcb! (RCB)
    # (in Giraffe.g)
    def rcb!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )

      type = RCB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 209:7: '}'
      match( 0x7d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 27 )

    end

    # lexer rule comma! (COMMA)
    # (in Giraffe.g)
    def comma!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )

      type = COMMA
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 210:9: ','
      match( 0x2c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 28 )

    end

    # lexer rule colon! (COLON)
    # (in Giraffe.g)
    def colon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )

      type = COLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 211:9: ':'
      match( 0x3a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 29 )

    end

    # lexer rule semicolon! (SEMICOLON)
    # (in Giraffe.g)
    def semicolon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )

      type = SEMICOLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 213:4: ';'
      match( 0x3b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 30 )

    end

    # lexer rule assign! (ASSIGN)
    # (in Giraffe.g)
    def assign!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )

      type = ASSIGN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 214:10: '='
      match( 0x3d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 31 )

    end

    # lexer rule plus! (PLUS)
    # (in Giraffe.g)
    def plus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )

      type = PLUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 215:8: '+'
      match( 0x2b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )

    end

    # lexer rule minus! (MINUS)
    # (in Giraffe.g)
    def minus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )

      type = MINUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 216:9: '-'
      match( 0x2d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )

    end

    # lexer rule mul! (MUL)
    # (in Giraffe.g)
    def mul!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )

      type = MUL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 217:7: '*'
      match( 0x2a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 34 )

    end

    # lexer rule div! (DIV)
    # (in Giraffe.g)
    def div!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )

      type = DIV
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 218:7: '/'
      match( 0x2f )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 35 )

    end

    # lexer rule mod! (MOD)
    # (in Giraffe.g)
    def mod!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )

      type = MOD
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 219:7: '%'
      match( 0x25 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 36 )

    end

    # lexer rule eq! (EQ)
    # (in Giraffe.g)
    def eq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )

      type = EQ
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 221:6: '=='
      match( "==" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 37 )

    end

    # lexer rule ne! (NE)
    # (in Giraffe.g)
    def ne!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )

      type = NE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 222:6: '!='
      match( "!=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 38 )

    end

    # lexer rule lt! (LT)
    # (in Giraffe.g)
    def lt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )

      type = LT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 223:6: '<'
      match( 0x3c )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 39 )

    end

    # lexer rule gt! (GT)
    # (in Giraffe.g)
    def gt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )

      type = GT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 224:6: '>'
      match( 0x3e )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 40 )

    end

    # lexer rule le! (LE)
    # (in Giraffe.g)
    def le!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )

      type = LE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 225:6: '<='
      match( "<=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 41 )

    end

    # lexer rule ge! (GE)
    # (in Giraffe.g)
    def ge!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )

      type = GE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 226:6: '>='
      match( ">=" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 42 )

    end

    # lexer rule and! (AND)
    # (in Giraffe.g)
    def and!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )

      type = AND
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 228:7: '&&'
      match( "&&" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 43 )

    end

    # lexer rule or! (OR)
    # (in Giraffe.g)
    def or!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )

      type = OR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 229:6: '||'
      match( "||" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 44 )

    end

    # lexer rule not! (NOT)
    # (in Giraffe.g)
    def not!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )

      type = NOT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 230:7: '!'
      match( 0x21 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 45 )

    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    # 
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( T__47 | T__48 | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | ID | INT | FLOAT | COMMENT | WS | STRING | CHAR | LB | RB | LCB | RCB | COMMA | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT )
      alt_17 = 40
      alt_17 = @dfa17.predict( @input )
      case alt_17
      when 1
        # at line 1:10: T__47
        t__47!

      when 2
        # at line 1:16: T__48
        t__48!

      when 3
        # at line 1:22: TRUE
        true!

      when 4
        # at line 1:27: FALSE
        false!

      when 5
        # at line 1:33: FOR
        for!

      when 6
        # at line 1:37: IF
        if!

      when 7
        # at line 1:40: ELSE
        else!

      when 8
        # at line 1:45: ELIF
        elif!

      when 9
        # at line 1:50: ELSEIF
        elseif!

      when 10
        # at line 1:57: WHILE
        while!

      when 11
        # at line 1:63: DO
        do!

      when 12
        # at line 1:66: ID
        id!

      when 13
        # at line 1:69: INT
        int!

      when 14
        # at line 1:73: FLOAT
        float!

      when 15
        # at line 1:79: COMMENT
        comment!

      when 16
        # at line 1:87: WS
        ws!

      when 17
        # at line 1:90: STRING
        string!

      when 18
        # at line 1:97: CHAR
        char!

      when 19
        # at line 1:102: LB
        lb!

      when 20
        # at line 1:105: RB
        rb!

      when 21
        # at line 1:108: LCB
        lcb!

      when 22
        # at line 1:112: RCB
        rcb!

      when 23
        # at line 1:116: COMMA
        comma!

      when 24
        # at line 1:122: COLON
        colon!

      when 25
        # at line 1:128: SEMICOLON
        semicolon!

      when 26
        # at line 1:138: ASSIGN
        assign!

      when 27
        # at line 1:145: PLUS
        plus!

      when 28
        # at line 1:150: MINUS
        minus!

      when 29
        # at line 1:156: MUL
        mul!

      when 30
        # at line 1:160: DIV
        div!

      when 31
        # at line 1:164: MOD
        mod!

      when 32
        # at line 1:168: EQ
        eq!

      when 33
        # at line 1:171: NE
        ne!

      when 34
        # at line 1:174: LT
        lt!

      when 35
        # at line 1:177: GT
        gt!

      when 36
        # at line 1:180: LE
        le!

      when 37
        # at line 1:183: GE
        ge!

      when 38
        # at line 1:186: AND
        and!

      when 39
        # at line 1:190: OR
        or!

      when 40
        # at line 1:193: NOT
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
          157:1: FLOAT : ( ( '0' .. '9' )+ '.' ( '0' .. '9' )* ( EXPONENT )? | '.' ( '0' .. '9' )+ ( EXPONENT )? | ( '0' .. '9' )+ EXPONENT );
        __dfa_description__
      end
    end
    class DFA17 < ANTLR3::DFA
      EOT = unpack( 3, -1, 6, 9, 1, -1, 1, 43, 12, -1, 1, 45, 5, -1, 1, 
                    47, 1, 49, 1, 51, 4, -1, 3, 9, 1, 55, 2, 9, 1, 59, 9, 
                    -1, 2, 9, 1, 62, 1, -1, 3, 9, 1, -1, 1, 66, 1, 9, 1, 
                    -1, 1, 69, 1, 70, 1, 9, 1, -1, 1, 72, 1, 9, 2, -1, 1, 
                    74, 1, -1, 1, 75, 2, -1 )
      EOF = unpack( 76, -1 )
      MIN = unpack( 1, 9, 2, -1, 1, 114, 1, 97, 1, 102, 1, 108, 1, 104, 
                    1, 111, 1, -1, 1, 46, 12, -1, 1, 61, 5, -1, 3, 61, 4, 
                    -1, 1, 117, 1, 108, 1, 114, 1, 48, 2, 105, 1, 48, 9, 
                    -1, 1, 101, 1, 115, 1, 48, 1, -1, 1, 101, 1, 102, 1, 
                    108, 1, -1, 1, 48, 1, 101, 1, -1, 2, 48, 1, 101, 1, 
                    -1, 1, 48, 1, 102, 2, -1, 1, 48, 1, -1, 1, 48, 2, -1 )
      MAX = unpack( 1, 125, 2, -1, 1, 114, 1, 111, 1, 102, 1, 108, 1, 104, 
                    1, 111, 1, -1, 1, 101, 12, -1, 1, 61, 5, -1, 3, 61, 
                    4, -1, 1, 117, 1, 108, 1, 114, 1, 122, 1, 115, 1, 105, 
                    1, 122, 9, -1, 1, 101, 1, 115, 1, 122, 1, -1, 1, 101, 
                    1, 102, 1, 108, 1, -1, 1, 122, 1, 101, 1, -1, 2, 122, 
                    1, 101, 1, -1, 1, 122, 1, 102, 2, -1, 1, 122, 1, -1, 
                    1, 122, 2, -1 )
      ACCEPT = unpack( 1, -1, 1, 1, 1, 2, 6, -1, 1, 12, 1, -1, 1, 14, 1, 
                       15, 1, 16, 1, 17, 1, 18, 1, 19, 1, 20, 1, 21, 1, 
                       22, 1, 23, 1, 24, 1, 25, 1, -1, 1, 27, 1, 28, 1, 
                       29, 1, 30, 1, 31, 3, -1, 1, 38, 1, 39, 1, 1, 1, 2, 
                       7, -1, 1, 13, 1, 32, 1, 26, 1, 33, 1, 40, 1, 36, 
                       1, 34, 1, 37, 1, 35, 3, -1, 1, 6, 3, -1, 1, 11, 2, 
                       -1, 1, 5, 3, -1, 1, 3, 2, -1, 1, 7, 1, 8, 1, -1, 
                       1, 4, 1, -1, 1, 10, 1, 9 )
      SPECIAL = unpack( 76, -1 )
      TRANSITION = [
        unpack( 1, 13, 1, 2, 2, -1, 1, 1, 18, -1, 1, 13, 1, 29, 1, 14, 1, 
                12, 1, -1, 1, 28, 1, 32, 1, 15, 1, 16, 1, 17, 1, 26, 1, 
                24, 1, 20, 1, 25, 1, 11, 1, 27, 10, 10, 1, 21, 1, 22, 1, 
                30, 1, 23, 1, 31, 2, -1, 26, 9, 4, -1, 1, 9, 1, -1, 3, 9, 
                1, 8, 1, 6, 1, 4, 2, 9, 1, 5, 10, 9, 1, 3, 2, 9, 1, 7, 3, 
                9, 1, 18, 1, 33, 1, 19 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 36 ),
        unpack( 1, 37, 13, -1, 1, 38 ),
        unpack( 1, 39 ),
        unpack( 1, 40 ),
        unpack( 1, 41 ),
        unpack( 1, 42 ),
        unpack(  ),
        unpack( 1, 11, 1, -1, 10, 10, 11, -1, 1, 11, 31, -1, 1, 11 ),
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
        unpack( 1, 44 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 46 ),
        unpack( 1, 48 ),
        unpack( 1, 50 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 52 ),
        unpack( 1, 53 ),
        unpack( 1, 54 ),
        unpack( 10, 9, 7, -1, 26, 9, 4, -1, 1, 9, 1, -1, 26, 9 ),
        unpack( 1, 57, 9, -1, 1, 56 ),
        unpack( 1, 58 ),
        unpack( 10, 9, 7, -1, 26, 9, 4, -1, 1, 9, 1, -1, 26, 9 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 60 ),
        unpack( 1, 61 ),
        unpack( 10, 9, 7, -1, 26, 9, 4, -1, 1, 9, 1, -1, 26, 9 ),
        unpack(  ),
        unpack( 1, 63 ),
        unpack( 1, 64 ),
        unpack( 1, 65 ),
        unpack(  ),
        unpack( 10, 9, 7, -1, 26, 9, 4, -1, 1, 9, 1, -1, 26, 9 ),
        unpack( 1, 67 ),
        unpack(  ),
        unpack( 10, 9, 7, -1, 26, 9, 4, -1, 1, 9, 1, -1, 8, 9, 1, 68, 17, 
                 9 ),
        unpack( 10, 9, 7, -1, 26, 9, 4, -1, 1, 9, 1, -1, 26, 9 ),
        unpack( 1, 71 ),
        unpack(  ),
        unpack( 10, 9, 7, -1, 26, 9, 4, -1, 1, 9, 1, -1, 26, 9 ),
        unpack( 1, 73 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 9, 7, -1, 26, 9, 4, -1, 1, 9, 1, -1, 26, 9 ),
        unpack(  ),
        unpack( 10, 9, 7, -1, 26, 9, 4, -1, 1, 9, 1, -1, 26, 9 ),
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
          1:1: Tokens : ( T__47 | T__48 | TRUE | FALSE | FOR | IF | ELSE | ELIF | ELSEIF | WHILE | DO | ID | INT | FLOAT | COMMENT | WS | STRING | CHAR | LB | RB | LCB | RCB | COMMA | COLON | SEMICOLON | ASSIGN | PLUS | MINUS | MUL | DIV | MOD | EQ | NE | LT | GT | LE | GE | AND | OR | NOT );
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


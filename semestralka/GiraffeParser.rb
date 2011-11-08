#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-11-07 22:31:22
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
                   :MOD => 28, :OCTAL_ESC => 45, :CHAR => 30, :FOR => 14, 
                   :DO => 13, :FLOAT => 25, :NOT => 21, :ID => 16, :RCB => 5, 
                   :AND => 20, :EOF => -1, :IF => 8, :ESC_SEQ => 42, :COMMA => 15, 
                   :LCB => 4, :PLUS => 22, :EQ => 32, :COMMENT => 6, :NE => 33, 
                   :GE => 37, :T__47 => 47, :T__48 => 48, :UNICODE_ESC => 44, 
                   :ELSE => 9, :HEX_DIGIT => 43, :SEMICOLON => 7, :INT => 24, 
                   :MINUS => 23, :MUL => 26, :TRUE => 38, :ELSEIF => 10, 
                   :COLON => 46, :ELIF => 11, :WS => 41, :OR => 19, :ASSIGN => 31, 
                   :GT => 35, :LB => 17, :DIV => 27, :FALSE => 39, :LE => 36, 
                   :STRING => 29 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "LCB", "RCB", "COMMENT", "SEMICOLON", "IF", "ELSE", 
                    "ELSEIF", "ELIF", "WHILE", "DO", "FOR", "COMMA", "ID", 
                    "LB", "RB", "OR", "AND", "NOT", "PLUS", "MINUS", "INT", 
                    "FLOAT", "MUL", "DIV", "MOD", "STRING", "CHAR", "ASSIGN", 
                    "EQ", "NE", "LT", "GT", "LE", "GE", "TRUE", "FALSE", 
                    "EXPONENT", "WS", "ESC_SEQ", "HEX_DIGIT", "UNICODE_ESC", 
                    "OCTAL_ESC", "COLON", "'\\r'", "'\\n'" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = Giraffe

    RULE_METHODS = [ :program, :env, :block, :instructionRest, :instruction, 
                     :ifInstruction, :ifRest, :whileCycle, :doCycle, :forCycle, 
                     :func, :params, :paramRest, :call, :args, :argsRest, 
                     :condition, :conditionRest, :orOperand, :orOperandRest, 
                     :andOperand, :andOperandRest, :boolOperand, :expression, 
                     :expressionRest, :addOperand, :addOperandRest, :mulOperand, 
                     :mulOperandRest, :mulOperator, :addOperator, :value, 
                     :assignment, :boolOperator, :bool ].freeze


    include TokenData

    begin
      generated_using( "Giraffe.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )


    end
    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -

    # 
    # parser rule program
    # 
    # (in Giraffe.g)
    # 5:1: program : block ;
    # 
    def program
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      begin
        # at line 5:11: block
        @state.following.push( TOKENS_FOLLOWING_block_IN_program_22 )
        block
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 1 )

      end
      
      return 
    end


    # 
    # parser rule env
    # 
    # (in Giraffe.g)
    # 7:1: env : LCB block RCB ;
    # 
    def env
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      begin
        # at line 7:7: LCB block RCB
        match( LCB, TOKENS_FOLLOWING_LCB_IN_env_30 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_env_32 )
        block
        @state.following.pop
        match( RCB, TOKENS_FOLLOWING_RCB_IN_env_34 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 2 )

      end
      
      return 
    end


    # 
    # parser rule block
    # 
    # (in Giraffe.g)
    # 9:1: block : instruction instructionRest ;
    # 
    def block
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      begin
        # at line 10:4: instruction instructionRest
        @state.following.push( TOKENS_FOLLOWING_instruction_IN_block_43 )
        instruction
        @state.following.pop
        @state.following.push( TOKENS_FOLLOWING_instructionRest_IN_block_45 )
        instructionRest
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 3 )

      end
      
      return 
    end


    # 
    # parser rule instructionRest
    # 
    # (in Giraffe.g)
    # 12:1: instructionRest : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | );
    # 
    def instructionRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      begin
        # at line 13:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | )
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0.between?( COMMENT, SEMICOLON ) || look_4_0.between?( T__47, T__48 ) )
          alt_4 = 1
        elsif ( look_4_0 == EOF || look_4_0 == RCB )
          alt_4 = 2
        else
          raise NoViableAlternative( "", 4, 0 )
        end
        case alt_4
        when 1
          # at line 13:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block
          # at line 13:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0 == COMMENT || look_3_0.between?( T__47, T__48 ) )
            alt_3 = 1
          elsif ( look_3_0 == SEMICOLON )
            alt_3 = 2
          else
            raise NoViableAlternative( "", 3, 0 )
          end
          case alt_3
          when 1
            # at line 13:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 13:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 13:8: ( COMMENT )? ( '\\r' )? '\\n'
            # at line 13:8: ( COMMENT )?
            alt_1 = 2
            look_1_0 = @input.peek( 1 )

            if ( look_1_0 == COMMENT )
              alt_1 = 1
            end
            case alt_1
            when 1
              # at line 13:8: COMMENT
              match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_instructionRest_58 )

            end
            # at line 13:17: ( '\\r' )?
            alt_2 = 2
            look_2_0 = @input.peek( 1 )

            if ( look_2_0 == T__47 )
              alt_2 = 1
            end
            case alt_2
            when 1
              # at line 13:17: '\\r'
              match( T__47, TOKENS_FOLLOWING_T__47_IN_instructionRest_61 )

            end
            match( T__48, TOKENS_FOLLOWING_T__48_IN_instructionRest_64 )


          when 2
            # at line 13:31: SEMICOLON
            match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_69 )

          end
          @state.following.push( TOKENS_FOLLOWING_block_IN_instructionRest_72 )
          block
          @state.following.pop

        when 2
          # at line 14:4: 

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 4 )

      end
      
      return 
    end


    # 
    # parser rule instruction
    # 
    # (in Giraffe.g)
    # 16:1: instruction : ( assignment | call | func | env | forCycle | ifInstruction | whileCycle | doCycle | );
    # 
    def instruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )

      begin
        # at line 17:2: ( assignment | call | func | env | forCycle | ifInstruction | whileCycle | doCycle | )
        alt_5 = 9
        alt_5 = @dfa5.predict( @input )
        case alt_5
        when 1
          # at line 17:4: assignment
          @state.following.push( TOKENS_FOLLOWING_assignment_IN_instruction_85 )
          assignment
          @state.following.pop

        when 2
          # at line 18:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_instruction_90 )
          call
          @state.following.pop

        when 3
          # at line 19:4: func
          @state.following.push( TOKENS_FOLLOWING_func_IN_instruction_95 )
          func
          @state.following.pop

        when 4
          # at line 20:4: env
          @state.following.push( TOKENS_FOLLOWING_env_IN_instruction_100 )
          env
          @state.following.pop

        when 5
          # at line 21:4: forCycle
          @state.following.push( TOKENS_FOLLOWING_forCycle_IN_instruction_105 )
          forCycle
          @state.following.pop

        when 6
          # at line 22:4: ifInstruction
          @state.following.push( TOKENS_FOLLOWING_ifInstruction_IN_instruction_110 )
          ifInstruction
          @state.following.pop

        when 7
          # at line 23:4: whileCycle
          @state.following.push( TOKENS_FOLLOWING_whileCycle_IN_instruction_115 )
          whileCycle
          @state.following.pop

        when 8
          # at line 24:4: doCycle
          @state.following.push( TOKENS_FOLLOWING_doCycle_IN_instruction_120 )
          doCycle
          @state.following.pop

        when 9
          # at line 25:4: 

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 5 )

      end
      
      return 
    end


    # 
    # parser rule ifInstruction
    # 
    # (in Giraffe.g)
    # 27:1: ifInstruction : IF condition env ifRest ;
    # 
    def ifInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )

      begin
        # at line 28:4: IF condition env ifRest
        match( IF, TOKENS_FOLLOWING_IF_IN_ifInstruction_135 )
        @state.following.push( TOKENS_FOLLOWING_condition_IN_ifInstruction_137 )
        condition
        @state.following.pop
        @state.following.push( TOKENS_FOLLOWING_env_IN_ifInstruction_139 )
        env
        @state.following.pop
        @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifInstruction_141 )
        ifRest
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 6 )

      end
      
      return 
    end


    # 
    # parser rule ifRest
    # 
    # (in Giraffe.g)
    # 30:1: ifRest : ( ELSE env | ( ELSEIF | ELIF ) condition env | );
    # 
    def ifRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )

      begin
        # at line 30:8: ( ELSE env | ( ELSEIF | ELIF ) condition env | )
        alt_6 = 3
        case look_6 = @input.peek( 1 )
        when ELSE then alt_6 = 1
        when ELSEIF, ELIF then alt_6 = 2
        when EOF, RCB, COMMENT, SEMICOLON, T__47, T__48 then alt_6 = 3
        else
          raise NoViableAlternative( "", 6, 0 )
        end
        case alt_6
        when 1
          # at line 30:10: ELSE env
          match( ELSE, TOKENS_FOLLOWING_ELSE_IN_ifRest_149 )
          @state.following.push( TOKENS_FOLLOWING_env_IN_ifRest_151 )
          env
          @state.following.pop

        when 2
          # at line 31:4: ( ELSEIF | ELIF ) condition env
          if @input.peek( 1 ).between?( ELSEIF, ELIF )
            @input.consume
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          @state.following.push( TOKENS_FOLLOWING_condition_IN_ifRest_164 )
          condition
          @state.following.pop
          @state.following.push( TOKENS_FOLLOWING_env_IN_ifRest_166 )
          env
          @state.following.pop

        when 3
          # at line 32:4: 

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 7 )

      end
      
      return 
    end


    # 
    # parser rule whileCycle
    # 
    # (in Giraffe.g)
    # 34:1: whileCycle : WHILE condition env ;
    # 
    def whileCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )

      begin
        # at line 35:5: WHILE condition env
        match( WHILE, TOKENS_FOLLOWING_WHILE_IN_whileCycle_180 )
        @state.following.push( TOKENS_FOLLOWING_condition_IN_whileCycle_182 )
        condition
        @state.following.pop
        @state.following.push( TOKENS_FOLLOWING_env_IN_whileCycle_184 )
        env
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 8 )

      end
      
      return 
    end


    # 
    # parser rule doCycle
    # 
    # (in Giraffe.g)
    # 37:1: doCycle : DO env WHILE condition ;
    # 
    def doCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )

      begin
        # at line 37:11: DO env WHILE condition
        match( DO, TOKENS_FOLLOWING_DO_IN_doCycle_192 )
        @state.following.push( TOKENS_FOLLOWING_env_IN_doCycle_194 )
        env
        @state.following.pop
        match( WHILE, TOKENS_FOLLOWING_WHILE_IN_doCycle_196 )
        @state.following.push( TOKENS_FOLLOWING_condition_IN_doCycle_198 )
        condition
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 9 )

      end
      
      return 
    end


    # 
    # parser rule forCycle
    # 
    # (in Giraffe.g)
    # 39:1: forCycle : FOR assignment COMMA condition COMMA assignment env ;
    # 
    def forCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )

      begin
        # at line 40:4: FOR assignment COMMA condition COMMA assignment env
        match( FOR, TOKENS_FOLLOWING_FOR_IN_forCycle_207 )
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_209 )
        assignment
        @state.following.pop
        match( COMMA, TOKENS_FOLLOWING_COMMA_IN_forCycle_211 )
        @state.following.push( TOKENS_FOLLOWING_condition_IN_forCycle_213 )
        condition
        @state.following.pop
        match( COMMA, TOKENS_FOLLOWING_COMMA_IN_forCycle_215 )
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_217 )
        assignment
        @state.following.pop
        @state.following.push( TOKENS_FOLLOWING_env_IN_forCycle_219 )
        env
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 10 )

      end
      
      return 
    end


    # 
    # parser rule func
    # 
    # (in Giraffe.g)
    # 42:1: func : ID ( params )? env ;
    # 
    def func
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )

      begin
        # at line 42:9: ID ( params )? env
        match( ID, TOKENS_FOLLOWING_ID_IN_func_229 )
        # at line 42:12: ( params )?
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == ID )
          alt_7 = 1
        end
        case alt_7
        when 1
          # at line 42:12: params
          @state.following.push( TOKENS_FOLLOWING_params_IN_func_231 )
          params
          @state.following.pop

        end
        @state.following.push( TOKENS_FOLLOWING_env_IN_func_234 )
        env
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 11 )

      end
      
      return 
    end


    # 
    # parser rule params
    # 
    # (in Giraffe.g)
    # 44:1: params : ID paramRest ;
    # 
    def params
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )

      begin
        # at line 44:10: ID paramRest
        match( ID, TOKENS_FOLLOWING_ID_IN_params_242 )
        @state.following.push( TOKENS_FOLLOWING_paramRest_IN_params_244 )
        paramRest
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 12 )

      end
      
      return 
    end


    # 
    # parser rule paramRest
    # 
    # (in Giraffe.g)
    # 46:1: paramRest : ( COMMA params | );
    # 
    def paramRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      begin
        # at line 47:2: ( COMMA params | )
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == COMMA )
          alt_8 = 1
        elsif ( look_8_0 == LCB )
          alt_8 = 2
        else
          raise NoViableAlternative( "", 8, 0 )
        end
        case alt_8
        when 1
          # at line 47:4: COMMA params
          match( COMMA, TOKENS_FOLLOWING_COMMA_IN_paramRest_253 )
          @state.following.push( TOKENS_FOLLOWING_params_IN_paramRest_255 )
          params
          @state.following.pop

        when 2
          # at line 48:4: 

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 13 )

      end
      
      return 
    end


    # 
    # parser rule call
    # 
    # (in Giraffe.g)
    # 50:1: call : ID LB ( args )? RB ;
    # 
    def call
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )

      begin
        # at line 51:4: ID LB ( args )? RB
        match( ID, TOKENS_FOLLOWING_ID_IN_call_269 )
        match( LB, TOKENS_FOLLOWING_LB_IN_call_271 )
        # at line 51:10: ( args )?
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0.between?( ID, LB ) || look_9_0.between?( PLUS, FLOAT ) )
          alt_9 = 1
        end
        case alt_9
        when 1
          # at line 51:10: args
          @state.following.push( TOKENS_FOLLOWING_args_IN_call_273 )
          args
          @state.following.pop

        end
        match( RB, TOKENS_FOLLOWING_RB_IN_call_276 )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 14 )

      end
      
      return 
    end


    # 
    # parser rule args
    # 
    # (in Giraffe.g)
    # 53:1: args : expression argsRest ;
    # 
    def args
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      begin
        # at line 54:4: expression argsRest
        @state.following.push( TOKENS_FOLLOWING_expression_IN_args_287 )
        expression
        @state.following.pop
        @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_289 )
        argsRest
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 15 )

      end
      
      return 
    end


    # 
    # parser rule argsRest
    # 
    # (in Giraffe.g)
    # 56:1: argsRest : ( COMMA args | );
    # 
    def argsRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      begin
        # at line 57:2: ( COMMA args | )
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0 == COMMA )
          alt_10 = 1
        elsif ( look_10_0 == RB )
          alt_10 = 2
        else
          raise NoViableAlternative( "", 10, 0 )
        end
        case alt_10
        when 1
          # at line 57:4: COMMA args
          match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsRest_300 )
          @state.following.push( TOKENS_FOLLOWING_args_IN_argsRest_302 )
          args
          @state.following.pop

        when 2
          # at line 58:4: 

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 16 )

      end
      
      return 
    end


    # 
    # parser rule condition
    # 
    # (in Giraffe.g)
    # 62:1: condition : orOperand conditionRest ;
    # 
    def condition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )

      begin
        # at line 63:4: orOperand conditionRest
        @state.following.push( TOKENS_FOLLOWING_orOperand_IN_condition_317 )
        orOperand
        @state.following.pop
        @state.following.push( TOKENS_FOLLOWING_conditionRest_IN_condition_319 )
        conditionRest
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 17 )

      end
      
      return 
    end


    # 
    # parser rule conditionRest
    # 
    # (in Giraffe.g)
    # 65:1: conditionRest : ( OR conditionRest | );
    # 
    def conditionRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )

      begin
        # at line 66:2: ( OR conditionRest | )
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == OR )
          alt_11 = 1
        elsif ( look_11_0 == EOF || look_11_0.between?( LCB, SEMICOLON ) || look_11_0 == COMMA || look_11_0 == RB || look_11_0.between?( T__47, T__48 ) )
          alt_11 = 2
        else
          raise NoViableAlternative( "", 11, 0 )
        end
        case alt_11
        when 1
          # at line 66:4: OR conditionRest
          match( OR, TOKENS_FOLLOWING_OR_IN_conditionRest_329 )
          @state.following.push( TOKENS_FOLLOWING_conditionRest_IN_conditionRest_331 )
          conditionRest
          @state.following.pop

        when 2
          # at line 67:4: 

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 18 )

      end
      
      return 
    end


    # 
    # parser rule orOperand
    # 
    # (in Giraffe.g)
    # 71:1: orOperand : andOperand orOperandRest ;
    # 
    def orOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )

      begin
        # at line 72:4: andOperand orOperandRest
        @state.following.push( TOKENS_FOLLOWING_andOperand_IN_orOperand_346 )
        andOperand
        @state.following.pop
        @state.following.push( TOKENS_FOLLOWING_orOperandRest_IN_orOperand_348 )
        orOperandRest
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 19 )

      end
      
      return 
    end


    # 
    # parser rule orOperandRest
    # 
    # (in Giraffe.g)
    # 74:1: orOperandRest : ( AND andOperand orOperandRest | );
    # 
    def orOperandRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )

      begin
        # at line 75:2: ( AND andOperand orOperandRest | )
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == AND )
          alt_12 = 1
        elsif ( look_12_0 == EOF || look_12_0.between?( LCB, SEMICOLON ) || look_12_0 == COMMA || look_12_0.between?( RB, OR ) || look_12_0.between?( T__47, T__48 ) )
          alt_12 = 2
        else
          raise NoViableAlternative( "", 12, 0 )
        end
        case alt_12
        when 1
          # at line 75:4: AND andOperand orOperandRest
          match( AND, TOKENS_FOLLOWING_AND_IN_orOperandRest_358 )
          @state.following.push( TOKENS_FOLLOWING_andOperand_IN_orOperandRest_360 )
          andOperand
          @state.following.pop
          @state.following.push( TOKENS_FOLLOWING_orOperandRest_IN_orOperandRest_362 )
          orOperandRest
          @state.following.pop

        when 2
          # at line 76:4: 

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 20 )

      end
      
      return 
    end


    # 
    # parser rule andOperand
    # 
    # (in Giraffe.g)
    # 78:1: andOperand : boolOperand andOperandRest ;
    # 
    def andOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )

      begin
        # at line 79:4: boolOperand andOperandRest
        @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_andOperand_375 )
        boolOperand
        @state.following.pop
        @state.following.push( TOKENS_FOLLOWING_andOperandRest_IN_andOperand_377 )
        andOperandRest
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 21 )

      end
      
      return 
    end


    # 
    # parser rule andOperandRest
    # 
    # (in Giraffe.g)
    # 81:1: andOperandRest : ( boolOperator boolOperand | );
    # 
    def andOperandRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )

      begin
        # at line 82:2: ( boolOperator boolOperand | )
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0.between?( EQ, GE ) )
          alt_13 = 1
        elsif ( look_13_0 == EOF || look_13_0.between?( LCB, SEMICOLON ) || look_13_0 == COMMA || look_13_0.between?( RB, AND ) || look_13_0.between?( T__47, T__48 ) )
          alt_13 = 2
        else
          raise NoViableAlternative( "", 13, 0 )
        end
        case alt_13
        when 1
          # at line 82:4: boolOperator boolOperand
          @state.following.push( TOKENS_FOLLOWING_boolOperator_IN_andOperandRest_386 )
          boolOperator
          @state.following.pop
          @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_andOperandRest_388 )
          boolOperand
          @state.following.pop

        when 2
          # at line 83:4: 

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 22 )

      end
      
      return 
    end


    # 
    # parser rule boolOperand
    # 
    # (in Giraffe.g)
    # 85:1: boolOperand : ( bool | NOT LB condition RB | expression boolOperator ( bool | expression ) );
    # 
    def boolOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )

      begin
        # at line 86:2: ( bool | NOT LB condition RB | expression boolOperator ( bool | expression ) )
        alt_15 = 3
        case look_15 = @input.peek( 1 )
        when TRUE, FALSE then alt_15 = 1
        when NOT then alt_15 = 2
        when ID, LB, PLUS, MINUS, INT, FLOAT then alt_15 = 3
        else
          raise NoViableAlternative( "", 15, 0 )
        end
        case alt_15
        when 1
          # at line 86:4: bool
          @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_401 )
          bool
          @state.following.pop

        when 2
          # at line 87:4: NOT LB condition RB
          match( NOT, TOKENS_FOLLOWING_NOT_IN_boolOperand_406 )
          match( LB, TOKENS_FOLLOWING_LB_IN_boolOperand_408 )
          @state.following.push( TOKENS_FOLLOWING_condition_IN_boolOperand_410 )
          condition
          @state.following.pop
          match( RB, TOKENS_FOLLOWING_RB_IN_boolOperand_412 )

        when 3
          # at line 88:4: expression boolOperator ( bool | expression )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_417 )
          expression
          @state.following.pop
          @state.following.push( TOKENS_FOLLOWING_boolOperator_IN_boolOperand_419 )
          boolOperator
          @state.following.pop
          # at line 88:28: ( bool | expression )
          alt_14 = 2
          look_14_0 = @input.peek( 1 )

          if ( look_14_0.between?( TRUE, FALSE ) )
            alt_14 = 1
          elsif ( look_14_0.between?( ID, LB ) || look_14_0.between?( PLUS, FLOAT ) )
            alt_14 = 2
          else
            raise NoViableAlternative( "", 14, 0 )
          end
          case alt_14
          when 1
            # at line 88:29: bool
            @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_422 )
            bool
            @state.following.pop

          when 2
            # at line 88:36: expression
            @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_426 )
            expression
            @state.following.pop

          end

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 23 )

      end
      
      return 
    end


    # 
    # parser rule expression
    # 
    # (in Giraffe.g)
    # 91:1: expression : addOperand expressionRest ;
    # 
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )

      begin
        # at line 92:4: addOperand expressionRest
        @state.following.push( TOKENS_FOLLOWING_addOperand_IN_expression_437 )
        addOperand
        @state.following.pop
        @state.following.push( TOKENS_FOLLOWING_expressionRest_IN_expression_439 )
        expressionRest
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 24 )

      end
      
      return 
    end


    # 
    # parser rule expressionRest
    # 
    # (in Giraffe.g)
    # 94:1: expressionRest : ( addOperator addOperand expressionRest | );
    # 
    def expressionRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )

      begin
        # at line 95:2: ( addOperator addOperand expressionRest | )
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0.between?( PLUS, MINUS ) )
          alt_16 = 1
        elsif ( look_16_0 == EOF || look_16_0.between?( LCB, SEMICOLON ) || look_16_0 == COMMA || look_16_0.between?( RB, AND ) || look_16_0.between?( EQ, GE ) || look_16_0.between?( T__47, T__48 ) )
          alt_16 = 2
        else
          raise NoViableAlternative( "", 16, 0 )
        end
        case alt_16
        when 1
          # at line 95:4: addOperator addOperand expressionRest
          @state.following.push( TOKENS_FOLLOWING_addOperator_IN_expressionRest_449 )
          addOperator
          @state.following.pop
          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_expressionRest_451 )
          addOperand
          @state.following.pop
          @state.following.push( TOKENS_FOLLOWING_expressionRest_IN_expressionRest_453 )
          expressionRest
          @state.following.pop

        when 2
          # at line 96:4: 

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 25 )

      end
      
      return 
    end


    # 
    # parser rule addOperand
    # 
    # (in Giraffe.g)
    # 98:1: addOperand : mulOperand addOperandRest ;
    # 
    def addOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )

      begin
        # at line 99:4: mulOperand addOperandRest
        @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperand_466 )
        mulOperand
        @state.following.pop
        @state.following.push( TOKENS_FOLLOWING_addOperandRest_IN_addOperand_468 )
        addOperandRest
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 26 )

      end
      
      return 
    end


    # 
    # parser rule addOperandRest
    # 
    # (in Giraffe.g)
    # 101:1: addOperandRest : ( mulOperator mulOperand addOperandRest | );
    # 
    def addOperandRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )

      begin
        # at line 102:2: ( mulOperator mulOperand addOperandRest | )
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0.between?( MUL, MOD ) )
          alt_17 = 1
        elsif ( look_17_0 == EOF || look_17_0.between?( LCB, SEMICOLON ) || look_17_0 == COMMA || look_17_0.between?( RB, AND ) || look_17_0.between?( PLUS, MINUS ) || look_17_0.between?( EQ, GE ) || look_17_0.between?( T__47, T__48 ) )
          alt_17 = 2
        else
          raise NoViableAlternative( "", 17, 0 )
        end
        case alt_17
        when 1
          # at line 102:4: mulOperator mulOperand addOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperator_IN_addOperandRest_478 )
          mulOperator
          @state.following.pop
          @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperandRest_480 )
          mulOperand
          @state.following.pop
          @state.following.push( TOKENS_FOLLOWING_addOperandRest_IN_addOperandRest_482 )
          addOperandRest
          @state.following.pop

        when 2
          # at line 103:4: 

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 27 )

      end
      
      return 
    end


    # 
    # parser rule mulOperand
    # 
    # (in Giraffe.g)
    # 105:1: mulOperand : ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest );
    # 
    def mulOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )

      begin
        # at line 106:2: ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest )
        alt_18 = 3
        case look_18 = @input.peek( 1 )
        when PLUS then alt_18 = 1
        when MINUS then alt_18 = 2
        when ID, LB, INT, FLOAT then alt_18 = 3
        else
          raise NoViableAlternative( "", 18, 0 )
        end
        case alt_18
        when 1
          # at line 106:4: PLUS mulOperandRest
          match( PLUS, TOKENS_FOLLOWING_PLUS_IN_mulOperand_495 )
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_497 )
          mulOperandRest
          @state.following.pop

        when 2
          # at line 107:4: MINUS mulOperandRest
          match( MINUS, TOKENS_FOLLOWING_MINUS_IN_mulOperand_502 )
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_504 )
          mulOperandRest
          @state.following.pop

        when 3
          # at line 108:4: mulOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_509 )
          mulOperandRest
          @state.following.pop

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 28 )

      end
      
      return 
    end


    # 
    # parser rule mulOperandRest
    # 
    # (in Giraffe.g)
    # 110:1: mulOperandRest : ( ID | LB expression RB | INT | FLOAT | call );
    # 
    def mulOperandRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )

      begin
        # at line 111:2: ( ID | LB expression RB | INT | FLOAT | call )
        alt_19 = 5
        case look_19 = @input.peek( 1 )
        when ID then look_19_1 = @input.peek( 2 )

        if ( look_19_1 == LB )
          alt_19 = 5
        elsif ( look_19_1 == EOF || look_19_1.between?( LCB, SEMICOLON ) || look_19_1 == COMMA || look_19_1.between?( RB, AND ) || look_19_1.between?( PLUS, MINUS ) || look_19_1.between?( MUL, MOD ) || look_19_1.between?( EQ, GE ) || look_19_1.between?( T__47, T__48 ) )
          alt_19 = 1
        else
          raise NoViableAlternative( "", 19, 1 )
        end
        when LB then alt_19 = 2
        when INT then alt_19 = 3
        when FLOAT then alt_19 = 4
        else
          raise NoViableAlternative( "", 19, 0 )
        end
        case alt_19
        when 1
          # at line 111:4: ID
          match( ID, TOKENS_FOLLOWING_ID_IN_mulOperandRest_520 )

        when 2
          # at line 112:4: LB expression RB
          match( LB, TOKENS_FOLLOWING_LB_IN_mulOperandRest_525 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_mulOperandRest_527 )
          expression
          @state.following.pop
          match( RB, TOKENS_FOLLOWING_RB_IN_mulOperandRest_529 )

        when 3
          # at line 113:4: INT
          match( INT, TOKENS_FOLLOWING_INT_IN_mulOperandRest_534 )

        when 4
          # at line 114:4: FLOAT
          match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_mulOperandRest_539 )

        when 5
          # at line 115:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_mulOperandRest_544 )
          call
          @state.following.pop

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 29 )

      end
      
      return 
    end


    # 
    # parser rule mulOperator
    # 
    # (in Giraffe.g)
    # 117:1: mulOperator : ( MUL | DIV | MOD );
    # 
    def mulOperator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )

      begin
        # at line 
        if @input.peek( 1 ).between?( MUL, MOD )
          @input.consume
          @state.error_recovery = false
        else
          mse = MismatchedSet( nil )
          raise mse
        end



      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 30 )

      end
      
      return 
    end


    # 
    # parser rule addOperator
    # 
    # (in Giraffe.g)
    # 122:1: addOperator : ( PLUS | MINUS );
    # 
    def addOperator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )

      begin
        # at line 
        if @input.peek( 1 ).between?( PLUS, MINUS )
          @input.consume
          @state.error_recovery = false
        else
          mse = MismatchedSet( nil )
          raise mse
        end



      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 31 )

      end
      
      return 
    end


    # 
    # parser rule value
    # 
    # (in Giraffe.g)
    # 126:1: value : ( expression | STRING | CHAR );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )

      begin
        # at line 127:2: ( expression | STRING | CHAR )
        alt_20 = 3
        case look_20 = @input.peek( 1 )
        when ID, LB, PLUS, MINUS, INT, FLOAT then alt_20 = 1
        when STRING then alt_20 = 2
        when CHAR then alt_20 = 3
        else
          raise NoViableAlternative( "", 20, 0 )
        end
        case alt_20
        when 1
          # at line 127:5: expression
          @state.following.push( TOKENS_FOLLOWING_expression_IN_value_589 )
          expression
          @state.following.pop

        when 2
          # at line 128:4: STRING
          match( STRING, TOKENS_FOLLOWING_STRING_IN_value_595 )

        when 3
          # at line 129:4: CHAR
          match( CHAR, TOKENS_FOLLOWING_CHAR_IN_value_600 )

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 32 )

      end
      
      return 
    end


    # 
    # parser rule assignment
    # 
    # (in Giraffe.g)
    # 131:1: assignment : ID ( PLUS | MINUS | MUL | MOD | DIV | ) ASSIGN value ;
    # 
    def assignment
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )

      begin
        # at line 132:4: ID ( PLUS | MINUS | MUL | MOD | DIV | ) ASSIGN value
        match( ID, TOKENS_FOLLOWING_ID_IN_assignment_610 )
        # at line 132:7: ( PLUS | MINUS | MUL | MOD | DIV | )
        alt_21 = 6
        case look_21 = @input.peek( 1 )
        when PLUS then alt_21 = 1
        when MINUS then alt_21 = 2
        when MUL then alt_21 = 3
        when MOD then alt_21 = 4
        when DIV then alt_21 = 5
        when ASSIGN then alt_21 = 6
        else
          raise NoViableAlternative( "", 21, 0 )
        end
        case alt_21
        when 1
          # at line 132:8: PLUS
          match( PLUS, TOKENS_FOLLOWING_PLUS_IN_assignment_613 )

        when 2
          # at line 132:15: MINUS
          match( MINUS, TOKENS_FOLLOWING_MINUS_IN_assignment_617 )

        when 3
          # at line 132:23: MUL
          match( MUL, TOKENS_FOLLOWING_MUL_IN_assignment_621 )

        when 4
          # at line 132:29: MOD
          match( MOD, TOKENS_FOLLOWING_MOD_IN_assignment_625 )

        when 5
          # at line 132:35: DIV
          match( DIV, TOKENS_FOLLOWING_DIV_IN_assignment_629 )

        when 6
          # at line 132:41: 

        end
        match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_635 )
        @state.following.push( TOKENS_FOLLOWING_value_IN_assignment_637 )
        value
        @state.following.pop

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 33 )

      end
      
      return 
    end


    # 
    # parser rule boolOperator
    # 
    # (in Giraffe.g)
    # 134:1: boolOperator : ( EQ | NE | LT | GT | LE | GE );
    # 
    def boolOperator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )

      begin
        # at line 
        if @input.peek( 1 ).between?( EQ, GE )
          @input.consume
          @state.error_recovery = false
        else
          mse = MismatchedSet( nil )
          raise mse
        end



      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 34 )

      end
      
      return 
    end


    # 
    # parser rule bool
    # 
    # (in Giraffe.g)
    # 137:1: bool : ( TRUE | FALSE );
    # 
    def bool
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )

      begin
        # at line 
        if @input.peek( 1 ).between?( TRUE, FALSE )
          @input.consume
          @state.error_recovery = false
        else
          mse = MismatchedSet( nil )
          raise mse
        end



      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 35 )

      end
      
      return 
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA5 < ANTLR3::DFA
      EOT = unpack( 11, -1 )
      EOF = unpack( 1, 7, 10, -1 )
      MIN = unpack( 2, 4, 9, -1 )
      MAX = unpack( 1, 48, 1, 31, 9, -1 )
      ACCEPT = unpack( 2, -1, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 1, 2, 
                       1, 1, 1, 3 )
      SPECIAL = unpack( 11, -1 )
      TRANSITION = [
        unpack( 1, 2, 3, 7, 1, 4, 3, -1, 1, 5, 1, 6, 1, 3, 1, -1, 1, 1, 
                30, -1, 2, 7 ),
        unpack( 1, 10, 11, -1, 1, 10, 1, 8, 4, -1, 2, 9, 2, -1, 3, 9, 2, 
                 -1, 1, 9 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
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
      
      @decision = 5
      

      def description
        <<-'__dfa_description__'.strip!
          16:1: instruction : ( assignment | call | func | env | forCycle | ifInstruction | whileCycle | doCycle | );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa5 = DFA5.new( self, 5 )

    end
    TOKENS_FOLLOWING_block_IN_program_22 = Set[ 1 ]
    TOKENS_FOLLOWING_LCB_IN_env_30 = Set[ 4, 6, 7, 8, 12, 13, 14, 16, 47, 48 ]
    TOKENS_FOLLOWING_block_IN_env_32 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_env_34 = Set[ 1 ]
    TOKENS_FOLLOWING_instruction_IN_block_43 = Set[ 6, 7, 47, 48 ]
    TOKENS_FOLLOWING_instructionRest_IN_block_45 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_instructionRest_58 = Set[ 47, 48 ]
    TOKENS_FOLLOWING_T__47_IN_instructionRest_61 = Set[ 48 ]
    TOKENS_FOLLOWING_T__48_IN_instructionRest_64 = Set[ 4, 6, 7, 8, 12, 13, 14, 16, 47, 48 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_69 = Set[ 4, 6, 7, 8, 12, 13, 14, 16, 47, 48 ]
    TOKENS_FOLLOWING_block_IN_instructionRest_72 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_IN_instruction_85 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_instruction_90 = Set[ 1 ]
    TOKENS_FOLLOWING_func_IN_instruction_95 = Set[ 1 ]
    TOKENS_FOLLOWING_env_IN_instruction_100 = Set[ 1 ]
    TOKENS_FOLLOWING_forCycle_IN_instruction_105 = Set[ 1 ]
    TOKENS_FOLLOWING_ifInstruction_IN_instruction_110 = Set[ 1 ]
    TOKENS_FOLLOWING_whileCycle_IN_instruction_115 = Set[ 1 ]
    TOKENS_FOLLOWING_doCycle_IN_instruction_120 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_ifInstruction_135 = Set[ 16, 17, 21, 22, 23, 24, 25, 38, 39 ]
    TOKENS_FOLLOWING_condition_IN_ifInstruction_137 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_ifInstruction_139 = Set[ 9, 10, 11 ]
    TOKENS_FOLLOWING_ifRest_IN_ifInstruction_141 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_ifRest_149 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_ifRest_151 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_ifRest_156 = Set[ 16, 17, 21, 22, 23, 24, 25, 38, 39 ]
    TOKENS_FOLLOWING_condition_IN_ifRest_164 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_ifRest_166 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_whileCycle_180 = Set[ 16, 17, 21, 22, 23, 24, 25, 38, 39 ]
    TOKENS_FOLLOWING_condition_IN_whileCycle_182 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_whileCycle_184 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_doCycle_192 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_doCycle_194 = Set[ 12 ]
    TOKENS_FOLLOWING_WHILE_IN_doCycle_196 = Set[ 16, 17, 21, 22, 23, 24, 25, 38, 39 ]
    TOKENS_FOLLOWING_condition_IN_doCycle_198 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_forCycle_207 = Set[ 16 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_209 = Set[ 15 ]
    TOKENS_FOLLOWING_COMMA_IN_forCycle_211 = Set[ 16, 17, 21, 22, 23, 24, 25, 38, 39 ]
    TOKENS_FOLLOWING_condition_IN_forCycle_213 = Set[ 15 ]
    TOKENS_FOLLOWING_COMMA_IN_forCycle_215 = Set[ 16 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_217 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_forCycle_219 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_func_229 = Set[ 4, 16 ]
    TOKENS_FOLLOWING_params_IN_func_231 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_func_234 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_params_242 = Set[ 15 ]
    TOKENS_FOLLOWING_paramRest_IN_params_244 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_paramRest_253 = Set[ 16 ]
    TOKENS_FOLLOWING_params_IN_paramRest_255 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_call_269 = Set[ 17 ]
    TOKENS_FOLLOWING_LB_IN_call_271 = Set[ 16, 17, 18, 21, 22, 23, 24, 25, 38, 39 ]
    TOKENS_FOLLOWING_args_IN_call_273 = Set[ 18 ]
    TOKENS_FOLLOWING_RB_IN_call_276 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_args_287 = Set[ 15 ]
    TOKENS_FOLLOWING_argsRest_IN_args_289 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsRest_300 = Set[ 16, 17, 21, 22, 23, 24, 25, 38, 39 ]
    TOKENS_FOLLOWING_args_IN_argsRest_302 = Set[ 1 ]
    TOKENS_FOLLOWING_orOperand_IN_condition_317 = Set[ 19 ]
    TOKENS_FOLLOWING_conditionRest_IN_condition_319 = Set[ 1 ]
    TOKENS_FOLLOWING_OR_IN_conditionRest_329 = Set[ 19 ]
    TOKENS_FOLLOWING_conditionRest_IN_conditionRest_331 = Set[ 1 ]
    TOKENS_FOLLOWING_andOperand_IN_orOperand_346 = Set[ 20 ]
    TOKENS_FOLLOWING_orOperandRest_IN_orOperand_348 = Set[ 1 ]
    TOKENS_FOLLOWING_AND_IN_orOperandRest_358 = Set[ 16, 17, 21, 22, 23, 24, 25, 38, 39 ]
    TOKENS_FOLLOWING_andOperand_IN_orOperandRest_360 = Set[ 20 ]
    TOKENS_FOLLOWING_orOperandRest_IN_orOperandRest_362 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperand_IN_andOperand_375 = Set[ 32, 33, 34, 35, 36, 37 ]
    TOKENS_FOLLOWING_andOperandRest_IN_andOperand_377 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperator_IN_andOperandRest_386 = Set[ 16, 17, 21, 22, 23, 24, 25, 38, 39 ]
    TOKENS_FOLLOWING_boolOperand_IN_andOperandRest_388 = Set[ 1 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_401 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_boolOperand_406 = Set[ 17 ]
    TOKENS_FOLLOWING_LB_IN_boolOperand_408 = Set[ 16, 17, 21, 22, 23, 24, 25, 38, 39 ]
    TOKENS_FOLLOWING_condition_IN_boolOperand_410 = Set[ 18 ]
    TOKENS_FOLLOWING_RB_IN_boolOperand_412 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_417 = Set[ 32, 33, 34, 35, 36, 37 ]
    TOKENS_FOLLOWING_boolOperator_IN_boolOperand_419 = Set[ 16, 17, 21, 22, 23, 24, 25, 38, 39 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_422 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_426 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperand_IN_expression_437 = Set[ 22, 23 ]
    TOKENS_FOLLOWING_expressionRest_IN_expression_439 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperator_IN_expressionRest_449 = Set[ 16, 17, 21, 22, 23, 24, 25, 38, 39 ]
    TOKENS_FOLLOWING_addOperand_IN_expressionRest_451 = Set[ 22, 23 ]
    TOKENS_FOLLOWING_expressionRest_IN_expressionRest_453 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperand_466 = Set[ 26, 27, 28 ]
    TOKENS_FOLLOWING_addOperandRest_IN_addOperand_468 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperator_IN_addOperandRest_478 = Set[ 16, 17, 21, 22, 23, 24, 25, 38, 39 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperandRest_480 = Set[ 26, 27, 28 ]
    TOKENS_FOLLOWING_addOperandRest_IN_addOperandRest_482 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_mulOperand_495 = Set[ 16, 17, 21, 22, 23, 24, 25, 38, 39 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_497 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_mulOperand_502 = Set[ 16, 17, 21, 22, 23, 24, 25, 38, 39 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_504 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_509 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_mulOperandRest_520 = Set[ 1 ]
    TOKENS_FOLLOWING_LB_IN_mulOperandRest_525 = Set[ 16, 17, 21, 22, 23, 24, 25, 38, 39 ]
    TOKENS_FOLLOWING_expression_IN_mulOperandRest_527 = Set[ 18 ]
    TOKENS_FOLLOWING_RB_IN_mulOperandRest_529 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_mulOperandRest_534 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_mulOperandRest_539 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_mulOperandRest_544 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_mulOperator_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_addOperator_0 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_value_589 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_value_595 = Set[ 1 ]
    TOKENS_FOLLOWING_CHAR_IN_value_600 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_610 = Set[ 22, 23, 26, 27, 28, 31 ]
    TOKENS_FOLLOWING_PLUS_IN_assignment_613 = Set[ 31 ]
    TOKENS_FOLLOWING_MINUS_IN_assignment_617 = Set[ 31 ]
    TOKENS_FOLLOWING_MUL_IN_assignment_621 = Set[ 31 ]
    TOKENS_FOLLOWING_MOD_IN_assignment_625 = Set[ 31 ]
    TOKENS_FOLLOWING_DIV_IN_assignment_629 = Set[ 31 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_635 = Set[ 16, 17, 21, 22, 23, 24, 25, 29, 30, 38, 39 ]
    TOKENS_FOLLOWING_value_IN_assignment_637 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_boolOperator_0 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_bool_0 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end


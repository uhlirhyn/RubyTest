#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-11-12 23:12:53
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

# - - - - - - begin action @parser::header - - - - - -
# Giraffe.g


require './lib/giraffe/tree/programTree.rb'
require './lib/giraffe/tree/envTree.rb'
require './lib/giraffe/tree/assignTree.rb'
require './lib/giraffe/tree/printTree.rb'
require './lib/giraffe/tree/ifTree.rb'
require './lib/giraffe/tree/whileTree.rb'
require './lib/giraffe/tree/doTree.rb'
require './lib/giraffe/tree/forTree.rb'
require './lib/giraffe/tree/funcTree.rb'
require './lib/giraffe/tree/callTree.rb'
require './lib/giraffe/tree/binaryOperatorTree.rb'
require './lib/giraffe/tree/unaryOperatorTree.rb'
require './lib/giraffe/tree/atomTree.rb'
require './lib/giraffe/tree/varTree.rb'
require './lib/giraffe/tree/exitTree.rb'
require './lib/giraffe/tree/returnTree.rb'
require './lib/giraffe/tree/breakTree.rb'
require './lib/giraffe/operators.rb'

# - - - - - - end action @parser::header - - - - - - -


module Giraffe
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :EXPONENT => 46, :LT => 35, :RB => 12, :WHILE => 24, 
                   :MOD => 41, :OCTAL_ESC => 51, :CHAR => 29, :DO => 25, 
                   :FOR => 26, :FLOAT => 42, :NOT => 32, :RCB => 5, :ID => 28, 
                   :AND => 31, :EOF => -1, :BREAK => 8, :IF => 20, :ESC_SEQ => 48, 
                   :T__53 => 53, :T__54 => 54, :LCB => 4, :COMMA => 27, 
                   :PRINTLN => 19, :RETURN => 9, :PLUS => 13, :EQ => 33, 
                   :COMMENT => 6, :NE => 34, :EXIT => 10, :GE => 38, :UNICODE_ESC => 50, 
                   :ELSE => 21, :HEX_DIGIT => 49, :INT => 15, :SEMICOLON => 7, 
                   :MINUS => 14, :TRUE => 44, :MUL => 39, :PRINT => 16, 
                   :PRINTL => 18, :ELSEIF => 22, :COLON => 52, :ELIF => 23, 
                   :WS => 47, :OR => 30, :ASSIGN => 43, :GT => 36, :LB => 11, 
                   :DIV => 40, :FALSE => 45, :LE => 37, :STRING => 17 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "LCB", "RCB", "COMMENT", "SEMICOLON", "BREAK", "RETURN", 
                    "EXIT", "LB", "RB", "PLUS", "MINUS", "INT", "PRINT", 
                    "STRING", "PRINTL", "PRINTLN", "IF", "ELSE", "ELSEIF", 
                    "ELIF", "WHILE", "DO", "FOR", "COMMA", "ID", "CHAR", 
                    "OR", "AND", "NOT", "EQ", "NE", "LT", "GT", "LE", "GE", 
                    "MUL", "DIV", "MOD", "FLOAT", "ASSIGN", "TRUE", "FALSE", 
                    "EXPONENT", "WS", "ESC_SEQ", "HEX_DIGIT", "UNICODE_ESC", 
                    "OCTAL_ESC", "COLON", "'\\r'", "'\\n'" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = Giraffe
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :program, :env, :block, :instructionRest, :instruction, 
                     :breakInstruction, :returnInstruction, :exitInstruction, 
                     :statusCode, :printInstruction, :printlInstruction, 
                     :ifInstruction, :ifRest, :whileCycle, :doCycle, :forCycle, 
                     :func, :params, :paramRest, :call, :args, :argsRest, 
                     :condition, :orOperand, :boolOperand, :expression, 
                     :addOperand, :mulOperand, :mulOperandRest, :value, 
                     :assignment, :bool ].freeze


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
    ProgramReturnValue = define_return_scope :result

    # 
    # parser rule program
    # 
    # (in Giraffe.g)
    # 34:1: program returns [result] : block ;
    # 
    def program
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )
      return_value = ProgramReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      block1 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 35:4: block
        @state.following.push( TOKENS_FOLLOWING_block_IN_program_49 )
        block1 = block
        @state.following.pop
        @adaptor.add_child( root_0, block1.tree )
        # --> action
        return_value.result = ProgramTree.new(( block1.nil? ? nil : block1.list ))
        # <-- action
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 1 )

      end
      
      return return_value
    end

    EnvReturnValue = define_return_scope :result

    # 
    # parser rule env
    # 
    # (in Giraffe.g)
    # 37:1: env returns [result] : LCB block RCB ;
    # 
    def env
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )
      return_value = EnvReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __LCB2__ = nil
      __RCB4__ = nil
      block3 = nil

      tree_for_LCB2 = nil
      tree_for_RCB4 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 38:4: LCB block RCB
        __LCB2__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_env_64 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_env_70 )
        block3 = block
        @state.following.pop
        @adaptor.add_child( root_0, block3.tree )
        # --> action
        return_value.result = EnvTree.new(( block3.nil? ? nil : block3.list ))
        # <-- action
        __RCB4__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_env_76 )
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 2 )

      end
      
      return return_value
    end

    BlockReturnValue = define_return_scope :list

    # 
    # parser rule block
    # 
    # (in Giraffe.g)
    # 43:1: block returns [list] : instruction instructionRest ;
    # 
    def block
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )
      return_value = BlockReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      instruction5 = nil
      instructionRest6 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 44:4: instruction instructionRest
        # --> action
        return_value.list = []
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_instruction_IN_block_96 )
        instruction5 = instruction
        @state.following.pop
        @adaptor.add_child( root_0, instruction5.tree )
        # --> action
        return_value.list = [( instruction5.nil? ? nil : instruction5.result )] unless ( instruction5.nil? ? nil : instruction5.result ) == nil
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_instructionRest_IN_block_106 )
        instructionRest6 = instructionRest
        @state.following.pop
        @adaptor.add_child( root_0, instructionRest6.tree )
        # --> action
        return_value.list = return_value.list + ( instructionRest6.nil? ? nil : instructionRest6.list )
        # <-- action
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 3 )

      end
      
      return return_value
    end

    InstructionRestReturnValue = define_return_scope :list

    # 
    # parser rule instructionRest
    # 
    # (in Giraffe.g)
    # 51:1: instructionRest returns [list] : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) instruction op= instructionRest | );
    # 
    def instructionRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )
      return_value = InstructionRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMENT7__ = nil
      char_literal8 = nil
      char_literal9 = nil
      __SEMICOLON10__ = nil
      op = nil
      instruction11 = nil

      tree_for_COMMENT7 = nil
      tree_for_char_literal8 = nil
      tree_for_char_literal9 = nil
      tree_for_SEMICOLON10 = nil

      begin
        # at line 52:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) instruction op= instructionRest | )
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0.between?( COMMENT, SEMICOLON ) || look_4_0.between?( T__53, T__54 ) )
          alt_4 = 1
        elsif ( look_4_0 == EOF || look_4_0 == RCB )
          alt_4 = 2
        else
          raise NoViableAlternative( "", 4, 0 )
        end
        case alt_4
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 52:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) instruction op= instructionRest
          # --> action
          return_value.list = []
          # <-- action
          # at line 53:3: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0 == COMMENT || look_3_0.between?( T__53, T__54 ) )
            alt_3 = 1
          elsif ( look_3_0 == SEMICOLON )
            alt_3 = 2
          else
            raise NoViableAlternative( "", 3, 0 )
          end
          case alt_3
          when 1
            # at line 53:4: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 53:4: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 53:6: ( COMMENT )? ( '\\r' )? '\\n'
            # at line 53:13: ( COMMENT )?
            alt_1 = 2
            look_1_0 = @input.peek( 1 )

            if ( look_1_0 == COMMENT )
              alt_1 = 1
            end
            case alt_1
            when 1
              # at line 53:13: COMMENT
              __COMMENT7__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_instructionRest_136 )

            end
            # at line 53:20: ( '\\r' )?
            alt_2 = 2
            look_2_0 = @input.peek( 1 )

            if ( look_2_0 == T__53 )
              alt_2 = 1
            end
            case alt_2
            when 1
              # at line 53:20: '\\r'
              char_literal8 = match( T__53, TOKENS_FOLLOWING_T__53_IN_instructionRest_140 )

            end
            char_literal9 = match( T__54, TOKENS_FOLLOWING_T__54_IN_instructionRest_144 )


          when 2
            # at line 53:32: SEMICOLON
            __SEMICOLON10__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_150 )

          end
          @state.following.push( TOKENS_FOLLOWING_instruction_IN_instructionRest_157 )
          instruction11 = instruction
          @state.following.pop
          @adaptor.add_child( root_0, instruction11.tree )
          # --> action
          return_value.list = [( instruction11.nil? ? nil : instruction11.result )] unless ( instruction11.nil? ? nil : instruction11.result ) == nil
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_instructionRest_IN_instructionRest_170 )
          op = instructionRest
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.list = return_value.list + ( op.nil? ? nil : op.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 58:4: 
          # --> action
          return_value.list = []
          # <-- action

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 4 )

      end
      
      return return_value
    end

    InstructionReturnValue = define_return_scope :result

    # 
    # parser rule instruction
    # 
    # (in Giraffe.g)
    # 61:1: instruction returns [result] : ( assignment | call | func | env | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | );
    # 
    def instruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      return_value = InstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      assignment12 = nil
      call13 = nil
      func14 = nil
      env15 = nil
      forCycle16 = nil
      ifInstruction17 = nil
      whileCycle18 = nil
      doCycle19 = nil
      printInstruction20 = nil
      printlInstruction21 = nil
      returnInstruction22 = nil
      exitInstruction23 = nil
      breakInstruction24 = nil


      begin
        # at line 62:2: ( assignment | call | func | env | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | )
        alt_5 = 14
        alt_5 = @dfa5.predict( @input )
        case alt_5
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 62:4: assignment
          @state.following.push( TOKENS_FOLLOWING_assignment_IN_instruction_198 )
          assignment12 = assignment
          @state.following.pop
          @adaptor.add_child( root_0, assignment12.tree )
          # --> action
          return_value.result = ( assignment12.nil? ? nil : assignment12.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 63:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_instruction_205 )
          call13 = call
          @state.following.pop
          @adaptor.add_child( root_0, call13.tree )
          # --> action
          return_value.result = ( call13.nil? ? nil : call13.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 64:4: func
          @state.following.push( TOKENS_FOLLOWING_func_IN_instruction_212 )
          func14 = func
          @state.following.pop
          @adaptor.add_child( root_0, func14.tree )
          # --> action
          return_value.result = ( func14.nil? ? nil : func14.result )
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 65:4: env
          @state.following.push( TOKENS_FOLLOWING_env_IN_instruction_219 )
          env15 = env
          @state.following.pop
          @adaptor.add_child( root_0, env15.tree )
          # --> action
          return_value.result = ( env15.nil? ? nil : env15.result )
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 66:4: forCycle
          @state.following.push( TOKENS_FOLLOWING_forCycle_IN_instruction_226 )
          forCycle16 = forCycle
          @state.following.pop
          @adaptor.add_child( root_0, forCycle16.tree )
          # --> action
          return_value.result = ( forCycle16.nil? ? nil : forCycle16.result )
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 67:4: ifInstruction
          @state.following.push( TOKENS_FOLLOWING_ifInstruction_IN_instruction_233 )
          ifInstruction17 = ifInstruction
          @state.following.pop
          @adaptor.add_child( root_0, ifInstruction17.tree )
          # --> action
          return_value.result = ( ifInstruction17.nil? ? nil : ifInstruction17.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 68:4: whileCycle
          @state.following.push( TOKENS_FOLLOWING_whileCycle_IN_instruction_240 )
          whileCycle18 = whileCycle
          @state.following.pop
          @adaptor.add_child( root_0, whileCycle18.tree )
          # --> action
          return_value.result = ( whileCycle18.nil? ? nil : whileCycle18.result )
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 69:4: doCycle
          @state.following.push( TOKENS_FOLLOWING_doCycle_IN_instruction_247 )
          doCycle19 = doCycle
          @state.following.pop
          @adaptor.add_child( root_0, doCycle19.tree )
          # --> action
          return_value.result = ( doCycle19.nil? ? nil : doCycle19.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 70:4: printInstruction
          @state.following.push( TOKENS_FOLLOWING_printInstruction_IN_instruction_254 )
          printInstruction20 = printInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printInstruction20.tree )
          # --> action
          return_value.result = ( printInstruction20.nil? ? nil : printInstruction20.result )
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 71:4: printlInstruction
          @state.following.push( TOKENS_FOLLOWING_printlInstruction_IN_instruction_261 )
          printlInstruction21 = printlInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printlInstruction21.tree )
          # --> action
          return_value.result = ( printlInstruction21.nil? ? nil : printlInstruction21.result )
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 72:4: returnInstruction
          @state.following.push( TOKENS_FOLLOWING_returnInstruction_IN_instruction_268 )
          returnInstruction22 = returnInstruction
          @state.following.pop
          @adaptor.add_child( root_0, returnInstruction22.tree )
          # --> action
          return_value.result = ( returnInstruction22.nil? ? nil : returnInstruction22.result )
          # <-- action

        when 12
          root_0 = @adaptor.create_flat_list


          # at line 73:4: exitInstruction
          @state.following.push( TOKENS_FOLLOWING_exitInstruction_IN_instruction_276 )
          exitInstruction23 = exitInstruction
          @state.following.pop
          @adaptor.add_child( root_0, exitInstruction23.tree )
          # --> action
          return_value.result = ( exitInstruction23.nil? ? nil : exitInstruction23.result )
          # <-- action

        when 13
          root_0 = @adaptor.create_flat_list


          # at line 74:4: breakInstruction
          @state.following.push( TOKENS_FOLLOWING_breakInstruction_IN_instruction_283 )
          breakInstruction24 = breakInstruction
          @state.following.pop
          @adaptor.add_child( root_0, breakInstruction24.tree )
          # --> action
          return_value.result = $exitInstruction.result
          # <-- action

        when 14
          root_0 = @adaptor.create_flat_list


          # at line 75:4: 
          # --> action
          return_value.result = nil
          # <-- action

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 5 )

      end
      
      return return_value
    end

    BreakInstructionReturnValue = define_return_scope :result

    # 
    # parser rule breakInstruction
    # 
    # (in Giraffe.g)
    # 78:1: breakInstruction returns [result] : BREAK ;
    # 
    def breakInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      return_value = BreakInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BREAK25__ = nil

      tree_for_BREAK25 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 79:4: BREAK
        __BREAK25__ = match( BREAK, TOKENS_FOLLOWING_BREAK_IN_breakInstruction_306 )

        tree_for_BREAK25 = @adaptor.create_with_payload( __BREAK25__ )
        @adaptor.add_child( root_0, tree_for_BREAK25 )

        # --> action
        return_value.result = BreakTree.new
        # <-- action
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 6 )

      end
      
      return return_value
    end

    ReturnInstructionReturnValue = define_return_scope :result

    # 
    # parser rule returnInstruction
    # 
    # (in Giraffe.g)
    # 82:1: returnInstruction returns [result] : RETURN expression ;
    # 
    def returnInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )
      return_value = ReturnInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __RETURN26__ = nil
      expression27 = nil

      tree_for_RETURN26 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 83:4: RETURN expression
        __RETURN26__ = match( RETURN, TOKENS_FOLLOWING_RETURN_IN_returnInstruction_323 )

        tree_for_RETURN26 = @adaptor.create_with_payload( __RETURN26__ )
        root_0 = @adaptor.become_root( tree_for_RETURN26, root_0 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_returnInstruction_326 )
        expression27 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression27.tree )
        # --> action
        return_value.result = ReturnTree.new(( expression27.nil? ? nil : expression27.result ))
        # <-- action
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 7 )

      end
      
      return return_value
    end

    ExitInstructionReturnValue = define_return_scope :result

    # 
    # parser rule exitInstruction
    # 
    # (in Giraffe.g)
    # 86:1: exitInstruction returns [result] : EXIT ( LB alt1= statusCode RB | alt2= statusCode )? ;
    # 
    def exitInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      return_value = ExitInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __EXIT28__ = nil
      __LB29__ = nil
      __RB30__ = nil
      alt1 = nil
      alt2 = nil

      tree_for_EXIT28 = nil
      tree_for_LB29 = nil
      tree_for_RB30 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 87:4: EXIT ( LB alt1= statusCode RB | alt2= statusCode )?
        __EXIT28__ = match( EXIT, TOKENS_FOLLOWING_EXIT_IN_exitInstruction_343 )

        tree_for_EXIT28 = @adaptor.create_with_payload( __EXIT28__ )
        root_0 = @adaptor.become_root( tree_for_EXIT28, root_0 )

        # at line 87:11: ( LB alt1= statusCode RB | alt2= statusCode )?
        alt_6 = 3
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == LB )
          alt_6 = 1
        elsif ( look_6_0.between?( PLUS, INT ) )
          alt_6 = 2
        end
        case alt_6
        when 1
          # at line 87:12: LB alt1= statusCode RB
          __LB29__ = match( LB, TOKENS_FOLLOWING_LB_IN_exitInstruction_348 )
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_353 )
          alt1 = statusCode
          @state.following.pop
          @adaptor.add_child( root_0, alt1.tree )
          __RB30__ = match( RB, TOKENS_FOLLOWING_RB_IN_exitInstruction_355 )
          # --> action
          return_value.result = ExitTree.new(( alt1.nil? ? nil : alt1.result ))
          # <-- action

        when 2
          # at line 88:6: alt2= statusCode
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_368 )
          alt2 = statusCode
          @state.following.pop
          @adaptor.add_child( root_0, alt2.tree )
          # --> action
          return_value.result = ExitTree.new(( alt2.nil? ? nil : alt2.result ))
          # <-- action

        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 8 )

      end
      
      return return_value
    end

    StatusCodeReturnValue = define_return_scope :result

    # 
    # parser rule statusCode
    # 
    # (in Giraffe.g)
    # 91:1: statusCode returns [result] : ( PLUS | MINUS )? INT ;
    # 
    def statusCode
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = StatusCodeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS31__ = nil
      __MINUS32__ = nil
      __INT33__ = nil

      tree_for_PLUS31 = nil
      tree_for_MINUS32 = nil
      tree_for_INT33 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 92:4: ( PLUS | MINUS )? INT
        # --> action
        sign = ""
        # <-- action
        # at line 93:3: ( PLUS | MINUS )?
        alt_7 = 3
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == PLUS )
          alt_7 = 1
        elsif ( look_7_0 == MINUS )
          alt_7 = 2
        end
        case alt_7
        when 1
          # at line 93:4: PLUS
          __PLUS31__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_statusCode_393 )

          tree_for_PLUS31 = @adaptor.create_with_payload( __PLUS31__ )
          @adaptor.add_child( root_0, tree_for_PLUS31 )


        when 2
          # at line 93:11: MINUS
          __MINUS32__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_statusCode_397 )

          tree_for_MINUS32 = @adaptor.create_with_payload( __MINUS32__ )
          @adaptor.add_child( root_0, tree_for_MINUS32 )

          # --> action
          sign = __MINUS32__.text
          # <-- action

        end
        __INT33__ = match( INT, TOKENS_FOLLOWING_INT_IN_statusCode_403 )

        tree_for_INT33 = @adaptor.create_with_payload( __INT33__ )
        @adaptor.add_child( root_0, tree_for_INT33 )

        # --> action
        (sign + __INT33__.text).to_i
        # <-- action
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 9 )

      end
      
      return return_value
    end

    PrintInstructionReturnValue = define_return_scope :result

    # 
    # parser rule printInstruction
    # 
    # (in Giraffe.g)
    # 97:1: printInstruction returns [result] : PRINT ( STRING | expression ) ;
    # 
    def printInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = PrintInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PRINT34__ = nil
      __STRING35__ = nil
      expression36 = nil

      tree_for_PRINT34 = nil
      tree_for_STRING35 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 98:5: PRINT ( STRING | expression )
        __PRINT34__ = match( PRINT, TOKENS_FOLLOWING_PRINT_IN_printInstruction_424 )

        tree_for_PRINT34 = @adaptor.create_with_payload( __PRINT34__ )
        root_0 = @adaptor.become_root( tree_for_PRINT34, root_0 )

        # at line 98:13: ( STRING | expression )
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == STRING )
          alt_8 = 1
        elsif ( look_8_0 == LB || look_8_0.between?( PLUS, INT ) || look_8_0 == ID || look_8_0 == FLOAT )
          alt_8 = 2
        else
          raise NoViableAlternative( "", 8, 0 )
        end
        case alt_8
        when 1
          # at line 98:15: STRING
          __STRING35__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_printInstruction_430 )

          tree_for_STRING35 = @adaptor.create_with_payload( __STRING35__ )
          @adaptor.add_child( root_0, tree_for_STRING35 )

          # --> action
          return_value.result = PrintTree.new(AtomTree.new(__STRING35__.text))
          # <-- action

        when 2
          # at line 99:7: expression
          @state.following.push( TOKENS_FOLLOWING_expression_IN_printInstruction_440 )
          expression36 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression36.tree )
          # --> action
          return_value.result = PrintTree.new(( expression36.nil? ? nil : expression36.result ))
          # <-- action

        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 10 )

      end
      
      return return_value
    end

    PrintlInstructionReturnValue = define_return_scope :result

    # 
    # parser rule printlInstruction
    # 
    # (in Giraffe.g)
    # 103:1: printlInstruction returns [result] : ( PRINTL | PRINTLN ) ( STRING | expression ) ;
    # 
    def printlInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = PrintlInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set37 = nil
      __STRING38__ = nil
      expression39 = nil

      tree_for_set37 = nil
      tree_for_STRING38 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 104:5: ( PRINTL | PRINTLN ) ( STRING | expression )
        set37 = @input.look
        set37 = @input.look
        if @input.peek( 1 ).between?( PRINTL, PRINTLN )
          @input.consume
          root_0 = @adaptor.become_root( @adaptor.create_with_payload( set37 ), root_0 )
          @state.error_recovery = false
        else
          mse = MismatchedSet( nil )
          raise mse
        end


        # at line 105:4: ( STRING | expression )
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == STRING )
          alt_9 = 1
        elsif ( look_9_0 == LB || look_9_0.between?( PLUS, INT ) || look_9_0 == ID || look_9_0 == FLOAT )
          alt_9 = 2
        else
          raise NoViableAlternative( "", 9, 0 )
        end
        case alt_9
        when 1
          # at line 105:6: STRING
          __STRING38__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_printlInstruction_483 )

          tree_for_STRING38 = @adaptor.create_with_payload( __STRING38__ )
          @adaptor.add_child( root_0, tree_for_STRING38 )

          # --> action
          return_value.result = PrintTree.new(AtomTree.new(__STRING38__.text),true)
          # <-- action

        when 2
          # at line 106:6: expression
          @state.following.push( TOKENS_FOLLOWING_expression_IN_printlInstruction_492 )
          expression39 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression39.tree )
          # --> action
          return_value.result = PrintTree.new(( expression39.nil? ? nil : expression39.result ),true)
          # <-- action

        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 11 )

      end
      
      return return_value
    end

    IfInstructionReturnValue = define_return_scope :result

    # 
    # parser rule ifInstruction
    # 
    # (in Giraffe.g)
    # 110:1: ifInstruction returns [result] : IF condition LCB block RCB ifRest ;
    # 
    def ifInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = IfInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __IF40__ = nil
      __LCB42__ = nil
      __RCB44__ = nil
      condition41 = nil
      block43 = nil
      ifRest45 = nil

      tree_for_IF40 = nil
      tree_for_LCB42 = nil
      tree_for_RCB44 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 111:4: IF condition LCB block RCB ifRest
        __IF40__ = match( IF, TOKENS_FOLLOWING_IF_IN_ifInstruction_519 )

        tree_for_IF40 = @adaptor.create_with_payload( __IF40__ )
        root_0 = @adaptor.become_root( tree_for_IF40, root_0 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_ifInstruction_522 )
        condition41 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition41.tree )
        __LCB42__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifInstruction_524 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_ifInstruction_527 )
        block43 = block
        @state.following.pop
        @adaptor.add_child( root_0, block43.tree )
        __RCB44__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifInstruction_529 )
        @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifInstruction_532 )
        ifRest45 = ifRest
        @state.following.pop
        @adaptor.add_child( root_0, ifRest45.tree )
        # --> action
        return_value.result = IfTree.new(( condition41.nil? ? nil : condition41.result ),( block43.nil? ? nil : block43.list ),( ifRest45.nil? ? nil : ifRest45.result ))
        # <-- action
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 12 )

      end
      
      return return_value
    end

    IfRestReturnValue = define_return_scope :result

    # 
    # parser rule ifRest
    # 
    # (in Giraffe.g)
    # 115:1: ifRest returns [result] : ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | );
    # 
    def ifRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = IfRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ELSE46__ = nil
      __LCB47__ = nil
      __RCB49__ = nil
      set50 = nil
      __LCB52__ = nil
      __RCB54__ = nil
      op = nil
      block48 = nil
      condition51 = nil
      block53 = nil

      tree_for_ELSE46 = nil
      tree_for_LCB47 = nil
      tree_for_RCB49 = nil
      tree_for_set50 = nil
      tree_for_LCB52 = nil
      tree_for_RCB54 = nil

      begin
        # at line 116:2: ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | )
        alt_10 = 3
        case look_10 = @input.peek( 1 )
        when ELSE then alt_10 = 1
        when ELSEIF, ELIF then alt_10 = 2
        when EOF, RCB, COMMENT, SEMICOLON, T__53, T__54 then alt_10 = 3
        else
          raise NoViableAlternative( "", 10, 0 )
        end
        case alt_10
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 116:4: ELSE LCB block RCB
          __ELSE46__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_ifRest_551 )

          tree_for_ELSE46 = @adaptor.create_with_payload( __ELSE46__ )
          @adaptor.add_child( root_0, tree_for_ELSE46 )

          __LCB47__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_553 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_556 )
          block48 = block
          @state.following.pop
          @adaptor.add_child( root_0, block48.tree )
          __RCB49__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_558 )
          # --> action
          return_value.result = ( block48.nil? ? nil : block48.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 117:4: ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest
          set50 = @input.look
          if @input.peek( 1 ).between?( ELSEIF, ELIF )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set50 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          @state.following.push( TOKENS_FOLLOWING_condition_IN_ifRest_574 )
          condition51 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition51.tree )
          __LCB52__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_576 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_579 )
          block53 = block
          @state.following.pop
          @adaptor.add_child( root_0, block53.tree )
          __RCB54__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_581 )
          @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifRest_586 )
          op = ifRest
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = IfTree.new(( condition51.nil? ? nil : condition51.result ),( block53.nil? ? nil : block53.list ),( op.nil? ? nil : op.result ))
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 119:4: 
          # --> action
          return_value.result = nil
          # <-- action

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 13 )

      end
      
      return return_value
    end

    WhileCycleReturnValue = define_return_scope :result

    # 
    # parser rule whileCycle
    # 
    # (in Giraffe.g)
    # 122:1: whileCycle returns [result] : WHILE condition LCB block RCB ;
    # 
    def whileCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = WhileCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WHILE55__ = nil
      __LCB57__ = nil
      __RCB59__ = nil
      condition56 = nil
      block58 = nil

      tree_for_WHILE55 = nil
      tree_for_LCB57 = nil
      tree_for_RCB59 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 123:5: WHILE condition LCB block RCB
        __WHILE55__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_whileCycle_613 )

        tree_for_WHILE55 = @adaptor.create_with_payload( __WHILE55__ )
        @adaptor.add_child( root_0, tree_for_WHILE55 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_whileCycle_615 )
        condition56 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition56.tree )
        __LCB57__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_whileCycle_617 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_whileCycle_620 )
        block58 = block
        @state.following.pop
        @adaptor.add_child( root_0, block58.tree )
        __RCB59__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_whileCycle_622 )
        # --> action
        return_value.result = WhileTree.new(( condition56.nil? ? nil : condition56.result ),( block58.nil? ? nil : block58.list ))
        # <-- action
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 14 )

      end
      
      return return_value
    end

    DoCycleReturnValue = define_return_scope :result

    # 
    # parser rule doCycle
    # 
    # (in Giraffe.g)
    # 127:1: doCycle returns [result] : DO LCB block RCB WHILE condition ;
    # 
    def doCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = DoCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __DO60__ = nil
      __LCB61__ = nil
      __RCB63__ = nil
      __WHILE64__ = nil
      block62 = nil
      condition65 = nil

      tree_for_DO60 = nil
      tree_for_LCB61 = nil
      tree_for_RCB63 = nil
      tree_for_WHILE64 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 128:4: DO LCB block RCB WHILE condition
        __DO60__ = match( DO, TOKENS_FOLLOWING_DO_IN_doCycle_644 )

        tree_for_DO60 = @adaptor.create_with_payload( __DO60__ )
        @adaptor.add_child( root_0, tree_for_DO60 )

        __LCB61__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_doCycle_646 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_doCycle_649 )
        block62 = block
        @state.following.pop
        @adaptor.add_child( root_0, block62.tree )
        __RCB63__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_doCycle_651 )
        __WHILE64__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_doCycle_654 )

        tree_for_WHILE64 = @adaptor.create_with_payload( __WHILE64__ )
        @adaptor.add_child( root_0, tree_for_WHILE64 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_doCycle_656 )
        condition65 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition65.tree )
        # --> action
        return_value.result = DoTree.new(( condition65.nil? ? nil : condition65.result ),( block62.nil? ? nil : block62.list ))
        # <-- action
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 15 )

      end
      
      return return_value
    end

    ForCycleReturnValue = define_return_scope :result

    # 
    # parser rule forCycle
    # 
    # (in Giraffe.g)
    # 132:1: forCycle returns [result] : FOR as1= assignment COMMA condition COMMA as2= assignment LCB block RCB ;
    # 
    def forCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = ForCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __FOR66__ = nil
      __COMMA67__ = nil
      __COMMA69__ = nil
      __LCB70__ = nil
      __RCB72__ = nil
      as1 = nil
      as2 = nil
      condition68 = nil
      block71 = nil

      tree_for_FOR66 = nil
      tree_for_COMMA67 = nil
      tree_for_COMMA69 = nil
      tree_for_LCB70 = nil
      tree_for_RCB72 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 133:4: FOR as1= assignment COMMA condition COMMA as2= assignment LCB block RCB
        __FOR66__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_forCycle_677 )

        tree_for_FOR66 = @adaptor.create_with_payload( __FOR66__ )
        @adaptor.add_child( root_0, tree_for_FOR66 )

        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_681 )
        as1 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as1.tree )
        __COMMA67__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_forCycle_683 )
        @state.following.push( TOKENS_FOLLOWING_condition_IN_forCycle_686 )
        condition68 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition68.tree )
        __COMMA69__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_forCycle_688 )
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_693 )
        as2 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as2.tree )
        __LCB70__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_forCycle_695 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_forCycle_698 )
        block71 = block
        @state.following.pop
        @adaptor.add_child( root_0, block71.tree )
        __RCB72__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_forCycle_700 )
        # --> action
        return_value.result = ForTree.new(( as1.nil? ? nil : as1.result ),( condition68.nil? ? nil : condition68.result ),( as2.nil? ? nil : as2.result ),( block71.nil? ? nil : block71.list ))
        # <-- action
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 16 )

      end
      
      return return_value
    end

    FuncReturnValue = define_return_scope :result

    # 
    # parser rule func
    # 
    # (in Giraffe.g)
    # 137:1: func returns [result] : ID ( params )? LCB block RCB ;
    # 
    def func
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = FuncReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID73__ = nil
      __LCB75__ = nil
      __RCB77__ = nil
      params74 = nil
      block76 = nil

      tree_for_ID73 = nil
      tree_for_LCB75 = nil
      tree_for_RCB77 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 138:4: ID ( params )? LCB block RCB
        __ID73__ = match( ID, TOKENS_FOLLOWING_ID_IN_func_722 )

        tree_for_ID73 = @adaptor.create_with_payload( __ID73__ )
        root_0 = @adaptor.become_root( tree_for_ID73, root_0 )

        # at line 138:8: ( params )?
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == ID )
          alt_11 = 1
        end
        case alt_11
        when 1
          # at line 138:8: params
          @state.following.push( TOKENS_FOLLOWING_params_IN_func_725 )
          params74 = params
          @state.following.pop
          @adaptor.add_child( root_0, params74.tree )

        end
        __LCB75__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_728 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_func_731 )
        block76 = block
        @state.following.pop
        @adaptor.add_child( root_0, block76.tree )
        __RCB77__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_733 )
        # --> action
        return_value.result = FuncTree.new(__ID73__.text,( params74.nil? ? nil : params74.list ),( block76.nil? ? nil : block76.list ))
        # <-- action
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 17 )

      end
      
      return return_value
    end

    ParamsReturnValue = define_return_scope :list

    # 
    # parser rule params
    # 
    # (in Giraffe.g)
    # 142:1: params returns [list] : ID paramRest ;
    # 
    def params
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = ParamsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID78__ = nil
      paramRest79 = nil

      tree_for_ID78 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 143:4: ID paramRest
        __ID78__ = match( ID, TOKENS_FOLLOWING_ID_IN_params_753 )

        tree_for_ID78 = @adaptor.create_with_payload( __ID78__ )
        @adaptor.add_child( root_0, tree_for_ID78 )

        @state.following.push( TOKENS_FOLLOWING_paramRest_IN_params_755 )
        paramRest79 = paramRest
        @state.following.pop
        @adaptor.add_child( root_0, paramRest79.tree )
        # --> action
        return_value.list = [__ID78__.text] + ( paramRest79.nil? ? nil : paramRest79.list )
        # <-- action
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 18 )

      end
      
      return return_value
    end

    ParamRestReturnValue = define_return_scope :list

    # 
    # parser rule paramRest
    # 
    # (in Giraffe.g)
    # 147:1: paramRest returns [list] : ( COMMA params | );
    # 
    def paramRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = ParamRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA80__ = nil
      params81 = nil

      tree_for_COMMA80 = nil

      begin
        # at line 148:2: ( COMMA params | )
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == COMMA )
          alt_12 = 1
        elsif ( look_12_0 == LCB )
          alt_12 = 2
        else
          raise NoViableAlternative( "", 12, 0 )
        end
        case alt_12
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 148:4: COMMA params
          __COMMA80__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_paramRest_774 )
          @state.following.push( TOKENS_FOLLOWING_params_IN_paramRest_777 )
          params81 = params
          @state.following.pop
          @adaptor.add_child( root_0, params81.tree )
          # --> action
          return_value.list = ( params81.nil? ? nil : params81.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 150:4: 
          # --> action
          return_value.list = []
          # <-- action

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 19 )

      end
      
      return return_value
    end

    CallReturnValue = define_return_scope :result

    # 
    # parser rule call
    # 
    # (in Giraffe.g)
    # 153:1: call returns [result] : ID LB ( args )? RB ;
    # 
    def call
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = CallReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID82__ = nil
      __LB83__ = nil
      __RB85__ = nil
      args84 = nil

      tree_for_ID82 = nil
      tree_for_LB83 = nil
      tree_for_RB85 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 154:4: ID LB ( args )? RB
        __ID82__ = match( ID, TOKENS_FOLLOWING_ID_IN_call_804 )

        tree_for_ID82 = @adaptor.create_with_payload( __ID82__ )
        root_0 = @adaptor.become_root( tree_for_ID82, root_0 )

        __LB83__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_807 )
        # at line 154:12: ( args )?
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == LB || look_13_0.between?( PLUS, INT ) || look_13_0 == STRING || look_13_0.between?( ID, CHAR ) || look_13_0 == FLOAT )
          alt_13 = 1
        end
        case alt_13
        when 1
          # at line 154:12: args
          @state.following.push( TOKENS_FOLLOWING_args_IN_call_810 )
          args84 = args
          @state.following.pop
          @adaptor.add_child( root_0, args84.tree )

        end
        __RB85__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_813 )
        # --> action
        return_value.result = CallTree.new(__ID82__.text,( args84.nil? ? nil : args84.list ))
        # <-- action
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 20 )

      end
      
      return return_value
    end

    ArgsReturnValue = define_return_scope :list

    # 
    # parser rule args
    # 
    # (in Giraffe.g)
    # 158:1: args returns [list] : ( expression argsRest | STRING argsRest | CHAR argsRest );
    # 
    def args
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = ArgsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __STRING88__ = nil
      __CHAR90__ = nil
      expression86 = nil
      argsRest87 = nil
      argsRest89 = nil
      argsRest91 = nil

      tree_for_STRING88 = nil
      tree_for_CHAR90 = nil

      begin
        # at line 159:2: ( expression argsRest | STRING argsRest | CHAR argsRest )
        alt_14 = 3
        case look_14 = @input.peek( 1 )
        when LB, PLUS, MINUS, INT, ID, FLOAT then alt_14 = 1
        when STRING then alt_14 = 2
        when CHAR then alt_14 = 3
        else
          raise NoViableAlternative( "", 14, 0 )
        end
        case alt_14
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 159:5: expression argsRest
          @state.following.push( TOKENS_FOLLOWING_expression_IN_args_835 )
          expression86 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression86.tree )
          @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_837 )
          argsRest87 = argsRest
          @state.following.pop
          @adaptor.add_child( root_0, argsRest87.tree )
          # --> action
          return_value.list = [( expression86.nil? ? nil : expression86.result )] + ( argsRest87.nil? ? nil : argsRest87.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 160:4: STRING argsRest
          __STRING88__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_args_844 )

          tree_for_STRING88 = @adaptor.create_with_payload( __STRING88__ )
          @adaptor.add_child( root_0, tree_for_STRING88 )

          @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_846 )
          argsRest89 = argsRest
          @state.following.pop
          @adaptor.add_child( root_0, argsRest89.tree )
          # --> action
          return_value.list = [AtomTree.new(__STRING88__.text)] + ( argsRest89.nil? ? nil : argsRest89.list )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 161:4: CHAR argsRest
          __CHAR90__ = match( CHAR, TOKENS_FOLLOWING_CHAR_IN_args_853 )

          tree_for_CHAR90 = @adaptor.create_with_payload( __CHAR90__ )
          @adaptor.add_child( root_0, tree_for_CHAR90 )

          @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_855 )
          argsRest91 = argsRest
          @state.following.pop
          @adaptor.add_child( root_0, argsRest91.tree )
          # --> action
          return_value.list = [AtomTree.new(__CHAR90__.text)] + ( argsRest91.nil? ? nil : argsRest91.list )
          # <-- action

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 21 )

      end
      
      return return_value
    end

    ArgsRestReturnValue = define_return_scope :list

    # 
    # parser rule argsRest
    # 
    # (in Giraffe.g)
    # 164:1: argsRest returns [list] : ( COMMA args | );
    # 
    def argsRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ArgsRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA92__ = nil
      args93 = nil

      tree_for_COMMA92 = nil

      begin
        # at line 165:2: ( COMMA args | )
        alt_15 = 2
        look_15_0 = @input.peek( 1 )

        if ( look_15_0 == COMMA )
          alt_15 = 1
        elsif ( look_15_0 == RB )
          alt_15 = 2
        else
          raise NoViableAlternative( "", 15, 0 )
        end
        case alt_15
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 165:4: COMMA args
          __COMMA92__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsRest_874 )
          @state.following.push( TOKENS_FOLLOWING_args_IN_argsRest_877 )
          args93 = args
          @state.following.pop
          @adaptor.add_child( root_0, args93.tree )
          # --> action
          return_value.list = ( args93.nil? ? nil : args93.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 167:4: 
          # --> action
          return_value.list = []
          # <-- action

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 22 )

      end
      
      return return_value
    end

    ConditionReturnValue = define_return_scope :result

    # 
    # parser rule condition
    # 
    # (in Giraffe.g)
    # 172:1: condition returns [result] : orOperand ( OR op= condition )? ;
    # 
    def condition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ConditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OR95__ = nil
      op = nil
      orOperand94 = nil

      tree_for_OR95 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 173:4: orOperand ( OR op= condition )?
        @state.following.push( TOKENS_FOLLOWING_orOperand_IN_condition_903 )
        orOperand94 = orOperand
        @state.following.pop
        @adaptor.add_child( root_0, orOperand94.tree )
        # --> action
        return_value.result = ( orOperand94.nil? ? nil : orOperand94.result )
        # <-- action
        # at line 174:3: ( OR op= condition )?
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == OR )
          alt_16 = 1
        end
        case alt_16
        when 1
          # at line 174:4: OR op= condition
          __OR95__ = match( OR, TOKENS_FOLLOWING_OR_IN_condition_910 )

          tree_for_OR95 = @adaptor.create_with_payload( __OR95__ )
          root_0 = @adaptor.become_root( tree_for_OR95, root_0 )

          @state.following.push( TOKENS_FOLLOWING_condition_IN_condition_915 )
          op = condition
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:or))
          # <-- action

        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 23 )

      end
      
      return return_value
    end

    OrOperandReturnValue = define_return_scope :result

    # 
    # parser rule orOperand
    # 
    # (in Giraffe.g)
    # 179:1: orOperand returns [result] : boolOperand ( AND op= orOperand )? ;
    # 
    def orOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = OrOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __AND97__ = nil
      op = nil
      boolOperand96 = nil

      tree_for_AND97 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 180:4: boolOperand ( AND op= orOperand )?
        @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_orOperand_936 )
        boolOperand96 = boolOperand
        @state.following.pop
        @adaptor.add_child( root_0, boolOperand96.tree )
        # --> action
        return_value.result = ( boolOperand96.nil? ? nil : boolOperand96.result )
        # <-- action
        # at line 181:3: ( AND op= orOperand )?
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == AND )
          alt_17 = 1
        end
        case alt_17
        when 1
          # at line 181:4: AND op= orOperand
          __AND97__ = match( AND, TOKENS_FOLLOWING_AND_IN_orOperand_943 )

          tree_for_AND97 = @adaptor.create_with_payload( __AND97__ )
          root_0 = @adaptor.become_root( tree_for_AND97, root_0 )

          @state.following.push( TOKENS_FOLLOWING_orOperand_IN_orOperand_948 )
          op = orOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:and))
          # <-- action

        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 24 )

      end
      
      return return_value
    end

    BoolOperandReturnValue = define_return_scope :result

    # 
    # parser rule boolOperand
    # 
    # (in Giraffe.g)
    # 184:1: boolOperand returns [result] : ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) );
    # 
    def boolOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = BoolOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NOT99__ = nil
      __LB100__ = nil
      __RB102__ = nil
      __EQ103__ = nil
      __NE104__ = nil
      __LT105__ = nil
      __GT106__ = nil
      __LE107__ = nil
      __GE108__ = nil
      op1 = nil
      op2 = nil
      bool98 = nil
      condition101 = nil

      tree_for_NOT99 = nil
      tree_for_LB100 = nil
      tree_for_RB102 = nil
      tree_for_EQ103 = nil
      tree_for_NE104 = nil
      tree_for_LT105 = nil
      tree_for_GT106 = nil
      tree_for_LE107 = nil
      tree_for_GE108 = nil

      begin
        # at line 185:2: ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) )
        alt_25 = 3
        case look_25 = @input.peek( 1 )
        when TRUE, FALSE then alt_25 = 1
        when NOT then alt_25 = 2
        when LB, PLUS, MINUS, INT, ID, FLOAT then alt_25 = 3
        else
          raise NoViableAlternative( "", 25, 0 )
        end
        case alt_25
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 185:4: bool
          @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_967 )
          bool98 = bool
          @state.following.pop
          @adaptor.add_child( root_0, bool98.tree )
          # --> action
          return_value.result = ( bool98.nil? ? nil : bool98.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 186:4: NOT LB condition RB
          __NOT99__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_boolOperand_974 )

          tree_for_NOT99 = @adaptor.create_with_payload( __NOT99__ )
          @adaptor.add_child( root_0, tree_for_NOT99 )

          __LB100__ = match( LB, TOKENS_FOLLOWING_LB_IN_boolOperand_976 )
          @state.following.push( TOKENS_FOLLOWING_condition_IN_boolOperand_979 )
          condition101 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition101.tree )
          __RB102__ = match( RB, TOKENS_FOLLOWING_RB_IN_boolOperand_981 )
          # --> action
          return_value.result = !( condition101.nil? ? nil : condition101.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 187:4: op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_991 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # at line 187:19: ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          alt_24 = 6
          case look_24 = @input.peek( 1 )
          when EQ then alt_24 = 1
          when NE then alt_24 = 2
          when LT then alt_24 = 3
          when GT then alt_24 = 4
          when LE then alt_24 = 5
          when GE then alt_24 = 6
          else
            raise NoViableAlternative( "", 24, 0 )
          end
          case alt_24
          when 1
            # at line 187:20: EQ (op2= bool | op2= expression )
            __EQ103__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_boolOperand_994 )

            tree_for_EQ103 = @adaptor.create_with_payload( __EQ103__ )
            root_0 = @adaptor.become_root( tree_for_EQ103, root_0 )

            # at line 187:24: (op2= bool | op2= expression )
            alt_18 = 2
            look_18_0 = @input.peek( 1 )

            if ( look_18_0.between?( TRUE, FALSE ) )
              alt_18 = 1
            elsif ( look_18_0 == LB || look_18_0.between?( PLUS, INT ) || look_18_0 == ID || look_18_0 == FLOAT )
              alt_18 = 2
            else
              raise NoViableAlternative( "", 18, 0 )
            end
            case alt_18
            when 1
              # at line 187:26: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1001 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 187:37: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1007 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:eq))
            # <-- action

          when 2
            # at line 188:6: NE (op2= bool | op2= expression )
            __NE104__ = match( NE, TOKENS_FOLLOWING_NE_IN_boolOperand_1018 )

            tree_for_NE104 = @adaptor.create_with_payload( __NE104__ )
            root_0 = @adaptor.become_root( tree_for_NE104, root_0 )

            # at line 188:10: (op2= bool | op2= expression )
            alt_19 = 2
            look_19_0 = @input.peek( 1 )

            if ( look_19_0.between?( TRUE, FALSE ) )
              alt_19 = 1
            elsif ( look_19_0 == LB || look_19_0.between?( PLUS, INT ) || look_19_0 == ID || look_19_0 == FLOAT )
              alt_19 = 2
            else
              raise NoViableAlternative( "", 19, 0 )
            end
            case alt_19
            when 1
              # at line 188:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1025 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 188:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1031 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:ne))
            # <-- action

          when 3
            # at line 189:6: LT (op2= bool | op2= expression )
            __LT105__ = match( LT, TOKENS_FOLLOWING_LT_IN_boolOperand_1042 )

            tree_for_LT105 = @adaptor.create_with_payload( __LT105__ )
            root_0 = @adaptor.become_root( tree_for_LT105, root_0 )

            # at line 189:10: (op2= bool | op2= expression )
            alt_20 = 2
            look_20_0 = @input.peek( 1 )

            if ( look_20_0.between?( TRUE, FALSE ) )
              alt_20 = 1
            elsif ( look_20_0 == LB || look_20_0.between?( PLUS, INT ) || look_20_0 == ID || look_20_0 == FLOAT )
              alt_20 = 2
            else
              raise NoViableAlternative( "", 20, 0 )
            end
            case alt_20
            when 1
              # at line 189:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1049 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 189:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1055 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:lt))
            # <-- action

          when 4
            # at line 190:6: GT (op2= bool | op2= expression )
            __GT106__ = match( GT, TOKENS_FOLLOWING_GT_IN_boolOperand_1066 )

            tree_for_GT106 = @adaptor.create_with_payload( __GT106__ )
            root_0 = @adaptor.become_root( tree_for_GT106, root_0 )

            # at line 190:10: (op2= bool | op2= expression )
            alt_21 = 2
            look_21_0 = @input.peek( 1 )

            if ( look_21_0.between?( TRUE, FALSE ) )
              alt_21 = 1
            elsif ( look_21_0 == LB || look_21_0.between?( PLUS, INT ) || look_21_0 == ID || look_21_0 == FLOAT )
              alt_21 = 2
            else
              raise NoViableAlternative( "", 21, 0 )
            end
            case alt_21
            when 1
              # at line 190:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1073 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 190:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1079 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:gt))
            # <-- action

          when 5
            # at line 191:6: LE (op2= bool | op2= expression )
            __LE107__ = match( LE, TOKENS_FOLLOWING_LE_IN_boolOperand_1090 )

            tree_for_LE107 = @adaptor.create_with_payload( __LE107__ )
            root_0 = @adaptor.become_root( tree_for_LE107, root_0 )

            # at line 191:10: (op2= bool | op2= expression )
            alt_22 = 2
            look_22_0 = @input.peek( 1 )

            if ( look_22_0.between?( TRUE, FALSE ) )
              alt_22 = 1
            elsif ( look_22_0 == LB || look_22_0.between?( PLUS, INT ) || look_22_0 == ID || look_22_0 == FLOAT )
              alt_22 = 2
            else
              raise NoViableAlternative( "", 22, 0 )
            end
            case alt_22
            when 1
              # at line 191:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1097 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 191:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1103 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:le))
            # <-- action

          when 6
            # at line 192:6: GE (op2= bool | op2= expression )
            __GE108__ = match( GE, TOKENS_FOLLOWING_GE_IN_boolOperand_1114 )

            tree_for_GE108 = @adaptor.create_with_payload( __GE108__ )
            root_0 = @adaptor.become_root( tree_for_GE108, root_0 )

            # at line 192:10: (op2= bool | op2= expression )
            alt_23 = 2
            look_23_0 = @input.peek( 1 )

            if ( look_23_0.between?( TRUE, FALSE ) )
              alt_23 = 1
            elsif ( look_23_0 == LB || look_23_0.between?( PLUS, INT ) || look_23_0 == ID || look_23_0 == FLOAT )
              alt_23 = 2
            else
              raise NoViableAlternative( "", 23, 0 )
            end
            case alt_23
            when 1
              # at line 192:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1121 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 192:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1127 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:ge))
            # <-- action

          end

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 25 )

      end
      
      return return_value
    end

    ExpressionReturnValue = define_return_scope :result

    # 
    # parser rule expression
    # 
    # (in Giraffe.g)
    # 197:1: expression returns [result] : addOperand ( PLUS op= expression | MINUS op= expression )? ;
    # 
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS110__ = nil
      __MINUS111__ = nil
      op = nil
      addOperand109 = nil

      tree_for_PLUS110 = nil
      tree_for_MINUS111 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 198:4: addOperand ( PLUS op= expression | MINUS op= expression )?
        @state.following.push( TOKENS_FOLLOWING_addOperand_IN_expression_1152 )
        addOperand109 = addOperand
        @state.following.pop
        @adaptor.add_child( root_0, addOperand109.tree )
        # --> action
        return_value.result = ( addOperand109.nil? ? nil : addOperand109.result )
        # <-- action
        # at line 199:3: ( PLUS op= expression | MINUS op= expression )?
        alt_26 = 3
        look_26_0 = @input.peek( 1 )

        if ( look_26_0 == PLUS )
          alt_26 = 1
        elsif ( look_26_0 == MINUS )
          alt_26 = 2
        end
        case alt_26
        when 1
          # at line 200:4: PLUS op= expression
          __PLUS110__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expression_1163 )

          tree_for_PLUS110 = @adaptor.create_with_payload( __PLUS110__ )
          root_0 = @adaptor.become_root( tree_for_PLUS110, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1168 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:add))
          # <-- action

        when 2
          # at line 201:5: MINUS op= expression
          __MINUS111__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expression_1176 )

          tree_for_MINUS111 = @adaptor.create_with_payload( __MINUS111__ )
          root_0 = @adaptor.become_root( tree_for_MINUS111, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1181 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:sub))
          # <-- action

        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 26 )

      end
      
      return return_value
    end

    AddOperandReturnValue = define_return_scope :result

    # 
    # parser rule addOperand
    # 
    # (in Giraffe.g)
    # 205:1: addOperand returns [result] : mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )? ;
    # 
    def addOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = AddOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __MUL113__ = nil
      __DIV114__ = nil
      __MOD115__ = nil
      op = nil
      mulOperand112 = nil

      tree_for_MUL113 = nil
      tree_for_DIV114 = nil
      tree_for_MOD115 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 206:4: mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperand_1203 )
        mulOperand112 = mulOperand
        @state.following.pop
        @adaptor.add_child( root_0, mulOperand112.tree )
        # --> action
        return_value.result = ( mulOperand112.nil? ? nil : mulOperand112.result )
        # <-- action
        # at line 207:3: ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        alt_27 = 4
        case look_27 = @input.peek( 1 )
        when MUL then alt_27 = 1
        when DIV then alt_27 = 2
        when MOD then alt_27 = 3
        end
        case alt_27
        when 1
          # at line 208:4: MUL op= addOperand
          __MUL113__ = match( MUL, TOKENS_FOLLOWING_MUL_IN_addOperand_1214 )

          tree_for_MUL113 = @adaptor.create_with_payload( __MUL113__ )
          root_0 = @adaptor.become_root( tree_for_MUL113, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1219 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:mul))
          # <-- action

        when 2
          # at line 209:5: DIV op= addOperand
          __DIV114__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_addOperand_1227 )

          tree_for_DIV114 = @adaptor.create_with_payload( __DIV114__ )
          root_0 = @adaptor.become_root( tree_for_DIV114, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1232 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:div))
          # <-- action

        when 3
          # at line 210:5: MOD op= addOperand
          __MOD115__ = match( MOD, TOKENS_FOLLOWING_MOD_IN_addOperand_1240 )

          tree_for_MOD115 = @adaptor.create_with_payload( __MOD115__ )
          root_0 = @adaptor.become_root( tree_for_MOD115, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1245 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:mod))
          # <-- action

        end
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 27 )

      end
      
      return return_value
    end

    MulOperandReturnValue = define_return_scope :result

    # 
    # parser rule mulOperand
    # 
    # (in Giraffe.g)
    # 214:1: mulOperand returns [result] : ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest );
    # 
    def mulOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = MulOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS116__ = nil
      __MINUS118__ = nil
      mulOperandRest117 = nil
      mulOperandRest119 = nil
      mulOperandRest120 = nil

      tree_for_PLUS116 = nil
      tree_for_MINUS118 = nil

      begin
        # at line 215:2: ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest )
        alt_28 = 3
        case look_28 = @input.peek( 1 )
        when PLUS then alt_28 = 1
        when MINUS then alt_28 = 2
        when LB, INT, ID, FLOAT then alt_28 = 3
        else
          raise NoViableAlternative( "", 28, 0 )
        end
        case alt_28
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 215:4: PLUS mulOperandRest
          __PLUS116__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_mulOperand_1267 )

          tree_for_PLUS116 = @adaptor.create_with_payload( __PLUS116__ )
          @adaptor.add_child( root_0, tree_for_PLUS116 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1269 )
          mulOperandRest117 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest117.tree )
          # --> action
          return_value.result = ( mulOperandRest117.nil? ? nil : mulOperandRest117.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 216:4: MINUS mulOperandRest
          __MINUS118__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_mulOperand_1276 )

          tree_for_MINUS118 = @adaptor.create_with_payload( __MINUS118__ )
          @adaptor.add_child( root_0, tree_for_MINUS118 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1278 )
          mulOperandRest119 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest119.tree )
          # --> action
          return_value.result = UnaryOperatorTree.new(( mulOperandRest119.nil? ? nil : mulOperandRest119.result ),Operators.method(:neg))
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 217:4: mulOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1285 )
          mulOperandRest120 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest120.tree )
          # --> action
          return_value.result = ( mulOperandRest120.nil? ? nil : mulOperandRest120.result )
          # <-- action

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 28 )

      end
      
      return return_value
    end

    MulOperandRestReturnValue = define_return_scope :result

    # 
    # parser rule mulOperandRest
    # 
    # (in Giraffe.g)
    # 220:1: mulOperandRest returns [result] : ( ID | LB expression RB | INT | FLOAT | call );
    # 
    def mulOperandRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = MulOperandRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID121__ = nil
      __LB122__ = nil
      __RB124__ = nil
      __INT125__ = nil
      __FLOAT126__ = nil
      expression123 = nil
      call127 = nil

      tree_for_ID121 = nil
      tree_for_LB122 = nil
      tree_for_RB124 = nil
      tree_for_INT125 = nil
      tree_for_FLOAT126 = nil

      begin
        # at line 221:2: ( ID | LB expression RB | INT | FLOAT | call )
        alt_29 = 5
        case look_29 = @input.peek( 1 )
        when ID then look_29_1 = @input.peek( 2 )

        if ( look_29_1 == LB )
          alt_29 = 5
        elsif ( look_29_1 == EOF || look_29_1.between?( LCB, SEMICOLON ) || look_29_1.between?( RB, MINUS ) || look_29_1 == COMMA || look_29_1.between?( OR, AND ) || look_29_1.between?( EQ, MOD ) || look_29_1.between?( T__53, T__54 ) )
          alt_29 = 1
        else
          raise NoViableAlternative( "", 29, 1 )
        end
        when LB then alt_29 = 2
        when INT then alt_29 = 3
        when FLOAT then alt_29 = 4
        else
          raise NoViableAlternative( "", 29, 0 )
        end
        case alt_29
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 221:4: ID
          __ID121__ = match( ID, TOKENS_FOLLOWING_ID_IN_mulOperandRest_1302 )

          tree_for_ID121 = @adaptor.create_with_payload( __ID121__ )
          @adaptor.add_child( root_0, tree_for_ID121 )

          # --> action
          return_value.result = VarTree.new(__ID121__.text)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 222:4: LB expression RB
          __LB122__ = match( LB, TOKENS_FOLLOWING_LB_IN_mulOperandRest_1309 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_mulOperandRest_1312 )
          expression123 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression123.tree )
          __RB124__ = match( RB, TOKENS_FOLLOWING_RB_IN_mulOperandRest_1314 )
          # --> action
          return_value.result = ( expression123.nil? ? nil : expression123.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 223:4: INT
          __INT125__ = match( INT, TOKENS_FOLLOWING_INT_IN_mulOperandRest_1322 )

          tree_for_INT125 = @adaptor.create_with_payload( __INT125__ )
          @adaptor.add_child( root_0, tree_for_INT125 )

          # --> action
          return_value.result = AtomTree.new(__INT125__.text.to_i)
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 224:4: FLOAT
          __FLOAT126__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_mulOperandRest_1329 )

          tree_for_FLOAT126 = @adaptor.create_with_payload( __FLOAT126__ )
          @adaptor.add_child( root_0, tree_for_FLOAT126 )

          # --> action
          return_value.result = AtomTree.new(__FLOAT126__.text.to_f)
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 225:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_mulOperandRest_1336 )
          call127 = call
          @state.following.pop
          @adaptor.add_child( root_0, call127.tree )
          # --> action
          return_value.result = ( call127.nil? ? nil : call127.result )
          # <-- action

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 29 )

      end
      
      return return_value
    end

    ValueReturnValue = define_return_scope :result

    # 
    # parser rule value
    # 
    # (in Giraffe.g)
    # 227:1: value returns [result] : ( expression | STRING | CHAR );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __STRING129__ = nil
      __CHAR130__ = nil
      expression128 = nil

      tree_for_STRING129 = nil
      tree_for_CHAR130 = nil

      begin
        # at line 228:2: ( expression | STRING | CHAR )
        alt_30 = 3
        case look_30 = @input.peek( 1 )
        when LB, PLUS, MINUS, INT, ID, FLOAT then alt_30 = 1
        when STRING then alt_30 = 2
        when CHAR then alt_30 = 3
        else
          raise NoViableAlternative( "", 30, 0 )
        end
        case alt_30
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 228:5: expression
          @state.following.push( TOKENS_FOLLOWING_expression_IN_value_1352 )
          expression128 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression128.tree )
          # --> action
          return_value.result = ( expression128.nil? ? nil : expression128.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 229:4: STRING
          __STRING129__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_value_1359 )

          tree_for_STRING129 = @adaptor.create_with_payload( __STRING129__ )
          @adaptor.add_child( root_0, tree_for_STRING129 )

          # --> action
          return_value.result = AtomTree.new(__STRING129__.text)
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 230:4: CHAR
          __CHAR130__ = match( CHAR, TOKENS_FOLLOWING_CHAR_IN_value_1366 )

          tree_for_CHAR130 = @adaptor.create_with_payload( __CHAR130__ )
          @adaptor.add_child( root_0, tree_for_CHAR130 )

          # --> action
          return_value.result = AtomTree.new(__CHAR130__.text)
          # <-- action

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 30 )

      end
      
      return return_value
    end

    AssignmentReturnValue = define_return_scope :result

    # 
    # parser rule assignment
    # 
    # (in Giraffe.g)
    # 233:1: assignment returns [result] : ID ASSIGN value ;
    # 
    def assignment
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = AssignmentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID131__ = nil
      __ASSIGN132__ = nil
      value133 = nil

      tree_for_ID131 = nil
      tree_for_ASSIGN132 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 234:4: ID ASSIGN value
        __ID131__ = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1385 )

        tree_for_ID131 = @adaptor.create_with_payload( __ID131__ )
        @adaptor.add_child( root_0, tree_for_ID131 )

        __ASSIGN132__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1387 )

        tree_for_ASSIGN132 = @adaptor.create_with_payload( __ASSIGN132__ )
        root_0 = @adaptor.become_root( tree_for_ASSIGN132, root_0 )

        @state.following.push( TOKENS_FOLLOWING_value_IN_assignment_1390 )
        value133 = value
        @state.following.pop
        @adaptor.add_child( root_0, value133.tree )
        # --> action
         return_value.result = AssignTree.new(__ID131__.text,( value133.nil? ? nil : value133.result )) 
        # <-- action
        # - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 31 )

      end
      
      return return_value
    end

    BoolReturnValue = define_return_scope :result

    # 
    # parser rule bool
    # 
    # (in Giraffe.g)
    # 236:1: bool returns [result] : ( TRUE | FALSE );
    # 
    def bool
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = BoolReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __TRUE134__ = nil
      __FALSE135__ = nil

      tree_for_TRUE134 = nil
      tree_for_FALSE135 = nil

      begin
        # at line 237:2: ( TRUE | FALSE )
        alt_31 = 2
        look_31_0 = @input.peek( 1 )

        if ( look_31_0 == TRUE )
          alt_31 = 1
        elsif ( look_31_0 == FALSE )
          alt_31 = 2
        else
          raise NoViableAlternative( "", 31, 0 )
        end
        case alt_31
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 237:4: TRUE
          __TRUE134__ = match( TRUE, TOKENS_FOLLOWING_TRUE_IN_bool_1408 )

          tree_for_TRUE134 = @adaptor.create_with_payload( __TRUE134__ )
          @adaptor.add_child( root_0, tree_for_TRUE134 )

          # --> action
          return_value.result = AtomTree.new(true)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 238:5: FALSE
          __FALSE135__ = match( FALSE, TOKENS_FOLLOWING_FALSE_IN_bool_1416 )

          tree_for_FALSE135 = @adaptor.create_with_payload( __FALSE135__ )
          @adaptor.add_child( root_0, tree_for_FALSE135 )

          # --> action
          return_value.result = AtomTree.new(false)
          # <-- action

        end# - - - - - - - rule clean up - - - - - - - -
        return_value.stop = @input.look( -1 )


        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 32 )

      end
      
      return return_value
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA5 < ANTLR3::DFA
      EOT = unpack( 16, -1 )
      EOF = unpack( 1, 12, 15, -1 )
      MIN = unpack( 2, 4, 14, -1 )
      MAX = unpack( 1, 54, 1, 43, 14, -1 )
      ACCEPT = unpack( 2, -1, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 
                       1, 11, 1, 12, 1, 13, 1, 14, 1, 1, 1, 2, 1, 3 )
      SPECIAL = unpack( 16, -1 )
      TRANSITION = [
        unpack( 1, 2, 3, 12, 1, 11, 1, 9, 1, 10, 5, -1, 1, 7, 1, -1, 2, 
                8, 1, 4, 3, -1, 1, 5, 1, 6, 1, 3, 1, -1, 1, 1, 24, -1, 2, 
                12 ),
        unpack( 1, 15, 6, -1, 1, 14, 16, -1, 1, 15, 14, -1, 1, 13 ),
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
          61:1: instruction returns [result] : ( assignment | call | func | env | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa5 = DFA5.new( self, 5 )

    end
    TOKENS_FOLLOWING_block_IN_program_49 = Set[ 1 ]
    TOKENS_FOLLOWING_LCB_IN_env_64 = Set[ 4, 6, 7, 8, 9, 10, 16, 18, 19, 20, 24, 25, 26, 28, 53, 54 ]
    TOKENS_FOLLOWING_block_IN_env_70 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_env_76 = Set[ 1 ]
    TOKENS_FOLLOWING_instruction_IN_block_96 = Set[ 6, 7, 53, 54 ]
    TOKENS_FOLLOWING_instructionRest_IN_block_106 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_instructionRest_136 = Set[ 53, 54 ]
    TOKENS_FOLLOWING_T__53_IN_instructionRest_140 = Set[ 54 ]
    TOKENS_FOLLOWING_T__54_IN_instructionRest_144 = Set[ 4, 6, 7, 8, 9, 10, 16, 18, 19, 20, 24, 25, 26, 28, 53, 54 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_150 = Set[ 4, 6, 7, 8, 9, 10, 16, 18, 19, 20, 24, 25, 26, 28, 53, 54 ]
    TOKENS_FOLLOWING_instruction_IN_instructionRest_157 = Set[ 6, 7, 53, 54 ]
    TOKENS_FOLLOWING_instructionRest_IN_instructionRest_170 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_IN_instruction_198 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_instruction_205 = Set[ 1 ]
    TOKENS_FOLLOWING_func_IN_instruction_212 = Set[ 1 ]
    TOKENS_FOLLOWING_env_IN_instruction_219 = Set[ 1 ]
    TOKENS_FOLLOWING_forCycle_IN_instruction_226 = Set[ 1 ]
    TOKENS_FOLLOWING_ifInstruction_IN_instruction_233 = Set[ 1 ]
    TOKENS_FOLLOWING_whileCycle_IN_instruction_240 = Set[ 1 ]
    TOKENS_FOLLOWING_doCycle_IN_instruction_247 = Set[ 1 ]
    TOKENS_FOLLOWING_printInstruction_IN_instruction_254 = Set[ 1 ]
    TOKENS_FOLLOWING_printlInstruction_IN_instruction_261 = Set[ 1 ]
    TOKENS_FOLLOWING_returnInstruction_IN_instruction_268 = Set[ 1 ]
    TOKENS_FOLLOWING_exitInstruction_IN_instruction_276 = Set[ 1 ]
    TOKENS_FOLLOWING_breakInstruction_IN_instruction_283 = Set[ 1 ]
    TOKENS_FOLLOWING_BREAK_IN_breakInstruction_306 = Set[ 1 ]
    TOKENS_FOLLOWING_RETURN_IN_returnInstruction_323 = Set[ 11, 13, 14, 15, 28, 42 ]
    TOKENS_FOLLOWING_expression_IN_returnInstruction_326 = Set[ 1 ]
    TOKENS_FOLLOWING_EXIT_IN_exitInstruction_343 = Set[ 1, 11, 13, 14, 15 ]
    TOKENS_FOLLOWING_LB_IN_exitInstruction_348 = Set[ 13, 14, 15 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_353 = Set[ 12 ]
    TOKENS_FOLLOWING_RB_IN_exitInstruction_355 = Set[ 1 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_368 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_statusCode_393 = Set[ 15 ]
    TOKENS_FOLLOWING_MINUS_IN_statusCode_397 = Set[ 15 ]
    TOKENS_FOLLOWING_INT_IN_statusCode_403 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINT_IN_printInstruction_424 = Set[ 11, 13, 14, 15, 17, 28, 42 ]
    TOKENS_FOLLOWING_STRING_IN_printInstruction_430 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_printInstruction_440 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_printlInstruction_468 = Set[ 11, 13, 14, 15, 17, 28, 42 ]
    TOKENS_FOLLOWING_STRING_IN_printlInstruction_483 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_printlInstruction_492 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_ifInstruction_519 = Set[ 11, 13, 14, 15, 28, 32, 42, 44, 45 ]
    TOKENS_FOLLOWING_condition_IN_ifInstruction_522 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_ifInstruction_524 = Set[ 4, 6, 7, 8, 9, 10, 16, 18, 19, 20, 24, 25, 26, 28, 53, 54 ]
    TOKENS_FOLLOWING_block_IN_ifInstruction_527 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_ifInstruction_529 = Set[ 21, 22, 23 ]
    TOKENS_FOLLOWING_ifRest_IN_ifInstruction_532 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_ifRest_551 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_553 = Set[ 4, 6, 7, 8, 9, 10, 16, 18, 19, 20, 24, 25, 26, 28, 53, 54 ]
    TOKENS_FOLLOWING_block_IN_ifRest_556 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_558 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_ifRest_566 = Set[ 11, 13, 14, 15, 28, 32, 42, 44, 45 ]
    TOKENS_FOLLOWING_condition_IN_ifRest_574 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_576 = Set[ 4, 6, 7, 8, 9, 10, 16, 18, 19, 20, 24, 25, 26, 28, 53, 54 ]
    TOKENS_FOLLOWING_block_IN_ifRest_579 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_581 = Set[ 21, 22, 23 ]
    TOKENS_FOLLOWING_ifRest_IN_ifRest_586 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_whileCycle_613 = Set[ 11, 13, 14, 15, 28, 32, 42, 44, 45 ]
    TOKENS_FOLLOWING_condition_IN_whileCycle_615 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_whileCycle_617 = Set[ 4, 6, 7, 8, 9, 10, 16, 18, 19, 20, 24, 25, 26, 28, 53, 54 ]
    TOKENS_FOLLOWING_block_IN_whileCycle_620 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_whileCycle_622 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_doCycle_644 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_doCycle_646 = Set[ 4, 6, 7, 8, 9, 10, 16, 18, 19, 20, 24, 25, 26, 28, 53, 54 ]
    TOKENS_FOLLOWING_block_IN_doCycle_649 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_doCycle_651 = Set[ 24 ]
    TOKENS_FOLLOWING_WHILE_IN_doCycle_654 = Set[ 11, 13, 14, 15, 28, 32, 42, 44, 45 ]
    TOKENS_FOLLOWING_condition_IN_doCycle_656 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_forCycle_677 = Set[ 28 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_681 = Set[ 27 ]
    TOKENS_FOLLOWING_COMMA_IN_forCycle_683 = Set[ 11, 13, 14, 15, 28, 32, 42, 44, 45 ]
    TOKENS_FOLLOWING_condition_IN_forCycle_686 = Set[ 27 ]
    TOKENS_FOLLOWING_COMMA_IN_forCycle_688 = Set[ 28 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_693 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_forCycle_695 = Set[ 4, 6, 7, 8, 9, 10, 16, 18, 19, 20, 24, 25, 26, 28, 53, 54 ]
    TOKENS_FOLLOWING_block_IN_forCycle_698 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_forCycle_700 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_func_722 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_params_IN_func_725 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_func_728 = Set[ 4, 6, 7, 8, 9, 10, 16, 18, 19, 20, 24, 25, 26, 28, 53, 54 ]
    TOKENS_FOLLOWING_block_IN_func_731 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_func_733 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_params_753 = Set[ 27 ]
    TOKENS_FOLLOWING_paramRest_IN_params_755 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_paramRest_774 = Set[ 28 ]
    TOKENS_FOLLOWING_params_IN_paramRest_777 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_call_804 = Set[ 11 ]
    TOKENS_FOLLOWING_LB_IN_call_807 = Set[ 11, 12, 13, 14, 15, 17, 28, 29, 42 ]
    TOKENS_FOLLOWING_args_IN_call_810 = Set[ 12 ]
    TOKENS_FOLLOWING_RB_IN_call_813 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_args_835 = Set[ 27 ]
    TOKENS_FOLLOWING_argsRest_IN_args_837 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_args_844 = Set[ 27 ]
    TOKENS_FOLLOWING_argsRest_IN_args_846 = Set[ 1 ]
    TOKENS_FOLLOWING_CHAR_IN_args_853 = Set[ 27 ]
    TOKENS_FOLLOWING_argsRest_IN_args_855 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsRest_874 = Set[ 11, 13, 14, 15, 17, 28, 29, 42 ]
    TOKENS_FOLLOWING_args_IN_argsRest_877 = Set[ 1 ]
    TOKENS_FOLLOWING_orOperand_IN_condition_903 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_OR_IN_condition_910 = Set[ 11, 13, 14, 15, 28, 32, 42, 44, 45 ]
    TOKENS_FOLLOWING_condition_IN_condition_915 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperand_IN_orOperand_936 = Set[ 1, 31 ]
    TOKENS_FOLLOWING_AND_IN_orOperand_943 = Set[ 11, 13, 14, 15, 28, 32, 42, 44, 45 ]
    TOKENS_FOLLOWING_orOperand_IN_orOperand_948 = Set[ 1 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_967 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_boolOperand_974 = Set[ 11 ]
    TOKENS_FOLLOWING_LB_IN_boolOperand_976 = Set[ 11, 13, 14, 15, 28, 32, 42, 44, 45 ]
    TOKENS_FOLLOWING_condition_IN_boolOperand_979 = Set[ 12 ]
    TOKENS_FOLLOWING_RB_IN_boolOperand_981 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_991 = Set[ 33, 34, 35, 36, 37, 38 ]
    TOKENS_FOLLOWING_EQ_IN_boolOperand_994 = Set[ 11, 13, 14, 15, 28, 42, 44, 45 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1001 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1007 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_boolOperand_1018 = Set[ 11, 13, 14, 15, 28, 42, 44, 45 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1025 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1031 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_boolOperand_1042 = Set[ 11, 13, 14, 15, 28, 42, 44, 45 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1049 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1055 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_boolOperand_1066 = Set[ 11, 13, 14, 15, 28, 42, 44, 45 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1073 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1079 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_boolOperand_1090 = Set[ 11, 13, 14, 15, 28, 42, 44, 45 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1097 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1103 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_boolOperand_1114 = Set[ 11, 13, 14, 15, 28, 42, 44, 45 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1121 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1127 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperand_IN_expression_1152 = Set[ 1, 13, 14 ]
    TOKENS_FOLLOWING_PLUS_IN_expression_1163 = Set[ 11, 13, 14, 15, 28, 42 ]
    TOKENS_FOLLOWING_expression_IN_expression_1168 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expression_1176 = Set[ 11, 13, 14, 15, 28, 42 ]
    TOKENS_FOLLOWING_expression_IN_expression_1181 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperand_1203 = Set[ 1, 39, 40, 41 ]
    TOKENS_FOLLOWING_MUL_IN_addOperand_1214 = Set[ 11, 13, 14, 15, 28, 42 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1219 = Set[ 1 ]
    TOKENS_FOLLOWING_DIV_IN_addOperand_1227 = Set[ 11, 13, 14, 15, 28, 42 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1232 = Set[ 1 ]
    TOKENS_FOLLOWING_MOD_IN_addOperand_1240 = Set[ 11, 13, 14, 15, 28, 42 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1245 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_mulOperand_1267 = Set[ 11, 13, 14, 15, 28, 42 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1269 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_mulOperand_1276 = Set[ 11, 13, 14, 15, 28, 42 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1278 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1285 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_mulOperandRest_1302 = Set[ 1 ]
    TOKENS_FOLLOWING_LB_IN_mulOperandRest_1309 = Set[ 11, 13, 14, 15, 28, 42 ]
    TOKENS_FOLLOWING_expression_IN_mulOperandRest_1312 = Set[ 12 ]
    TOKENS_FOLLOWING_RB_IN_mulOperandRest_1314 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_mulOperandRest_1322 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_mulOperandRest_1329 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_mulOperandRest_1336 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_value_1352 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_value_1359 = Set[ 1 ]
    TOKENS_FOLLOWING_CHAR_IN_value_1366 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1385 = Set[ 43 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1387 = Set[ 11, 13, 14, 15, 17, 28, 29, 42 ]
    TOKENS_FOLLOWING_value_IN_assignment_1390 = Set[ 1 ]
    TOKENS_FOLLOWING_TRUE_IN_bool_1408 = Set[ 1 ]
    TOKENS_FOLLOWING_FALSE_IN_bool_1416 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end


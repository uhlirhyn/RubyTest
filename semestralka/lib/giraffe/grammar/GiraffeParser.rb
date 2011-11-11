#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-11-11 21:45:52
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
require './lib/giraffe/tree/printlTree.rb'
require './lib/giraffe/tree/ifTree.rb'
require './lib/giraffe/tree/whileTree.rb'
require './lib/giraffe/tree/doTree.rb'
require './lib/giraffe/tree/forTree.rb'
require './lib/giraffe/tree/funcTree.rb'
require './lib/giraffe/tree/callTree.rb'
require './lib/giraffe/tree/binaryOperandTree.rb'
require './lib/giraffe/tree/unaryOperandTree.rb'
require './lib/giraffe/tree/atomTree.rb'
require './lib/giraffe/tree/varTree.rb'

# - - - - - - end action @parser::header - - - - - - -


module Giraffe
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :EXPONENT => 42, :LT => 27, :WHILE => 15, :RB => 21, 
                   :MOD => 35, :OCTAL_ESC => 47, :CHAR => 38, :FOR => 17, 
                   :DO => 16, :FLOAT => 37, :NOT => 24, :RCB => 5, :ID => 19, 
                   :AND => 23, :EOF => -1, :IF => 11, :ESC_SEQ => 44, :LCB => 4, 
                   :COMMA => 18, :PLUS => 31, :EQ => 25, :COMMENT => 6, 
                   :T__50 => 50, :NE => 26, :GE => 30, :T__49 => 49, :UNICODE_ESC => 46, 
                   :ELSE => 12, :HEX_DIGIT => 45, :SEMICOLON => 7, :INT => 36, 
                   :MINUS => 32, :MUL => 33, :TRUE => 40, :PRINT => 8, :ELSEIF => 13, 
                   :PRINTL => 10, :COLON => 48, :ELIF => 14, :WS => 43, 
                   :OR => 22, :ASSIGN => 39, :GT => 28, :LB => 20, :DIV => 34, 
                   :FALSE => 41, :LE => 29, :STRING => 9 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "LCB", "RCB", "COMMENT", "SEMICOLON", "PRINT", "STRING", 
                    "PRINTL", "IF", "ELSE", "ELSEIF", "ELIF", "WHILE", "DO", 
                    "FOR", "COMMA", "ID", "LB", "RB", "OR", "AND", "NOT", 
                    "EQ", "NE", "LT", "GT", "LE", "GE", "PLUS", "MINUS", 
                    "MUL", "DIV", "MOD", "INT", "FLOAT", "CHAR", "ASSIGN", 
                    "TRUE", "FALSE", "EXPONENT", "WS", "ESC_SEQ", "HEX_DIGIT", 
                    "UNICODE_ESC", "OCTAL_ESC", "COLON", "'\\r'", "'\\n'" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = Giraffe
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :program, :env, :block, :instructionRest, :instruction, 
                     :printInstruction, :printlInstruction, :ifInstruction, 
                     :ifRest, :whileCycle, :doCycle, :forCycle, :func, :params, 
                     :paramRest, :call, :args, :argsRest, :condition, :orOperand, 
                     :boolOperand, :expression, :addOperand, :mulOperand, 
                     :mulOperandRest, :value, :assignment, :bool ].freeze


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
    # 31:1: program returns [result] : block ;
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


        # at line 32:4: block
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
    # 34:1: env returns [result] : LCB block RCB ;
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


        # at line 35:4: LCB block RCB
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
    # 40:1: block returns [list] : instruction instructionRest ;
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


        # at line 41:4: instruction instructionRest
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
    # 48:1: instructionRest returns [list] : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) instruction op= instructionRest | );
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
        # at line 49:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) instruction op= instructionRest | )
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0.between?( COMMENT, SEMICOLON ) || look_4_0.between?( T__49, T__50 ) )
          alt_4 = 1
        elsif ( look_4_0 == EOF || look_4_0 == RCB )
          alt_4 = 2
        else
          raise NoViableAlternative( "", 4, 0 )
        end
        case alt_4
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 49:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) instruction op= instructionRest
          # --> action
          return_value.list = []
          # <-- action
          # at line 50:3: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0 == COMMENT || look_3_0.between?( T__49, T__50 ) )
            alt_3 = 1
          elsif ( look_3_0 == SEMICOLON )
            alt_3 = 2
          else
            raise NoViableAlternative( "", 3, 0 )
          end
          case alt_3
          when 1
            # at line 50:4: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 50:4: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 50:6: ( COMMENT )? ( '\\r' )? '\\n'
            # at line 50:13: ( COMMENT )?
            alt_1 = 2
            look_1_0 = @input.peek( 1 )

            if ( look_1_0 == COMMENT )
              alt_1 = 1
            end
            case alt_1
            when 1
              # at line 50:13: COMMENT
              __COMMENT7__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_instructionRest_136 )

            end
            # at line 50:20: ( '\\r' )?
            alt_2 = 2
            look_2_0 = @input.peek( 1 )

            if ( look_2_0 == T__49 )
              alt_2 = 1
            end
            case alt_2
            when 1
              # at line 50:20: '\\r'
              char_literal8 = match( T__49, TOKENS_FOLLOWING_T__49_IN_instructionRest_140 )

            end
            char_literal9 = match( T__50, TOKENS_FOLLOWING_T__50_IN_instructionRest_144 )


          when 2
            # at line 50:32: SEMICOLON
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


          # at line 55:4: 
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
    # 58:1: instruction returns [result] : ( assignment | call | func | env | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | );
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


      begin
        # at line 59:2: ( assignment | call | func | env | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | )
        alt_5 = 11
        alt_5 = @dfa5.predict( @input )
        case alt_5
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 59:4: assignment
          @state.following.push( TOKENS_FOLLOWING_assignment_IN_instruction_198 )
          assignment12 = assignment
          @state.following.pop
          @adaptor.add_child( root_0, assignment12.tree )
          # --> action
          return_value.result = ( assignment12.nil? ? nil : assignment12.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 60:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_instruction_205 )
          call13 = call
          @state.following.pop
          @adaptor.add_child( root_0, call13.tree )
          # --> action
          return_value.result = ( call13.nil? ? nil : call13.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 61:4: func
          @state.following.push( TOKENS_FOLLOWING_func_IN_instruction_212 )
          func14 = func
          @state.following.pop
          @adaptor.add_child( root_0, func14.tree )
          # --> action
          return_value.result = ( func14.nil? ? nil : func14.result )
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 62:4: env
          @state.following.push( TOKENS_FOLLOWING_env_IN_instruction_219 )
          env15 = env
          @state.following.pop
          @adaptor.add_child( root_0, env15.tree )
          # --> action
          return_value.result = ( env15.nil? ? nil : env15.result )
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 63:4: forCycle
          @state.following.push( TOKENS_FOLLOWING_forCycle_IN_instruction_226 )
          forCycle16 = forCycle
          @state.following.pop
          @adaptor.add_child( root_0, forCycle16.tree )
          # --> action
          return_value.result = ( forCycle16.nil? ? nil : forCycle16.result )
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 64:4: ifInstruction
          @state.following.push( TOKENS_FOLLOWING_ifInstruction_IN_instruction_233 )
          ifInstruction17 = ifInstruction
          @state.following.pop
          @adaptor.add_child( root_0, ifInstruction17.tree )
          # --> action
          return_value.result = ( ifInstruction17.nil? ? nil : ifInstruction17.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 65:4: whileCycle
          @state.following.push( TOKENS_FOLLOWING_whileCycle_IN_instruction_240 )
          whileCycle18 = whileCycle
          @state.following.pop
          @adaptor.add_child( root_0, whileCycle18.tree )
          # --> action
          return_value.result = ( whileCycle18.nil? ? nil : whileCycle18.result )
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 66:4: doCycle
          @state.following.push( TOKENS_FOLLOWING_doCycle_IN_instruction_247 )
          doCycle19 = doCycle
          @state.following.pop
          @adaptor.add_child( root_0, doCycle19.tree )
          # --> action
          return_value.result = ( doCycle19.nil? ? nil : doCycle19.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 67:4: printInstruction
          @state.following.push( TOKENS_FOLLOWING_printInstruction_IN_instruction_254 )
          printInstruction20 = printInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printInstruction20.tree )
          # --> action
          return_value.result = ( printInstruction20.nil? ? nil : printInstruction20.result )
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 68:4: printlInstruction
          @state.following.push( TOKENS_FOLLOWING_printlInstruction_IN_instruction_261 )
          printlInstruction21 = printlInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printlInstruction21.tree )
          # --> action
          return_value.result = ( printlInstruction21.nil? ? nil : printlInstruction21.result )
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 69:4: 
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

    PrintInstructionReturnValue = define_return_scope :result

    # 
    # parser rule printInstruction
    # 
    # (in Giraffe.g)
    # 72:1: printInstruction returns [result] : PRINT ( STRING | expression ) ;
    # 
    def printInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      return_value = PrintInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PRINT22__ = nil
      __STRING23__ = nil
      expression24 = nil

      tree_for_PRINT22 = nil
      tree_for_STRING23 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 73:5: PRINT ( STRING | expression )
        __PRINT22__ = match( PRINT, TOKENS_FOLLOWING_PRINT_IN_printInstruction_285 )

        tree_for_PRINT22 = @adaptor.create_with_payload( __PRINT22__ )
        @adaptor.add_child( root_0, tree_for_PRINT22 )

        # at line 73:13: ( STRING | expression )
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == STRING )
          alt_6 = 1
        elsif ( look_6_0.between?( ID, LB ) || look_6_0.between?( PLUS, MINUS ) || look_6_0.between?( INT, FLOAT ) )
          alt_6 = 2
        else
          raise NoViableAlternative( "", 6, 0 )
        end
        case alt_6
        when 1
          # at line 73:15: STRING
          __STRING23__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_printInstruction_291 )

          tree_for_STRING23 = @adaptor.create_with_payload( __STRING23__ )
          @adaptor.add_child( root_0, tree_for_STRING23 )

          # --> action
          return_value.result = PrintTree.new(__STRING23__.text)
          # <-- action

        when 2
          # at line 74:7: expression
          @state.following.push( TOKENS_FOLLOWING_expression_IN_printInstruction_301 )
          expression24 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression24.tree )
          # --> action
          return_value.result = PrintTree.new(( expression24.nil? ? nil : expression24.result ))
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
        # trace_out( __method__, 6 )

      end
      
      return return_value
    end

    PrintlInstructionReturnValue = define_return_scope :result

    # 
    # parser rule printlInstruction
    # 
    # (in Giraffe.g)
    # 78:1: printlInstruction returns [result] : PRINTL ( STRING | expression ) ;
    # 
    def printlInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )
      return_value = PrintlInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PRINTL25__ = nil
      __STRING26__ = nil
      expression27 = nil

      tree_for_PRINTL25 = nil
      tree_for_STRING26 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 79:5: PRINTL ( STRING | expression )
        __PRINTL25__ = match( PRINTL, TOKENS_FOLLOWING_PRINTL_IN_printlInstruction_329 )

        tree_for_PRINTL25 = @adaptor.create_with_payload( __PRINTL25__ )
        @adaptor.add_child( root_0, tree_for_PRINTL25 )

        # at line 79:13: ( STRING | expression )
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == STRING )
          alt_7 = 1
        elsif ( look_7_0.between?( ID, LB ) || look_7_0.between?( PLUS, MINUS ) || look_7_0.between?( INT, FLOAT ) )
          alt_7 = 2
        else
          raise NoViableAlternative( "", 7, 0 )
        end
        case alt_7
        when 1
          # at line 79:15: STRING
          __STRING26__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_printlInstruction_334 )

          tree_for_STRING26 = @adaptor.create_with_payload( __STRING26__ )
          @adaptor.add_child( root_0, tree_for_STRING26 )

          # --> action
          return_value.result = PrintlTree.new(AtomTree.new(lambda {|env| __STRING26__}))
          # <-- action

        when 2
          # at line 80:7: expression
          @state.following.push( TOKENS_FOLLOWING_expression_IN_printlInstruction_344 )
          expression27 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression27.tree )
          # --> action
          return_value.result = PrintlTree.new(( expression27.nil? ? nil : expression27.result ))
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
        # trace_out( __method__, 7 )

      end
      
      return return_value
    end

    IfInstructionReturnValue = define_return_scope :result

    # 
    # parser rule ifInstruction
    # 
    # (in Giraffe.g)
    # 84:1: ifInstruction returns [result] : IF condition env ifRest ;
    # 
    def ifInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      return_value = IfInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __IF28__ = nil
      condition29 = nil
      env30 = nil
      ifRest31 = nil

      tree_for_IF28 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 85:4: IF condition env ifRest
        __IF28__ = match( IF, TOKENS_FOLLOWING_IF_IN_ifInstruction_370 )

        tree_for_IF28 = @adaptor.create_with_payload( __IF28__ )
        root_0 = @adaptor.become_root( tree_for_IF28, root_0 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_ifInstruction_373 )
        condition29 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition29.tree )
        @state.following.push( TOKENS_FOLLOWING_env_IN_ifInstruction_375 )
        env30 = env
        @state.following.pop
        @adaptor.add_child( root_0, env30.tree )
        @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifInstruction_377 )
        ifRest31 = ifRest
        @state.following.pop
        @adaptor.add_child( root_0, ifRest31.tree )
        # --> action
        return_value.result = IfTree.new(( condition29.nil? ? nil : condition29.result ),( env30.nil? ? nil : env30.result ),( ifRest31.nil? ? nil : ifRest31.result ))
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
        # trace_out( __method__, 8 )

      end
      
      return return_value
    end

    IfRestReturnValue = define_return_scope :result

    # 
    # parser rule ifRest
    # 
    # (in Giraffe.g)
    # 89:1: ifRest returns [result] : ( ELSE env | ( ELSEIF | ELIF ) condition env op= ifRest | );
    # 
    def ifRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = IfRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ELSE32__ = nil
      set34 = nil
      op = nil
      env33 = nil
      condition35 = nil
      env36 = nil

      tree_for_ELSE32 = nil
      tree_for_set34 = nil

      begin
        # at line 90:2: ( ELSE env | ( ELSEIF | ELIF ) condition env op= ifRest | )
        alt_8 = 3
        case look_8 = @input.peek( 1 )
        when ELSE then alt_8 = 1
        when ELSEIF, ELIF then alt_8 = 2
        when EOF, RCB, COMMENT, SEMICOLON, T__49, T__50 then alt_8 = 3
        else
          raise NoViableAlternative( "", 8, 0 )
        end
        case alt_8
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 90:4: ELSE env
          __ELSE32__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_ifRest_396 )

          tree_for_ELSE32 = @adaptor.create_with_payload( __ELSE32__ )
          @adaptor.add_child( root_0, tree_for_ELSE32 )

          @state.following.push( TOKENS_FOLLOWING_env_IN_ifRest_398 )
          env33 = env
          @state.following.pop
          @adaptor.add_child( root_0, env33.tree )
          # --> action
          return_value.result = ( env33.nil? ? nil : env33.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 91:4: ( ELSEIF | ELIF ) condition env op= ifRest
          set34 = @input.look
          if @input.peek( 1 ).between?( ELSEIF, ELIF )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set34 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          @state.following.push( TOKENS_FOLLOWING_condition_IN_ifRest_413 )
          condition35 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition35.tree )
          @state.following.push( TOKENS_FOLLOWING_env_IN_ifRest_415 )
          env36 = env
          @state.following.pop
          @adaptor.add_child( root_0, env36.tree )
          @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifRest_419 )
          op = ifRest
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = IfTree.new(( condition35.nil? ? nil : condition35.result ),( env36.nil? ? nil : env36.result ),( op.nil? ? nil : op.result ))
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 93:4: 
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
        # trace_out( __method__, 9 )

      end
      
      return return_value
    end

    WhileCycleReturnValue = define_return_scope :result

    # 
    # parser rule whileCycle
    # 
    # (in Giraffe.g)
    # 96:1: whileCycle returns [result] : WHILE condition env ;
    # 
    def whileCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = WhileCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WHILE37__ = nil
      condition38 = nil
      env39 = nil

      tree_for_WHILE37 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 97:5: WHILE condition env
        __WHILE37__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_whileCycle_446 )

        tree_for_WHILE37 = @adaptor.create_with_payload( __WHILE37__ )
        @adaptor.add_child( root_0, tree_for_WHILE37 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_whileCycle_448 )
        condition38 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition38.tree )
        @state.following.push( TOKENS_FOLLOWING_env_IN_whileCycle_450 )
        env39 = env
        @state.following.pop
        @adaptor.add_child( root_0, env39.tree )
        # --> action
        return_value.result = WhileTree.new(( condition38.nil? ? nil : condition38.result ),( env39.nil? ? nil : env39.result ))
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
        # trace_out( __method__, 10 )

      end
      
      return return_value
    end

    DoCycleReturnValue = define_return_scope :result

    # 
    # parser rule doCycle
    # 
    # (in Giraffe.g)
    # 101:1: doCycle returns [result] : DO env WHILE condition ;
    # 
    def doCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = DoCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __DO40__ = nil
      __WHILE42__ = nil
      env41 = nil
      condition43 = nil

      tree_for_DO40 = nil
      tree_for_WHILE42 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 102:4: DO env WHILE condition
        __DO40__ = match( DO, TOKENS_FOLLOWING_DO_IN_doCycle_471 )

        tree_for_DO40 = @adaptor.create_with_payload( __DO40__ )
        @adaptor.add_child( root_0, tree_for_DO40 )

        @state.following.push( TOKENS_FOLLOWING_env_IN_doCycle_473 )
        env41 = env
        @state.following.pop
        @adaptor.add_child( root_0, env41.tree )
        __WHILE42__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_doCycle_475 )

        tree_for_WHILE42 = @adaptor.create_with_payload( __WHILE42__ )
        @adaptor.add_child( root_0, tree_for_WHILE42 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_doCycle_477 )
        condition43 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition43.tree )
        # --> action
        return_value.result = DoTree.new(( condition43.nil? ? nil : condition43.result ),( env41.nil? ? nil : env41.result ))
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
        # trace_out( __method__, 11 )

      end
      
      return return_value
    end

    ForCycleReturnValue = define_return_scope :result

    # 
    # parser rule forCycle
    # 
    # (in Giraffe.g)
    # 106:1: forCycle returns [result] : FOR as1= assignment COMMA condition COMMA as2= assignment LCB block RCB ;
    # 
    def forCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = ForCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __FOR44__ = nil
      __COMMA45__ = nil
      __COMMA47__ = nil
      __LCB48__ = nil
      __RCB50__ = nil
      as1 = nil
      as2 = nil
      condition46 = nil
      block49 = nil

      tree_for_FOR44 = nil
      tree_for_COMMA45 = nil
      tree_for_COMMA47 = nil
      tree_for_LCB48 = nil
      tree_for_RCB50 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 107:4: FOR as1= assignment COMMA condition COMMA as2= assignment LCB block RCB
        __FOR44__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_forCycle_498 )

        tree_for_FOR44 = @adaptor.create_with_payload( __FOR44__ )
        @adaptor.add_child( root_0, tree_for_FOR44 )

        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_502 )
        as1 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as1.tree )
        __COMMA45__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_forCycle_504 )
        @state.following.push( TOKENS_FOLLOWING_condition_IN_forCycle_507 )
        condition46 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition46.tree )
        __COMMA47__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_forCycle_509 )
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_514 )
        as2 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as2.tree )
        __LCB48__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_forCycle_516 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_forCycle_519 )
        block49 = block
        @state.following.pop
        @adaptor.add_child( root_0, block49.tree )
        __RCB50__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_forCycle_521 )
        # --> action
        return_value.result = ForTree.new(( as1.nil? ? nil : as1.result ),( condition46.nil? ? nil : condition46.result ),( as2.nil? ? nil : as2.result ),( block49.nil? ? nil : block49.list ))
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

    FuncReturnValue = define_return_scope :result

    # 
    # parser rule func
    # 
    # (in Giraffe.g)
    # 111:1: func returns [result] : ID ( params )? LCB block RCB ;
    # 
    def func
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = FuncReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID51__ = nil
      __LCB53__ = nil
      __RCB55__ = nil
      params52 = nil
      block54 = nil

      tree_for_ID51 = nil
      tree_for_LCB53 = nil
      tree_for_RCB55 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 112:4: ID ( params )? LCB block RCB
        __ID51__ = match( ID, TOKENS_FOLLOWING_ID_IN_func_543 )

        tree_for_ID51 = @adaptor.create_with_payload( __ID51__ )
        root_0 = @adaptor.become_root( tree_for_ID51, root_0 )

        # at line 112:8: ( params )?
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == ID )
          alt_9 = 1
        end
        case alt_9
        when 1
          # at line 112:8: params
          @state.following.push( TOKENS_FOLLOWING_params_IN_func_546 )
          params52 = params
          @state.following.pop
          @adaptor.add_child( root_0, params52.tree )

        end
        __LCB53__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_549 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_func_552 )
        block54 = block
        @state.following.pop
        @adaptor.add_child( root_0, block54.tree )
        __RCB55__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_554 )
        # --> action
        return_value.result = FuncTree.new(__ID51__.text,( params52.nil? ? nil : params52.list ),( block54.nil? ? nil : block54.list ))
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
        # trace_out( __method__, 13 )

      end
      
      return return_value
    end

    ParamsReturnValue = define_return_scope :list

    # 
    # parser rule params
    # 
    # (in Giraffe.g)
    # 116:1: params returns [list] : ID paramRest ;
    # 
    def params
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = ParamsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID56__ = nil
      paramRest57 = nil

      tree_for_ID56 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 117:4: ID paramRest
        __ID56__ = match( ID, TOKENS_FOLLOWING_ID_IN_params_574 )

        tree_for_ID56 = @adaptor.create_with_payload( __ID56__ )
        @adaptor.add_child( root_0, tree_for_ID56 )

        @state.following.push( TOKENS_FOLLOWING_paramRest_IN_params_576 )
        paramRest57 = paramRest
        @state.following.pop
        @adaptor.add_child( root_0, paramRest57.tree )
        # --> action
        return_value.list = [__ID56__.text] + ( paramRest57.nil? ? nil : paramRest57.list )
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

    ParamRestReturnValue = define_return_scope :list

    # 
    # parser rule paramRest
    # 
    # (in Giraffe.g)
    # 121:1: paramRest returns [list] : ( COMMA params | );
    # 
    def paramRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = ParamRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA58__ = nil
      params59 = nil

      tree_for_COMMA58 = nil

      begin
        # at line 122:2: ( COMMA params | )
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0 == COMMA )
          alt_10 = 1
        elsif ( look_10_0 == LCB )
          alt_10 = 2
        else
          raise NoViableAlternative( "", 10, 0 )
        end
        case alt_10
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 122:4: COMMA params
          __COMMA58__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_paramRest_595 )
          @state.following.push( TOKENS_FOLLOWING_params_IN_paramRest_598 )
          params59 = params
          @state.following.pop
          @adaptor.add_child( root_0, params59.tree )
          # --> action
          return_value.list = ( params59.nil? ? nil : params59.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 124:4: 
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
        # trace_out( __method__, 15 )

      end
      
      return return_value
    end

    CallReturnValue = define_return_scope :result

    # 
    # parser rule call
    # 
    # (in Giraffe.g)
    # 127:1: call returns [result] : ID LB ( args )? RB ;
    # 
    def call
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = CallReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID60__ = nil
      __LB61__ = nil
      __RB63__ = nil
      args62 = nil

      tree_for_ID60 = nil
      tree_for_LB61 = nil
      tree_for_RB63 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 128:4: ID LB ( args )? RB
        __ID60__ = match( ID, TOKENS_FOLLOWING_ID_IN_call_625 )

        tree_for_ID60 = @adaptor.create_with_payload( __ID60__ )
        root_0 = @adaptor.become_root( tree_for_ID60, root_0 )

        __LB61__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_628 )
        # at line 128:12: ( args )?
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0.between?( ID, LB ) || look_11_0.between?( PLUS, MINUS ) || look_11_0.between?( INT, FLOAT ) )
          alt_11 = 1
        end
        case alt_11
        when 1
          # at line 128:12: args
          @state.following.push( TOKENS_FOLLOWING_args_IN_call_631 )
          args62 = args
          @state.following.pop
          @adaptor.add_child( root_0, args62.tree )

        end
        __RB63__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_634 )
        # --> action
        return_value.result = CallTree.new(__ID60__,( args62.nil? ? nil : args62.list ))
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

    ArgsReturnValue = define_return_scope :list

    # 
    # parser rule args
    # 
    # (in Giraffe.g)
    # 132:1: args returns [list] : expression argsRest ;
    # 
    def args
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = ArgsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      expression64 = nil
      argsRest65 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 133:4: expression argsRest
        @state.following.push( TOKENS_FOLLOWING_expression_IN_args_655 )
        expression64 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression64.tree )
        @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_657 )
        argsRest65 = argsRest
        @state.following.pop
        @adaptor.add_child( root_0, argsRest65.tree )
        # --> action
        return_value.list = [( expression64.nil? ? nil : expression64.result )] + ( argsRest65.nil? ? nil : argsRest65.list )
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

    ArgsRestReturnValue = define_return_scope :list

    # 
    # parser rule argsRest
    # 
    # (in Giraffe.g)
    # 137:1: argsRest returns [list] : ( COMMA args | );
    # 
    def argsRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = ArgsRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA66__ = nil
      args67 = nil

      tree_for_COMMA66 = nil

      begin
        # at line 138:2: ( COMMA args | )
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == COMMA )
          alt_12 = 1
        elsif ( look_12_0 == RB )
          alt_12 = 2
        else
          raise NoViableAlternative( "", 12, 0 )
        end
        case alt_12
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 138:4: COMMA args
          __COMMA66__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsRest_678 )
          @state.following.push( TOKENS_FOLLOWING_args_IN_argsRest_681 )
          args67 = args
          @state.following.pop
          @adaptor.add_child( root_0, args67.tree )
          # --> action
          return_value.list = ( args67.nil? ? nil : args67.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 140:4: 
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
        # trace_out( __method__, 18 )

      end
      
      return return_value
    end

    ConditionReturnValue = define_return_scope :result

    # 
    # parser rule condition
    # 
    # (in Giraffe.g)
    # 145:1: condition returns [result] : orOperand ( OR op= condition )? ;
    # 
    def condition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = ConditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OR69__ = nil
      op = nil
      orOperand68 = nil

      tree_for_OR69 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 146:4: orOperand ( OR op= condition )?
        @state.following.push( TOKENS_FOLLOWING_orOperand_IN_condition_707 )
        orOperand68 = orOperand
        @state.following.pop
        @adaptor.add_child( root_0, orOperand68.tree )
        # --> action
        return_value.result = ( orOperand68.nil? ? nil : orOperand68.result )
        # <-- action
        # at line 147:3: ( OR op= condition )?
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == OR )
          alt_13 = 1
        end
        case alt_13
        when 1
          # at line 147:4: OR op= condition
          __OR69__ = match( OR, TOKENS_FOLLOWING_OR_IN_condition_714 )

          tree_for_OR69 = @adaptor.create_with_payload( __OR69__ )
          root_0 = @adaptor.become_root( tree_for_OR69, root_0 )

          @state.following.push( TOKENS_FOLLOWING_condition_IN_condition_719 )
          op = condition
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperandTree.new(return_value.result,( op.nil? ? nil : op.result ),lambda {|x,y| x || y})
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
        # trace_out( __method__, 19 )

      end
      
      return return_value
    end

    OrOperandReturnValue = define_return_scope :result

    # 
    # parser rule orOperand
    # 
    # (in Giraffe.g)
    # 152:1: orOperand returns [result] : boolOperand ( AND op= orOperand )? ;
    # 
    def orOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = OrOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __AND71__ = nil
      op = nil
      boolOperand70 = nil

      tree_for_AND71 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 153:4: boolOperand ( AND op= orOperand )?
        @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_orOperand_740 )
        boolOperand70 = boolOperand
        @state.following.pop
        @adaptor.add_child( root_0, boolOperand70.tree )
        # --> action
        return_value.result = ( boolOperand70.nil? ? nil : boolOperand70.result )
        # <-- action
        # at line 154:3: ( AND op= orOperand )?
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == AND )
          alt_14 = 1
        end
        case alt_14
        when 1
          # at line 154:4: AND op= orOperand
          __AND71__ = match( AND, TOKENS_FOLLOWING_AND_IN_orOperand_747 )

          tree_for_AND71 = @adaptor.create_with_payload( __AND71__ )
          root_0 = @adaptor.become_root( tree_for_AND71, root_0 )

          @state.following.push( TOKENS_FOLLOWING_orOperand_IN_orOperand_752 )
          op = orOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperandTree.new(return_value.result,( op.nil? ? nil : op.result ),lambda {|x,y| x && y})
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
        # trace_out( __method__, 20 )

      end
      
      return return_value
    end

    BoolOperandReturnValue = define_return_scope :result

    # 
    # parser rule boolOperand
    # 
    # (in Giraffe.g)
    # 157:1: boolOperand returns [result] : ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) );
    # 
    def boolOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = BoolOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NOT73__ = nil
      __LB74__ = nil
      __RB76__ = nil
      __EQ77__ = nil
      __NE78__ = nil
      __LT79__ = nil
      __GT80__ = nil
      __LE81__ = nil
      __GE82__ = nil
      op1 = nil
      op2 = nil
      bool72 = nil
      condition75 = nil

      tree_for_NOT73 = nil
      tree_for_LB74 = nil
      tree_for_RB76 = nil
      tree_for_EQ77 = nil
      tree_for_NE78 = nil
      tree_for_LT79 = nil
      tree_for_GT80 = nil
      tree_for_LE81 = nil
      tree_for_GE82 = nil

      begin
        # at line 158:2: ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) )
        alt_22 = 3
        case look_22 = @input.peek( 1 )
        when TRUE, FALSE then alt_22 = 1
        when NOT then alt_22 = 2
        when ID, LB, PLUS, MINUS, INT, FLOAT then alt_22 = 3
        else
          raise NoViableAlternative( "", 22, 0 )
        end
        case alt_22
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 158:4: bool
          @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_771 )
          bool72 = bool
          @state.following.pop
          @adaptor.add_child( root_0, bool72.tree )
          # --> action
          return_value.result = ( bool72.nil? ? nil : bool72.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 159:4: NOT LB condition RB
          __NOT73__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_boolOperand_778 )

          tree_for_NOT73 = @adaptor.create_with_payload( __NOT73__ )
          @adaptor.add_child( root_0, tree_for_NOT73 )

          __LB74__ = match( LB, TOKENS_FOLLOWING_LB_IN_boolOperand_780 )
          @state.following.push( TOKENS_FOLLOWING_condition_IN_boolOperand_783 )
          condition75 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition75.tree )
          __RB76__ = match( RB, TOKENS_FOLLOWING_RB_IN_boolOperand_785 )
          # --> action
          return_value.result = !( condition75.nil? ? nil : condition75.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 160:4: op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_795 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # at line 160:19: ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          alt_21 = 6
          case look_21 = @input.peek( 1 )
          when EQ then alt_21 = 1
          when NE then alt_21 = 2
          when LT then alt_21 = 3
          when GT then alt_21 = 4
          when LE then alt_21 = 5
          when GE then alt_21 = 6
          else
            raise NoViableAlternative( "", 21, 0 )
          end
          case alt_21
          when 1
            # at line 160:20: EQ (op2= bool | op2= expression )
            __EQ77__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_boolOperand_798 )

            tree_for_EQ77 = @adaptor.create_with_payload( __EQ77__ )
            root_0 = @adaptor.become_root( tree_for_EQ77, root_0 )

            # at line 160:24: (op2= bool | op2= expression )
            alt_15 = 2
            look_15_0 = @input.peek( 1 )

            if ( look_15_0.between?( TRUE, FALSE ) )
              alt_15 = 1
            elsif ( look_15_0.between?( ID, LB ) || look_15_0.between?( PLUS, MINUS ) || look_15_0.between?( INT, FLOAT ) )
              alt_15 = 2
            else
              raise NoViableAlternative( "", 15, 0 )
            end
            case alt_15
            when 1
              # at line 160:26: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_805 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 160:37: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_811 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperandTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),lambda {|x,y| x == y})
            # <-- action

          when 2
            # at line 161:6: NE (op2= bool | op2= expression )
            __NE78__ = match( NE, TOKENS_FOLLOWING_NE_IN_boolOperand_822 )

            tree_for_NE78 = @adaptor.create_with_payload( __NE78__ )
            root_0 = @adaptor.become_root( tree_for_NE78, root_0 )

            # at line 161:10: (op2= bool | op2= expression )
            alt_16 = 2
            look_16_0 = @input.peek( 1 )

            if ( look_16_0.between?( TRUE, FALSE ) )
              alt_16 = 1
            elsif ( look_16_0.between?( ID, LB ) || look_16_0.between?( PLUS, MINUS ) || look_16_0.between?( INT, FLOAT ) )
              alt_16 = 2
            else
              raise NoViableAlternative( "", 16, 0 )
            end
            case alt_16
            when 1
              # at line 161:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_829 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 161:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_835 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperandTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),lambda {|x,y| x != y})
            # <-- action

          when 3
            # at line 162:6: LT (op2= bool | op2= expression )
            __LT79__ = match( LT, TOKENS_FOLLOWING_LT_IN_boolOperand_846 )

            tree_for_LT79 = @adaptor.create_with_payload( __LT79__ )
            root_0 = @adaptor.become_root( tree_for_LT79, root_0 )

            # at line 162:10: (op2= bool | op2= expression )
            alt_17 = 2
            look_17_0 = @input.peek( 1 )

            if ( look_17_0.between?( TRUE, FALSE ) )
              alt_17 = 1
            elsif ( look_17_0.between?( ID, LB ) || look_17_0.between?( PLUS, MINUS ) || look_17_0.between?( INT, FLOAT ) )
              alt_17 = 2
            else
              raise NoViableAlternative( "", 17, 0 )
            end
            case alt_17
            when 1
              # at line 162:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_853 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 162:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_859 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperandTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),lambda {|x,y| x < y})
            # <-- action

          when 4
            # at line 163:6: GT (op2= bool | op2= expression )
            __GT80__ = match( GT, TOKENS_FOLLOWING_GT_IN_boolOperand_870 )

            tree_for_GT80 = @adaptor.create_with_payload( __GT80__ )
            root_0 = @adaptor.become_root( tree_for_GT80, root_0 )

            # at line 163:10: (op2= bool | op2= expression )
            alt_18 = 2
            look_18_0 = @input.peek( 1 )

            if ( look_18_0.between?( TRUE, FALSE ) )
              alt_18 = 1
            elsif ( look_18_0.between?( ID, LB ) || look_18_0.between?( PLUS, MINUS ) || look_18_0.between?( INT, FLOAT ) )
              alt_18 = 2
            else
              raise NoViableAlternative( "", 18, 0 )
            end
            case alt_18
            when 1
              # at line 163:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_877 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 163:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_883 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperandTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),lambda {|x,y| x > y})
            # <-- action

          when 5
            # at line 164:6: LE (op2= bool | op2= expression )
            __LE81__ = match( LE, TOKENS_FOLLOWING_LE_IN_boolOperand_894 )

            tree_for_LE81 = @adaptor.create_with_payload( __LE81__ )
            root_0 = @adaptor.become_root( tree_for_LE81, root_0 )

            # at line 164:10: (op2= bool | op2= expression )
            alt_19 = 2
            look_19_0 = @input.peek( 1 )

            if ( look_19_0.between?( TRUE, FALSE ) )
              alt_19 = 1
            elsif ( look_19_0.between?( ID, LB ) || look_19_0.between?( PLUS, MINUS ) || look_19_0.between?( INT, FLOAT ) )
              alt_19 = 2
            else
              raise NoViableAlternative( "", 19, 0 )
            end
            case alt_19
            when 1
              # at line 164:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_901 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 164:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_907 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperandTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),lambda {|x,y| x <= y})
            # <-- action

          when 6
            # at line 165:6: GE (op2= bool | op2= expression )
            __GE82__ = match( GE, TOKENS_FOLLOWING_GE_IN_boolOperand_918 )

            tree_for_GE82 = @adaptor.create_with_payload( __GE82__ )
            root_0 = @adaptor.become_root( tree_for_GE82, root_0 )

            # at line 165:10: (op2= bool | op2= expression )
            alt_20 = 2
            look_20_0 = @input.peek( 1 )

            if ( look_20_0.between?( TRUE, FALSE ) )
              alt_20 = 1
            elsif ( look_20_0.between?( ID, LB ) || look_20_0.between?( PLUS, MINUS ) || look_20_0.between?( INT, FLOAT ) )
              alt_20 = 2
            else
              raise NoViableAlternative( "", 20, 0 )
            end
            case alt_20
            when 1
              # at line 165:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_925 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 165:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_931 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperandTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),lambda {|x,y| x >= y})
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
        # trace_out( __method__, 21 )

      end
      
      return return_value
    end

    ExpressionReturnValue = define_return_scope :result

    # 
    # parser rule expression
    # 
    # (in Giraffe.g)
    # 170:1: expression returns [result] : addOperand ( PLUS op= expression | MINUS op= expression )? ;
    # 
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS84__ = nil
      __MINUS85__ = nil
      op = nil
      addOperand83 = nil

      tree_for_PLUS84 = nil
      tree_for_MINUS85 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 171:4: addOperand ( PLUS op= expression | MINUS op= expression )?
        @state.following.push( TOKENS_FOLLOWING_addOperand_IN_expression_956 )
        addOperand83 = addOperand
        @state.following.pop
        @adaptor.add_child( root_0, addOperand83.tree )
        # --> action
        return_value.result = ( addOperand83.nil? ? nil : addOperand83.result )
        # <-- action
        # at line 172:3: ( PLUS op= expression | MINUS op= expression )?
        alt_23 = 3
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == PLUS )
          alt_23 = 1
        elsif ( look_23_0 == MINUS )
          alt_23 = 2
        end
        case alt_23
        when 1
          # at line 173:4: PLUS op= expression
          __PLUS84__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expression_967 )

          tree_for_PLUS84 = @adaptor.create_with_payload( __PLUS84__ )
          root_0 = @adaptor.become_root( tree_for_PLUS84, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_972 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperandTree.new(return_value.result,( op.nil? ? nil : op.result ),lambda {|x,y| x + y})
          # <-- action

        when 2
          # at line 174:5: MINUS op= expression
          __MINUS85__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expression_980 )

          tree_for_MINUS85 = @adaptor.create_with_payload( __MINUS85__ )
          root_0 = @adaptor.become_root( tree_for_MINUS85, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_985 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperandTree.new(return_value.result,( op.nil? ? nil : op.result ),lambda {|x,y| x - y})
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
        # trace_out( __method__, 22 )

      end
      
      return return_value
    end

    AddOperandReturnValue = define_return_scope :result

    # 
    # parser rule addOperand
    # 
    # (in Giraffe.g)
    # 178:1: addOperand returns [result] : mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )? ;
    # 
    def addOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = AddOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __MUL87__ = nil
      __DIV88__ = nil
      __MOD89__ = nil
      op = nil
      mulOperand86 = nil

      tree_for_MUL87 = nil
      tree_for_DIV88 = nil
      tree_for_MOD89 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 179:4: mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperand_1007 )
        mulOperand86 = mulOperand
        @state.following.pop
        @adaptor.add_child( root_0, mulOperand86.tree )
        # --> action
        return_value.result = ( mulOperand86.nil? ? nil : mulOperand86.result )
        # <-- action
        # at line 180:3: ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        alt_24 = 4
        case look_24 = @input.peek( 1 )
        when MUL then alt_24 = 1
        when DIV then alt_24 = 2
        when MOD then alt_24 = 3
        end
        case alt_24
        when 1
          # at line 181:4: MUL op= addOperand
          __MUL87__ = match( MUL, TOKENS_FOLLOWING_MUL_IN_addOperand_1018 )

          tree_for_MUL87 = @adaptor.create_with_payload( __MUL87__ )
          root_0 = @adaptor.become_root( tree_for_MUL87, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1023 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperandTree.new(return_value.result,( op.nil? ? nil : op.result ),lambda {|x,y| x * y})
          # <-- action

        when 2
          # at line 182:5: DIV op= addOperand
          __DIV88__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_addOperand_1031 )

          tree_for_DIV88 = @adaptor.create_with_payload( __DIV88__ )
          root_0 = @adaptor.become_root( tree_for_DIV88, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1036 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperandTree.new(return_value.result,( op.nil? ? nil : op.result ),lambda {|x,y| x / y})
          # <-- action

        when 3
          # at line 183:5: MOD op= addOperand
          __MOD89__ = match( MOD, TOKENS_FOLLOWING_MOD_IN_addOperand_1044 )

          tree_for_MOD89 = @adaptor.create_with_payload( __MOD89__ )
          root_0 = @adaptor.become_root( tree_for_MOD89, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1049 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperandTree.new(return_value.result,( op.nil? ? nil : op.result ),lambda {|x,y| x % y})
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

    MulOperandReturnValue = define_return_scope :result

    # 
    # parser rule mulOperand
    # 
    # (in Giraffe.g)
    # 187:1: mulOperand returns [result] : ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest );
    # 
    def mulOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = MulOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS90__ = nil
      __MINUS92__ = nil
      mulOperandRest91 = nil
      mulOperandRest93 = nil
      mulOperandRest94 = nil

      tree_for_PLUS90 = nil
      tree_for_MINUS92 = nil

      begin
        # at line 188:2: ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest )
        alt_25 = 3
        case look_25 = @input.peek( 1 )
        when PLUS then alt_25 = 1
        when MINUS then alt_25 = 2
        when ID, LB, INT, FLOAT then alt_25 = 3
        else
          raise NoViableAlternative( "", 25, 0 )
        end
        case alt_25
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 188:4: PLUS mulOperandRest
          __PLUS90__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_mulOperand_1071 )

          tree_for_PLUS90 = @adaptor.create_with_payload( __PLUS90__ )
          @adaptor.add_child( root_0, tree_for_PLUS90 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1073 )
          mulOperandRest91 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest91.tree )
          # --> action
          return_value.result = ( mulOperandRest91.nil? ? nil : mulOperandRest91.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 189:4: MINUS mulOperandRest
          __MINUS92__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_mulOperand_1080 )

          tree_for_MINUS92 = @adaptor.create_with_payload( __MINUS92__ )
          @adaptor.add_child( root_0, tree_for_MINUS92 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1082 )
          mulOperandRest93 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest93.tree )
          # --> action
          return_value.result = UnaryOperandTree.new(( mulOperandRest93.nil? ? nil : mulOperandRest93.result ),lambda {|x| -x})
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 190:4: mulOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1089 )
          mulOperandRest94 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest94.tree )
          # --> action
          return_value.result = ( mulOperandRest94.nil? ? nil : mulOperandRest94.result )
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
        # trace_out( __method__, 24 )

      end
      
      return return_value
    end

    MulOperandRestReturnValue = define_return_scope :result

    # 
    # parser rule mulOperandRest
    # 
    # (in Giraffe.g)
    # 193:1: mulOperandRest returns [result] : ( ID | LB expression RB | INT | FLOAT | call );
    # 
    def mulOperandRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = MulOperandRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID95__ = nil
      __LB96__ = nil
      __RB98__ = nil
      __INT99__ = nil
      __FLOAT100__ = nil
      expression97 = nil
      call101 = nil

      tree_for_ID95 = nil
      tree_for_LB96 = nil
      tree_for_RB98 = nil
      tree_for_INT99 = nil
      tree_for_FLOAT100 = nil

      begin
        # at line 194:2: ( ID | LB expression RB | INT | FLOAT | call )
        alt_26 = 5
        case look_26 = @input.peek( 1 )
        when ID then look_26_1 = @input.peek( 2 )

        if ( look_26_1 == LB )
          alt_26 = 5
        elsif ( look_26_1 == EOF || look_26_1.between?( LCB, SEMICOLON ) || look_26_1 == COMMA || look_26_1.between?( RB, AND ) || look_26_1.between?( EQ, MOD ) || look_26_1.between?( T__49, T__50 ) )
          alt_26 = 1
        else
          raise NoViableAlternative( "", 26, 1 )
        end
        when LB then alt_26 = 2
        when INT then alt_26 = 3
        when FLOAT then alt_26 = 4
        else
          raise NoViableAlternative( "", 26, 0 )
        end
        case alt_26
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 194:4: ID
          __ID95__ = match( ID, TOKENS_FOLLOWING_ID_IN_mulOperandRest_1106 )

          tree_for_ID95 = @adaptor.create_with_payload( __ID95__ )
          @adaptor.add_child( root_0, tree_for_ID95 )

          # --> action
          return_value.result = VarTree.new(__ID95__.text)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 195:4: LB expression RB
          __LB96__ = match( LB, TOKENS_FOLLOWING_LB_IN_mulOperandRest_1113 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_mulOperandRest_1116 )
          expression97 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression97.tree )
          __RB98__ = match( RB, TOKENS_FOLLOWING_RB_IN_mulOperandRest_1118 )
          # --> action
          return_value.result = ( expression97.nil? ? nil : expression97.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 196:4: INT
          __INT99__ = match( INT, TOKENS_FOLLOWING_INT_IN_mulOperandRest_1126 )

          tree_for_INT99 = @adaptor.create_with_payload( __INT99__ )
          @adaptor.add_child( root_0, tree_for_INT99 )

          # --> action
          return_value.result = AtomTree.new(lambda {|env| __INT99__.text.to_i})
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 197:4: FLOAT
          __FLOAT100__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_mulOperandRest_1133 )

          tree_for_FLOAT100 = @adaptor.create_with_payload( __FLOAT100__ )
          @adaptor.add_child( root_0, tree_for_FLOAT100 )

          # --> action
          return_value.result = AtomTree.new(lambda {|env| __FLOAT100__.text.to_f})
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 198:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_mulOperandRest_1140 )
          call101 = call
          @state.following.pop
          @adaptor.add_child( root_0, call101.tree )
          # --> action
          return_value.result = ( call101.nil? ? nil : call101.result )
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
        # trace_out( __method__, 25 )

      end
      
      return return_value
    end

    ValueReturnValue = define_return_scope :result

    # 
    # parser rule value
    # 
    # (in Giraffe.g)
    # 200:1: value returns [result] : ( expression | STRING | CHAR );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __STRING103__ = nil
      __CHAR104__ = nil
      expression102 = nil

      tree_for_STRING103 = nil
      tree_for_CHAR104 = nil

      begin
        # at line 201:2: ( expression | STRING | CHAR )
        alt_27 = 3
        case look_27 = @input.peek( 1 )
        when ID, LB, PLUS, MINUS, INT, FLOAT then alt_27 = 1
        when STRING then alt_27 = 2
        when CHAR then alt_27 = 3
        else
          raise NoViableAlternative( "", 27, 0 )
        end
        case alt_27
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 201:5: expression
          @state.following.push( TOKENS_FOLLOWING_expression_IN_value_1156 )
          expression102 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression102.tree )
          # --> action
          return_value.result = ( expression102.nil? ? nil : expression102.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 202:4: STRING
          __STRING103__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_value_1163 )

          tree_for_STRING103 = @adaptor.create_with_payload( __STRING103__ )
          @adaptor.add_child( root_0, tree_for_STRING103 )

          # --> action
          return_value.result = AtomTree.new(lambda {|env| __STRING103__.text})
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 203:4: CHAR
          __CHAR104__ = match( CHAR, TOKENS_FOLLOWING_CHAR_IN_value_1170 )

          tree_for_CHAR104 = @adaptor.create_with_payload( __CHAR104__ )
          @adaptor.add_child( root_0, tree_for_CHAR104 )

          # --> action
          return_value.result = AtomTree.new(lambda {|env| __CHAR104__.text})
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
        # trace_out( __method__, 26 )

      end
      
      return return_value
    end

    AssignmentReturnValue = define_return_scope :result

    # 
    # parser rule assignment
    # 
    # (in Giraffe.g)
    # 206:1: assignment returns [result] : ID ASSIGN value ;
    # 
    def assignment
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = AssignmentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID105__ = nil
      __ASSIGN106__ = nil
      value107 = nil

      tree_for_ID105 = nil
      tree_for_ASSIGN106 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 207:4: ID ASSIGN value
        __ID105__ = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1189 )

        tree_for_ID105 = @adaptor.create_with_payload( __ID105__ )
        @adaptor.add_child( root_0, tree_for_ID105 )

        __ASSIGN106__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1191 )

        tree_for_ASSIGN106 = @adaptor.create_with_payload( __ASSIGN106__ )
        root_0 = @adaptor.become_root( tree_for_ASSIGN106, root_0 )

        @state.following.push( TOKENS_FOLLOWING_value_IN_assignment_1194 )
        value107 = value
        @state.following.pop
        @adaptor.add_child( root_0, value107.tree )
        # --> action
         return_value.result = AssignTree.new(__ID105__.text,( value107.nil? ? nil : value107.result )) 
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
        # trace_out( __method__, 27 )

      end
      
      return return_value
    end

    BoolReturnValue = define_return_scope :result

    # 
    # parser rule bool
    # 
    # (in Giraffe.g)
    # 209:1: bool returns [result] : ( TRUE | FALSE );
    # 
    def bool
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = BoolReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __TRUE108__ = nil
      __FALSE109__ = nil

      tree_for_TRUE108 = nil
      tree_for_FALSE109 = nil

      begin
        # at line 210:2: ( TRUE | FALSE )
        alt_28 = 2
        look_28_0 = @input.peek( 1 )

        if ( look_28_0 == TRUE )
          alt_28 = 1
        elsif ( look_28_0 == FALSE )
          alt_28 = 2
        else
          raise NoViableAlternative( "", 28, 0 )
        end
        case alt_28
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 210:4: TRUE
          __TRUE108__ = match( TRUE, TOKENS_FOLLOWING_TRUE_IN_bool_1212 )

          tree_for_TRUE108 = @adaptor.create_with_payload( __TRUE108__ )
          @adaptor.add_child( root_0, tree_for_TRUE108 )

          # --> action
          return_value.result = AtomTree.new(lambda {|env| true})
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 211:5: FALSE
          __FALSE109__ = match( FALSE, TOKENS_FOLLOWING_FALSE_IN_bool_1220 )

          tree_for_FALSE109 = @adaptor.create_with_payload( __FALSE109__ )
          @adaptor.add_child( root_0, tree_for_FALSE109 )

          # --> action
          return_value.result = AtomTree.new(lambda {|env| false})
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



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA5 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 1, 9, 12, -1 )
      MIN = unpack( 2, 4, 11, -1 )
      MAX = unpack( 1, 50, 1, 39, 11, -1 )
      ACCEPT = unpack( 2, -1, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 
                       1, 11, 1, 1, 1, 2, 1, 3 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 2, 3, 9, 1, 7, 1, -1, 1, 8, 1, 4, 3, -1, 1, 5, 1, 6, 
                1, 3, 1, -1, 1, 1, 29, -1, 2, 9 ),
        unpack( 1, 12, 14, -1, 1, 12, 1, 11, 18, -1, 1, 10 ),
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
          58:1: instruction returns [result] : ( assignment | call | func | env | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa5 = DFA5.new( self, 5 )

    end
    TOKENS_FOLLOWING_block_IN_program_49 = Set[ 1 ]
    TOKENS_FOLLOWING_LCB_IN_env_64 = Set[ 4, 6, 7, 8, 10, 11, 15, 16, 17, 19, 49, 50 ]
    TOKENS_FOLLOWING_block_IN_env_70 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_env_76 = Set[ 1 ]
    TOKENS_FOLLOWING_instruction_IN_block_96 = Set[ 6, 7, 49, 50 ]
    TOKENS_FOLLOWING_instructionRest_IN_block_106 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_instructionRest_136 = Set[ 49, 50 ]
    TOKENS_FOLLOWING_T__49_IN_instructionRest_140 = Set[ 50 ]
    TOKENS_FOLLOWING_T__50_IN_instructionRest_144 = Set[ 4, 6, 7, 8, 10, 11, 15, 16, 17, 19, 49, 50 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_150 = Set[ 4, 6, 7, 8, 10, 11, 15, 16, 17, 19, 49, 50 ]
    TOKENS_FOLLOWING_instruction_IN_instructionRest_157 = Set[ 6, 7, 49, 50 ]
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
    TOKENS_FOLLOWING_PRINT_IN_printInstruction_285 = Set[ 9, 19, 20, 31, 32, 36, 37 ]
    TOKENS_FOLLOWING_STRING_IN_printInstruction_291 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_printInstruction_301 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINTL_IN_printlInstruction_329 = Set[ 9, 19, 20, 31, 32, 36, 37 ]
    TOKENS_FOLLOWING_STRING_IN_printlInstruction_334 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_printlInstruction_344 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_ifInstruction_370 = Set[ 9, 19, 20, 24, 31, 32, 36, 37, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_ifInstruction_373 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_ifInstruction_375 = Set[ 12, 13, 14 ]
    TOKENS_FOLLOWING_ifRest_IN_ifInstruction_377 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_ifRest_396 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_ifRest_398 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_ifRest_405 = Set[ 9, 19, 20, 24, 31, 32, 36, 37, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_ifRest_413 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_ifRest_415 = Set[ 12, 13, 14 ]
    TOKENS_FOLLOWING_ifRest_IN_ifRest_419 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_whileCycle_446 = Set[ 9, 19, 20, 24, 31, 32, 36, 37, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_whileCycle_448 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_whileCycle_450 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_doCycle_471 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_doCycle_473 = Set[ 15 ]
    TOKENS_FOLLOWING_WHILE_IN_doCycle_475 = Set[ 9, 19, 20, 24, 31, 32, 36, 37, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_doCycle_477 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_forCycle_498 = Set[ 19 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_502 = Set[ 18 ]
    TOKENS_FOLLOWING_COMMA_IN_forCycle_504 = Set[ 9, 19, 20, 24, 31, 32, 36, 37, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_forCycle_507 = Set[ 18 ]
    TOKENS_FOLLOWING_COMMA_IN_forCycle_509 = Set[ 19 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_514 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_forCycle_516 = Set[ 4, 6, 7, 8, 10, 11, 15, 16, 17, 19, 49, 50 ]
    TOKENS_FOLLOWING_block_IN_forCycle_519 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_forCycle_521 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_func_543 = Set[ 4, 19 ]
    TOKENS_FOLLOWING_params_IN_func_546 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_func_549 = Set[ 4, 6, 7, 8, 10, 11, 15, 16, 17, 19, 49, 50 ]
    TOKENS_FOLLOWING_block_IN_func_552 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_func_554 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_params_574 = Set[ 18 ]
    TOKENS_FOLLOWING_paramRest_IN_params_576 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_paramRest_595 = Set[ 19 ]
    TOKENS_FOLLOWING_params_IN_paramRest_598 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_call_625 = Set[ 20 ]
    TOKENS_FOLLOWING_LB_IN_call_628 = Set[ 9, 19, 20, 21, 31, 32, 36, 37 ]
    TOKENS_FOLLOWING_args_IN_call_631 = Set[ 21 ]
    TOKENS_FOLLOWING_RB_IN_call_634 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_args_655 = Set[ 18 ]
    TOKENS_FOLLOWING_argsRest_IN_args_657 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsRest_678 = Set[ 9, 19, 20, 31, 32, 36, 37 ]
    TOKENS_FOLLOWING_args_IN_argsRest_681 = Set[ 1 ]
    TOKENS_FOLLOWING_orOperand_IN_condition_707 = Set[ 1, 22 ]
    TOKENS_FOLLOWING_OR_IN_condition_714 = Set[ 9, 19, 20, 24, 31, 32, 36, 37, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_condition_719 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperand_IN_orOperand_740 = Set[ 1, 23 ]
    TOKENS_FOLLOWING_AND_IN_orOperand_747 = Set[ 9, 19, 20, 24, 31, 32, 36, 37, 40, 41 ]
    TOKENS_FOLLOWING_orOperand_IN_orOperand_752 = Set[ 1 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_771 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_boolOperand_778 = Set[ 20 ]
    TOKENS_FOLLOWING_LB_IN_boolOperand_780 = Set[ 9, 19, 20, 24, 31, 32, 36, 37, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_boolOperand_783 = Set[ 21 ]
    TOKENS_FOLLOWING_RB_IN_boolOperand_785 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_795 = Set[ 25, 26, 27, 28, 29, 30 ]
    TOKENS_FOLLOWING_EQ_IN_boolOperand_798 = Set[ 9, 19, 20, 31, 32, 36, 37, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_805 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_811 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_boolOperand_822 = Set[ 9, 19, 20, 31, 32, 36, 37, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_829 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_835 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_boolOperand_846 = Set[ 9, 19, 20, 31, 32, 36, 37, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_853 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_859 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_boolOperand_870 = Set[ 9, 19, 20, 31, 32, 36, 37, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_877 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_883 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_boolOperand_894 = Set[ 9, 19, 20, 31, 32, 36, 37, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_901 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_907 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_boolOperand_918 = Set[ 9, 19, 20, 31, 32, 36, 37, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_925 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_931 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperand_IN_expression_956 = Set[ 1, 31, 32 ]
    TOKENS_FOLLOWING_PLUS_IN_expression_967 = Set[ 9, 19, 20, 31, 32, 36, 37 ]
    TOKENS_FOLLOWING_expression_IN_expression_972 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expression_980 = Set[ 9, 19, 20, 31, 32, 36, 37 ]
    TOKENS_FOLLOWING_expression_IN_expression_985 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperand_1007 = Set[ 1, 33, 34, 35 ]
    TOKENS_FOLLOWING_MUL_IN_addOperand_1018 = Set[ 9, 19, 20, 31, 32, 36, 37 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1023 = Set[ 1 ]
    TOKENS_FOLLOWING_DIV_IN_addOperand_1031 = Set[ 9, 19, 20, 31, 32, 36, 37 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1036 = Set[ 1 ]
    TOKENS_FOLLOWING_MOD_IN_addOperand_1044 = Set[ 9, 19, 20, 31, 32, 36, 37 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1049 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_mulOperand_1071 = Set[ 9, 19, 20, 31, 32, 36, 37 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1073 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_mulOperand_1080 = Set[ 9, 19, 20, 31, 32, 36, 37 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1082 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1089 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_mulOperandRest_1106 = Set[ 1 ]
    TOKENS_FOLLOWING_LB_IN_mulOperandRest_1113 = Set[ 9, 19, 20, 31, 32, 36, 37 ]
    TOKENS_FOLLOWING_expression_IN_mulOperandRest_1116 = Set[ 21 ]
    TOKENS_FOLLOWING_RB_IN_mulOperandRest_1118 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_mulOperandRest_1126 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_mulOperandRest_1133 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_mulOperandRest_1140 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_value_1156 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_value_1163 = Set[ 1 ]
    TOKENS_FOLLOWING_CHAR_IN_value_1170 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1189 = Set[ 39 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1191 = Set[ 9, 19, 20, 31, 32, 36, 37, 38 ]
    TOKENS_FOLLOWING_value_IN_assignment_1194 = Set[ 1 ]
    TOKENS_FOLLOWING_TRUE_IN_bool_1212 = Set[ 1 ]
    TOKENS_FOLLOWING_FALSE_IN_bool_1220 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end


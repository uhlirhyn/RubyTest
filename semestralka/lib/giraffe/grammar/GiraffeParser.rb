#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-11-12 01:50:21
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
    define_tokens( :EXPONENT => 42, :LT => 28, :WHILE => 15, :RB => 21, 
                   :MOD => 36, :OCTAL_ESC => 47, :CHAR => 22, :FOR => 17, 
                   :DO => 16, :FLOAT => 38, :NOT => 25, :RCB => 5, :ID => 19, 
                   :AND => 24, :EOF => -1, :IF => 11, :ESC_SEQ => 44, :LCB => 4, 
                   :COMMA => 18, :PLUS => 32, :EQ => 26, :COMMENT => 6, 
                   :T__50 => 50, :NE => 27, :GE => 31, :T__49 => 49, :UNICODE_ESC => 46, 
                   :ELSE => 12, :HEX_DIGIT => 45, :SEMICOLON => 7, :INT => 37, 
                   :MINUS => 33, :MUL => 34, :TRUE => 40, :PRINT => 8, :ELSEIF => 13, 
                   :PRINTL => 10, :COLON => 48, :ELIF => 14, :WS => 43, 
                   :OR => 23, :ASSIGN => 39, :GT => 29, :LB => 20, :DIV => 35, 
                   :FALSE => 41, :LE => 30, :STRING => 9 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "LCB", "RCB", "COMMENT", "SEMICOLON", "PRINT", "STRING", 
                    "PRINTL", "IF", "ELSE", "ELSEIF", "ELIF", "WHILE", "DO", 
                    "FOR", "COMMA", "ID", "LB", "RB", "CHAR", "OR", "AND", 
                    "NOT", "EQ", "NE", "LT", "GT", "LE", "GE", "PLUS", "MINUS", 
                    "MUL", "DIV", "MOD", "INT", "FLOAT", "ASSIGN", "TRUE", 
                    "FALSE", "EXPONENT", "WS", "ESC_SEQ", "HEX_DIGIT", "UNICODE_ESC", 
                    "OCTAL_ESC", "COLON", "'\\r'", "'\\n'" )
    
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
          return_value.result = PrintlTree.new(AtomTree.new(lambda {|env| __STRING26__.text}))
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
    # 96:1: whileCycle returns [result] : WHILE condition LCB block RCB ;
    # 
    def whileCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = WhileCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WHILE37__ = nil
      __LCB39__ = nil
      __RCB41__ = nil
      condition38 = nil
      block40 = nil

      tree_for_WHILE37 = nil
      tree_for_LCB39 = nil
      tree_for_RCB41 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 97:5: WHILE condition LCB block RCB
        __WHILE37__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_whileCycle_446 )

        tree_for_WHILE37 = @adaptor.create_with_payload( __WHILE37__ )
        @adaptor.add_child( root_0, tree_for_WHILE37 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_whileCycle_448 )
        condition38 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition38.tree )
        __LCB39__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_whileCycle_450 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_whileCycle_453 )
        block40 = block
        @state.following.pop
        @adaptor.add_child( root_0, block40.tree )
        __RCB41__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_whileCycle_455 )
        # --> action
        return_value.result = WhileTree.new(( condition38.nil? ? nil : condition38.result ),( block40.nil? ? nil : block40.list ))
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
      __DO42__ = nil
      __WHILE44__ = nil
      env43 = nil
      condition45 = nil

      tree_for_DO42 = nil
      tree_for_WHILE44 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 102:4: DO env WHILE condition
        __DO42__ = match( DO, TOKENS_FOLLOWING_DO_IN_doCycle_477 )

        tree_for_DO42 = @adaptor.create_with_payload( __DO42__ )
        @adaptor.add_child( root_0, tree_for_DO42 )

        @state.following.push( TOKENS_FOLLOWING_env_IN_doCycle_479 )
        env43 = env
        @state.following.pop
        @adaptor.add_child( root_0, env43.tree )
        __WHILE44__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_doCycle_481 )

        tree_for_WHILE44 = @adaptor.create_with_payload( __WHILE44__ )
        @adaptor.add_child( root_0, tree_for_WHILE44 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_doCycle_483 )
        condition45 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition45.tree )
        # --> action
        return_value.result = DoTree.new(( condition45.nil? ? nil : condition45.result ),( env43.nil? ? nil : env43.result ))
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
      __FOR46__ = nil
      __COMMA47__ = nil
      __COMMA49__ = nil
      __LCB50__ = nil
      __RCB52__ = nil
      as1 = nil
      as2 = nil
      condition48 = nil
      block51 = nil

      tree_for_FOR46 = nil
      tree_for_COMMA47 = nil
      tree_for_COMMA49 = nil
      tree_for_LCB50 = nil
      tree_for_RCB52 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 107:4: FOR as1= assignment COMMA condition COMMA as2= assignment LCB block RCB
        __FOR46__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_forCycle_504 )

        tree_for_FOR46 = @adaptor.create_with_payload( __FOR46__ )
        @adaptor.add_child( root_0, tree_for_FOR46 )

        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_508 )
        as1 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as1.tree )
        __COMMA47__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_forCycle_510 )
        @state.following.push( TOKENS_FOLLOWING_condition_IN_forCycle_513 )
        condition48 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition48.tree )
        __COMMA49__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_forCycle_515 )
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_520 )
        as2 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as2.tree )
        __LCB50__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_forCycle_522 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_forCycle_525 )
        block51 = block
        @state.following.pop
        @adaptor.add_child( root_0, block51.tree )
        __RCB52__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_forCycle_527 )
        # --> action
        return_value.result = ForTree.new(( as1.nil? ? nil : as1.result ),( condition48.nil? ? nil : condition48.result ),( as2.nil? ? nil : as2.result ),( block51.nil? ? nil : block51.list ))
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
      __ID53__ = nil
      __LCB55__ = nil
      __RCB57__ = nil
      params54 = nil
      block56 = nil

      tree_for_ID53 = nil
      tree_for_LCB55 = nil
      tree_for_RCB57 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 112:4: ID ( params )? LCB block RCB
        __ID53__ = match( ID, TOKENS_FOLLOWING_ID_IN_func_549 )

        tree_for_ID53 = @adaptor.create_with_payload( __ID53__ )
        root_0 = @adaptor.become_root( tree_for_ID53, root_0 )

        # at line 112:8: ( params )?
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == ID )
          alt_9 = 1
        end
        case alt_9
        when 1
          # at line 112:8: params
          @state.following.push( TOKENS_FOLLOWING_params_IN_func_552 )
          params54 = params
          @state.following.pop
          @adaptor.add_child( root_0, params54.tree )

        end
        __LCB55__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_555 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_func_558 )
        block56 = block
        @state.following.pop
        @adaptor.add_child( root_0, block56.tree )
        __RCB57__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_560 )
        # --> action
        return_value.result = FuncTree.new(__ID53__.text,( params54.nil? ? nil : params54.list ),( block56.nil? ? nil : block56.list ))
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
      __ID58__ = nil
      paramRest59 = nil

      tree_for_ID58 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 117:4: ID paramRest
        __ID58__ = match( ID, TOKENS_FOLLOWING_ID_IN_params_580 )

        tree_for_ID58 = @adaptor.create_with_payload( __ID58__ )
        @adaptor.add_child( root_0, tree_for_ID58 )

        @state.following.push( TOKENS_FOLLOWING_paramRest_IN_params_582 )
        paramRest59 = paramRest
        @state.following.pop
        @adaptor.add_child( root_0, paramRest59.tree )
        # --> action
        return_value.list = [__ID58__.text] + ( paramRest59.nil? ? nil : paramRest59.list )
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
      __COMMA60__ = nil
      params61 = nil

      tree_for_COMMA60 = nil

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
          __COMMA60__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_paramRest_601 )
          @state.following.push( TOKENS_FOLLOWING_params_IN_paramRest_604 )
          params61 = params
          @state.following.pop
          @adaptor.add_child( root_0, params61.tree )
          # --> action
          return_value.list = ( params61.nil? ? nil : params61.list )
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
      __ID62__ = nil
      __LB63__ = nil
      __RB65__ = nil
      args64 = nil

      tree_for_ID62 = nil
      tree_for_LB63 = nil
      tree_for_RB65 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 128:4: ID LB ( args )? RB
        __ID62__ = match( ID, TOKENS_FOLLOWING_ID_IN_call_631 )

        tree_for_ID62 = @adaptor.create_with_payload( __ID62__ )
        root_0 = @adaptor.become_root( tree_for_ID62, root_0 )

        __LB63__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_634 )
        # at line 128:12: ( args )?
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == STRING || look_11_0.between?( ID, LB ) || look_11_0 == CHAR || look_11_0.between?( PLUS, MINUS ) || look_11_0.between?( INT, FLOAT ) )
          alt_11 = 1
        end
        case alt_11
        when 1
          # at line 128:12: args
          @state.following.push( TOKENS_FOLLOWING_args_IN_call_637 )
          args64 = args
          @state.following.pop
          @adaptor.add_child( root_0, args64.tree )

        end
        __RB65__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_640 )
        # --> action
        return_value.result = CallTree.new(__ID62__.text,( args64.nil? ? nil : args64.list ))
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
    # 132:1: args returns [list] : ( expression argsRest | STRING argsRest | CHAR argsRest );
    # 
    def args
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = ArgsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __STRING68__ = nil
      __CHAR70__ = nil
      expression66 = nil
      argsRest67 = nil
      argsRest69 = nil
      argsRest71 = nil

      tree_for_STRING68 = nil
      tree_for_CHAR70 = nil

      begin
        # at line 133:2: ( expression argsRest | STRING argsRest | CHAR argsRest )
        alt_12 = 3
        case look_12 = @input.peek( 1 )
        when ID, LB, PLUS, MINUS, INT, FLOAT then alt_12 = 1
        when STRING then alt_12 = 2
        when CHAR then alt_12 = 3
        else
          raise NoViableAlternative( "", 12, 0 )
        end
        case alt_12
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 133:5: expression argsRest
          @state.following.push( TOKENS_FOLLOWING_expression_IN_args_662 )
          expression66 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression66.tree )
          @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_664 )
          argsRest67 = argsRest
          @state.following.pop
          @adaptor.add_child( root_0, argsRest67.tree )
          # --> action
          return_value.list = [( expression66.nil? ? nil : expression66.result )] + ( argsRest67.nil? ? nil : argsRest67.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 134:4: STRING argsRest
          __STRING68__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_args_671 )

          tree_for_STRING68 = @adaptor.create_with_payload( __STRING68__ )
          @adaptor.add_child( root_0, tree_for_STRING68 )

          @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_673 )
          argsRest69 = argsRest
          @state.following.pop
          @adaptor.add_child( root_0, argsRest69.tree )
          # --> action
          return_value.list = [AtomTree.new(lambda {|env| __STRING68__.text})] + ( argsRest69.nil? ? nil : argsRest69.list )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 135:4: CHAR argsRest
          __CHAR70__ = match( CHAR, TOKENS_FOLLOWING_CHAR_IN_args_680 )

          tree_for_CHAR70 = @adaptor.create_with_payload( __CHAR70__ )
          @adaptor.add_child( root_0, tree_for_CHAR70 )

          @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_682 )
          argsRest71 = argsRest
          @state.following.pop
          @adaptor.add_child( root_0, argsRest71.tree )
          # --> action
          return_value.list = [AtomTree.new(lambda {|env| __CHAR70__.text})] + ( argsRest71.nil? ? nil : argsRest71.list )
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
        # trace_out( __method__, 17 )

      end
      
      return return_value
    end

    ArgsRestReturnValue = define_return_scope :list

    # 
    # parser rule argsRest
    # 
    # (in Giraffe.g)
    # 138:1: argsRest returns [list] : ( COMMA args | );
    # 
    def argsRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = ArgsRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA72__ = nil
      args73 = nil

      tree_for_COMMA72 = nil

      begin
        # at line 139:2: ( COMMA args | )
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == COMMA )
          alt_13 = 1
        elsif ( look_13_0 == RB )
          alt_13 = 2
        else
          raise NoViableAlternative( "", 13, 0 )
        end
        case alt_13
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 139:4: COMMA args
          __COMMA72__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsRest_701 )
          @state.following.push( TOKENS_FOLLOWING_args_IN_argsRest_704 )
          args73 = args
          @state.following.pop
          @adaptor.add_child( root_0, args73.tree )
          # --> action
          return_value.list = ( args73.nil? ? nil : args73.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 141:4: 
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
    # 146:1: condition returns [result] : orOperand ( OR op= condition )? ;
    # 
    def condition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = ConditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OR75__ = nil
      op = nil
      orOperand74 = nil

      tree_for_OR75 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 147:4: orOperand ( OR op= condition )?
        @state.following.push( TOKENS_FOLLOWING_orOperand_IN_condition_730 )
        orOperand74 = orOperand
        @state.following.pop
        @adaptor.add_child( root_0, orOperand74.tree )
        # --> action
        return_value.result = ( orOperand74.nil? ? nil : orOperand74.result )
        # <-- action
        # at line 148:3: ( OR op= condition )?
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == OR )
          alt_14 = 1
        end
        case alt_14
        when 1
          # at line 148:4: OR op= condition
          __OR75__ = match( OR, TOKENS_FOLLOWING_OR_IN_condition_737 )

          tree_for_OR75 = @adaptor.create_with_payload( __OR75__ )
          root_0 = @adaptor.become_root( tree_for_OR75, root_0 )

          @state.following.push( TOKENS_FOLLOWING_condition_IN_condition_742 )
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
    # 153:1: orOperand returns [result] : boolOperand ( AND op= orOperand )? ;
    # 
    def orOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = OrOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __AND77__ = nil
      op = nil
      boolOperand76 = nil

      tree_for_AND77 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 154:4: boolOperand ( AND op= orOperand )?
        @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_orOperand_763 )
        boolOperand76 = boolOperand
        @state.following.pop
        @adaptor.add_child( root_0, boolOperand76.tree )
        # --> action
        return_value.result = ( boolOperand76.nil? ? nil : boolOperand76.result )
        # <-- action
        # at line 155:3: ( AND op= orOperand )?
        alt_15 = 2
        look_15_0 = @input.peek( 1 )

        if ( look_15_0 == AND )
          alt_15 = 1
        end
        case alt_15
        when 1
          # at line 155:4: AND op= orOperand
          __AND77__ = match( AND, TOKENS_FOLLOWING_AND_IN_orOperand_770 )

          tree_for_AND77 = @adaptor.create_with_payload( __AND77__ )
          root_0 = @adaptor.become_root( tree_for_AND77, root_0 )

          @state.following.push( TOKENS_FOLLOWING_orOperand_IN_orOperand_775 )
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
    # 158:1: boolOperand returns [result] : ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) );
    # 
    def boolOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = BoolOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NOT79__ = nil
      __LB80__ = nil
      __RB82__ = nil
      __EQ83__ = nil
      __NE84__ = nil
      __LT85__ = nil
      __GT86__ = nil
      __LE87__ = nil
      __GE88__ = nil
      op1 = nil
      op2 = nil
      bool78 = nil
      condition81 = nil

      tree_for_NOT79 = nil
      tree_for_LB80 = nil
      tree_for_RB82 = nil
      tree_for_EQ83 = nil
      tree_for_NE84 = nil
      tree_for_LT85 = nil
      tree_for_GT86 = nil
      tree_for_LE87 = nil
      tree_for_GE88 = nil

      begin
        # at line 159:2: ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) )
        alt_23 = 3
        case look_23 = @input.peek( 1 )
        when TRUE, FALSE then alt_23 = 1
        when NOT then alt_23 = 2
        when ID, LB, PLUS, MINUS, INT, FLOAT then alt_23 = 3
        else
          raise NoViableAlternative( "", 23, 0 )
        end
        case alt_23
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 159:4: bool
          @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_794 )
          bool78 = bool
          @state.following.pop
          @adaptor.add_child( root_0, bool78.tree )
          # --> action
          return_value.result = ( bool78.nil? ? nil : bool78.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 160:4: NOT LB condition RB
          __NOT79__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_boolOperand_801 )

          tree_for_NOT79 = @adaptor.create_with_payload( __NOT79__ )
          @adaptor.add_child( root_0, tree_for_NOT79 )

          __LB80__ = match( LB, TOKENS_FOLLOWING_LB_IN_boolOperand_803 )
          @state.following.push( TOKENS_FOLLOWING_condition_IN_boolOperand_806 )
          condition81 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition81.tree )
          __RB82__ = match( RB, TOKENS_FOLLOWING_RB_IN_boolOperand_808 )
          # --> action
          return_value.result = !( condition81.nil? ? nil : condition81.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 161:4: op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_818 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # at line 161:19: ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          alt_22 = 6
          case look_22 = @input.peek( 1 )
          when EQ then alt_22 = 1
          when NE then alt_22 = 2
          when LT then alt_22 = 3
          when GT then alt_22 = 4
          when LE then alt_22 = 5
          when GE then alt_22 = 6
          else
            raise NoViableAlternative( "", 22, 0 )
          end
          case alt_22
          when 1
            # at line 161:20: EQ (op2= bool | op2= expression )
            __EQ83__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_boolOperand_821 )

            tree_for_EQ83 = @adaptor.create_with_payload( __EQ83__ )
            root_0 = @adaptor.become_root( tree_for_EQ83, root_0 )

            # at line 161:24: (op2= bool | op2= expression )
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
              # at line 161:26: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_828 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 161:37: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_834 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperandTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),lambda {|x,y| x == y})
            # <-- action

          when 2
            # at line 162:6: NE (op2= bool | op2= expression )
            __NE84__ = match( NE, TOKENS_FOLLOWING_NE_IN_boolOperand_845 )

            tree_for_NE84 = @adaptor.create_with_payload( __NE84__ )
            root_0 = @adaptor.become_root( tree_for_NE84, root_0 )

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
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_852 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 162:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_858 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperandTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),lambda {|x,y| x != y})
            # <-- action

          when 3
            # at line 163:6: LT (op2= bool | op2= expression )
            __LT85__ = match( LT, TOKENS_FOLLOWING_LT_IN_boolOperand_869 )

            tree_for_LT85 = @adaptor.create_with_payload( __LT85__ )
            root_0 = @adaptor.become_root( tree_for_LT85, root_0 )

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
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_876 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 163:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_882 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperandTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),lambda {|x,y| x < y})
            # <-- action

          when 4
            # at line 164:6: GT (op2= bool | op2= expression )
            __GT86__ = match( GT, TOKENS_FOLLOWING_GT_IN_boolOperand_893 )

            tree_for_GT86 = @adaptor.create_with_payload( __GT86__ )
            root_0 = @adaptor.become_root( tree_for_GT86, root_0 )

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
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_900 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 164:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_906 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperandTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),lambda {|x,y| x > y})
            # <-- action

          when 5
            # at line 165:6: LE (op2= bool | op2= expression )
            __LE87__ = match( LE, TOKENS_FOLLOWING_LE_IN_boolOperand_917 )

            tree_for_LE87 = @adaptor.create_with_payload( __LE87__ )
            root_0 = @adaptor.become_root( tree_for_LE87, root_0 )

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
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_924 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 165:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_930 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperandTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),lambda {|x,y| x <= y})
            # <-- action

          when 6
            # at line 166:6: GE (op2= bool | op2= expression )
            __GE88__ = match( GE, TOKENS_FOLLOWING_GE_IN_boolOperand_941 )

            tree_for_GE88 = @adaptor.create_with_payload( __GE88__ )
            root_0 = @adaptor.become_root( tree_for_GE88, root_0 )

            # at line 166:10: (op2= bool | op2= expression )
            alt_21 = 2
            look_21_0 = @input.peek( 1 )

            if ( look_21_0.between?( TRUE, FALSE ) )
              alt_21 = 1
            elsif ( look_21_0.between?( ID, LB ) || look_21_0.between?( PLUS, MINUS ) || look_21_0.between?( INT, FLOAT ) )
              alt_21 = 2
            else
              raise NoViableAlternative( "", 21, 0 )
            end
            case alt_21
            when 1
              # at line 166:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_948 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 166:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_954 )
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
    # 171:1: expression returns [result] : addOperand ( PLUS op= expression | MINUS op= expression )? ;
    # 
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS90__ = nil
      __MINUS91__ = nil
      op = nil
      addOperand89 = nil

      tree_for_PLUS90 = nil
      tree_for_MINUS91 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 172:4: addOperand ( PLUS op= expression | MINUS op= expression )?
        @state.following.push( TOKENS_FOLLOWING_addOperand_IN_expression_979 )
        addOperand89 = addOperand
        @state.following.pop
        @adaptor.add_child( root_0, addOperand89.tree )
        # --> action
        return_value.result = ( addOperand89.nil? ? nil : addOperand89.result )
        # <-- action
        # at line 173:3: ( PLUS op= expression | MINUS op= expression )?
        alt_24 = 3
        look_24_0 = @input.peek( 1 )

        if ( look_24_0 == PLUS )
          alt_24 = 1
        elsif ( look_24_0 == MINUS )
          alt_24 = 2
        end
        case alt_24
        when 1
          # at line 174:4: PLUS op= expression
          __PLUS90__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expression_990 )

          tree_for_PLUS90 = @adaptor.create_with_payload( __PLUS90__ )
          root_0 = @adaptor.become_root( tree_for_PLUS90, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_995 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperandTree.new(return_value.result,( op.nil? ? nil : op.result ),lambda {|x,y| x + y})
          # <-- action

        when 2
          # at line 175:5: MINUS op= expression
          __MINUS91__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expression_1003 )

          tree_for_MINUS91 = @adaptor.create_with_payload( __MINUS91__ )
          root_0 = @adaptor.become_root( tree_for_MINUS91, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1008 )
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
    # 179:1: addOperand returns [result] : mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )? ;
    # 
    def addOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = AddOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __MUL93__ = nil
      __DIV94__ = nil
      __MOD95__ = nil
      op = nil
      mulOperand92 = nil

      tree_for_MUL93 = nil
      tree_for_DIV94 = nil
      tree_for_MOD95 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 180:4: mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperand_1030 )
        mulOperand92 = mulOperand
        @state.following.pop
        @adaptor.add_child( root_0, mulOperand92.tree )
        # --> action
        return_value.result = ( mulOperand92.nil? ? nil : mulOperand92.result )
        # <-- action
        # at line 181:3: ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        alt_25 = 4
        case look_25 = @input.peek( 1 )
        when MUL then alt_25 = 1
        when DIV then alt_25 = 2
        when MOD then alt_25 = 3
        end
        case alt_25
        when 1
          # at line 182:4: MUL op= addOperand
          __MUL93__ = match( MUL, TOKENS_FOLLOWING_MUL_IN_addOperand_1041 )

          tree_for_MUL93 = @adaptor.create_with_payload( __MUL93__ )
          root_0 = @adaptor.become_root( tree_for_MUL93, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1046 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperandTree.new(return_value.result,( op.nil? ? nil : op.result ),lambda {|x,y| x * y})
          # <-- action

        when 2
          # at line 183:5: DIV op= addOperand
          __DIV94__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_addOperand_1054 )

          tree_for_DIV94 = @adaptor.create_with_payload( __DIV94__ )
          root_0 = @adaptor.become_root( tree_for_DIV94, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1059 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperandTree.new(return_value.result,( op.nil? ? nil : op.result ),lambda {|x,y| x / y})
          # <-- action

        when 3
          # at line 184:5: MOD op= addOperand
          __MOD95__ = match( MOD, TOKENS_FOLLOWING_MOD_IN_addOperand_1067 )

          tree_for_MOD95 = @adaptor.create_with_payload( __MOD95__ )
          root_0 = @adaptor.become_root( tree_for_MOD95, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1072 )
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
    # 188:1: mulOperand returns [result] : ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest );
    # 
    def mulOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = MulOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS96__ = nil
      __MINUS98__ = nil
      mulOperandRest97 = nil
      mulOperandRest99 = nil
      mulOperandRest100 = nil

      tree_for_PLUS96 = nil
      tree_for_MINUS98 = nil

      begin
        # at line 189:2: ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest )
        alt_26 = 3
        case look_26 = @input.peek( 1 )
        when PLUS then alt_26 = 1
        when MINUS then alt_26 = 2
        when ID, LB, INT, FLOAT then alt_26 = 3
        else
          raise NoViableAlternative( "", 26, 0 )
        end
        case alt_26
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 189:4: PLUS mulOperandRest
          __PLUS96__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_mulOperand_1094 )

          tree_for_PLUS96 = @adaptor.create_with_payload( __PLUS96__ )
          @adaptor.add_child( root_0, tree_for_PLUS96 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1096 )
          mulOperandRest97 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest97.tree )
          # --> action
          return_value.result = ( mulOperandRest97.nil? ? nil : mulOperandRest97.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 190:4: MINUS mulOperandRest
          __MINUS98__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_mulOperand_1103 )

          tree_for_MINUS98 = @adaptor.create_with_payload( __MINUS98__ )
          @adaptor.add_child( root_0, tree_for_MINUS98 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1105 )
          mulOperandRest99 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest99.tree )
          # --> action
          return_value.result = UnaryOperandTree.new(( mulOperandRest99.nil? ? nil : mulOperandRest99.result ),lambda {|x| -x})
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 191:4: mulOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1112 )
          mulOperandRest100 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest100.tree )
          # --> action
          return_value.result = ( mulOperandRest100.nil? ? nil : mulOperandRest100.result )
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
    # 194:1: mulOperandRest returns [result] : ( ID | LB expression RB | INT | FLOAT | call );
    # 
    def mulOperandRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = MulOperandRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID101__ = nil
      __LB102__ = nil
      __RB104__ = nil
      __INT105__ = nil
      __FLOAT106__ = nil
      expression103 = nil
      call107 = nil

      tree_for_ID101 = nil
      tree_for_LB102 = nil
      tree_for_RB104 = nil
      tree_for_INT105 = nil
      tree_for_FLOAT106 = nil

      begin
        # at line 195:2: ( ID | LB expression RB | INT | FLOAT | call )
        alt_27 = 5
        case look_27 = @input.peek( 1 )
        when ID then look_27_1 = @input.peek( 2 )

        if ( look_27_1 == LB )
          alt_27 = 5
        elsif ( look_27_1 == EOF || look_27_1.between?( LCB, SEMICOLON ) || look_27_1 == COMMA || look_27_1 == RB || look_27_1.between?( OR, AND ) || look_27_1.between?( EQ, MOD ) || look_27_1.between?( T__49, T__50 ) )
          alt_27 = 1
        else
          raise NoViableAlternative( "", 27, 1 )
        end
        when LB then alt_27 = 2
        when INT then alt_27 = 3
        when FLOAT then alt_27 = 4
        else
          raise NoViableAlternative( "", 27, 0 )
        end
        case alt_27
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 195:4: ID
          __ID101__ = match( ID, TOKENS_FOLLOWING_ID_IN_mulOperandRest_1129 )

          tree_for_ID101 = @adaptor.create_with_payload( __ID101__ )
          @adaptor.add_child( root_0, tree_for_ID101 )

          # --> action
          return_value.result = VarTree.new(__ID101__.text)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 196:4: LB expression RB
          __LB102__ = match( LB, TOKENS_FOLLOWING_LB_IN_mulOperandRest_1136 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_mulOperandRest_1139 )
          expression103 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression103.tree )
          __RB104__ = match( RB, TOKENS_FOLLOWING_RB_IN_mulOperandRest_1141 )
          # --> action
          return_value.result = ( expression103.nil? ? nil : expression103.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 197:4: INT
          __INT105__ = match( INT, TOKENS_FOLLOWING_INT_IN_mulOperandRest_1149 )

          tree_for_INT105 = @adaptor.create_with_payload( __INT105__ )
          @adaptor.add_child( root_0, tree_for_INT105 )

          # --> action
          return_value.result = AtomTree.new(lambda {|env| __INT105__.text.to_i})
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 198:4: FLOAT
          __FLOAT106__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_mulOperandRest_1156 )

          tree_for_FLOAT106 = @adaptor.create_with_payload( __FLOAT106__ )
          @adaptor.add_child( root_0, tree_for_FLOAT106 )

          # --> action
          return_value.result = AtomTree.new(lambda {|env| __FLOAT106__.text.to_f})
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 199:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_mulOperandRest_1163 )
          call107 = call
          @state.following.pop
          @adaptor.add_child( root_0, call107.tree )
          # --> action
          return_value.result = ( call107.nil? ? nil : call107.result )
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
    # 201:1: value returns [result] : ( expression | STRING | CHAR );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __STRING109__ = nil
      __CHAR110__ = nil
      expression108 = nil

      tree_for_STRING109 = nil
      tree_for_CHAR110 = nil

      begin
        # at line 202:2: ( expression | STRING | CHAR )
        alt_28 = 3
        case look_28 = @input.peek( 1 )
        when ID, LB, PLUS, MINUS, INT, FLOAT then alt_28 = 1
        when STRING then alt_28 = 2
        when CHAR then alt_28 = 3
        else
          raise NoViableAlternative( "", 28, 0 )
        end
        case alt_28
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 202:5: expression
          @state.following.push( TOKENS_FOLLOWING_expression_IN_value_1179 )
          expression108 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression108.tree )
          # --> action
          return_value.result = ( expression108.nil? ? nil : expression108.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 203:4: STRING
          __STRING109__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_value_1186 )

          tree_for_STRING109 = @adaptor.create_with_payload( __STRING109__ )
          @adaptor.add_child( root_0, tree_for_STRING109 )

          # --> action
          return_value.result = AtomTree.new(lambda {|env| __STRING109__.text})
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 204:4: CHAR
          __CHAR110__ = match( CHAR, TOKENS_FOLLOWING_CHAR_IN_value_1193 )

          tree_for_CHAR110 = @adaptor.create_with_payload( __CHAR110__ )
          @adaptor.add_child( root_0, tree_for_CHAR110 )

          # --> action
          return_value.result = AtomTree.new(lambda {|env| __CHAR110__.text})
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
    # 207:1: assignment returns [result] : ID ASSIGN value ;
    # 
    def assignment
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = AssignmentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID111__ = nil
      __ASSIGN112__ = nil
      value113 = nil

      tree_for_ID111 = nil
      tree_for_ASSIGN112 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 208:4: ID ASSIGN value
        __ID111__ = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1212 )

        tree_for_ID111 = @adaptor.create_with_payload( __ID111__ )
        @adaptor.add_child( root_0, tree_for_ID111 )

        __ASSIGN112__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1214 )

        tree_for_ASSIGN112 = @adaptor.create_with_payload( __ASSIGN112__ )
        root_0 = @adaptor.become_root( tree_for_ASSIGN112, root_0 )

        @state.following.push( TOKENS_FOLLOWING_value_IN_assignment_1217 )
        value113 = value
        @state.following.pop
        @adaptor.add_child( root_0, value113.tree )
        # --> action
         return_value.result = AssignTree.new(__ID111__.text,( value113.nil? ? nil : value113.result )) 
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
    # 210:1: bool returns [result] : ( TRUE | FALSE );
    # 
    def bool
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = BoolReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __TRUE114__ = nil
      __FALSE115__ = nil

      tree_for_TRUE114 = nil
      tree_for_FALSE115 = nil

      begin
        # at line 211:2: ( TRUE | FALSE )
        alt_29 = 2
        look_29_0 = @input.peek( 1 )

        if ( look_29_0 == TRUE )
          alt_29 = 1
        elsif ( look_29_0 == FALSE )
          alt_29 = 2
        else
          raise NoViableAlternative( "", 29, 0 )
        end
        case alt_29
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 211:4: TRUE
          __TRUE114__ = match( TRUE, TOKENS_FOLLOWING_TRUE_IN_bool_1235 )

          tree_for_TRUE114 = @adaptor.create_with_payload( __TRUE114__ )
          @adaptor.add_child( root_0, tree_for_TRUE114 )

          # --> action
          return_value.result = AtomTree.new(lambda {|env| true})
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 212:5: FALSE
          __FALSE115__ = match( FALSE, TOKENS_FOLLOWING_FALSE_IN_bool_1243 )

          tree_for_FALSE115 = @adaptor.create_with_payload( __FALSE115__ )
          @adaptor.add_child( root_0, tree_for_FALSE115 )

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
    TOKENS_FOLLOWING_PRINT_IN_printInstruction_285 = Set[ 9, 19, 20, 32, 33, 37, 38 ]
    TOKENS_FOLLOWING_STRING_IN_printInstruction_291 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_printInstruction_301 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINTL_IN_printlInstruction_329 = Set[ 9, 19, 20, 32, 33, 37, 38 ]
    TOKENS_FOLLOWING_STRING_IN_printlInstruction_334 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_printlInstruction_344 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_ifInstruction_370 = Set[ 9, 19, 20, 25, 32, 33, 37, 38, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_ifInstruction_373 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_ifInstruction_375 = Set[ 12, 13, 14 ]
    TOKENS_FOLLOWING_ifRest_IN_ifInstruction_377 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_ifRest_396 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_ifRest_398 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_ifRest_405 = Set[ 9, 19, 20, 25, 32, 33, 37, 38, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_ifRest_413 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_ifRest_415 = Set[ 12, 13, 14 ]
    TOKENS_FOLLOWING_ifRest_IN_ifRest_419 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_whileCycle_446 = Set[ 9, 19, 20, 25, 32, 33, 37, 38, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_whileCycle_448 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_whileCycle_450 = Set[ 4, 6, 7, 8, 10, 11, 15, 16, 17, 19, 49, 50 ]
    TOKENS_FOLLOWING_block_IN_whileCycle_453 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_whileCycle_455 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_doCycle_477 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_doCycle_479 = Set[ 15 ]
    TOKENS_FOLLOWING_WHILE_IN_doCycle_481 = Set[ 9, 19, 20, 25, 32, 33, 37, 38, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_doCycle_483 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_forCycle_504 = Set[ 19 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_508 = Set[ 18 ]
    TOKENS_FOLLOWING_COMMA_IN_forCycle_510 = Set[ 9, 19, 20, 25, 32, 33, 37, 38, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_forCycle_513 = Set[ 18 ]
    TOKENS_FOLLOWING_COMMA_IN_forCycle_515 = Set[ 19 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_520 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_forCycle_522 = Set[ 4, 6, 7, 8, 10, 11, 15, 16, 17, 19, 49, 50 ]
    TOKENS_FOLLOWING_block_IN_forCycle_525 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_forCycle_527 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_func_549 = Set[ 4, 19 ]
    TOKENS_FOLLOWING_params_IN_func_552 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_func_555 = Set[ 4, 6, 7, 8, 10, 11, 15, 16, 17, 19, 49, 50 ]
    TOKENS_FOLLOWING_block_IN_func_558 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_func_560 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_params_580 = Set[ 18 ]
    TOKENS_FOLLOWING_paramRest_IN_params_582 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_paramRest_601 = Set[ 19 ]
    TOKENS_FOLLOWING_params_IN_paramRest_604 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_call_631 = Set[ 20 ]
    TOKENS_FOLLOWING_LB_IN_call_634 = Set[ 9, 19, 20, 21, 22, 32, 33, 37, 38 ]
    TOKENS_FOLLOWING_args_IN_call_637 = Set[ 21 ]
    TOKENS_FOLLOWING_RB_IN_call_640 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_args_662 = Set[ 18 ]
    TOKENS_FOLLOWING_argsRest_IN_args_664 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_args_671 = Set[ 18 ]
    TOKENS_FOLLOWING_argsRest_IN_args_673 = Set[ 1 ]
    TOKENS_FOLLOWING_CHAR_IN_args_680 = Set[ 18 ]
    TOKENS_FOLLOWING_argsRest_IN_args_682 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsRest_701 = Set[ 9, 19, 20, 22, 32, 33, 37, 38 ]
    TOKENS_FOLLOWING_args_IN_argsRest_704 = Set[ 1 ]
    TOKENS_FOLLOWING_orOperand_IN_condition_730 = Set[ 1, 23 ]
    TOKENS_FOLLOWING_OR_IN_condition_737 = Set[ 9, 19, 20, 25, 32, 33, 37, 38, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_condition_742 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperand_IN_orOperand_763 = Set[ 1, 24 ]
    TOKENS_FOLLOWING_AND_IN_orOperand_770 = Set[ 9, 19, 20, 25, 32, 33, 37, 38, 40, 41 ]
    TOKENS_FOLLOWING_orOperand_IN_orOperand_775 = Set[ 1 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_794 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_boolOperand_801 = Set[ 20 ]
    TOKENS_FOLLOWING_LB_IN_boolOperand_803 = Set[ 9, 19, 20, 25, 32, 33, 37, 38, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_boolOperand_806 = Set[ 21 ]
    TOKENS_FOLLOWING_RB_IN_boolOperand_808 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_818 = Set[ 26, 27, 28, 29, 30, 31 ]
    TOKENS_FOLLOWING_EQ_IN_boolOperand_821 = Set[ 9, 19, 20, 32, 33, 37, 38, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_828 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_834 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_boolOperand_845 = Set[ 9, 19, 20, 32, 33, 37, 38, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_852 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_858 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_boolOperand_869 = Set[ 9, 19, 20, 32, 33, 37, 38, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_876 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_882 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_boolOperand_893 = Set[ 9, 19, 20, 32, 33, 37, 38, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_900 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_906 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_boolOperand_917 = Set[ 9, 19, 20, 32, 33, 37, 38, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_924 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_930 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_boolOperand_941 = Set[ 9, 19, 20, 32, 33, 37, 38, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_948 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_954 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperand_IN_expression_979 = Set[ 1, 32, 33 ]
    TOKENS_FOLLOWING_PLUS_IN_expression_990 = Set[ 9, 19, 20, 32, 33, 37, 38 ]
    TOKENS_FOLLOWING_expression_IN_expression_995 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expression_1003 = Set[ 9, 19, 20, 32, 33, 37, 38 ]
    TOKENS_FOLLOWING_expression_IN_expression_1008 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperand_1030 = Set[ 1, 34, 35, 36 ]
    TOKENS_FOLLOWING_MUL_IN_addOperand_1041 = Set[ 9, 19, 20, 32, 33, 37, 38 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1046 = Set[ 1 ]
    TOKENS_FOLLOWING_DIV_IN_addOperand_1054 = Set[ 9, 19, 20, 32, 33, 37, 38 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1059 = Set[ 1 ]
    TOKENS_FOLLOWING_MOD_IN_addOperand_1067 = Set[ 9, 19, 20, 32, 33, 37, 38 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1072 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_mulOperand_1094 = Set[ 9, 19, 20, 32, 33, 37, 38 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1096 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_mulOperand_1103 = Set[ 9, 19, 20, 32, 33, 37, 38 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1105 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1112 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_mulOperandRest_1129 = Set[ 1 ]
    TOKENS_FOLLOWING_LB_IN_mulOperandRest_1136 = Set[ 9, 19, 20, 32, 33, 37, 38 ]
    TOKENS_FOLLOWING_expression_IN_mulOperandRest_1139 = Set[ 21 ]
    TOKENS_FOLLOWING_RB_IN_mulOperandRest_1141 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_mulOperandRest_1149 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_mulOperandRest_1156 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_mulOperandRest_1163 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_value_1179 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_value_1186 = Set[ 1 ]
    TOKENS_FOLLOWING_CHAR_IN_value_1193 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1212 = Set[ 39 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1214 = Set[ 9, 19, 20, 22, 32, 33, 37, 38 ]
    TOKENS_FOLLOWING_value_IN_assignment_1217 = Set[ 1 ]
    TOKENS_FOLLOWING_TRUE_IN_bool_1235 = Set[ 1 ]
    TOKENS_FOLLOWING_FALSE_IN_bool_1243 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end


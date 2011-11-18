#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-11-18 01:28:14
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
require './lib/giraffe/tree/derefTree.rb'
require './lib/giraffe/tree/indexTree.rb'
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
require './lib/giraffe/tree/arrayTree.rb'
require './lib/giraffe/tree/varTree.rb'
require './lib/giraffe/tree/exitTree.rb'
require './lib/giraffe/tree/returnTree.rb'
require './lib/giraffe/tree/breakTree.rb'
require './lib/giraffe/tree/readTree.rb'
require './lib/giraffe/tree/methodCallTree.rb'
require './lib/giraffe/tree/classTree.rb'
require './lib/giraffe/tree/newTree.rb'
require './lib/giraffe/operators.rb'

# - - - - - - end action @parser::header - - - - - - -


module Giraffe
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :EXPONENT => 57, :CLASS => 51, :LT => 35, :T__64 => 64, 
                   :T__65 => 65, :T__62 => 62, :RB => 13, :T__63 => 63, 
                   :WHILE => 25, :MOD => 41, :OCTAL_ESC => 55, :NEW => 45, 
                   :DO => 26, :FOR => 27, :FLOAT => 44, :NOT => 32, :RCB => 5, 
                   :ID => 28, :AND => 31, :EOF => -1, :TO_INT => 42, :BREAK => 9, 
                   :IF => 21, :TO_FLOAT => 43, :QUOTE => 59, :ESC_SEQ => 50, 
                   :CONTINUE => 56, :QM => 61, :LCB => 4, :COMMA => 20, 
                   :PRINTLN => 19, :RETURN => 10, :PLUS => 14, :SUPERCLASS => 52, 
                   :EQ => 33, :COMMENT => 6, :DOT => 29, :NE => 34, :EXIT => 11, 
                   :GE => 38, :UNICODE_ESC => 54, :ELSE => 22, :HEX_DIGIT => 53, 
                   :SEMICOLON => 7, :INT => 16, :MINUS => 15, :TRUE => 47, 
                   :MUL => 39, :PRINT => 17, :PRINTL => 18, :ELSEIF => 23, 
                   :COLON => 60, :ELIF => 24, :WS => 58, :READ => 8, :OR => 30, 
                   :ASSIGN => 46, :GT => 36, :LB => 12, :DIV => 40, :FALSE => 48, 
                   :LE => 37, :STRING => 49 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "LCB", "RCB", "COMMENT", "SEMICOLON", "READ", "BREAK", 
                    "RETURN", "EXIT", "LB", "RB", "PLUS", "MINUS", "INT", 
                    "PRINT", "PRINTL", "PRINTLN", "COMMA", "IF", "ELSE", 
                    "ELSEIF", "ELIF", "WHILE", "DO", "FOR", "ID", "DOT", 
                    "OR", "AND", "NOT", "EQ", "NE", "LT", "GT", "LE", "GE", 
                    "MUL", "DIV", "MOD", "TO_INT", "TO_FLOAT", "FLOAT", 
                    "NEW", "ASSIGN", "TRUE", "FALSE", "STRING", "ESC_SEQ", 
                    "CLASS", "SUPERCLASS", "HEX_DIGIT", "UNICODE_ESC", "OCTAL_ESC", 
                    "CONTINUE", "EXPONENT", "WS", "QUOTE", "COLON", "QM", 
                    "'\\r'", "'\\n'", "'['", "']'" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = Giraffe
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :program, :env, :block, :instructionRest, :instruction, 
                     :readInstruction, :breakInstruction, :returnInstruction, 
                     :exitInstruction, :statusCode, :printInstruction, :printlInstruction, 
                     :printText, :ifInstruction, :ifRest, :whileCycle, :doCycle, 
                     :forCycle, :func, :params, :paramRest, :call, :args, 
                     :argsRest, :condition, :orOperand, :boolOperand, :expression, 
                     :addOperand, :mulOperand, :mulOperandRest, :arrayIndexTarget, 
                     :new, :array, :assignment, :bool, :string, :classDef ].freeze


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
    # 41:1: program returns [result] : block ;
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


        # at line 42:4: block
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
    # 44:1: env returns [result] : LCB block RCB ;
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


        # at line 45:4: LCB block RCB
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
    # 50:1: block returns [list] : instruction instructionRest ;
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


        # at line 51:4: instruction instructionRest
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
    # 58:1: instructionRest returns [list] : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) instruction op= instructionRest | );
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
        # at line 59:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) instruction op= instructionRest | )
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0.between?( COMMENT, SEMICOLON ) || look_4_0.between?( T__62, T__63 ) )
          alt_4 = 1
        elsif ( look_4_0 == EOF || look_4_0 == RCB )
          alt_4 = 2
        else
          raise NoViableAlternative( "", 4, 0 )
        end
        case alt_4
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 59:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) instruction op= instructionRest
          # --> action
          return_value.list = []
          # <-- action
          # at line 60:3: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0 == COMMENT || look_3_0.between?( T__62, T__63 ) )
            alt_3 = 1
          elsif ( look_3_0 == SEMICOLON )
            alt_3 = 2
          else
            raise NoViableAlternative( "", 3, 0 )
          end
          case alt_3
          when 1
            # at line 60:4: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 60:4: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 60:6: ( COMMENT )? ( '\\r' )? '\\n'
            # at line 60:13: ( COMMENT )?
            alt_1 = 2
            look_1_0 = @input.peek( 1 )

            if ( look_1_0 == COMMENT )
              alt_1 = 1
            end
            case alt_1
            when 1
              # at line 60:13: COMMENT
              __COMMENT7__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_instructionRest_136 )

            end
            # at line 60:20: ( '\\r' )?
            alt_2 = 2
            look_2_0 = @input.peek( 1 )

            if ( look_2_0 == T__62 )
              alt_2 = 1
            end
            case alt_2
            when 1
              # at line 60:20: '\\r'
              char_literal8 = match( T__62, TOKENS_FOLLOWING_T__62_IN_instructionRest_140 )

            end
            char_literal9 = match( T__63, TOKENS_FOLLOWING_T__63_IN_instructionRest_144 )


          when 2
            # at line 60:32: SEMICOLON
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


          # at line 65:4: 
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
    # 68:1: instruction returns [result] : ( assignment | func | env | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | classDef | );
    # 
    def instruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      return_value = InstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      assignment12 = nil
      func13 = nil
      env14 = nil
      forCycle15 = nil
      ifInstruction16 = nil
      whileCycle17 = nil
      doCycle18 = nil
      printInstruction19 = nil
      printlInstruction20 = nil
      returnInstruction21 = nil
      exitInstruction22 = nil
      breakInstruction23 = nil
      call24 = nil
      classDef25 = nil


      begin
        # at line 69:2: ( assignment | func | env | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | classDef | )
        alt_5 = 15
        alt_5 = @dfa5.predict( @input )
        case alt_5
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 69:4: assignment
          @state.following.push( TOKENS_FOLLOWING_assignment_IN_instruction_198 )
          assignment12 = assignment
          @state.following.pop
          @adaptor.add_child( root_0, assignment12.tree )
          # --> action
          return_value.result = ( assignment12.nil? ? nil : assignment12.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 70:4: func
          @state.following.push( TOKENS_FOLLOWING_func_IN_instruction_205 )
          func13 = func
          @state.following.pop
          @adaptor.add_child( root_0, func13.tree )
          # --> action
          return_value.result = ( func13.nil? ? nil : func13.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 71:4: env
          @state.following.push( TOKENS_FOLLOWING_env_IN_instruction_212 )
          env14 = env
          @state.following.pop
          @adaptor.add_child( root_0, env14.tree )
          # --> action
          return_value.result = ( env14.nil? ? nil : env14.result )
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 72:4: forCycle
          @state.following.push( TOKENS_FOLLOWING_forCycle_IN_instruction_219 )
          forCycle15 = forCycle
          @state.following.pop
          @adaptor.add_child( root_0, forCycle15.tree )
          # --> action
          return_value.result = ( forCycle15.nil? ? nil : forCycle15.result )
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 73:4: ifInstruction
          @state.following.push( TOKENS_FOLLOWING_ifInstruction_IN_instruction_226 )
          ifInstruction16 = ifInstruction
          @state.following.pop
          @adaptor.add_child( root_0, ifInstruction16.tree )
          # --> action
          return_value.result = ( ifInstruction16.nil? ? nil : ifInstruction16.result )
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 74:4: whileCycle
          @state.following.push( TOKENS_FOLLOWING_whileCycle_IN_instruction_233 )
          whileCycle17 = whileCycle
          @state.following.pop
          @adaptor.add_child( root_0, whileCycle17.tree )
          # --> action
          return_value.result = ( whileCycle17.nil? ? nil : whileCycle17.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 75:4: doCycle
          @state.following.push( TOKENS_FOLLOWING_doCycle_IN_instruction_240 )
          doCycle18 = doCycle
          @state.following.pop
          @adaptor.add_child( root_0, doCycle18.tree )
          # --> action
          return_value.result = ( doCycle18.nil? ? nil : doCycle18.result )
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 76:4: printInstruction
          @state.following.push( TOKENS_FOLLOWING_printInstruction_IN_instruction_247 )
          printInstruction19 = printInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printInstruction19.tree )
          # --> action
          return_value.result = ( printInstruction19.nil? ? nil : printInstruction19.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 77:4: printlInstruction
          @state.following.push( TOKENS_FOLLOWING_printlInstruction_IN_instruction_254 )
          printlInstruction20 = printlInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printlInstruction20.tree )
          # --> action
          return_value.result = ( printlInstruction20.nil? ? nil : printlInstruction20.result )
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 78:4: returnInstruction
          @state.following.push( TOKENS_FOLLOWING_returnInstruction_IN_instruction_261 )
          returnInstruction21 = returnInstruction
          @state.following.pop
          @adaptor.add_child( root_0, returnInstruction21.tree )
          # --> action
          return_value.result = ( returnInstruction21.nil? ? nil : returnInstruction21.result )
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 79:4: exitInstruction
          @state.following.push( TOKENS_FOLLOWING_exitInstruction_IN_instruction_269 )
          exitInstruction22 = exitInstruction
          @state.following.pop
          @adaptor.add_child( root_0, exitInstruction22.tree )
          # --> action
          return_value.result = ( exitInstruction22.nil? ? nil : exitInstruction22.result )
          # <-- action

        when 12
          root_0 = @adaptor.create_flat_list


          # at line 80:4: breakInstruction
          @state.following.push( TOKENS_FOLLOWING_breakInstruction_IN_instruction_276 )
          breakInstruction23 = breakInstruction
          @state.following.pop
          @adaptor.add_child( root_0, breakInstruction23.tree )
          # --> action
          return_value.result = $exitInstruction.result
          # <-- action

        when 13
          root_0 = @adaptor.create_flat_list


          # at line 81:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_instruction_283 )
          call24 = call
          @state.following.pop
          @adaptor.add_child( root_0, call24.tree )
          # --> action
          return_value.result = ( call24.nil? ? nil : call24.result )
          # <-- action

        when 14
          root_0 = @adaptor.create_flat_list


          # at line 82:4: classDef
          @state.following.push( TOKENS_FOLLOWING_classDef_IN_instruction_290 )
          classDef25 = classDef
          @state.following.pop
          @adaptor.add_child( root_0, classDef25.tree )
          # --> action
          return_value.result = ( classDef25.nil? ? nil : classDef25.result )
          # <-- action

        when 15
          root_0 = @adaptor.create_flat_list


          # at line 83:4: 
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

    ReadInstructionReturnValue = define_return_scope :result

    # 
    # parser rule readInstruction
    # 
    # (in Giraffe.g)
    # 86:1: readInstruction returns [result] : READ ;
    # 
    def readInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      return_value = ReadInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __READ26__ = nil

      tree_for_READ26 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 87:4: READ
        __READ26__ = match( READ, TOKENS_FOLLOWING_READ_IN_readInstruction_313 )

        tree_for_READ26 = @adaptor.create_with_payload( __READ26__ )
        @adaptor.add_child( root_0, tree_for_READ26 )

        # --> action
        return_value.result = ReadTree.new
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

    BreakInstructionReturnValue = define_return_scope :result

    # 
    # parser rule breakInstruction
    # 
    # (in Giraffe.g)
    # 90:1: breakInstruction returns [result] : BREAK ;
    # 
    def breakInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )
      return_value = BreakInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BREAK27__ = nil

      tree_for_BREAK27 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 91:4: BREAK
        __BREAK27__ = match( BREAK, TOKENS_FOLLOWING_BREAK_IN_breakInstruction_330 )

        tree_for_BREAK27 = @adaptor.create_with_payload( __BREAK27__ )
        @adaptor.add_child( root_0, tree_for_BREAK27 )

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
        # trace_out( __method__, 7 )

      end
      
      return return_value
    end

    ReturnInstructionReturnValue = define_return_scope :result

    # 
    # parser rule returnInstruction
    # 
    # (in Giraffe.g)
    # 94:1: returnInstruction returns [result] : RETURN expression ;
    # 
    def returnInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      return_value = ReturnInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __RETURN28__ = nil
      expression29 = nil

      tree_for_RETURN28 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 95:4: RETURN expression
        __RETURN28__ = match( RETURN, TOKENS_FOLLOWING_RETURN_IN_returnInstruction_347 )

        tree_for_RETURN28 = @adaptor.create_with_payload( __RETURN28__ )
        root_0 = @adaptor.become_root( tree_for_RETURN28, root_0 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_returnInstruction_350 )
        expression29 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression29.tree )
        # --> action
        return_value.result = ReturnTree.new(( expression29.nil? ? nil : expression29.result ))
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

    ExitInstructionReturnValue = define_return_scope :result

    # 
    # parser rule exitInstruction
    # 
    # (in Giraffe.g)
    # 98:1: exitInstruction returns [result] : EXIT ( LB alt1= statusCode RB | alt2= statusCode )? ;
    # 
    def exitInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = ExitInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __EXIT30__ = nil
      __LB31__ = nil
      __RB32__ = nil
      alt1 = nil
      alt2 = nil

      tree_for_EXIT30 = nil
      tree_for_LB31 = nil
      tree_for_RB32 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 99:4: EXIT ( LB alt1= statusCode RB | alt2= statusCode )?
        __EXIT30__ = match( EXIT, TOKENS_FOLLOWING_EXIT_IN_exitInstruction_367 )

        tree_for_EXIT30 = @adaptor.create_with_payload( __EXIT30__ )
        root_0 = @adaptor.become_root( tree_for_EXIT30, root_0 )

        # at line 99:11: ( LB alt1= statusCode RB | alt2= statusCode )?
        alt_6 = 3
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == LB )
          alt_6 = 1
        elsif ( look_6_0.between?( PLUS, INT ) )
          alt_6 = 2
        end
        case alt_6
        when 1
          # at line 99:12: LB alt1= statusCode RB
          __LB31__ = match( LB, TOKENS_FOLLOWING_LB_IN_exitInstruction_372 )
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_377 )
          alt1 = statusCode
          @state.following.pop
          @adaptor.add_child( root_0, alt1.tree )
          __RB32__ = match( RB, TOKENS_FOLLOWING_RB_IN_exitInstruction_379 )
          # --> action
          return_value.result = ExitTree.new(( alt1.nil? ? nil : alt1.result ))
          # <-- action

        when 2
          # at line 100:6: alt2= statusCode
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_392 )
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
        # trace_out( __method__, 9 )

      end
      
      return return_value
    end

    StatusCodeReturnValue = define_return_scope :result

    # 
    # parser rule statusCode
    # 
    # (in Giraffe.g)
    # 103:1: statusCode returns [result] : ( PLUS | MINUS )? INT ;
    # 
    def statusCode
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = StatusCodeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS33__ = nil
      __MINUS34__ = nil
      __INT35__ = nil

      tree_for_PLUS33 = nil
      tree_for_MINUS34 = nil
      tree_for_INT35 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 104:4: ( PLUS | MINUS )? INT
        # --> action
        sign = ""
        # <-- action
        # at line 105:3: ( PLUS | MINUS )?
        alt_7 = 3
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == PLUS )
          alt_7 = 1
        elsif ( look_7_0 == MINUS )
          alt_7 = 2
        end
        case alt_7
        when 1
          # at line 105:4: PLUS
          __PLUS33__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_statusCode_417 )

          tree_for_PLUS33 = @adaptor.create_with_payload( __PLUS33__ )
          @adaptor.add_child( root_0, tree_for_PLUS33 )


        when 2
          # at line 105:11: MINUS
          __MINUS34__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_statusCode_421 )

          tree_for_MINUS34 = @adaptor.create_with_payload( __MINUS34__ )
          @adaptor.add_child( root_0, tree_for_MINUS34 )

          # --> action
          sign = __MINUS34__.text
          # <-- action

        end
        __INT35__ = match( INT, TOKENS_FOLLOWING_INT_IN_statusCode_427 )

        tree_for_INT35 = @adaptor.create_with_payload( __INT35__ )
        @adaptor.add_child( root_0, tree_for_INT35 )

        # --> action
        (sign + __INT35__.text).to_i
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

    PrintInstructionReturnValue = define_return_scope :result

    # 
    # parser rule printInstruction
    # 
    # (in Giraffe.g)
    # 109:1: printInstruction returns [result] : PRINT printText ;
    # 
    def printInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = PrintInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PRINT36__ = nil
      printText37 = nil

      tree_for_PRINT36 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 110:5: PRINT printText
        __PRINT36__ = match( PRINT, TOKENS_FOLLOWING_PRINT_IN_printInstruction_448 )

        tree_for_PRINT36 = @adaptor.create_with_payload( __PRINT36__ )
        root_0 = @adaptor.become_root( tree_for_PRINT36, root_0 )

        @state.following.push( TOKENS_FOLLOWING_printText_IN_printInstruction_451 )
        printText37 = printText
        @state.following.pop
        @adaptor.add_child( root_0, printText37.tree )
        # --> action
        return_value.result = PrintTree.new(( printText37.nil? ? nil : printText37.list ))
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

    PrintlInstructionReturnValue = define_return_scope :result

    # 
    # parser rule printlInstruction
    # 
    # (in Giraffe.g)
    # 113:1: printlInstruction returns [result] : ( PRINTL | PRINTLN ) printText ;
    # 
    def printlInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = PrintlInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set38 = nil
      printText39 = nil

      tree_for_set38 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 114:5: ( PRINTL | PRINTLN ) printText
        set38 = @input.look
        set38 = @input.look
        if @input.peek( 1 ).between?( PRINTL, PRINTLN )
          @input.consume
          root_0 = @adaptor.become_root( @adaptor.create_with_payload( set38 ), root_0 )
          @state.error_recovery = false
        else
          mse = MismatchedSet( nil )
          raise mse
        end


        @state.following.push( TOKENS_FOLLOWING_printText_IN_printlInstruction_481 )
        printText39 = printText
        @state.following.pop
        @adaptor.add_child( root_0, printText39.tree )
        # --> action
        return_value.result = PrintTree.new(( printText39.nil? ? nil : printText39.list ),true)
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

    PrintTextReturnValue = define_return_scope :list

    # 
    # parser rule printText
    # 
    # (in Giraffe.g)
    # 117:1: printText returns [list] : expression ( COMMA rest= printText )? ;
    # 
    def printText
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = PrintTextReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA41__ = nil
      rest = nil
      expression40 = nil

      tree_for_COMMA41 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 118:4: expression ( COMMA rest= printText )?
        @state.following.push( TOKENS_FOLLOWING_expression_IN_printText_501 )
        expression40 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression40.tree )
        # --> action
        return_value.list = [( expression40.nil? ? nil : expression40.result )]
        # <-- action
        # at line 119:3: ( COMMA rest= printText )?
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == COMMA )
          alt_8 = 1
        end
        case alt_8
        when 1
          # at line 119:4: COMMA rest= printText
          __COMMA41__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_printText_508 )

          tree_for_COMMA41 = @adaptor.create_with_payload( __COMMA41__ )
          @adaptor.add_child( root_0, tree_for_COMMA41 )

          @state.following.push( TOKENS_FOLLOWING_printText_IN_printText_512 )
          rest = printText
          @state.following.pop
          @adaptor.add_child( root_0, rest.tree )
          # --> action
          return_value.list = return_value.list + ( rest.nil? ? nil : rest.list )
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
        # trace_out( __method__, 13 )

      end
      
      return return_value
    end

    IfInstructionReturnValue = define_return_scope :result

    # 
    # parser rule ifInstruction
    # 
    # (in Giraffe.g)
    # 122:1: ifInstruction returns [result] : IF condition LCB block RCB ifRest ;
    # 
    def ifInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = IfInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __IF42__ = nil
      __LCB44__ = nil
      __RCB46__ = nil
      condition43 = nil
      block45 = nil
      ifRest47 = nil

      tree_for_IF42 = nil
      tree_for_LCB44 = nil
      tree_for_RCB46 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 123:4: IF condition LCB block RCB ifRest
        __IF42__ = match( IF, TOKENS_FOLLOWING_IF_IN_ifInstruction_535 )

        tree_for_IF42 = @adaptor.create_with_payload( __IF42__ )
        root_0 = @adaptor.become_root( tree_for_IF42, root_0 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_ifInstruction_538 )
        condition43 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition43.tree )
        __LCB44__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifInstruction_540 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_ifInstruction_543 )
        block45 = block
        @state.following.pop
        @adaptor.add_child( root_0, block45.tree )
        __RCB46__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifInstruction_545 )
        @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifInstruction_548 )
        ifRest47 = ifRest
        @state.following.pop
        @adaptor.add_child( root_0, ifRest47.tree )
        # --> action
        return_value.result = IfTree.new(( condition43.nil? ? nil : condition43.result ),( block45.nil? ? nil : block45.list ),( ifRest47.nil? ? nil : ifRest47.result ))
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

    IfRestReturnValue = define_return_scope :result

    # 
    # parser rule ifRest
    # 
    # (in Giraffe.g)
    # 127:1: ifRest returns [result] : ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | );
    # 
    def ifRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = IfRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ELSE48__ = nil
      __LCB49__ = nil
      __RCB51__ = nil
      set52 = nil
      __LCB54__ = nil
      __RCB56__ = nil
      op = nil
      block50 = nil
      condition53 = nil
      block55 = nil

      tree_for_ELSE48 = nil
      tree_for_LCB49 = nil
      tree_for_RCB51 = nil
      tree_for_set52 = nil
      tree_for_LCB54 = nil
      tree_for_RCB56 = nil

      begin
        # at line 128:2: ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | )
        alt_9 = 3
        case look_9 = @input.peek( 1 )
        when ELSE then alt_9 = 1
        when ELSEIF, ELIF then alt_9 = 2
        when EOF, RCB, COMMENT, SEMICOLON, T__62, T__63 then alt_9 = 3
        else
          raise NoViableAlternative( "", 9, 0 )
        end
        case alt_9
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 128:4: ELSE LCB block RCB
          __ELSE48__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_ifRest_567 )

          tree_for_ELSE48 = @adaptor.create_with_payload( __ELSE48__ )
          @adaptor.add_child( root_0, tree_for_ELSE48 )

          __LCB49__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_569 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_572 )
          block50 = block
          @state.following.pop
          @adaptor.add_child( root_0, block50.tree )
          __RCB51__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_574 )
          # --> action
          return_value.result = ( block50.nil? ? nil : block50.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 129:4: ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest
          set52 = @input.look
          if @input.peek( 1 ).between?( ELSEIF, ELIF )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set52 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          @state.following.push( TOKENS_FOLLOWING_condition_IN_ifRest_590 )
          condition53 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition53.tree )
          __LCB54__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_592 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_595 )
          block55 = block
          @state.following.pop
          @adaptor.add_child( root_0, block55.tree )
          __RCB56__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_597 )
          @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifRest_602 )
          op = ifRest
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = IfTree.new(( condition53.nil? ? nil : condition53.result ),( block55.nil? ? nil : block55.list ),( op.nil? ? nil : op.result ))
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 131:4: 
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
        # trace_out( __method__, 15 )

      end
      
      return return_value
    end

    WhileCycleReturnValue = define_return_scope :result

    # 
    # parser rule whileCycle
    # 
    # (in Giraffe.g)
    # 134:1: whileCycle returns [result] : WHILE condition LCB block RCB ;
    # 
    def whileCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = WhileCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WHILE57__ = nil
      __LCB59__ = nil
      __RCB61__ = nil
      condition58 = nil
      block60 = nil

      tree_for_WHILE57 = nil
      tree_for_LCB59 = nil
      tree_for_RCB61 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 135:5: WHILE condition LCB block RCB
        __WHILE57__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_whileCycle_629 )

        tree_for_WHILE57 = @adaptor.create_with_payload( __WHILE57__ )
        @adaptor.add_child( root_0, tree_for_WHILE57 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_whileCycle_631 )
        condition58 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition58.tree )
        __LCB59__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_whileCycle_633 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_whileCycle_636 )
        block60 = block
        @state.following.pop
        @adaptor.add_child( root_0, block60.tree )
        __RCB61__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_whileCycle_638 )
        # --> action
        return_value.result = WhileTree.new(( condition58.nil? ? nil : condition58.result ),( block60.nil? ? nil : block60.list ))
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

    DoCycleReturnValue = define_return_scope :result

    # 
    # parser rule doCycle
    # 
    # (in Giraffe.g)
    # 139:1: doCycle returns [result] : DO LCB block RCB WHILE condition ;
    # 
    def doCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = DoCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __DO62__ = nil
      __LCB63__ = nil
      __RCB65__ = nil
      __WHILE66__ = nil
      block64 = nil
      condition67 = nil

      tree_for_DO62 = nil
      tree_for_LCB63 = nil
      tree_for_RCB65 = nil
      tree_for_WHILE66 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 140:4: DO LCB block RCB WHILE condition
        __DO62__ = match( DO, TOKENS_FOLLOWING_DO_IN_doCycle_660 )

        tree_for_DO62 = @adaptor.create_with_payload( __DO62__ )
        @adaptor.add_child( root_0, tree_for_DO62 )

        __LCB63__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_doCycle_662 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_doCycle_665 )
        block64 = block
        @state.following.pop
        @adaptor.add_child( root_0, block64.tree )
        __RCB65__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_doCycle_667 )
        __WHILE66__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_doCycle_670 )

        tree_for_WHILE66 = @adaptor.create_with_payload( __WHILE66__ )
        @adaptor.add_child( root_0, tree_for_WHILE66 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_doCycle_672 )
        condition67 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition67.tree )
        # --> action
        return_value.result = DoTree.new(( condition67.nil? ? nil : condition67.result ),( block64.nil? ? nil : block64.list ))
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

    ForCycleReturnValue = define_return_scope :result

    # 
    # parser rule forCycle
    # 
    # (in Giraffe.g)
    # 144:1: forCycle returns [result] : FOR as1= assignment COMMA condition COMMA as2= assignment LCB block RCB ;
    # 
    def forCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = ForCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __FOR68__ = nil
      __COMMA69__ = nil
      __COMMA71__ = nil
      __LCB72__ = nil
      __RCB74__ = nil
      as1 = nil
      as2 = nil
      condition70 = nil
      block73 = nil

      tree_for_FOR68 = nil
      tree_for_COMMA69 = nil
      tree_for_COMMA71 = nil
      tree_for_LCB72 = nil
      tree_for_RCB74 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 145:4: FOR as1= assignment COMMA condition COMMA as2= assignment LCB block RCB
        __FOR68__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_forCycle_693 )

        tree_for_FOR68 = @adaptor.create_with_payload( __FOR68__ )
        @adaptor.add_child( root_0, tree_for_FOR68 )

        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_697 )
        as1 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as1.tree )
        __COMMA69__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_forCycle_699 )
        @state.following.push( TOKENS_FOLLOWING_condition_IN_forCycle_702 )
        condition70 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition70.tree )
        __COMMA71__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_forCycle_704 )
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_709 )
        as2 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as2.tree )
        __LCB72__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_forCycle_711 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_forCycle_714 )
        block73 = block
        @state.following.pop
        @adaptor.add_child( root_0, block73.tree )
        __RCB74__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_forCycle_716 )
        # --> action
        return_value.result = ForTree.new(( as1.nil? ? nil : as1.result ),( condition70.nil? ? nil : condition70.result ),( as2.nil? ? nil : as2.result ),( block73.nil? ? nil : block73.list ))
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

    FuncReturnValue = define_return_scope :result

    # 
    # parser rule func
    # 
    # (in Giraffe.g)
    # 149:1: func returns [result] : ID ( params )? LCB block RCB ;
    # 
    def func
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = FuncReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID75__ = nil
      __LCB77__ = nil
      __RCB79__ = nil
      params76 = nil
      block78 = nil

      tree_for_ID75 = nil
      tree_for_LCB77 = nil
      tree_for_RCB79 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 150:4: ID ( params )? LCB block RCB
        __ID75__ = match( ID, TOKENS_FOLLOWING_ID_IN_func_738 )

        tree_for_ID75 = @adaptor.create_with_payload( __ID75__ )
        root_0 = @adaptor.become_root( tree_for_ID75, root_0 )

        # at line 150:8: ( params )?
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0 == ID )
          alt_10 = 1
        end
        case alt_10
        when 1
          # at line 150:8: params
          @state.following.push( TOKENS_FOLLOWING_params_IN_func_741 )
          params76 = params
          @state.following.pop
          @adaptor.add_child( root_0, params76.tree )

        end
        __LCB77__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_744 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_func_747 )
        block78 = block
        @state.following.pop
        @adaptor.add_child( root_0, block78.tree )
        __RCB79__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_749 )
        # --> action
        return_value.result = FuncTree.new(__ID75__.text,( params76.nil? ? nil : params76.list ),( block78.nil? ? nil : block78.list ))
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
        # trace_out( __method__, 19 )

      end
      
      return return_value
    end

    ParamsReturnValue = define_return_scope :list

    # 
    # parser rule params
    # 
    # (in Giraffe.g)
    # 154:1: params returns [list] : ID paramRest ;
    # 
    def params
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = ParamsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID80__ = nil
      paramRest81 = nil

      tree_for_ID80 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 155:4: ID paramRest
        __ID80__ = match( ID, TOKENS_FOLLOWING_ID_IN_params_769 )

        tree_for_ID80 = @adaptor.create_with_payload( __ID80__ )
        @adaptor.add_child( root_0, tree_for_ID80 )

        @state.following.push( TOKENS_FOLLOWING_paramRest_IN_params_771 )
        paramRest81 = paramRest
        @state.following.pop
        @adaptor.add_child( root_0, paramRest81.tree )
        # --> action
        return_value.list = [__ID80__.text] + ( paramRest81.nil? ? nil : paramRest81.list )
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

    ParamRestReturnValue = define_return_scope :list

    # 
    # parser rule paramRest
    # 
    # (in Giraffe.g)
    # 159:1: paramRest returns [list] : ( COMMA params | );
    # 
    def paramRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = ParamRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA82__ = nil
      params83 = nil

      tree_for_COMMA82 = nil

      begin
        # at line 160:2: ( COMMA params | )
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == COMMA )
          alt_11 = 1
        elsif ( look_11_0 == LCB )
          alt_11 = 2
        else
          raise NoViableAlternative( "", 11, 0 )
        end
        case alt_11
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 160:4: COMMA params
          __COMMA82__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_paramRest_790 )
          @state.following.push( TOKENS_FOLLOWING_params_IN_paramRest_793 )
          params83 = params
          @state.following.pop
          @adaptor.add_child( root_0, params83.tree )
          # --> action
          return_value.list = ( params83.nil? ? nil : params83.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 162:4: 
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
        # trace_out( __method__, 21 )

      end
      
      return return_value
    end

    CallReturnValue = define_return_scope :result

    # 
    # parser rule call
    # 
    # (in Giraffe.g)
    # 165:1: call returns [result] : fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )* ;
    # 
    def call
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = CallReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      fun = nil
      method = nil
      __LB84__ = nil
      __RB85__ = nil
      __DOT86__ = nil
      __LB87__ = nil
      __RB88__ = nil
      args1 = nil
      args2 = nil

      tree_for_fun = nil
      tree_for_method = nil
      tree_for_LB84 = nil
      tree_for_RB85 = nil
      tree_for_DOT86 = nil
      tree_for_LB87 = nil
      tree_for_RB88 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 166:4: fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )*
        fun = match( ID, TOKENS_FOLLOWING_ID_IN_call_822 )

        tree_for_fun = @adaptor.create_with_payload( fun )
        root_0 = @adaptor.become_root( tree_for_fun, root_0 )

        __LB84__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_825 )
        # at line 166:21: (args1= args )?
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == READ || look_12_0 == LB || look_12_0.between?( PLUS, INT ) || look_12_0 == ID || look_12_0.between?( TO_INT, NEW ) || look_12_0 == STRING || look_12_0 == T__64 )
          alt_12 = 1
        end
        case alt_12
        when 1
          # at line 166:21: args1= args
          @state.following.push( TOKENS_FOLLOWING_args_IN_call_830 )
          args1 = args
          @state.following.pop
          @adaptor.add_child( root_0, args1.tree )

        end
        __RB85__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_833 )
        # --> action
        return_value.result = CallTree.new(fun.text,( args1.nil? ? nil : args1.list ))
        # <-- action
        # at line 168:3: ( DOT method= ID LB (args2= args )? RB )*
        while true # decision 14
          alt_14 = 2
          look_14_0 = @input.peek( 1 )

          if ( look_14_0 == DOT )
            alt_14 = 1

          end
          case alt_14
          when 1
            # at line 168:5: DOT method= ID LB (args2= args )? RB
            __DOT86__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_call_844 )

            tree_for_DOT86 = @adaptor.create_with_payload( __DOT86__ )
            @adaptor.add_child( root_0, tree_for_DOT86 )

            method = match( ID, TOKENS_FOLLOWING_ID_IN_call_848 )

            tree_for_method = @adaptor.create_with_payload( method )
            @adaptor.add_child( root_0, tree_for_method )

            __LB87__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_850 )
            # at line 168:28: (args2= args )?
            alt_13 = 2
            look_13_0 = @input.peek( 1 )

            if ( look_13_0 == READ || look_13_0 == LB || look_13_0.between?( PLUS, INT ) || look_13_0 == ID || look_13_0.between?( TO_INT, NEW ) || look_13_0 == STRING || look_13_0 == T__64 )
              alt_13 = 1
            end
            case alt_13
            when 1
              # at line 168:28: args2= args
              @state.following.push( TOKENS_FOLLOWING_args_IN_call_855 )
              args2 = args
              @state.following.pop
              @adaptor.add_child( root_0, args2.tree )

            end
            __RB88__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_858 )
            # --> action
            return_value.result = MethodCallTree.new(return_value.result,method.text,( args2.nil? ? nil : args2.list )) 
            # <-- action

          else
            break # out of loop for decision 14
          end
        end # loop for decision 14
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

    ArgsReturnValue = define_return_scope :list

    # 
    # parser rule args
    # 
    # (in Giraffe.g)
    # 171:1: args returns [list] : expression argsRest ;
    # 
    def args
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ArgsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      expression89 = nil
      argsRest90 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 172:5: expression argsRest
        @state.following.push( TOKENS_FOLLOWING_expression_IN_args_880 )
        expression89 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression89.tree )
        @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_882 )
        argsRest90 = argsRest
        @state.following.pop
        @adaptor.add_child( root_0, argsRest90.tree )
        # --> action
        return_value.list = [( expression89.nil? ? nil : expression89.result )] + ( argsRest90.nil? ? nil : argsRest90.list )
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
        # trace_out( __method__, 23 )

      end
      
      return return_value
    end

    ArgsRestReturnValue = define_return_scope :list

    # 
    # parser rule argsRest
    # 
    # (in Giraffe.g)
    # 175:1: argsRest returns [list] : ( COMMA args | );
    # 
    def argsRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = ArgsRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA91__ = nil
      args92 = nil

      tree_for_COMMA91 = nil

      begin
        # at line 176:2: ( COMMA args | )
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


          # at line 176:4: COMMA args
          __COMMA91__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsRest_901 )
          @state.following.push( TOKENS_FOLLOWING_args_IN_argsRest_904 )
          args92 = args
          @state.following.pop
          @adaptor.add_child( root_0, args92.tree )
          # --> action
          return_value.list = ( args92.nil? ? nil : args92.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 178:4: 
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
        # trace_out( __method__, 24 )

      end
      
      return return_value
    end

    ConditionReturnValue = define_return_scope :result

    # 
    # parser rule condition
    # 
    # (in Giraffe.g)
    # 183:1: condition returns [result] : orOperand ( OR op= condition )? ;
    # 
    def condition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = ConditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OR94__ = nil
      op = nil
      orOperand93 = nil

      tree_for_OR94 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 184:4: orOperand ( OR op= condition )?
        @state.following.push( TOKENS_FOLLOWING_orOperand_IN_condition_930 )
        orOperand93 = orOperand
        @state.following.pop
        @adaptor.add_child( root_0, orOperand93.tree )
        # --> action
        return_value.result = ( orOperand93.nil? ? nil : orOperand93.result )
        # <-- action
        # at line 185:3: ( OR op= condition )?
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == OR )
          alt_16 = 1
        end
        case alt_16
        when 1
          # at line 185:4: OR op= condition
          __OR94__ = match( OR, TOKENS_FOLLOWING_OR_IN_condition_937 )

          tree_for_OR94 = @adaptor.create_with_payload( __OR94__ )
          root_0 = @adaptor.become_root( tree_for_OR94, root_0 )

          @state.following.push( TOKENS_FOLLOWING_condition_IN_condition_942 )
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
        # trace_out( __method__, 25 )

      end
      
      return return_value
    end

    OrOperandReturnValue = define_return_scope :result

    # 
    # parser rule orOperand
    # 
    # (in Giraffe.g)
    # 190:1: orOperand returns [result] : boolOperand ( AND op= orOperand )? ;
    # 
    def orOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = OrOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __AND96__ = nil
      op = nil
      boolOperand95 = nil

      tree_for_AND96 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 191:4: boolOperand ( AND op= orOperand )?
        @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_orOperand_963 )
        boolOperand95 = boolOperand
        @state.following.pop
        @adaptor.add_child( root_0, boolOperand95.tree )
        # --> action
        return_value.result = ( boolOperand95.nil? ? nil : boolOperand95.result )
        # <-- action
        # at line 192:3: ( AND op= orOperand )?
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == AND )
          alt_17 = 1
        end
        case alt_17
        when 1
          # at line 192:4: AND op= orOperand
          __AND96__ = match( AND, TOKENS_FOLLOWING_AND_IN_orOperand_970 )

          tree_for_AND96 = @adaptor.create_with_payload( __AND96__ )
          root_0 = @adaptor.become_root( tree_for_AND96, root_0 )

          @state.following.push( TOKENS_FOLLOWING_orOperand_IN_orOperand_975 )
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
        # trace_out( __method__, 26 )

      end
      
      return return_value
    end

    BoolOperandReturnValue = define_return_scope :result

    # 
    # parser rule boolOperand
    # 
    # (in Giraffe.g)
    # 195:1: boolOperand returns [result] : ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) );
    # 
    def boolOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = BoolOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NOT98__ = nil
      __LB99__ = nil
      __RB101__ = nil
      __EQ102__ = nil
      __NE103__ = nil
      __LT104__ = nil
      __GT105__ = nil
      __LE106__ = nil
      __GE107__ = nil
      op1 = nil
      op2 = nil
      bool97 = nil
      condition100 = nil

      tree_for_NOT98 = nil
      tree_for_LB99 = nil
      tree_for_RB101 = nil
      tree_for_EQ102 = nil
      tree_for_NE103 = nil
      tree_for_LT104 = nil
      tree_for_GT105 = nil
      tree_for_LE106 = nil
      tree_for_GE107 = nil

      begin
        # at line 196:2: ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) )
        alt_25 = 3
        case look_25 = @input.peek( 1 )
        when TRUE, FALSE then alt_25 = 1
        when NOT then alt_25 = 2
        when READ, LB, PLUS, MINUS, INT, ID, TO_INT, TO_FLOAT, FLOAT, NEW, STRING, T__64 then alt_25 = 3
        else
          raise NoViableAlternative( "", 25, 0 )
        end
        case alt_25
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 196:4: bool
          @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_994 )
          bool97 = bool
          @state.following.pop
          @adaptor.add_child( root_0, bool97.tree )
          # --> action
          return_value.result = ( bool97.nil? ? nil : bool97.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 197:4: NOT LB condition RB
          __NOT98__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_boolOperand_1001 )

          tree_for_NOT98 = @adaptor.create_with_payload( __NOT98__ )
          @adaptor.add_child( root_0, tree_for_NOT98 )

          __LB99__ = match( LB, TOKENS_FOLLOWING_LB_IN_boolOperand_1003 )
          @state.following.push( TOKENS_FOLLOWING_condition_IN_boolOperand_1006 )
          condition100 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition100.tree )
          __RB101__ = match( RB, TOKENS_FOLLOWING_RB_IN_boolOperand_1008 )
          # --> action
          return_value.result = !( condition100.nil? ? nil : condition100.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 198:4: op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1018 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # at line 198:19: ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
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
            # at line 198:20: EQ (op2= bool | op2= expression )
            __EQ102__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_boolOperand_1021 )

            tree_for_EQ102 = @adaptor.create_with_payload( __EQ102__ )
            root_0 = @adaptor.become_root( tree_for_EQ102, root_0 )

            # at line 198:24: (op2= bool | op2= expression )
            alt_18 = 2
            look_18_0 = @input.peek( 1 )

            if ( look_18_0.between?( TRUE, FALSE ) )
              alt_18 = 1
            elsif ( look_18_0 == READ || look_18_0 == LB || look_18_0.between?( PLUS, INT ) || look_18_0 == ID || look_18_0.between?( TO_INT, NEW ) || look_18_0 == STRING || look_18_0 == T__64 )
              alt_18 = 2
            else
              raise NoViableAlternative( "", 18, 0 )
            end
            case alt_18
            when 1
              # at line 198:26: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1028 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 198:37: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1034 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:eq))
            # <-- action

          when 2
            # at line 199:6: NE (op2= bool | op2= expression )
            __NE103__ = match( NE, TOKENS_FOLLOWING_NE_IN_boolOperand_1045 )

            tree_for_NE103 = @adaptor.create_with_payload( __NE103__ )
            root_0 = @adaptor.become_root( tree_for_NE103, root_0 )

            # at line 199:10: (op2= bool | op2= expression )
            alt_19 = 2
            look_19_0 = @input.peek( 1 )

            if ( look_19_0.between?( TRUE, FALSE ) )
              alt_19 = 1
            elsif ( look_19_0 == READ || look_19_0 == LB || look_19_0.between?( PLUS, INT ) || look_19_0 == ID || look_19_0.between?( TO_INT, NEW ) || look_19_0 == STRING || look_19_0 == T__64 )
              alt_19 = 2
            else
              raise NoViableAlternative( "", 19, 0 )
            end
            case alt_19
            when 1
              # at line 199:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1052 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 199:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1058 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:ne))
            # <-- action

          when 3
            # at line 200:6: LT (op2= bool | op2= expression )
            __LT104__ = match( LT, TOKENS_FOLLOWING_LT_IN_boolOperand_1069 )

            tree_for_LT104 = @adaptor.create_with_payload( __LT104__ )
            root_0 = @adaptor.become_root( tree_for_LT104, root_0 )

            # at line 200:10: (op2= bool | op2= expression )
            alt_20 = 2
            look_20_0 = @input.peek( 1 )

            if ( look_20_0.between?( TRUE, FALSE ) )
              alt_20 = 1
            elsif ( look_20_0 == READ || look_20_0 == LB || look_20_0.between?( PLUS, INT ) || look_20_0 == ID || look_20_0.between?( TO_INT, NEW ) || look_20_0 == STRING || look_20_0 == T__64 )
              alt_20 = 2
            else
              raise NoViableAlternative( "", 20, 0 )
            end
            case alt_20
            when 1
              # at line 200:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1076 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 200:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1082 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:lt))
            # <-- action

          when 4
            # at line 201:6: GT (op2= bool | op2= expression )
            __GT105__ = match( GT, TOKENS_FOLLOWING_GT_IN_boolOperand_1093 )

            tree_for_GT105 = @adaptor.create_with_payload( __GT105__ )
            root_0 = @adaptor.become_root( tree_for_GT105, root_0 )

            # at line 201:10: (op2= bool | op2= expression )
            alt_21 = 2
            look_21_0 = @input.peek( 1 )

            if ( look_21_0.between?( TRUE, FALSE ) )
              alt_21 = 1
            elsif ( look_21_0 == READ || look_21_0 == LB || look_21_0.between?( PLUS, INT ) || look_21_0 == ID || look_21_0.between?( TO_INT, NEW ) || look_21_0 == STRING || look_21_0 == T__64 )
              alt_21 = 2
            else
              raise NoViableAlternative( "", 21, 0 )
            end
            case alt_21
            when 1
              # at line 201:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1100 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 201:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1106 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:gt))
            # <-- action

          when 5
            # at line 202:6: LE (op2= bool | op2= expression )
            __LE106__ = match( LE, TOKENS_FOLLOWING_LE_IN_boolOperand_1117 )

            tree_for_LE106 = @adaptor.create_with_payload( __LE106__ )
            root_0 = @adaptor.become_root( tree_for_LE106, root_0 )

            # at line 202:10: (op2= bool | op2= expression )
            alt_22 = 2
            look_22_0 = @input.peek( 1 )

            if ( look_22_0.between?( TRUE, FALSE ) )
              alt_22 = 1
            elsif ( look_22_0 == READ || look_22_0 == LB || look_22_0.between?( PLUS, INT ) || look_22_0 == ID || look_22_0.between?( TO_INT, NEW ) || look_22_0 == STRING || look_22_0 == T__64 )
              alt_22 = 2
            else
              raise NoViableAlternative( "", 22, 0 )
            end
            case alt_22
            when 1
              # at line 202:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1124 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 202:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1130 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:le))
            # <-- action

          when 6
            # at line 203:6: GE (op2= bool | op2= expression )
            __GE107__ = match( GE, TOKENS_FOLLOWING_GE_IN_boolOperand_1141 )

            tree_for_GE107 = @adaptor.create_with_payload( __GE107__ )
            root_0 = @adaptor.become_root( tree_for_GE107, root_0 )

            # at line 203:10: (op2= bool | op2= expression )
            alt_23 = 2
            look_23_0 = @input.peek( 1 )

            if ( look_23_0.between?( TRUE, FALSE ) )
              alt_23 = 1
            elsif ( look_23_0 == READ || look_23_0 == LB || look_23_0.between?( PLUS, INT ) || look_23_0 == ID || look_23_0.between?( TO_INT, NEW ) || look_23_0 == STRING || look_23_0 == T__64 )
              alt_23 = 2
            else
              raise NoViableAlternative( "", 23, 0 )
            end
            case alt_23
            when 1
              # at line 203:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1148 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 203:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1154 )
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
        # trace_out( __method__, 27 )

      end
      
      return return_value
    end

    ExpressionReturnValue = define_return_scope :result

    # 
    # parser rule expression
    # 
    # (in Giraffe.g)
    # 208:1: expression returns [result] : addOperand ( PLUS op= expression | MINUS op= expression )? ;
    # 
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS109__ = nil
      __MINUS110__ = nil
      op = nil
      addOperand108 = nil

      tree_for_PLUS109 = nil
      tree_for_MINUS110 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 209:4: addOperand ( PLUS op= expression | MINUS op= expression )?
        @state.following.push( TOKENS_FOLLOWING_addOperand_IN_expression_1179 )
        addOperand108 = addOperand
        @state.following.pop
        @adaptor.add_child( root_0, addOperand108.tree )
        # --> action
        return_value.result = ( addOperand108.nil? ? nil : addOperand108.result )
        # <-- action
        # at line 210:3: ( PLUS op= expression | MINUS op= expression )?
        alt_26 = 3
        look_26_0 = @input.peek( 1 )

        if ( look_26_0 == PLUS )
          alt_26 = 1
        elsif ( look_26_0 == MINUS )
          alt_26 = 2
        end
        case alt_26
        when 1
          # at line 211:4: PLUS op= expression
          __PLUS109__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expression_1190 )

          tree_for_PLUS109 = @adaptor.create_with_payload( __PLUS109__ )
          root_0 = @adaptor.become_root( tree_for_PLUS109, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1195 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:add))
          # <-- action

        when 2
          # at line 212:5: MINUS op= expression
          __MINUS110__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expression_1203 )

          tree_for_MINUS110 = @adaptor.create_with_payload( __MINUS110__ )
          root_0 = @adaptor.become_root( tree_for_MINUS110, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1208 )
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
        # trace_out( __method__, 28 )

      end
      
      return return_value
    end

    AddOperandReturnValue = define_return_scope :result

    # 
    # parser rule addOperand
    # 
    # (in Giraffe.g)
    # 216:1: addOperand returns [result] : mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )? ;
    # 
    def addOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = AddOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __MUL112__ = nil
      __DIV113__ = nil
      __MOD114__ = nil
      op = nil
      mulOperand111 = nil

      tree_for_MUL112 = nil
      tree_for_DIV113 = nil
      tree_for_MOD114 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 217:4: mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperand_1230 )
        mulOperand111 = mulOperand
        @state.following.pop
        @adaptor.add_child( root_0, mulOperand111.tree )
        # --> action
        return_value.result = ( mulOperand111.nil? ? nil : mulOperand111.result )
        # <-- action
        # at line 218:3: ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        alt_27 = 4
        case look_27 = @input.peek( 1 )
        when MUL then alt_27 = 1
        when DIV then alt_27 = 2
        when MOD then alt_27 = 3
        end
        case alt_27
        when 1
          # at line 219:4: MUL op= addOperand
          __MUL112__ = match( MUL, TOKENS_FOLLOWING_MUL_IN_addOperand_1241 )

          tree_for_MUL112 = @adaptor.create_with_payload( __MUL112__ )
          root_0 = @adaptor.become_root( tree_for_MUL112, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1246 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:mul))
          # <-- action

        when 2
          # at line 220:5: DIV op= addOperand
          __DIV113__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_addOperand_1254 )

          tree_for_DIV113 = @adaptor.create_with_payload( __DIV113__ )
          root_0 = @adaptor.become_root( tree_for_DIV113, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1259 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:div))
          # <-- action

        when 3
          # at line 221:5: MOD op= addOperand
          __MOD114__ = match( MOD, TOKENS_FOLLOWING_MOD_IN_addOperand_1267 )

          tree_for_MOD114 = @adaptor.create_with_payload( __MOD114__ )
          root_0 = @adaptor.become_root( tree_for_MOD114, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1272 )
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
        # trace_out( __method__, 29 )

      end
      
      return return_value
    end

    MulOperandReturnValue = define_return_scope :result

    # 
    # parser rule mulOperand
    # 
    # (in Giraffe.g)
    # 225:1: mulOperand returns [result] : ( PLUS mulOperandRest | MINUS mulOperandRest | TO_INT mulOperandRest | TO_FLOAT mulOperandRest | mulOperandRest );
    # 
    def mulOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = MulOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS115__ = nil
      __MINUS117__ = nil
      __TO_INT119__ = nil
      __TO_FLOAT121__ = nil
      mulOperandRest116 = nil
      mulOperandRest118 = nil
      mulOperandRest120 = nil
      mulOperandRest122 = nil
      mulOperandRest123 = nil

      tree_for_PLUS115 = nil
      tree_for_MINUS117 = nil
      tree_for_TO_INT119 = nil
      tree_for_TO_FLOAT121 = nil

      begin
        # at line 226:2: ( PLUS mulOperandRest | MINUS mulOperandRest | TO_INT mulOperandRest | TO_FLOAT mulOperandRest | mulOperandRest )
        alt_28 = 5
        case look_28 = @input.peek( 1 )
        when PLUS then alt_28 = 1
        when MINUS then alt_28 = 2
        when TO_INT then alt_28 = 3
        when TO_FLOAT then alt_28 = 4
        when READ, LB, INT, ID, FLOAT, NEW, STRING, T__64 then alt_28 = 5
        else
          raise NoViableAlternative( "", 28, 0 )
        end
        case alt_28
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 226:4: PLUS mulOperandRest
          __PLUS115__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_mulOperand_1294 )

          tree_for_PLUS115 = @adaptor.create_with_payload( __PLUS115__ )
          @adaptor.add_child( root_0, tree_for_PLUS115 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1296 )
          mulOperandRest116 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest116.tree )
          # --> action
          return_value.result = ( mulOperandRest116.nil? ? nil : mulOperandRest116.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 227:4: MINUS mulOperandRest
          __MINUS117__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_mulOperand_1303 )

          tree_for_MINUS117 = @adaptor.create_with_payload( __MINUS117__ )
          @adaptor.add_child( root_0, tree_for_MINUS117 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1305 )
          mulOperandRest118 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest118.tree )
          # --> action
          return_value.result = UnaryOperatorTree.new(( mulOperandRest118.nil? ? nil : mulOperandRest118.result ),Operators.method(:neg))
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 228:4: TO_INT mulOperandRest
          __TO_INT119__ = match( TO_INT, TOKENS_FOLLOWING_TO_INT_IN_mulOperand_1312 )

          tree_for_TO_INT119 = @adaptor.create_with_payload( __TO_INT119__ )
          @adaptor.add_child( root_0, tree_for_TO_INT119 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1314 )
          mulOperandRest120 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest120.tree )
          # --> action
          return_value.result = UnaryOperatorTree.new(( mulOperandRest120.nil? ? nil : mulOperandRest120.result ),Operators.method(:int))
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 229:4: TO_FLOAT mulOperandRest
          __TO_FLOAT121__ = match( TO_FLOAT, TOKENS_FOLLOWING_TO_FLOAT_IN_mulOperand_1321 )

          tree_for_TO_FLOAT121 = @adaptor.create_with_payload( __TO_FLOAT121__ )
          @adaptor.add_child( root_0, tree_for_TO_FLOAT121 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1323 )
          mulOperandRest122 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest122.tree )
          # --> action
          return_value.result = UnaryOperatorTree.new(( mulOperandRest122.nil? ? nil : mulOperandRest122.result ),Operators.method(:float))
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 230:4: mulOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1330 )
          mulOperandRest123 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest123.tree )
          # --> action
          return_value.result = ( mulOperandRest123.nil? ? nil : mulOperandRest123.result )
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

    MulOperandRestReturnValue = define_return_scope :result

    # 
    # parser rule mulOperandRest
    # 
    # (in Giraffe.g)
    # 233:1: mulOperandRest returns [result] : arrayIndexTarget ( '[' expression ']' )* ;
    # 
    def mulOperandRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = MulOperandRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal125 = nil
      char_literal127 = nil
      arrayIndexTarget124 = nil
      expression126 = nil

      tree_for_char_literal125 = nil
      tree_for_char_literal127 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 234:4: arrayIndexTarget ( '[' expression ']' )*
        @state.following.push( TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1347 )
        arrayIndexTarget124 = arrayIndexTarget
        @state.following.pop
        @adaptor.add_child( root_0, arrayIndexTarget124.tree )
        # --> action
        return_value.result = ( arrayIndexTarget124.nil? ? nil : arrayIndexTarget124.result )
        # <-- action
        # at line 235:3: ( '[' expression ']' )*
        while true # decision 29
          alt_29 = 2
          look_29_0 = @input.peek( 1 )

          if ( look_29_0 == T__64 )
            alt_29 = 1

          end
          case alt_29
          when 1
            # at line 235:4: '[' expression ']'
            char_literal125 = match( T__64, TOKENS_FOLLOWING_T__64_IN_mulOperandRest_1355 )

            tree_for_char_literal125 = @adaptor.create_with_payload( char_literal125 )
            @adaptor.add_child( root_0, tree_for_char_literal125 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_mulOperandRest_1357 )
            expression126 = expression
            @state.following.pop
            @adaptor.add_child( root_0, expression126.tree )
            char_literal127 = match( T__65, TOKENS_FOLLOWING_T__65_IN_mulOperandRest_1359 )

            tree_for_char_literal127 = @adaptor.create_with_payload( char_literal127 )
            @adaptor.add_child( root_0, tree_for_char_literal127 )

            # --> action
             return_value.result = IndexTree.new(return_value.result,( expression126.nil? ? nil : expression126.result )) 
            # <-- action

          else
            break # out of loop for decision 29
          end
        end # loop for decision 29
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

    ArrayIndexTargetReturnValue = define_return_scope :result

    # 
    # parser rule arrayIndexTarget
    # 
    # (in Giraffe.g)
    # 238:1: arrayIndexTarget returns [result] : ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction | new );
    # 
    def arrayIndexTarget
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = ArrayIndexTargetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID128__ = nil
      __LB129__ = nil
      __RB131__ = nil
      __INT132__ = nil
      __FLOAT133__ = nil
      expression130 = nil
      string134 = nil
      call135 = nil
      array136 = nil
      readInstruction137 = nil
      new138 = nil

      tree_for_ID128 = nil
      tree_for_LB129 = nil
      tree_for_RB131 = nil
      tree_for_INT132 = nil
      tree_for_FLOAT133 = nil

      begin
        # at line 239:2: ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction | new )
        alt_30 = 9
        alt_30 = @dfa30.predict( @input )
        case alt_30
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 239:4: ID
          __ID128__ = match( ID, TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1382 )

          tree_for_ID128 = @adaptor.create_with_payload( __ID128__ )
          @adaptor.add_child( root_0, tree_for_ID128 )

          # --> action
          return_value.result = VarTree.new(__ID128__.text)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 240:4: LB expression RB
          __LB129__ = match( LB, TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1389 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1392 )
          expression130 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression130.tree )
          __RB131__ = match( RB, TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1394 )
          # --> action
          return_value.result = ( expression130.nil? ? nil : expression130.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 241:4: INT
          __INT132__ = match( INT, TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1402 )

          tree_for_INT132 = @adaptor.create_with_payload( __INT132__ )
          @adaptor.add_child( root_0, tree_for_INT132 )

          # --> action
          return_value.result = AtomTree.new(__INT132__.text.to_i)
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 242:4: FLOAT
          __FLOAT133__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_arrayIndexTarget_1409 )

          tree_for_FLOAT133 = @adaptor.create_with_payload( __FLOAT133__ )
          @adaptor.add_child( root_0, tree_for_FLOAT133 )

          # --> action
          return_value.result = AtomTree.new(__FLOAT133__.text.to_f)
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 243:4: string
          @state.following.push( TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1416 )
          string134 = string
          @state.following.pop
          @adaptor.add_child( root_0, string134.tree )
          # --> action
          return_value.result = AtomTree.new(( string134.nil? ? nil : string134.result ))
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 244:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1423 )
          call135 = call
          @state.following.pop
          @adaptor.add_child( root_0, call135.tree )
          # --> action
          return_value.result = ( call135.nil? ? nil : call135.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 245:4: array
          @state.following.push( TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1430 )
          array136 = array
          @state.following.pop
          @adaptor.add_child( root_0, array136.tree )
          # --> action
          return_value.result = ArrayTree.new(( array136.nil? ? nil : array136.result ))
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 246:4: readInstruction
          @state.following.push( TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1437 )
          readInstruction137 = readInstruction
          @state.following.pop
          @adaptor.add_child( root_0, readInstruction137.tree )
          # --> action
          return_value.result = ( readInstruction137.nil? ? nil : readInstruction137.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 247:4: new
          @state.following.push( TOKENS_FOLLOWING_new_IN_arrayIndexTarget_1444 )
          new138 = new
          @state.following.pop
          @adaptor.add_child( root_0, new138.tree )
          # --> action
          return_value.result = ( new138.nil? ? nil : new138.result )
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

    NewReturnValue = define_return_scope :result

    # 
    # parser rule new
    # 
    # (in Giraffe.g)
    # 250:1: new returns [result] : NEW ID ( LB ( args )? RB )? ;
    # 
    def new
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = NewReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NEW139__ = nil
      __ID140__ = nil
      __LB141__ = nil
      __RB143__ = nil
      args142 = nil

      tree_for_NEW139 = nil
      tree_for_ID140 = nil
      tree_for_LB141 = nil
      tree_for_RB143 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 251:4: NEW ID ( LB ( args )? RB )?
        __NEW139__ = match( NEW, TOKENS_FOLLOWING_NEW_IN_new_1461 )

        tree_for_NEW139 = @adaptor.create_with_payload( __NEW139__ )
        @adaptor.add_child( root_0, tree_for_NEW139 )

        __ID140__ = match( ID, TOKENS_FOLLOWING_ID_IN_new_1463 )

        tree_for_ID140 = @adaptor.create_with_payload( __ID140__ )
        @adaptor.add_child( root_0, tree_for_ID140 )

        # at line 251:11: ( LB ( args )? RB )?
        alt_32 = 2
        look_32_0 = @input.peek( 1 )

        if ( look_32_0 == LB )
          alt_32 = 1
        end
        case alt_32
        when 1
          # at line 251:12: LB ( args )? RB
          __LB141__ = match( LB, TOKENS_FOLLOWING_LB_IN_new_1466 )

          tree_for_LB141 = @adaptor.create_with_payload( __LB141__ )
          @adaptor.add_child( root_0, tree_for_LB141 )

          # at line 251:15: ( args )?
          alt_31 = 2
          look_31_0 = @input.peek( 1 )

          if ( look_31_0 == READ || look_31_0 == LB || look_31_0.between?( PLUS, INT ) || look_31_0 == ID || look_31_0.between?( TO_INT, NEW ) || look_31_0 == STRING || look_31_0 == T__64 )
            alt_31 = 1
          end
          case alt_31
          when 1
            # at line 251:15: args
            @state.following.push( TOKENS_FOLLOWING_args_IN_new_1468 )
            args142 = args
            @state.following.pop
            @adaptor.add_child( root_0, args142.tree )

          end
          __RB143__ = match( RB, TOKENS_FOLLOWING_RB_IN_new_1471 )

          tree_for_RB143 = @adaptor.create_with_payload( __RB143__ )
          @adaptor.add_child( root_0, tree_for_RB143 )


        end
        # --> action
        return_value.result = NewTree.new(__ID140__.text,( args142.nil? ? nil : args142.list ))
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
        # trace_out( __method__, 33 )

      end
      
      return return_value
    end

    ArrayReturnValue = define_return_scope :result

    # 
    # parser rule array
    # 
    # (in Giraffe.g)
    # 254:1: array returns [result] : '[' (ex1= expression ( COMMA ex2= expression )* )? ']' ;
    # 
    def array
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = ArrayReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal144 = nil
      __COMMA145__ = nil
      char_literal146 = nil
      ex1 = nil
      ex2 = nil

      tree_for_char_literal144 = nil
      tree_for_COMMA145 = nil
      tree_for_char_literal146 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 255:4: '[' (ex1= expression ( COMMA ex2= expression )* )? ']'
        char_literal144 = match( T__64, TOKENS_FOLLOWING_T__64_IN_array_1490 )

        tree_for_char_literal144 = @adaptor.create_with_payload( char_literal144 )
        @adaptor.add_child( root_0, tree_for_char_literal144 )

        # --> action
        return_value.result = []
        # <-- action
        # at line 256:3: (ex1= expression ( COMMA ex2= expression )* )?
        alt_34 = 2
        look_34_0 = @input.peek( 1 )

        if ( look_34_0 == READ || look_34_0 == LB || look_34_0.between?( PLUS, INT ) || look_34_0 == ID || look_34_0.between?( TO_INT, NEW ) || look_34_0 == STRING || look_34_0 == T__64 )
          alt_34 = 1
        end
        case alt_34
        when 1
          # at line 256:4: ex1= expression ( COMMA ex2= expression )*
          @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1499 )
          ex1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, ex1.tree )
          # --> action
          return_value.result << ( ex1.nil? ? nil : ex1.result )
          # <-- action
          # at line 257:3: ( COMMA ex2= expression )*
          while true # decision 33
            alt_33 = 2
            look_33_0 = @input.peek( 1 )

            if ( look_33_0 == COMMA )
              alt_33 = 1

            end
            case alt_33
            when 1
              # at line 257:4: COMMA ex2= expression
              __COMMA145__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_array_1506 )

              tree_for_COMMA145 = @adaptor.create_with_payload( __COMMA145__ )
              @adaptor.add_child( root_0, tree_for_COMMA145 )

              @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1510 )
              ex2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, ex2.tree )
              # --> action
              return_value.result << ( ex2.nil? ? nil : ex2.result )
              # <-- action

            else
              break # out of loop for decision 33
            end
          end # loop for decision 33

        end
        char_literal146 = match( T__65, TOKENS_FOLLOWING_T__65_IN_array_1521 )

        tree_for_char_literal146 = @adaptor.create_with_payload( char_literal146 )
        @adaptor.add_child( root_0, tree_for_char_literal146 )

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
        # trace_out( __method__, 34 )

      end
      
      return return_value
    end

    AssignmentReturnValue = define_return_scope :result

    # 
    # parser rule assignment
    # 
    # (in Giraffe.g)
    # 264:1: assignment returns [result] : var= ID ( ASSIGN op1= expression | ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) ) | ( DOT method2= ID LB (args2= args )? RB )+ ) ;
    # 
    def assignment
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = AssignmentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      var = nil
      method1 = nil
      method2 = nil
      __ASSIGN147__ = nil
      char_literal148 = nil
      char_literal149 = nil
      __ASSIGN150__ = nil
      __DOT151__ = nil
      __LB152__ = nil
      __RB153__ = nil
      __DOT154__ = nil
      __LB155__ = nil
      __RB156__ = nil
      op1 = nil
      index = nil
      op2 = nil
      args1 = nil
      args2 = nil

      tree_for_var = nil
      tree_for_method1 = nil
      tree_for_method2 = nil
      tree_for_ASSIGN147 = nil
      tree_for_char_literal148 = nil
      tree_for_char_literal149 = nil
      tree_for_ASSIGN150 = nil
      tree_for_DOT151 = nil
      tree_for_LB152 = nil
      tree_for_RB153 = nil
      tree_for_DOT154 = nil
      tree_for_LB155 = nil
      tree_for_RB156 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 265:4: var= ID ( ASSIGN op1= expression | ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) ) | ( DOT method2= ID LB (args2= args )? RB )+ )
        var = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1543 )

        tree_for_var = @adaptor.create_with_payload( var )
        @adaptor.add_child( root_0, tree_for_var )

        # --> action
        return_value.result = VarTree.new(var.text)
        # <-- action
        # at line 266:3: ( ASSIGN op1= expression | ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) ) | ( DOT method2= ID LB (args2= args )? RB )+ )
        alt_41 = 3
        case look_41 = @input.peek( 1 )
        when ASSIGN then alt_41 = 1
        when T__64 then alt_41 = 2
        when DOT then alt_41 = 3
        else
          raise NoViableAlternative( "", 41, 0 )
        end
        case alt_41
        when 1
          # at line 266:5: ASSIGN op1= expression
          __ASSIGN147__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1551 )

          tree_for_ASSIGN147 = @adaptor.create_with_payload( __ASSIGN147__ )
          root_0 = @adaptor.become_root( tree_for_ASSIGN147, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1556 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # --> action
           return_value.result = AssignTree.new(var.text,( op1.nil? ? nil : op1.result )) 
          # <-- action

        when 2
          # at line 267:5: ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) )
          # --> action
          index=nil
          # <-- action
          # at line 268:4: ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) )
          # at line 268:5: ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ )
          # at file 268:5: ( '[' index= expression ']' )+
          match_count_35 = 0
          while true
            alt_35 = 2
            look_35_0 = @input.peek( 1 )

            if ( look_35_0 == T__64 )
              alt_35 = 1

            end
            case alt_35
            when 1
              # at line 268:7: '[' index= expression ']'
              # --> action
              index_ = index
              # <-- action
              char_literal148 = match( T__64, TOKENS_FOLLOWING_T__64_IN_assignment_1575 )

              tree_for_char_literal148 = @adaptor.create_with_payload( char_literal148 )
              @adaptor.add_child( root_0, tree_for_char_literal148 )

              @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1579 )
              index = expression
              @state.following.pop
              @adaptor.add_child( root_0, index.tree )
              char_literal149 = match( T__65, TOKENS_FOLLOWING_T__65_IN_assignment_1581 )

              tree_for_char_literal149 = @adaptor.create_with_payload( char_literal149 )
              @adaptor.add_child( root_0, tree_for_char_literal149 )

              # --> action
              target_ = return_value.result; return_value.result = IndexTree.new(return_value.result,( index.nil? ? nil : index.result ))
              # <-- action

            else
              match_count_35 > 0 and break
              eee = EarlyExit(35)


              raise eee
            end
            match_count_35 += 1
          end

          # at line 269:4: ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ )
          alt_38 = 2
          look_38_0 = @input.peek( 1 )

          if ( look_38_0 == ASSIGN )
            alt_38 = 1
          elsif ( look_38_0 == DOT )
            alt_38 = 2
          else
            raise NoViableAlternative( "", 38, 0 )
          end
          case alt_38
          when 1
            # at line 269:6: ASSIGN op2= expression
            __ASSIGN150__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1594 )

            tree_for_ASSIGN150 = @adaptor.create_with_payload( __ASSIGN150__ )
            root_0 = @adaptor.become_root( tree_for_ASSIGN150, root_0 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1599 )
            op2 = expression
            @state.following.pop
            @adaptor.add_child( root_0, op2.tree )
            # --> action
             return_value.result = DerefTree.new(target_,( index.nil? ? nil : index.result ),( op2.nil? ? nil : op2.result )) 
            # <-- action

          when 2
            # at line 270:6: ( DOT method1= ID LB (args1= args )? RB )+
            # at file 270:6: ( DOT method1= ID LB (args1= args )? RB )+
            match_count_37 = 0
            while true
              alt_37 = 2
              look_37_0 = @input.peek( 1 )

              if ( look_37_0 == DOT )
                alt_37 = 1

              end
              case alt_37
              when 1
                # at line 270:7: DOT method1= ID LB (args1= args )? RB
                __DOT151__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_assignment_1614 )

                tree_for_DOT151 = @adaptor.create_with_payload( __DOT151__ )
                @adaptor.add_child( root_0, tree_for_DOT151 )

                method1 = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1618 )

                tree_for_method1 = @adaptor.create_with_payload( method1 )
                @adaptor.add_child( root_0, tree_for_method1 )

                __LB152__ = match( LB, TOKENS_FOLLOWING_LB_IN_assignment_1620 )
                # at line 270:31: (args1= args )?
                alt_36 = 2
                look_36_0 = @input.peek( 1 )

                if ( look_36_0 == READ || look_36_0 == LB || look_36_0.between?( PLUS, INT ) || look_36_0 == ID || look_36_0.between?( TO_INT, NEW ) || look_36_0 == STRING || look_36_0 == T__64 )
                  alt_36 = 1
                end
                case alt_36
                when 1
                  # at line 270:31: args1= args
                  @state.following.push( TOKENS_FOLLOWING_args_IN_assignment_1625 )
                  args1 = args
                  @state.following.pop
                  @adaptor.add_child( root_0, args1.tree )

                end
                __RB153__ = match( RB, TOKENS_FOLLOWING_RB_IN_assignment_1628 )
                # --> action
                return_value.result = MethodCallTree.new(return_value.result,method1.text,( args1.nil? ? nil : args1.list ))
                # <-- action

              else
                match_count_37 > 0 and break
                eee = EarlyExit(37)


                raise eee
              end
              match_count_37 += 1
            end


          end


        when 3
          # at line 272:5: ( DOT method2= ID LB (args2= args )? RB )+
          # at file 272:5: ( DOT method2= ID LB (args2= args )? RB )+
          match_count_40 = 0
          while true
            alt_40 = 2
            look_40_0 = @input.peek( 1 )

            if ( look_40_0 == DOT )
              alt_40 = 1

            end
            case alt_40
            when 1
              # at line 272:6: DOT method2= ID LB (args2= args )? RB
              __DOT154__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_assignment_1646 )

              tree_for_DOT154 = @adaptor.create_with_payload( __DOT154__ )
              @adaptor.add_child( root_0, tree_for_DOT154 )

              method2 = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1650 )

              tree_for_method2 = @adaptor.create_with_payload( method2 )
              @adaptor.add_child( root_0, tree_for_method2 )

              __LB155__ = match( LB, TOKENS_FOLLOWING_LB_IN_assignment_1652 )
              # at line 272:30: (args2= args )?
              alt_39 = 2
              look_39_0 = @input.peek( 1 )

              if ( look_39_0 == READ || look_39_0 == LB || look_39_0.between?( PLUS, INT ) || look_39_0 == ID || look_39_0.between?( TO_INT, NEW ) || look_39_0 == STRING || look_39_0 == T__64 )
                alt_39 = 1
              end
              case alt_39
              when 1
                # at line 272:30: args2= args
                @state.following.push( TOKENS_FOLLOWING_args_IN_assignment_1657 )
                args2 = args
                @state.following.pop
                @adaptor.add_child( root_0, args2.tree )

              end
              __RB156__ = match( RB, TOKENS_FOLLOWING_RB_IN_assignment_1660 )
              # --> action
              return_value.result = MethodCallTree.new(return_value.result,method2.text,( args2.nil? ? nil : args2.list )) 
              # <-- action

            else
              match_count_40 > 0 and break
              eee = EarlyExit(40)


              raise eee
            end
            match_count_40 += 1
          end


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
        # trace_out( __method__, 35 )

      end
      
      return return_value
    end

    BoolReturnValue = define_return_scope :result

    # 
    # parser rule bool
    # 
    # (in Giraffe.g)
    # 276:1: bool returns [result] : ( TRUE | FALSE );
    # 
    def bool
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = BoolReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __TRUE157__ = nil
      __FALSE158__ = nil

      tree_for_TRUE157 = nil
      tree_for_FALSE158 = nil

      begin
        # at line 277:2: ( TRUE | FALSE )
        alt_42 = 2
        look_42_0 = @input.peek( 1 )

        if ( look_42_0 == TRUE )
          alt_42 = 1
        elsif ( look_42_0 == FALSE )
          alt_42 = 2
        else
          raise NoViableAlternative( "", 42, 0 )
        end
        case alt_42
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 277:4: TRUE
          __TRUE157__ = match( TRUE, TOKENS_FOLLOWING_TRUE_IN_bool_1687 )

          tree_for_TRUE157 = @adaptor.create_with_payload( __TRUE157__ )
          @adaptor.add_child( root_0, tree_for_TRUE157 )

          # --> action
          return_value.result = AtomTree.new(true)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 278:5: FALSE
          __FALSE158__ = match( FALSE, TOKENS_FOLLOWING_FALSE_IN_bool_1695 )

          tree_for_FALSE158 = @adaptor.create_with_payload( __FALSE158__ )
          @adaptor.add_child( root_0, tree_for_FALSE158 )

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
        # trace_out( __method__, 36 )

      end
      
      return return_value
    end

    StringReturnValue = define_return_scope :result

    # 
    # parser rule string
    # 
    # (in Giraffe.g)
    # 281:1: string returns [result] : STRING ;
    # 
    def string
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = StringReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __STRING159__ = nil

      tree_for_STRING159 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 282:4: STRING
        __STRING159__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_string_1713 )

        tree_for_STRING159 = @adaptor.create_with_payload( __STRING159__ )
        @adaptor.add_child( root_0, tree_for_STRING159 )

        # --> action
        return_value.result = __STRING159__.text[1..-2]
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
        # trace_out( __method__, 37 )

      end
      
      return return_value
    end

    ClassDefReturnValue = define_return_scope :result

    # 
    # parser rule classDef
    # 
    # (in Giraffe.g)
    # 289:1: classDef returns [result] : CLASS classid= ID ( SUPERCLASS superclassid= ID )? LCB block RCB ;
    # 
    def classDef
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = ClassDefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      classid = nil
      superclassid = nil
      __CLASS160__ = nil
      __SUPERCLASS161__ = nil
      __LCB162__ = nil
      __RCB164__ = nil
      block163 = nil

      tree_for_classid = nil
      tree_for_superclassid = nil
      tree_for_CLASS160 = nil
      tree_for_SUPERCLASS161 = nil
      tree_for_LCB162 = nil
      tree_for_RCB164 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 290:4: CLASS classid= ID ( SUPERCLASS superclassid= ID )? LCB block RCB
        # --> action
        superclass=nil
        # <-- action
        __CLASS160__ = match( CLASS, TOKENS_FOLLOWING_CLASS_IN_classDef_1776 )

        tree_for_CLASS160 = @adaptor.create_with_payload( __CLASS160__ )
        @adaptor.add_child( root_0, tree_for_CLASS160 )

        classid = match( ID, TOKENS_FOLLOWING_ID_IN_classDef_1780 )

        tree_for_classid = @adaptor.create_with_payload( classid )
        @adaptor.add_child( root_0, tree_for_classid )

        # at line 291:20: ( SUPERCLASS superclassid= ID )?
        alt_43 = 2
        look_43_0 = @input.peek( 1 )

        if ( look_43_0 == SUPERCLASS )
          alt_43 = 1
        end
        case alt_43
        when 1
          # at line 291:21: SUPERCLASS superclassid= ID
          __SUPERCLASS161__ = match( SUPERCLASS, TOKENS_FOLLOWING_SUPERCLASS_IN_classDef_1783 )

          tree_for_SUPERCLASS161 = @adaptor.create_with_payload( __SUPERCLASS161__ )
          @adaptor.add_child( root_0, tree_for_SUPERCLASS161 )

          superclassid = match( ID, TOKENS_FOLLOWING_ID_IN_classDef_1787 )

          tree_for_superclassid = @adaptor.create_with_payload( superclassid )
          @adaptor.add_child( root_0, tree_for_superclassid )

          # --> action
          superclass=superclassid.text
          # <-- action

        end
        __LCB162__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_classDef_1793 )

        tree_for_LCB162 = @adaptor.create_with_payload( __LCB162__ )
        @adaptor.add_child( root_0, tree_for_LCB162 )

        @state.following.push( TOKENS_FOLLOWING_block_IN_classDef_1799 )
        block163 = block
        @state.following.pop
        @adaptor.add_child( root_0, block163.tree )
        __RCB164__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_classDef_1803 )

        tree_for_RCB164 = @adaptor.create_with_payload( __RCB164__ )
        @adaptor.add_child( root_0, tree_for_RCB164 )

        # --> action
        return_value.result = ClassTree.new(classid.text,( block163.nil? ? nil : block163.list ),superclass)
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
        # trace_out( __method__, 38 )

      end
      
      return return_value
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA5 < ANTLR3::DFA
      EOT = unpack( 17, -1 )
      EOF = unpack( 1, 13, 16, -1 )
      MIN = unpack( 2, 4, 15, -1 )
      MAX = unpack( 1, 63, 1, 64, 15, -1 )
      ACCEPT = unpack( 2, -1, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 
                       1, 10, 1, 11, 1, 12, 1, 14, 1, 15, 1, 13, 1, 1, 1, 
                       2 )
      SPECIAL = unpack( 17, -1 )
      TRANSITION = [
        unpack( 1, 2, 3, 13, 1, -1, 1, 11, 1, 9, 1, 10, 5, -1, 1, 7, 2, 
                8, 1, -1, 1, 4, 3, -1, 1, 5, 1, 6, 1, 3, 1, 1, 22, -1, 1, 
                12, 10, -1, 2, 13 ),
        unpack( 1, 16, 7, -1, 1, 14, 15, -1, 1, 16, 1, 15, 16, -1, 1, 15, 
                 17, -1, 1, 15 ),
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
          68:1: instruction returns [result] : ( assignment | func | env | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | classDef | );
        __dfa_description__
      end
    end
    class DFA30 < ANTLR3::DFA
      EOT = unpack( 11, -1 )
      EOF = unpack( 1, -1, 1, 10, 9, -1 )
      MIN = unpack( 1, 8, 1, 4, 9, -1 )
      MAX = unpack( 1, 64, 1, 65, 9, -1 )
      ACCEPT = unpack( 2, -1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 7, 1, 8, 1, 9, 
                       1, 6, 1, 1 )
      SPECIAL = unpack( 11, -1 )
      TRANSITION = [
        unpack( 1, 7, 3, -1, 1, 2, 3, -1, 1, 3, 11, -1, 1, 1, 15, -1, 1, 
                4, 1, 8, 3, -1, 1, 5, 14, -1, 1, 6 ),
        unpack( 4, 10, 4, -1, 1, 9, 3, 10, 4, -1, 1, 10, 9, -1, 2, 10, 
                 1, -1, 9, 10, 20, -1, 4, 10 ),
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
      
      @decision = 30
      

      def description
        <<-'__dfa_description__'.strip!
          238:1: arrayIndexTarget returns [result] : ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction | new );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa5 = DFA5.new( self, 5 )
      @dfa30 = DFA30.new( self, 30 )

    end
    TOKENS_FOLLOWING_block_IN_program_49 = Set[ 1 ]
    TOKENS_FOLLOWING_LCB_IN_env_64 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 21, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_env_70 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_env_76 = Set[ 1 ]
    TOKENS_FOLLOWING_instruction_IN_block_96 = Set[ 6, 7, 62, 63 ]
    TOKENS_FOLLOWING_instructionRest_IN_block_106 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_instructionRest_136 = Set[ 62, 63 ]
    TOKENS_FOLLOWING_T__62_IN_instructionRest_140 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_instructionRest_144 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 21, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_150 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 21, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_instruction_IN_instructionRest_157 = Set[ 6, 7, 62, 63 ]
    TOKENS_FOLLOWING_instructionRest_IN_instructionRest_170 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_IN_instruction_198 = Set[ 1 ]
    TOKENS_FOLLOWING_func_IN_instruction_205 = Set[ 1 ]
    TOKENS_FOLLOWING_env_IN_instruction_212 = Set[ 1 ]
    TOKENS_FOLLOWING_forCycle_IN_instruction_219 = Set[ 1 ]
    TOKENS_FOLLOWING_ifInstruction_IN_instruction_226 = Set[ 1 ]
    TOKENS_FOLLOWING_whileCycle_IN_instruction_233 = Set[ 1 ]
    TOKENS_FOLLOWING_doCycle_IN_instruction_240 = Set[ 1 ]
    TOKENS_FOLLOWING_printInstruction_IN_instruction_247 = Set[ 1 ]
    TOKENS_FOLLOWING_printlInstruction_IN_instruction_254 = Set[ 1 ]
    TOKENS_FOLLOWING_returnInstruction_IN_instruction_261 = Set[ 1 ]
    TOKENS_FOLLOWING_exitInstruction_IN_instruction_269 = Set[ 1 ]
    TOKENS_FOLLOWING_breakInstruction_IN_instruction_276 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_instruction_283 = Set[ 1 ]
    TOKENS_FOLLOWING_classDef_IN_instruction_290 = Set[ 1 ]
    TOKENS_FOLLOWING_READ_IN_readInstruction_313 = Set[ 1 ]
    TOKENS_FOLLOWING_BREAK_IN_breakInstruction_330 = Set[ 1 ]
    TOKENS_FOLLOWING_RETURN_IN_returnInstruction_347 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_returnInstruction_350 = Set[ 1 ]
    TOKENS_FOLLOWING_EXIT_IN_exitInstruction_367 = Set[ 1, 12, 14, 15, 16 ]
    TOKENS_FOLLOWING_LB_IN_exitInstruction_372 = Set[ 14, 15, 16 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_377 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_exitInstruction_379 = Set[ 1 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_392 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_statusCode_417 = Set[ 16 ]
    TOKENS_FOLLOWING_MINUS_IN_statusCode_421 = Set[ 16 ]
    TOKENS_FOLLOWING_INT_IN_statusCode_427 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINT_IN_printInstruction_448 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printInstruction_451 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_printlInstruction_472 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printlInstruction_481 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_printText_501 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_COMMA_IN_printText_508 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printText_512 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_ifInstruction_535 = Set[ 8, 12, 14, 15, 16, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_ifInstruction_538 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_ifInstruction_540 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 21, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifInstruction_543 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_ifInstruction_545 = Set[ 22, 23, 24 ]
    TOKENS_FOLLOWING_ifRest_IN_ifInstruction_548 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_ifRest_567 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_569 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 21, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifRest_572 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_574 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_ifRest_582 = Set[ 8, 12, 14, 15, 16, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_ifRest_590 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_592 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 21, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifRest_595 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_597 = Set[ 22, 23, 24 ]
    TOKENS_FOLLOWING_ifRest_IN_ifRest_602 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_whileCycle_629 = Set[ 8, 12, 14, 15, 16, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_whileCycle_631 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_whileCycle_633 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 21, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_whileCycle_636 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_whileCycle_638 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_doCycle_660 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_doCycle_662 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 21, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_doCycle_665 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_doCycle_667 = Set[ 25 ]
    TOKENS_FOLLOWING_WHILE_IN_doCycle_670 = Set[ 8, 12, 14, 15, 16, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_doCycle_672 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_forCycle_693 = Set[ 28 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_697 = Set[ 20 ]
    TOKENS_FOLLOWING_COMMA_IN_forCycle_699 = Set[ 8, 12, 14, 15, 16, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_forCycle_702 = Set[ 20 ]
    TOKENS_FOLLOWING_COMMA_IN_forCycle_704 = Set[ 28 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_709 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_forCycle_711 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 21, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_forCycle_714 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_forCycle_716 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_func_738 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_params_IN_func_741 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_func_744 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 21, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_func_747 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_func_749 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_params_769 = Set[ 20 ]
    TOKENS_FOLLOWING_paramRest_IN_params_771 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_paramRest_790 = Set[ 28 ]
    TOKENS_FOLLOWING_params_IN_paramRest_793 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_call_822 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_call_825 = Set[ 8, 12, 13, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_call_830 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_call_833 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_DOT_IN_call_844 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_call_848 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_call_850 = Set[ 8, 12, 13, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_call_855 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_call_858 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_expression_IN_args_880 = Set[ 20 ]
    TOKENS_FOLLOWING_argsRest_IN_args_882 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsRest_901 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_argsRest_904 = Set[ 1 ]
    TOKENS_FOLLOWING_orOperand_IN_condition_930 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_OR_IN_condition_937 = Set[ 8, 12, 14, 15, 16, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_condition_942 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperand_IN_orOperand_963 = Set[ 1, 31 ]
    TOKENS_FOLLOWING_AND_IN_orOperand_970 = Set[ 8, 12, 14, 15, 16, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_orOperand_IN_orOperand_975 = Set[ 1 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_994 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_boolOperand_1001 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_boolOperand_1003 = Set[ 8, 12, 14, 15, 16, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_boolOperand_1006 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_boolOperand_1008 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1018 = Set[ 33, 34, 35, 36, 37, 38 ]
    TOKENS_FOLLOWING_EQ_IN_boolOperand_1021 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1028 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1034 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_boolOperand_1045 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1052 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1058 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_boolOperand_1069 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1076 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1082 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_boolOperand_1093 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1100 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1106 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_boolOperand_1117 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1124 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1130 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_boolOperand_1141 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1148 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1154 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperand_IN_expression_1179 = Set[ 1, 14, 15 ]
    TOKENS_FOLLOWING_PLUS_IN_expression_1190 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_expression_1195 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expression_1203 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_expression_1208 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperand_1230 = Set[ 1, 39, 40, 41 ]
    TOKENS_FOLLOWING_MUL_IN_addOperand_1241 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1246 = Set[ 1 ]
    TOKENS_FOLLOWING_DIV_IN_addOperand_1254 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1259 = Set[ 1 ]
    TOKENS_FOLLOWING_MOD_IN_addOperand_1267 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1272 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_mulOperand_1294 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1296 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_mulOperand_1303 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1305 = Set[ 1 ]
    TOKENS_FOLLOWING_TO_INT_IN_mulOperand_1312 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1314 = Set[ 1 ]
    TOKENS_FOLLOWING_TO_FLOAT_IN_mulOperand_1321 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1323 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1330 = Set[ 1 ]
    TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1347 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_T__64_IN_mulOperandRest_1355 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_mulOperandRest_1357 = Set[ 65 ]
    TOKENS_FOLLOWING_T__65_IN_mulOperandRest_1359 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1382 = Set[ 1 ]
    TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1389 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1392 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1394 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1402 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_arrayIndexTarget_1409 = Set[ 1 ]
    TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1416 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1423 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1430 = Set[ 1 ]
    TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1437 = Set[ 1 ]
    TOKENS_FOLLOWING_new_IN_arrayIndexTarget_1444 = Set[ 1 ]
    TOKENS_FOLLOWING_NEW_IN_new_1461 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_new_1463 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_LB_IN_new_1466 = Set[ 8, 12, 13, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_new_1468 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_new_1471 = Set[ 1 ]
    TOKENS_FOLLOWING_T__64_IN_array_1490 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64, 65 ]
    TOKENS_FOLLOWING_expression_IN_array_1499 = Set[ 20, 65 ]
    TOKENS_FOLLOWING_COMMA_IN_array_1506 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_array_1510 = Set[ 20, 65 ]
    TOKENS_FOLLOWING_T__65_IN_array_1521 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1543 = Set[ 29, 46, 64 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1551 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1556 = Set[ 1 ]
    TOKENS_FOLLOWING_T__64_IN_assignment_1575 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1579 = Set[ 65 ]
    TOKENS_FOLLOWING_T__65_IN_assignment_1581 = Set[ 29, 46, 64 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1594 = Set[ 8, 12, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1599 = Set[ 1 ]
    TOKENS_FOLLOWING_DOT_IN_assignment_1614 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1618 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_assignment_1620 = Set[ 8, 12, 13, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_assignment_1625 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_assignment_1628 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_DOT_IN_assignment_1646 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1650 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_assignment_1652 = Set[ 8, 12, 13, 14, 15, 16, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_assignment_1657 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_assignment_1660 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_TRUE_IN_bool_1687 = Set[ 1 ]
    TOKENS_FOLLOWING_FALSE_IN_bool_1695 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_string_1713 = Set[ 1 ]
    TOKENS_FOLLOWING_CLASS_IN_classDef_1776 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_classDef_1780 = Set[ 4, 52 ]
    TOKENS_FOLLOWING_SUPERCLASS_IN_classDef_1783 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_classDef_1787 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_classDef_1793 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 21, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_classDef_1799 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_classDef_1803 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end


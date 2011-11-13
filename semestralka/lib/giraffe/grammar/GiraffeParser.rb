#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-11-14 00:00:26
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
require './lib/giraffe/operators.rb'

# - - - - - - end action @parser::header - - - - - - -


module Giraffe
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :EXPONENT => 51, :LT => 34, :RB => 13, :WHILE => 24, 
                   :MOD => 40, :OCTAL_ESC => 50, :DO => 25, :FOR => 26, 
                   :FLOAT => 43, :NOT => 31, :RCB => 5, :ID => 28, :AND => 30, 
                   :EOF => -1, :TO_INT => 41, :BREAK => 9, :IF => 20, :TO_FLOAT => 42, 
                   :T__55 => 55, :T__56 => 56, :T__57 => 57, :T__58 => 58, 
                   :ESC_SEQ => 47, :T__54 => 54, :LCB => 4, :COMMA => 27, 
                   :PRINTLN => 19, :RETURN => 10, :PLUS => 14, :EQ => 32, 
                   :COMMENT => 6, :NE => 33, :EXIT => 11, :GE => 37, :UNICODE_ESC => 49, 
                   :ELSE => 21, :HEX_DIGIT => 48, :SEMICOLON => 7, :INT => 16, 
                   :MINUS => 15, :TRUE => 45, :MUL => 38, :PRINT => 17, 
                   :PRINTL => 18, :ELSEIF => 22, :COLON => 53, :ELIF => 23, 
                   :WS => 52, :READ => 8, :OR => 29, :ASSIGN => 44, :GT => 35, 
                   :LB => 12, :DIV => 39, :FALSE => 46, :LE => 36 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "LCB", "RCB", "COMMENT", "SEMICOLON", "READ", "BREAK", 
                    "RETURN", "EXIT", "LB", "RB", "PLUS", "MINUS", "INT", 
                    "PRINT", "PRINTL", "PRINTLN", "IF", "ELSE", "ELSEIF", 
                    "ELIF", "WHILE", "DO", "FOR", "COMMA", "ID", "OR", "AND", 
                    "NOT", "EQ", "NE", "LT", "GT", "LE", "GE", "MUL", "DIV", 
                    "MOD", "TO_INT", "TO_FLOAT", "FLOAT", "ASSIGN", "TRUE", 
                    "FALSE", "ESC_SEQ", "HEX_DIGIT", "UNICODE_ESC", "OCTAL_ESC", 
                    "EXPONENT", "WS", "COLON", "'\\r'", "'\\n'", "'['", 
                    "']'", "'\"'" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = Giraffe
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :program, :env, :block, :instructionRest, :instruction, 
                     :readInstruction, :breakInstruction, :returnInstruction, 
                     :exitInstruction, :statusCode, :printInstruction, :printlInstruction, 
                     :ifInstruction, :ifRest, :whileCycle, :doCycle, :forCycle, 
                     :func, :params, :paramRest, :call, :args, :argsRest, 
                     :condition, :orOperand, :boolOperand, :expression, 
                     :addOperand, :mulOperand, :mulOperandRest, :arrayIndexTarget, 
                     :array, :assignment, :bool, :string, :innerString ].freeze


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
    # 38:1: program returns [result] : block ;
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


        # at line 39:4: block
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
    # 41:1: env returns [result] : LCB block RCB ;
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


        # at line 42:4: LCB block RCB
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
    # 47:1: block returns [list] : instruction instructionRest ;
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


        # at line 48:4: instruction instructionRest
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
    # 55:1: instructionRest returns [list] : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) instruction op= instructionRest | );
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
        # at line 56:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) instruction op= instructionRest | )
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0.between?( COMMENT, SEMICOLON ) || look_4_0.between?( T__54, T__55 ) )
          alt_4 = 1
        elsif ( look_4_0 == EOF || look_4_0 == RCB )
          alt_4 = 2
        else
          raise NoViableAlternative( "", 4, 0 )
        end
        case alt_4
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 56:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) instruction op= instructionRest
          # --> action
          return_value.list = []
          # <-- action
          # at line 57:3: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0 == COMMENT || look_3_0.between?( T__54, T__55 ) )
            alt_3 = 1
          elsif ( look_3_0 == SEMICOLON )
            alt_3 = 2
          else
            raise NoViableAlternative( "", 3, 0 )
          end
          case alt_3
          when 1
            # at line 57:4: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 57:4: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 57:6: ( COMMENT )? ( '\\r' )? '\\n'
            # at line 57:13: ( COMMENT )?
            alt_1 = 2
            look_1_0 = @input.peek( 1 )

            if ( look_1_0 == COMMENT )
              alt_1 = 1
            end
            case alt_1
            when 1
              # at line 57:13: COMMENT
              __COMMENT7__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_instructionRest_136 )

            end
            # at line 57:20: ( '\\r' )?
            alt_2 = 2
            look_2_0 = @input.peek( 1 )

            if ( look_2_0 == T__54 )
              alt_2 = 1
            end
            case alt_2
            when 1
              # at line 57:20: '\\r'
              char_literal8 = match( T__54, TOKENS_FOLLOWING_T__54_IN_instructionRest_140 )

            end
            char_literal9 = match( T__55, TOKENS_FOLLOWING_T__55_IN_instructionRest_144 )


          when 2
            # at line 57:32: SEMICOLON
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


          # at line 62:4: 
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
    # 65:1: instruction returns [result] : ( assignment | func | env | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | );
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


      begin
        # at line 66:2: ( assignment | func | env | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | )
        alt_5 = 14
        alt_5 = @dfa5.predict( @input )
        case alt_5
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 66:4: assignment
          @state.following.push( TOKENS_FOLLOWING_assignment_IN_instruction_198 )
          assignment12 = assignment
          @state.following.pop
          @adaptor.add_child( root_0, assignment12.tree )
          # --> action
          return_value.result = ( assignment12.nil? ? nil : assignment12.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 67:4: func
          @state.following.push( TOKENS_FOLLOWING_func_IN_instruction_205 )
          func13 = func
          @state.following.pop
          @adaptor.add_child( root_0, func13.tree )
          # --> action
          return_value.result = ( func13.nil? ? nil : func13.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 68:4: env
          @state.following.push( TOKENS_FOLLOWING_env_IN_instruction_212 )
          env14 = env
          @state.following.pop
          @adaptor.add_child( root_0, env14.tree )
          # --> action
          return_value.result = ( env14.nil? ? nil : env14.result )
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 69:4: forCycle
          @state.following.push( TOKENS_FOLLOWING_forCycle_IN_instruction_219 )
          forCycle15 = forCycle
          @state.following.pop
          @adaptor.add_child( root_0, forCycle15.tree )
          # --> action
          return_value.result = ( forCycle15.nil? ? nil : forCycle15.result )
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 70:4: ifInstruction
          @state.following.push( TOKENS_FOLLOWING_ifInstruction_IN_instruction_226 )
          ifInstruction16 = ifInstruction
          @state.following.pop
          @adaptor.add_child( root_0, ifInstruction16.tree )
          # --> action
          return_value.result = ( ifInstruction16.nil? ? nil : ifInstruction16.result )
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 71:4: whileCycle
          @state.following.push( TOKENS_FOLLOWING_whileCycle_IN_instruction_233 )
          whileCycle17 = whileCycle
          @state.following.pop
          @adaptor.add_child( root_0, whileCycle17.tree )
          # --> action
          return_value.result = ( whileCycle17.nil? ? nil : whileCycle17.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 72:4: doCycle
          @state.following.push( TOKENS_FOLLOWING_doCycle_IN_instruction_240 )
          doCycle18 = doCycle
          @state.following.pop
          @adaptor.add_child( root_0, doCycle18.tree )
          # --> action
          return_value.result = ( doCycle18.nil? ? nil : doCycle18.result )
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 73:4: printInstruction
          @state.following.push( TOKENS_FOLLOWING_printInstruction_IN_instruction_247 )
          printInstruction19 = printInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printInstruction19.tree )
          # --> action
          return_value.result = ( printInstruction19.nil? ? nil : printInstruction19.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 74:4: printlInstruction
          @state.following.push( TOKENS_FOLLOWING_printlInstruction_IN_instruction_254 )
          printlInstruction20 = printlInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printlInstruction20.tree )
          # --> action
          return_value.result = ( printlInstruction20.nil? ? nil : printlInstruction20.result )
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 75:4: returnInstruction
          @state.following.push( TOKENS_FOLLOWING_returnInstruction_IN_instruction_261 )
          returnInstruction21 = returnInstruction
          @state.following.pop
          @adaptor.add_child( root_0, returnInstruction21.tree )
          # --> action
          return_value.result = ( returnInstruction21.nil? ? nil : returnInstruction21.result )
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 76:4: exitInstruction
          @state.following.push( TOKENS_FOLLOWING_exitInstruction_IN_instruction_269 )
          exitInstruction22 = exitInstruction
          @state.following.pop
          @adaptor.add_child( root_0, exitInstruction22.tree )
          # --> action
          return_value.result = ( exitInstruction22.nil? ? nil : exitInstruction22.result )
          # <-- action

        when 12
          root_0 = @adaptor.create_flat_list


          # at line 77:4: breakInstruction
          @state.following.push( TOKENS_FOLLOWING_breakInstruction_IN_instruction_276 )
          breakInstruction23 = breakInstruction
          @state.following.pop
          @adaptor.add_child( root_0, breakInstruction23.tree )
          # --> action
          return_value.result = $exitInstruction.result
          # <-- action

        when 13
          root_0 = @adaptor.create_flat_list


          # at line 79:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_instruction_284 )
          call24 = call
          @state.following.pop
          @adaptor.add_child( root_0, call24.tree )
          # --> action
          return_value.result = ( call24.nil? ? nil : call24.result )
          # <-- action

        when 14
          root_0 = @adaptor.create_flat_list


          # at line 80:4: 
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
    # 83:1: readInstruction returns [result] : READ ;
    # 
    def readInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      return_value = ReadInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __READ25__ = nil

      tree_for_READ25 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 84:4: READ
        __READ25__ = match( READ, TOKENS_FOLLOWING_READ_IN_readInstruction_307 )

        tree_for_READ25 = @adaptor.create_with_payload( __READ25__ )
        @adaptor.add_child( root_0, tree_for_READ25 )

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
    # 87:1: breakInstruction returns [result] : BREAK ;
    # 
    def breakInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )
      return_value = BreakInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BREAK26__ = nil

      tree_for_BREAK26 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 88:4: BREAK
        __BREAK26__ = match( BREAK, TOKENS_FOLLOWING_BREAK_IN_breakInstruction_324 )

        tree_for_BREAK26 = @adaptor.create_with_payload( __BREAK26__ )
        @adaptor.add_child( root_0, tree_for_BREAK26 )

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
    # 91:1: returnInstruction returns [result] : RETURN expression ;
    # 
    def returnInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      return_value = ReturnInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __RETURN27__ = nil
      expression28 = nil

      tree_for_RETURN27 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 92:4: RETURN expression
        __RETURN27__ = match( RETURN, TOKENS_FOLLOWING_RETURN_IN_returnInstruction_341 )

        tree_for_RETURN27 = @adaptor.create_with_payload( __RETURN27__ )
        root_0 = @adaptor.become_root( tree_for_RETURN27, root_0 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_returnInstruction_344 )
        expression28 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression28.tree )
        # --> action
        return_value.result = ReturnTree.new(( expression28.nil? ? nil : expression28.result ))
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
    # 95:1: exitInstruction returns [result] : EXIT ( LB alt1= statusCode RB | alt2= statusCode )? ;
    # 
    def exitInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = ExitInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __EXIT29__ = nil
      __LB30__ = nil
      __RB31__ = nil
      alt1 = nil
      alt2 = nil

      tree_for_EXIT29 = nil
      tree_for_LB30 = nil
      tree_for_RB31 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 96:4: EXIT ( LB alt1= statusCode RB | alt2= statusCode )?
        __EXIT29__ = match( EXIT, TOKENS_FOLLOWING_EXIT_IN_exitInstruction_361 )

        tree_for_EXIT29 = @adaptor.create_with_payload( __EXIT29__ )
        root_0 = @adaptor.become_root( tree_for_EXIT29, root_0 )

        # at line 96:11: ( LB alt1= statusCode RB | alt2= statusCode )?
        alt_6 = 3
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == LB )
          alt_6 = 1
        elsif ( look_6_0.between?( PLUS, INT ) )
          alt_6 = 2
        end
        case alt_6
        when 1
          # at line 96:12: LB alt1= statusCode RB
          __LB30__ = match( LB, TOKENS_FOLLOWING_LB_IN_exitInstruction_366 )
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_371 )
          alt1 = statusCode
          @state.following.pop
          @adaptor.add_child( root_0, alt1.tree )
          __RB31__ = match( RB, TOKENS_FOLLOWING_RB_IN_exitInstruction_373 )
          # --> action
          return_value.result = ExitTree.new(( alt1.nil? ? nil : alt1.result ))
          # <-- action

        when 2
          # at line 97:6: alt2= statusCode
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_386 )
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
    # 100:1: statusCode returns [result] : ( PLUS | MINUS )? INT ;
    # 
    def statusCode
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = StatusCodeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS32__ = nil
      __MINUS33__ = nil
      __INT34__ = nil

      tree_for_PLUS32 = nil
      tree_for_MINUS33 = nil
      tree_for_INT34 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 101:4: ( PLUS | MINUS )? INT
        # --> action
        sign = ""
        # <-- action
        # at line 102:3: ( PLUS | MINUS )?
        alt_7 = 3
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == PLUS )
          alt_7 = 1
        elsif ( look_7_0 == MINUS )
          alt_7 = 2
        end
        case alt_7
        when 1
          # at line 102:4: PLUS
          __PLUS32__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_statusCode_411 )

          tree_for_PLUS32 = @adaptor.create_with_payload( __PLUS32__ )
          @adaptor.add_child( root_0, tree_for_PLUS32 )


        when 2
          # at line 102:11: MINUS
          __MINUS33__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_statusCode_415 )

          tree_for_MINUS33 = @adaptor.create_with_payload( __MINUS33__ )
          @adaptor.add_child( root_0, tree_for_MINUS33 )

          # --> action
          sign = __MINUS33__.text
          # <-- action

        end
        __INT34__ = match( INT, TOKENS_FOLLOWING_INT_IN_statusCode_421 )

        tree_for_INT34 = @adaptor.create_with_payload( __INT34__ )
        @adaptor.add_child( root_0, tree_for_INT34 )

        # --> action
        (sign + __INT34__.text).to_i
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
    # 106:1: printInstruction returns [result] : PRINT expression ;
    # 
    def printInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = PrintInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PRINT35__ = nil
      expression36 = nil

      tree_for_PRINT35 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 107:5: PRINT expression
        __PRINT35__ = match( PRINT, TOKENS_FOLLOWING_PRINT_IN_printInstruction_442 )

        tree_for_PRINT35 = @adaptor.create_with_payload( __PRINT35__ )
        root_0 = @adaptor.become_root( tree_for_PRINT35, root_0 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_printInstruction_445 )
        expression36 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression36.tree )
        # --> action
        return_value.result = PrintTree.new(( expression36.nil? ? nil : expression36.result ))
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
    # 110:1: printlInstruction returns [result] : ( PRINTL | PRINTLN ) expression ;
    # 
    def printlInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = PrintlInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set37 = nil
      expression38 = nil

      tree_for_set37 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 111:5: ( PRINTL | PRINTLN ) expression
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


        @state.following.push( TOKENS_FOLLOWING_expression_IN_printlInstruction_475 )
        expression38 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression38.tree )
        # --> action
        return_value.result = PrintTree.new(( expression38.nil? ? nil : expression38.result ),true)
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

    IfInstructionReturnValue = define_return_scope :result

    # 
    # parser rule ifInstruction
    # 
    # (in Giraffe.g)
    # 114:1: ifInstruction returns [result] : IF condition LCB block RCB ifRest ;
    # 
    def ifInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = IfInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __IF39__ = nil
      __LCB41__ = nil
      __RCB43__ = nil
      condition40 = nil
      block42 = nil
      ifRest44 = nil

      tree_for_IF39 = nil
      tree_for_LCB41 = nil
      tree_for_RCB43 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 115:4: IF condition LCB block RCB ifRest
        __IF39__ = match( IF, TOKENS_FOLLOWING_IF_IN_ifInstruction_496 )

        tree_for_IF39 = @adaptor.create_with_payload( __IF39__ )
        root_0 = @adaptor.become_root( tree_for_IF39, root_0 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_ifInstruction_499 )
        condition40 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition40.tree )
        __LCB41__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifInstruction_501 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_ifInstruction_504 )
        block42 = block
        @state.following.pop
        @adaptor.add_child( root_0, block42.tree )
        __RCB43__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifInstruction_506 )
        @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifInstruction_509 )
        ifRest44 = ifRest
        @state.following.pop
        @adaptor.add_child( root_0, ifRest44.tree )
        # --> action
        return_value.result = IfTree.new(( condition40.nil? ? nil : condition40.result ),( block42.nil? ? nil : block42.list ),( ifRest44.nil? ? nil : ifRest44.result ))
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

    IfRestReturnValue = define_return_scope :result

    # 
    # parser rule ifRest
    # 
    # (in Giraffe.g)
    # 119:1: ifRest returns [result] : ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | );
    # 
    def ifRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = IfRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ELSE45__ = nil
      __LCB46__ = nil
      __RCB48__ = nil
      set49 = nil
      __LCB51__ = nil
      __RCB53__ = nil
      op = nil
      block47 = nil
      condition50 = nil
      block52 = nil

      tree_for_ELSE45 = nil
      tree_for_LCB46 = nil
      tree_for_RCB48 = nil
      tree_for_set49 = nil
      tree_for_LCB51 = nil
      tree_for_RCB53 = nil

      begin
        # at line 120:2: ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | )
        alt_8 = 3
        case look_8 = @input.peek( 1 )
        when ELSE then alt_8 = 1
        when ELSEIF, ELIF then alt_8 = 2
        when EOF, RCB, COMMENT, SEMICOLON, T__54, T__55 then alt_8 = 3
        else
          raise NoViableAlternative( "", 8, 0 )
        end
        case alt_8
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 120:4: ELSE LCB block RCB
          __ELSE45__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_ifRest_528 )

          tree_for_ELSE45 = @adaptor.create_with_payload( __ELSE45__ )
          @adaptor.add_child( root_0, tree_for_ELSE45 )

          __LCB46__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_530 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_533 )
          block47 = block
          @state.following.pop
          @adaptor.add_child( root_0, block47.tree )
          __RCB48__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_535 )
          # --> action
          return_value.result = ( block47.nil? ? nil : block47.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 121:4: ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest
          set49 = @input.look
          if @input.peek( 1 ).between?( ELSEIF, ELIF )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set49 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          @state.following.push( TOKENS_FOLLOWING_condition_IN_ifRest_551 )
          condition50 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition50.tree )
          __LCB51__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_553 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_556 )
          block52 = block
          @state.following.pop
          @adaptor.add_child( root_0, block52.tree )
          __RCB53__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_558 )
          @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifRest_563 )
          op = ifRest
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = IfTree.new(( condition50.nil? ? nil : condition50.result ),( block52.nil? ? nil : block52.list ),( op.nil? ? nil : op.result ))
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 123:4: 
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
        # trace_out( __method__, 14 )

      end
      
      return return_value
    end

    WhileCycleReturnValue = define_return_scope :result

    # 
    # parser rule whileCycle
    # 
    # (in Giraffe.g)
    # 126:1: whileCycle returns [result] : WHILE condition LCB block RCB ;
    # 
    def whileCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = WhileCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WHILE54__ = nil
      __LCB56__ = nil
      __RCB58__ = nil
      condition55 = nil
      block57 = nil

      tree_for_WHILE54 = nil
      tree_for_LCB56 = nil
      tree_for_RCB58 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 127:5: WHILE condition LCB block RCB
        __WHILE54__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_whileCycle_590 )

        tree_for_WHILE54 = @adaptor.create_with_payload( __WHILE54__ )
        @adaptor.add_child( root_0, tree_for_WHILE54 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_whileCycle_592 )
        condition55 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition55.tree )
        __LCB56__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_whileCycle_594 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_whileCycle_597 )
        block57 = block
        @state.following.pop
        @adaptor.add_child( root_0, block57.tree )
        __RCB58__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_whileCycle_599 )
        # --> action
        return_value.result = WhileTree.new(( condition55.nil? ? nil : condition55.result ),( block57.nil? ? nil : block57.list ))
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

    DoCycleReturnValue = define_return_scope :result

    # 
    # parser rule doCycle
    # 
    # (in Giraffe.g)
    # 131:1: doCycle returns [result] : DO LCB block RCB WHILE condition ;
    # 
    def doCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = DoCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __DO59__ = nil
      __LCB60__ = nil
      __RCB62__ = nil
      __WHILE63__ = nil
      block61 = nil
      condition64 = nil

      tree_for_DO59 = nil
      tree_for_LCB60 = nil
      tree_for_RCB62 = nil
      tree_for_WHILE63 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 132:4: DO LCB block RCB WHILE condition
        __DO59__ = match( DO, TOKENS_FOLLOWING_DO_IN_doCycle_621 )

        tree_for_DO59 = @adaptor.create_with_payload( __DO59__ )
        @adaptor.add_child( root_0, tree_for_DO59 )

        __LCB60__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_doCycle_623 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_doCycle_626 )
        block61 = block
        @state.following.pop
        @adaptor.add_child( root_0, block61.tree )
        __RCB62__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_doCycle_628 )
        __WHILE63__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_doCycle_631 )

        tree_for_WHILE63 = @adaptor.create_with_payload( __WHILE63__ )
        @adaptor.add_child( root_0, tree_for_WHILE63 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_doCycle_633 )
        condition64 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition64.tree )
        # --> action
        return_value.result = DoTree.new(( condition64.nil? ? nil : condition64.result ),( block61.nil? ? nil : block61.list ))
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

    ForCycleReturnValue = define_return_scope :result

    # 
    # parser rule forCycle
    # 
    # (in Giraffe.g)
    # 136:1: forCycle returns [result] : FOR as1= assignment COMMA condition COMMA as2= assignment LCB block RCB ;
    # 
    def forCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = ForCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __FOR65__ = nil
      __COMMA66__ = nil
      __COMMA68__ = nil
      __LCB69__ = nil
      __RCB71__ = nil
      as1 = nil
      as2 = nil
      condition67 = nil
      block70 = nil

      tree_for_FOR65 = nil
      tree_for_COMMA66 = nil
      tree_for_COMMA68 = nil
      tree_for_LCB69 = nil
      tree_for_RCB71 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 137:4: FOR as1= assignment COMMA condition COMMA as2= assignment LCB block RCB
        __FOR65__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_forCycle_654 )

        tree_for_FOR65 = @adaptor.create_with_payload( __FOR65__ )
        @adaptor.add_child( root_0, tree_for_FOR65 )

        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_658 )
        as1 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as1.tree )
        __COMMA66__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_forCycle_660 )
        @state.following.push( TOKENS_FOLLOWING_condition_IN_forCycle_663 )
        condition67 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition67.tree )
        __COMMA68__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_forCycle_665 )
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_670 )
        as2 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as2.tree )
        __LCB69__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_forCycle_672 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_forCycle_675 )
        block70 = block
        @state.following.pop
        @adaptor.add_child( root_0, block70.tree )
        __RCB71__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_forCycle_677 )
        # --> action
        return_value.result = ForTree.new(( as1.nil? ? nil : as1.result ),( condition67.nil? ? nil : condition67.result ),( as2.nil? ? nil : as2.result ),( block70.nil? ? nil : block70.list ))
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

    FuncReturnValue = define_return_scope :result

    # 
    # parser rule func
    # 
    # (in Giraffe.g)
    # 141:1: func returns [result] : ID ( params )? LCB block RCB ;
    # 
    def func
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = FuncReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID72__ = nil
      __LCB74__ = nil
      __RCB76__ = nil
      params73 = nil
      block75 = nil

      tree_for_ID72 = nil
      tree_for_LCB74 = nil
      tree_for_RCB76 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 142:4: ID ( params )? LCB block RCB
        __ID72__ = match( ID, TOKENS_FOLLOWING_ID_IN_func_699 )

        tree_for_ID72 = @adaptor.create_with_payload( __ID72__ )
        root_0 = @adaptor.become_root( tree_for_ID72, root_0 )

        # at line 142:8: ( params )?
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == ID )
          alt_9 = 1
        end
        case alt_9
        when 1
          # at line 142:8: params
          @state.following.push( TOKENS_FOLLOWING_params_IN_func_702 )
          params73 = params
          @state.following.pop
          @adaptor.add_child( root_0, params73.tree )

        end
        __LCB74__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_705 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_func_708 )
        block75 = block
        @state.following.pop
        @adaptor.add_child( root_0, block75.tree )
        __RCB76__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_710 )
        # --> action
        return_value.result = FuncTree.new(__ID72__.text,( params73.nil? ? nil : params73.list ),( block75.nil? ? nil : block75.list ))
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

    ParamsReturnValue = define_return_scope :list

    # 
    # parser rule params
    # 
    # (in Giraffe.g)
    # 146:1: params returns [list] : ID paramRest ;
    # 
    def params
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = ParamsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID77__ = nil
      paramRest78 = nil

      tree_for_ID77 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 147:4: ID paramRest
        __ID77__ = match( ID, TOKENS_FOLLOWING_ID_IN_params_730 )

        tree_for_ID77 = @adaptor.create_with_payload( __ID77__ )
        @adaptor.add_child( root_0, tree_for_ID77 )

        @state.following.push( TOKENS_FOLLOWING_paramRest_IN_params_732 )
        paramRest78 = paramRest
        @state.following.pop
        @adaptor.add_child( root_0, paramRest78.tree )
        # --> action
        return_value.list = [__ID77__.text] + ( paramRest78.nil? ? nil : paramRest78.list )
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

    ParamRestReturnValue = define_return_scope :list

    # 
    # parser rule paramRest
    # 
    # (in Giraffe.g)
    # 151:1: paramRest returns [list] : ( COMMA params | );
    # 
    def paramRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = ParamRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA79__ = nil
      params80 = nil

      tree_for_COMMA79 = nil

      begin
        # at line 152:2: ( COMMA params | )
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


          # at line 152:4: COMMA params
          __COMMA79__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_paramRest_751 )
          @state.following.push( TOKENS_FOLLOWING_params_IN_paramRest_754 )
          params80 = params
          @state.following.pop
          @adaptor.add_child( root_0, params80.tree )
          # --> action
          return_value.list = ( params80.nil? ? nil : params80.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 154:4: 
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
        # trace_out( __method__, 20 )

      end
      
      return return_value
    end

    CallReturnValue = define_return_scope :result

    # 
    # parser rule call
    # 
    # (in Giraffe.g)
    # 157:1: call returns [result] : ID LB ( args )? RB ;
    # 
    def call
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = CallReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID81__ = nil
      __LB82__ = nil
      __RB84__ = nil
      args83 = nil

      tree_for_ID81 = nil
      tree_for_LB82 = nil
      tree_for_RB84 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 158:4: ID LB ( args )? RB
        __ID81__ = match( ID, TOKENS_FOLLOWING_ID_IN_call_781 )

        tree_for_ID81 = @adaptor.create_with_payload( __ID81__ )
        root_0 = @adaptor.become_root( tree_for_ID81, root_0 )

        __LB82__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_784 )
        # at line 158:12: ( args )?
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == READ || look_11_0 == LB || look_11_0.between?( PLUS, INT ) || look_11_0 == ID || look_11_0.between?( TO_INT, FLOAT ) || look_11_0 == T__56 || look_11_0 == T__58 )
          alt_11 = 1
        end
        case alt_11
        when 1
          # at line 158:12: args
          @state.following.push( TOKENS_FOLLOWING_args_IN_call_787 )
          args83 = args
          @state.following.pop
          @adaptor.add_child( root_0, args83.tree )

        end
        __RB84__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_790 )
        # --> action
        return_value.result = CallTree.new(__ID81__.text,( args83.nil? ? nil : args83.list ))
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
        # trace_out( __method__, 21 )

      end
      
      return return_value
    end

    ArgsReturnValue = define_return_scope :list

    # 
    # parser rule args
    # 
    # (in Giraffe.g)
    # 162:1: args returns [list] : expression argsRest ;
    # 
    def args
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ArgsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      expression85 = nil
      argsRest86 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 163:5: expression argsRest
        @state.following.push( TOKENS_FOLLOWING_expression_IN_args_812 )
        expression85 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression85.tree )
        @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_814 )
        argsRest86 = argsRest
        @state.following.pop
        @adaptor.add_child( root_0, argsRest86.tree )
        # --> action
        return_value.list = [( expression85.nil? ? nil : expression85.result )] + ( argsRest86.nil? ? nil : argsRest86.list )
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
        # trace_out( __method__, 22 )

      end
      
      return return_value
    end

    ArgsRestReturnValue = define_return_scope :list

    # 
    # parser rule argsRest
    # 
    # (in Giraffe.g)
    # 166:1: argsRest returns [list] : ( COMMA args | );
    # 
    def argsRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ArgsRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA87__ = nil
      args88 = nil

      tree_for_COMMA87 = nil

      begin
        # at line 167:2: ( COMMA args | )
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


          # at line 167:4: COMMA args
          __COMMA87__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsRest_833 )
          @state.following.push( TOKENS_FOLLOWING_args_IN_argsRest_836 )
          args88 = args
          @state.following.pop
          @adaptor.add_child( root_0, args88.tree )
          # --> action
          return_value.list = ( args88.nil? ? nil : args88.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 169:4: 
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
        # trace_out( __method__, 23 )

      end
      
      return return_value
    end

    ConditionReturnValue = define_return_scope :result

    # 
    # parser rule condition
    # 
    # (in Giraffe.g)
    # 174:1: condition returns [result] : orOperand ( OR op= condition )? ;
    # 
    def condition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = ConditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OR90__ = nil
      op = nil
      orOperand89 = nil

      tree_for_OR90 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 175:4: orOperand ( OR op= condition )?
        @state.following.push( TOKENS_FOLLOWING_orOperand_IN_condition_862 )
        orOperand89 = orOperand
        @state.following.pop
        @adaptor.add_child( root_0, orOperand89.tree )
        # --> action
        return_value.result = ( orOperand89.nil? ? nil : orOperand89.result )
        # <-- action
        # at line 176:3: ( OR op= condition )?
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == OR )
          alt_13 = 1
        end
        case alt_13
        when 1
          # at line 176:4: OR op= condition
          __OR90__ = match( OR, TOKENS_FOLLOWING_OR_IN_condition_869 )

          tree_for_OR90 = @adaptor.create_with_payload( __OR90__ )
          root_0 = @adaptor.become_root( tree_for_OR90, root_0 )

          @state.following.push( TOKENS_FOLLOWING_condition_IN_condition_874 )
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
        # trace_out( __method__, 24 )

      end
      
      return return_value
    end

    OrOperandReturnValue = define_return_scope :result

    # 
    # parser rule orOperand
    # 
    # (in Giraffe.g)
    # 181:1: orOperand returns [result] : boolOperand ( AND op= orOperand )? ;
    # 
    def orOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = OrOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __AND92__ = nil
      op = nil
      boolOperand91 = nil

      tree_for_AND92 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 182:4: boolOperand ( AND op= orOperand )?
        @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_orOperand_895 )
        boolOperand91 = boolOperand
        @state.following.pop
        @adaptor.add_child( root_0, boolOperand91.tree )
        # --> action
        return_value.result = ( boolOperand91.nil? ? nil : boolOperand91.result )
        # <-- action
        # at line 183:3: ( AND op= orOperand )?
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == AND )
          alt_14 = 1
        end
        case alt_14
        when 1
          # at line 183:4: AND op= orOperand
          __AND92__ = match( AND, TOKENS_FOLLOWING_AND_IN_orOperand_902 )

          tree_for_AND92 = @adaptor.create_with_payload( __AND92__ )
          root_0 = @adaptor.become_root( tree_for_AND92, root_0 )

          @state.following.push( TOKENS_FOLLOWING_orOperand_IN_orOperand_907 )
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
        # trace_out( __method__, 25 )

      end
      
      return return_value
    end

    BoolOperandReturnValue = define_return_scope :result

    # 
    # parser rule boolOperand
    # 
    # (in Giraffe.g)
    # 186:1: boolOperand returns [result] : ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) );
    # 
    def boolOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = BoolOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NOT94__ = nil
      __LB95__ = nil
      __RB97__ = nil
      __EQ98__ = nil
      __NE99__ = nil
      __LT100__ = nil
      __GT101__ = nil
      __LE102__ = nil
      __GE103__ = nil
      op1 = nil
      op2 = nil
      bool93 = nil
      condition96 = nil

      tree_for_NOT94 = nil
      tree_for_LB95 = nil
      tree_for_RB97 = nil
      tree_for_EQ98 = nil
      tree_for_NE99 = nil
      tree_for_LT100 = nil
      tree_for_GT101 = nil
      tree_for_LE102 = nil
      tree_for_GE103 = nil

      begin
        # at line 187:2: ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) )
        alt_22 = 3
        case look_22 = @input.peek( 1 )
        when TRUE, FALSE then alt_22 = 1
        when NOT then alt_22 = 2
        when READ, LB, PLUS, MINUS, INT, ID, TO_INT, TO_FLOAT, FLOAT, T__56, T__58 then alt_22 = 3
        else
          raise NoViableAlternative( "", 22, 0 )
        end
        case alt_22
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 187:4: bool
          @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_926 )
          bool93 = bool
          @state.following.pop
          @adaptor.add_child( root_0, bool93.tree )
          # --> action
          return_value.result = ( bool93.nil? ? nil : bool93.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 188:4: NOT LB condition RB
          __NOT94__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_boolOperand_933 )

          tree_for_NOT94 = @adaptor.create_with_payload( __NOT94__ )
          @adaptor.add_child( root_0, tree_for_NOT94 )

          __LB95__ = match( LB, TOKENS_FOLLOWING_LB_IN_boolOperand_935 )
          @state.following.push( TOKENS_FOLLOWING_condition_IN_boolOperand_938 )
          condition96 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition96.tree )
          __RB97__ = match( RB, TOKENS_FOLLOWING_RB_IN_boolOperand_940 )
          # --> action
          return_value.result = !( condition96.nil? ? nil : condition96.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 189:4: op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_950 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # at line 189:19: ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
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
            # at line 189:20: EQ (op2= bool | op2= expression )
            __EQ98__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_boolOperand_953 )

            tree_for_EQ98 = @adaptor.create_with_payload( __EQ98__ )
            root_0 = @adaptor.become_root( tree_for_EQ98, root_0 )

            # at line 189:24: (op2= bool | op2= expression )
            alt_15 = 2
            look_15_0 = @input.peek( 1 )

            if ( look_15_0.between?( TRUE, FALSE ) )
              alt_15 = 1
            elsif ( look_15_0 == READ || look_15_0 == LB || look_15_0.between?( PLUS, INT ) || look_15_0 == ID || look_15_0.between?( TO_INT, FLOAT ) || look_15_0 == T__56 || look_15_0 == T__58 )
              alt_15 = 2
            else
              raise NoViableAlternative( "", 15, 0 )
            end
            case alt_15
            when 1
              # at line 189:26: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_960 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 189:37: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_966 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:eq))
            # <-- action

          when 2
            # at line 190:6: NE (op2= bool | op2= expression )
            __NE99__ = match( NE, TOKENS_FOLLOWING_NE_IN_boolOperand_977 )

            tree_for_NE99 = @adaptor.create_with_payload( __NE99__ )
            root_0 = @adaptor.become_root( tree_for_NE99, root_0 )

            # at line 190:10: (op2= bool | op2= expression )
            alt_16 = 2
            look_16_0 = @input.peek( 1 )

            if ( look_16_0.between?( TRUE, FALSE ) )
              alt_16 = 1
            elsif ( look_16_0 == READ || look_16_0 == LB || look_16_0.between?( PLUS, INT ) || look_16_0 == ID || look_16_0.between?( TO_INT, FLOAT ) || look_16_0 == T__56 || look_16_0 == T__58 )
              alt_16 = 2
            else
              raise NoViableAlternative( "", 16, 0 )
            end
            case alt_16
            when 1
              # at line 190:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_984 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 190:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_990 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:ne))
            # <-- action

          when 3
            # at line 191:6: LT (op2= bool | op2= expression )
            __LT100__ = match( LT, TOKENS_FOLLOWING_LT_IN_boolOperand_1001 )

            tree_for_LT100 = @adaptor.create_with_payload( __LT100__ )
            root_0 = @adaptor.become_root( tree_for_LT100, root_0 )

            # at line 191:10: (op2= bool | op2= expression )
            alt_17 = 2
            look_17_0 = @input.peek( 1 )

            if ( look_17_0.between?( TRUE, FALSE ) )
              alt_17 = 1
            elsif ( look_17_0 == READ || look_17_0 == LB || look_17_0.between?( PLUS, INT ) || look_17_0 == ID || look_17_0.between?( TO_INT, FLOAT ) || look_17_0 == T__56 || look_17_0 == T__58 )
              alt_17 = 2
            else
              raise NoViableAlternative( "", 17, 0 )
            end
            case alt_17
            when 1
              # at line 191:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1008 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 191:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1014 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:lt))
            # <-- action

          when 4
            # at line 192:6: GT (op2= bool | op2= expression )
            __GT101__ = match( GT, TOKENS_FOLLOWING_GT_IN_boolOperand_1025 )

            tree_for_GT101 = @adaptor.create_with_payload( __GT101__ )
            root_0 = @adaptor.become_root( tree_for_GT101, root_0 )

            # at line 192:10: (op2= bool | op2= expression )
            alt_18 = 2
            look_18_0 = @input.peek( 1 )

            if ( look_18_0.between?( TRUE, FALSE ) )
              alt_18 = 1
            elsif ( look_18_0 == READ || look_18_0 == LB || look_18_0.between?( PLUS, INT ) || look_18_0 == ID || look_18_0.between?( TO_INT, FLOAT ) || look_18_0 == T__56 || look_18_0 == T__58 )
              alt_18 = 2
            else
              raise NoViableAlternative( "", 18, 0 )
            end
            case alt_18
            when 1
              # at line 192:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1032 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 192:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1038 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:gt))
            # <-- action

          when 5
            # at line 193:6: LE (op2= bool | op2= expression )
            __LE102__ = match( LE, TOKENS_FOLLOWING_LE_IN_boolOperand_1049 )

            tree_for_LE102 = @adaptor.create_with_payload( __LE102__ )
            root_0 = @adaptor.become_root( tree_for_LE102, root_0 )

            # at line 193:10: (op2= bool | op2= expression )
            alt_19 = 2
            look_19_0 = @input.peek( 1 )

            if ( look_19_0.between?( TRUE, FALSE ) )
              alt_19 = 1
            elsif ( look_19_0 == READ || look_19_0 == LB || look_19_0.between?( PLUS, INT ) || look_19_0 == ID || look_19_0.between?( TO_INT, FLOAT ) || look_19_0 == T__56 || look_19_0 == T__58 )
              alt_19 = 2
            else
              raise NoViableAlternative( "", 19, 0 )
            end
            case alt_19
            when 1
              # at line 193:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1056 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 193:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1062 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:le))
            # <-- action

          when 6
            # at line 194:6: GE (op2= bool | op2= expression )
            __GE103__ = match( GE, TOKENS_FOLLOWING_GE_IN_boolOperand_1073 )

            tree_for_GE103 = @adaptor.create_with_payload( __GE103__ )
            root_0 = @adaptor.become_root( tree_for_GE103, root_0 )

            # at line 194:10: (op2= bool | op2= expression )
            alt_20 = 2
            look_20_0 = @input.peek( 1 )

            if ( look_20_0.between?( TRUE, FALSE ) )
              alt_20 = 1
            elsif ( look_20_0 == READ || look_20_0 == LB || look_20_0.between?( PLUS, INT ) || look_20_0 == ID || look_20_0.between?( TO_INT, FLOAT ) || look_20_0 == T__56 || look_20_0 == T__58 )
              alt_20 = 2
            else
              raise NoViableAlternative( "", 20, 0 )
            end
            case alt_20
            when 1
              # at line 194:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1080 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 194:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1086 )
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
        # trace_out( __method__, 26 )

      end
      
      return return_value
    end

    ExpressionReturnValue = define_return_scope :result

    # 
    # parser rule expression
    # 
    # (in Giraffe.g)
    # 199:1: expression returns [result] : addOperand ( PLUS op= expression | MINUS op= expression )? ;
    # 
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS105__ = nil
      __MINUS106__ = nil
      op = nil
      addOperand104 = nil

      tree_for_PLUS105 = nil
      tree_for_MINUS106 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 200:4: addOperand ( PLUS op= expression | MINUS op= expression )?
        @state.following.push( TOKENS_FOLLOWING_addOperand_IN_expression_1111 )
        addOperand104 = addOperand
        @state.following.pop
        @adaptor.add_child( root_0, addOperand104.tree )
        # --> action
        return_value.result = ( addOperand104.nil? ? nil : addOperand104.result )
        # <-- action
        # at line 201:3: ( PLUS op= expression | MINUS op= expression )?
        alt_23 = 3
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == PLUS )
          alt_23 = 1
        elsif ( look_23_0 == MINUS )
          alt_23 = 2
        end
        case alt_23
        when 1
          # at line 202:4: PLUS op= expression
          __PLUS105__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expression_1122 )

          tree_for_PLUS105 = @adaptor.create_with_payload( __PLUS105__ )
          root_0 = @adaptor.become_root( tree_for_PLUS105, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1127 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:add))
          # <-- action

        when 2
          # at line 203:5: MINUS op= expression
          __MINUS106__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expression_1135 )

          tree_for_MINUS106 = @adaptor.create_with_payload( __MINUS106__ )
          root_0 = @adaptor.become_root( tree_for_MINUS106, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1140 )
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
        # trace_out( __method__, 27 )

      end
      
      return return_value
    end

    AddOperandReturnValue = define_return_scope :result

    # 
    # parser rule addOperand
    # 
    # (in Giraffe.g)
    # 207:1: addOperand returns [result] : mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )? ;
    # 
    def addOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = AddOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __MUL108__ = nil
      __DIV109__ = nil
      __MOD110__ = nil
      op = nil
      mulOperand107 = nil

      tree_for_MUL108 = nil
      tree_for_DIV109 = nil
      tree_for_MOD110 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 208:4: mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperand_1162 )
        mulOperand107 = mulOperand
        @state.following.pop
        @adaptor.add_child( root_0, mulOperand107.tree )
        # --> action
        return_value.result = ( mulOperand107.nil? ? nil : mulOperand107.result )
        # <-- action
        # at line 209:3: ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        alt_24 = 4
        case look_24 = @input.peek( 1 )
        when MUL then alt_24 = 1
        when DIV then alt_24 = 2
        when MOD then alt_24 = 3
        end
        case alt_24
        when 1
          # at line 210:4: MUL op= addOperand
          __MUL108__ = match( MUL, TOKENS_FOLLOWING_MUL_IN_addOperand_1173 )

          tree_for_MUL108 = @adaptor.create_with_payload( __MUL108__ )
          root_0 = @adaptor.become_root( tree_for_MUL108, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1178 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:mul))
          # <-- action

        when 2
          # at line 211:5: DIV op= addOperand
          __DIV109__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_addOperand_1186 )

          tree_for_DIV109 = @adaptor.create_with_payload( __DIV109__ )
          root_0 = @adaptor.become_root( tree_for_DIV109, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1191 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:div))
          # <-- action

        when 3
          # at line 212:5: MOD op= addOperand
          __MOD110__ = match( MOD, TOKENS_FOLLOWING_MOD_IN_addOperand_1199 )

          tree_for_MOD110 = @adaptor.create_with_payload( __MOD110__ )
          root_0 = @adaptor.become_root( tree_for_MOD110, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1204 )
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
        # trace_out( __method__, 28 )

      end
      
      return return_value
    end

    MulOperandReturnValue = define_return_scope :result

    # 
    # parser rule mulOperand
    # 
    # (in Giraffe.g)
    # 216:1: mulOperand returns [result] : ( PLUS mulOperandRest | MINUS mulOperandRest | TO_INT mulOperandRest | TO_FLOAT mulOperandRest | mulOperandRest );
    # 
    def mulOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = MulOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS111__ = nil
      __MINUS113__ = nil
      __TO_INT115__ = nil
      __TO_FLOAT117__ = nil
      mulOperandRest112 = nil
      mulOperandRest114 = nil
      mulOperandRest116 = nil
      mulOperandRest118 = nil
      mulOperandRest119 = nil

      tree_for_PLUS111 = nil
      tree_for_MINUS113 = nil
      tree_for_TO_INT115 = nil
      tree_for_TO_FLOAT117 = nil

      begin
        # at line 217:2: ( PLUS mulOperandRest | MINUS mulOperandRest | TO_INT mulOperandRest | TO_FLOAT mulOperandRest | mulOperandRest )
        alt_25 = 5
        case look_25 = @input.peek( 1 )
        when PLUS then alt_25 = 1
        when MINUS then alt_25 = 2
        when TO_INT then alt_25 = 3
        when TO_FLOAT then alt_25 = 4
        when READ, LB, INT, ID, FLOAT, T__56, T__58 then alt_25 = 5
        else
          raise NoViableAlternative( "", 25, 0 )
        end
        case alt_25
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 217:4: PLUS mulOperandRest
          __PLUS111__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_mulOperand_1226 )

          tree_for_PLUS111 = @adaptor.create_with_payload( __PLUS111__ )
          @adaptor.add_child( root_0, tree_for_PLUS111 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1228 )
          mulOperandRest112 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest112.tree )
          # --> action
          return_value.result = ( mulOperandRest112.nil? ? nil : mulOperandRest112.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 218:4: MINUS mulOperandRest
          __MINUS113__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_mulOperand_1235 )

          tree_for_MINUS113 = @adaptor.create_with_payload( __MINUS113__ )
          @adaptor.add_child( root_0, tree_for_MINUS113 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1237 )
          mulOperandRest114 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest114.tree )
          # --> action
          return_value.result = UnaryOperatorTree.new(( mulOperandRest114.nil? ? nil : mulOperandRest114.result ),Operators.method(:neg))
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 219:4: TO_INT mulOperandRest
          __TO_INT115__ = match( TO_INT, TOKENS_FOLLOWING_TO_INT_IN_mulOperand_1244 )

          tree_for_TO_INT115 = @adaptor.create_with_payload( __TO_INT115__ )
          @adaptor.add_child( root_0, tree_for_TO_INT115 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1246 )
          mulOperandRest116 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest116.tree )
          # --> action
          return_value.result = UnaryOperatorTree.new(( mulOperandRest116.nil? ? nil : mulOperandRest116.result ),Operators.method(:int))
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 220:4: TO_FLOAT mulOperandRest
          __TO_FLOAT117__ = match( TO_FLOAT, TOKENS_FOLLOWING_TO_FLOAT_IN_mulOperand_1253 )

          tree_for_TO_FLOAT117 = @adaptor.create_with_payload( __TO_FLOAT117__ )
          @adaptor.add_child( root_0, tree_for_TO_FLOAT117 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1255 )
          mulOperandRest118 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest118.tree )
          # --> action
          return_value.result = UnaryOperatorTree.new(( mulOperandRest118.nil? ? nil : mulOperandRest118.result ),Operators.method(:float))
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 221:4: mulOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1262 )
          mulOperandRest119 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest119.tree )
          # --> action
          return_value.result = ( mulOperandRest119.nil? ? nil : mulOperandRest119.result )
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

    MulOperandRestReturnValue = define_return_scope :result

    # 
    # parser rule mulOperandRest
    # 
    # (in Giraffe.g)
    # 224:1: mulOperandRest returns [result] : arrayIndexTarget ( '[' expression ']' )* ;
    # 
    def mulOperandRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = MulOperandRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal121 = nil
      char_literal123 = nil
      arrayIndexTarget120 = nil
      expression122 = nil

      tree_for_char_literal121 = nil
      tree_for_char_literal123 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 225:4: arrayIndexTarget ( '[' expression ']' )*
        @state.following.push( TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1279 )
        arrayIndexTarget120 = arrayIndexTarget
        @state.following.pop
        @adaptor.add_child( root_0, arrayIndexTarget120.tree )
        # --> action
        return_value.result = ( arrayIndexTarget120.nil? ? nil : arrayIndexTarget120.result )
        # <-- action
        # at line 226:3: ( '[' expression ']' )*
        while true # decision 26
          alt_26 = 2
          look_26_0 = @input.peek( 1 )

          if ( look_26_0 == T__56 )
            alt_26 = 1

          end
          case alt_26
          when 1
            # at line 226:4: '[' expression ']'
            char_literal121 = match( T__56, TOKENS_FOLLOWING_T__56_IN_mulOperandRest_1287 )

            tree_for_char_literal121 = @adaptor.create_with_payload( char_literal121 )
            @adaptor.add_child( root_0, tree_for_char_literal121 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_mulOperandRest_1289 )
            expression122 = expression
            @state.following.pop
            @adaptor.add_child( root_0, expression122.tree )
            char_literal123 = match( T__57, TOKENS_FOLLOWING_T__57_IN_mulOperandRest_1291 )

            tree_for_char_literal123 = @adaptor.create_with_payload( char_literal123 )
            @adaptor.add_child( root_0, tree_for_char_literal123 )

            # --> action
            return_value.result = IndexTree.new(return_value.result,( expression122.nil? ? nil : expression122.result ))
            # <-- action

          else
            break # out of loop for decision 26
          end
        end # loop for decision 26
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
        # trace_out( __method__, 30 )

      end
      
      return return_value
    end

    ArrayIndexTargetReturnValue = define_return_scope :result

    # 
    # parser rule arrayIndexTarget
    # 
    # (in Giraffe.g)
    # 231:1: arrayIndexTarget returns [result] : ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction );
    # 
    def arrayIndexTarget
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = ArrayIndexTargetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID124__ = nil
      __LB125__ = nil
      __RB127__ = nil
      __INT128__ = nil
      __FLOAT129__ = nil
      expression126 = nil
      string130 = nil
      call131 = nil
      array132 = nil
      readInstruction133 = nil

      tree_for_ID124 = nil
      tree_for_LB125 = nil
      tree_for_RB127 = nil
      tree_for_INT128 = nil
      tree_for_FLOAT129 = nil

      begin
        # at line 232:2: ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction )
        alt_27 = 8
        alt_27 = @dfa27.predict( @input )
        case alt_27
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 232:4: ID
          __ID124__ = match( ID, TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1318 )

          tree_for_ID124 = @adaptor.create_with_payload( __ID124__ )
          @adaptor.add_child( root_0, tree_for_ID124 )

          # --> action
          return_value.result = VarTree.new(__ID124__.text)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 233:4: LB expression RB
          __LB125__ = match( LB, TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1325 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1328 )
          expression126 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression126.tree )
          __RB127__ = match( RB, TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1330 )
          # --> action
          return_value.result = ( expression126.nil? ? nil : expression126.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 234:4: INT
          __INT128__ = match( INT, TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1338 )

          tree_for_INT128 = @adaptor.create_with_payload( __INT128__ )
          @adaptor.add_child( root_0, tree_for_INT128 )

          # --> action
          return_value.result = AtomTree.new(__INT128__.text.to_i)
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 235:4: FLOAT
          __FLOAT129__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_arrayIndexTarget_1345 )

          tree_for_FLOAT129 = @adaptor.create_with_payload( __FLOAT129__ )
          @adaptor.add_child( root_0, tree_for_FLOAT129 )

          # --> action
          return_value.result = AtomTree.new(__FLOAT129__.text.to_f)
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 236:4: string
          @state.following.push( TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1352 )
          string130 = string
          @state.following.pop
          @adaptor.add_child( root_0, string130.tree )
          # --> action
          return_value.result = AtomTree.new(( string130.nil? ? nil : string130.result ))
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 237:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1359 )
          call131 = call
          @state.following.pop
          @adaptor.add_child( root_0, call131.tree )
          # --> action
          return_value.result = ( call131.nil? ? nil : call131.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 238:4: array
          @state.following.push( TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1366 )
          array132 = array
          @state.following.pop
          @adaptor.add_child( root_0, array132.tree )
          # --> action
          return_value.result = ArrayTree.new(( array132.nil? ? nil : array132.result ))
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 239:4: readInstruction
          @state.following.push( TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1373 )
          readInstruction133 = readInstruction
          @state.following.pop
          @adaptor.add_child( root_0, readInstruction133.tree )
          # --> action
          return_value.result = ( readInstruction133.nil? ? nil : readInstruction133.result )
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
        # trace_out( __method__, 31 )

      end
      
      return return_value
    end

    ArrayReturnValue = define_return_scope :result

    # 
    # parser rule array
    # 
    # (in Giraffe.g)
    # 242:1: array returns [result] : '[' (ex1= expression ( COMMA ex2= expression )* )? ']' ;
    # 
    def array
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = ArrayReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal134 = nil
      __COMMA135__ = nil
      char_literal136 = nil
      ex1 = nil
      ex2 = nil

      tree_for_char_literal134 = nil
      tree_for_COMMA135 = nil
      tree_for_char_literal136 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 243:4: '[' (ex1= expression ( COMMA ex2= expression )* )? ']'
        char_literal134 = match( T__56, TOKENS_FOLLOWING_T__56_IN_array_1390 )

        tree_for_char_literal134 = @adaptor.create_with_payload( char_literal134 )
        @adaptor.add_child( root_0, tree_for_char_literal134 )

        # --> action
        return_value.result = []
        # <-- action
        # at line 244:3: (ex1= expression ( COMMA ex2= expression )* )?
        alt_29 = 2
        look_29_0 = @input.peek( 1 )

        if ( look_29_0 == READ || look_29_0 == LB || look_29_0.between?( PLUS, INT ) || look_29_0 == ID || look_29_0.between?( TO_INT, FLOAT ) || look_29_0 == T__56 || look_29_0 == T__58 )
          alt_29 = 1
        end
        case alt_29
        when 1
          # at line 244:4: ex1= expression ( COMMA ex2= expression )*
          @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1399 )
          ex1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, ex1.tree )
          # --> action
          return_value.result << ( ex1.nil? ? nil : ex1.result )
          # <-- action
          # at line 245:3: ( COMMA ex2= expression )*
          while true # decision 28
            alt_28 = 2
            look_28_0 = @input.peek( 1 )

            if ( look_28_0 == COMMA )
              alt_28 = 1

            end
            case alt_28
            when 1
              # at line 245:4: COMMA ex2= expression
              __COMMA135__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_array_1406 )

              tree_for_COMMA135 = @adaptor.create_with_payload( __COMMA135__ )
              @adaptor.add_child( root_0, tree_for_COMMA135 )

              @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1410 )
              ex2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, ex2.tree )
              # --> action
              return_value.result << ( ex2.nil? ? nil : ex2.result )
              # <-- action

            else
              break # out of loop for decision 28
            end
          end # loop for decision 28

        end
        char_literal136 = match( T__57, TOKENS_FOLLOWING_T__57_IN_array_1421 )

        tree_for_char_literal136 = @adaptor.create_with_payload( char_literal136 )
        @adaptor.add_child( root_0, tree_for_char_literal136 )

        # --> action
        puts "array: #{return_value.result}"
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
        # trace_out( __method__, 32 )

      end
      
      return return_value
    end

    AssignmentReturnValue = define_return_scope :result

    # 
    # parser rule assignment
    # 
    # (in Giraffe.g)
    # 251:1: assignment returns [result] : ID ( ASSIGN op1= expression | ( '[' index= expression ']' )+ ASSIGN op2= expression ) ;
    # 
    def assignment
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = AssignmentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID137__ = nil
      __ASSIGN138__ = nil
      char_literal139 = nil
      char_literal140 = nil
      __ASSIGN141__ = nil
      op1 = nil
      index = nil
      op2 = nil

      tree_for_ID137 = nil
      tree_for_ASSIGN138 = nil
      tree_for_char_literal139 = nil
      tree_for_char_literal140 = nil
      tree_for_ASSIGN141 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 252:4: ID ( ASSIGN op1= expression | ( '[' index= expression ']' )+ ASSIGN op2= expression )
        __ID137__ = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1442 )

        tree_for_ID137 = @adaptor.create_with_payload( __ID137__ )
        @adaptor.add_child( root_0, tree_for_ID137 )

        # at line 253:3: ( ASSIGN op1= expression | ( '[' index= expression ']' )+ ASSIGN op2= expression )
        alt_31 = 2
        look_31_0 = @input.peek( 1 )

        if ( look_31_0 == ASSIGN )
          alt_31 = 1
        elsif ( look_31_0 == T__56 )
          alt_31 = 2
        else
          raise NoViableAlternative( "", 31, 0 )
        end
        case alt_31
        when 1
          # at line 253:5: ASSIGN op1= expression
          __ASSIGN138__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1449 )

          tree_for_ASSIGN138 = @adaptor.create_with_payload( __ASSIGN138__ )
          root_0 = @adaptor.become_root( tree_for_ASSIGN138, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1454 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # --> action
           return_value.result = AssignTree.new(__ID137__.text,( op1.nil? ? nil : op1.result )) 
          # <-- action

        when 2
          # at line 254:5: ( '[' index= expression ']' )+ ASSIGN op2= expression
          # --> action
          target = VarTree.new(__ID137__.text); index=nil
          # <-- action
          # at file 255:4: ( '[' index= expression ']' )+
          match_count_30 = 0
          while true
            alt_30 = 2
            look_30_0 = @input.peek( 1 )

            if ( look_30_0 == T__56 )
              alt_30 = 1

            end
            case alt_30
            when 1
              # at line 255:5: '[' index= expression ']'
              # --> action
              index_ = index
              # <-- action
              char_literal139 = match( T__56, TOKENS_FOLLOWING_T__56_IN_assignment_1471 )

              tree_for_char_literal139 = @adaptor.create_with_payload( char_literal139 )
              @adaptor.add_child( root_0, tree_for_char_literal139 )

              @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1475 )
              index = expression
              @state.following.pop
              @adaptor.add_child( root_0, index.tree )
              char_literal140 = match( T__57, TOKENS_FOLLOWING_T__57_IN_assignment_1477 )

              tree_for_char_literal140 = @adaptor.create_with_payload( char_literal140 )
              @adaptor.add_child( root_0, tree_for_char_literal140 )

              # --> action
              target_ = target; target = IndexTree.new(target,( index.nil? ? nil : index.result ))
              # <-- action

            else
              match_count_30 > 0 and break
              eee = EarlyExit(30)


              raise eee
            end
            match_count_30 += 1
          end

          __ASSIGN141__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1488 )

          tree_for_ASSIGN141 = @adaptor.create_with_payload( __ASSIGN141__ )
          root_0 = @adaptor.become_root( tree_for_ASSIGN141, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1493 )
          op2 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op2.tree )
          # --> action
           if index_ == nil # byl tady jen jeden index
          				return_value.result = DerefTree.new(target_,( index.nil? ? nil : index.result ),( op2.nil? ? nil : op2.result ))
          			  else # vrat stare indexy a target
          			  	return_value.result = DerefTree.new(IndexTree.new(target_,$index_.result),( index.nil? ? nil : index.result ),( op2.nil? ? nil : op2.result ))
          			  end  
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
        # trace_out( __method__, 33 )

      end
      
      return return_value
    end

    BoolReturnValue = define_return_scope :result

    # 
    # parser rule bool
    # 
    # (in Giraffe.g)
    # 265:1: bool returns [result] : ( TRUE | FALSE );
    # 
    def bool
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = BoolReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __TRUE142__ = nil
      __FALSE143__ = nil

      tree_for_TRUE142 = nil
      tree_for_FALSE143 = nil

      begin
        # at line 266:2: ( TRUE | FALSE )
        alt_32 = 2
        look_32_0 = @input.peek( 1 )

        if ( look_32_0 == TRUE )
          alt_32 = 1
        elsif ( look_32_0 == FALSE )
          alt_32 = 2
        else
          raise NoViableAlternative( "", 32, 0 )
        end
        case alt_32
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 266:4: TRUE
          __TRUE142__ = match( TRUE, TOKENS_FOLLOWING_TRUE_IN_bool_1526 )

          tree_for_TRUE142 = @adaptor.create_with_payload( __TRUE142__ )
          @adaptor.add_child( root_0, tree_for_TRUE142 )

          # --> action
          return_value.result = AtomTree.new(true)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 267:5: FALSE
          __FALSE143__ = match( FALSE, TOKENS_FOLLOWING_FALSE_IN_bool_1534 )

          tree_for_FALSE143 = @adaptor.create_with_payload( __FALSE143__ )
          @adaptor.add_child( root_0, tree_for_FALSE143 )

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
        # trace_out( __method__, 34 )

      end
      
      return return_value
    end

    StringReturnValue = define_return_scope :result

    # 
    # parser rule string
    # 
    # (in Giraffe.g)
    # 270:1: string returns [result] : '\"' innerString '\"' ;
    # 
    def string
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = StringReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal144 = nil
      char_literal146 = nil
      innerString145 = nil

      tree_for_char_literal144 = nil
      tree_for_char_literal146 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 271:4: '\"' innerString '\"'
        char_literal144 = match( T__58, TOKENS_FOLLOWING_T__58_IN_string_1551 )

        tree_for_char_literal144 = @adaptor.create_with_payload( char_literal144 )
        @adaptor.add_child( root_0, tree_for_char_literal144 )

        @state.following.push( TOKENS_FOLLOWING_innerString_IN_string_1553 )
        innerString145 = innerString
        @state.following.pop
        @adaptor.add_child( root_0, innerString145.tree )
        char_literal146 = match( T__58, TOKENS_FOLLOWING_T__58_IN_string_1555 )

        tree_for_char_literal146 = @adaptor.create_with_payload( char_literal146 )
        @adaptor.add_child( root_0, tree_for_char_literal146 )

        # --> action
        return_value.result = ( innerString145.nil? ? nil : innerString145.result )
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
        # trace_out( __method__, 35 )

      end
      
      return return_value
    end

    InnerStringReturnValue = define_return_scope :result

    # 
    # parser rule innerString
    # 
    # (in Giraffe.g)
    # 274:1: innerString returns [result] : (esc= ESC_SEQ in1= innerString | normal=~ ( ESC_SEQ | '\"' ) in2= innerString | );
    # 
    def innerString
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = InnerStringReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      esc = nil
      normal = nil
      in1 = nil
      in2 = nil

      tree_for_esc = nil
      tree_for_normal = nil

      begin
        # at line 275:2: (esc= ESC_SEQ in1= innerString | normal=~ ( ESC_SEQ | '\"' ) in2= innerString | )
        alt_33 = 3
        case look_33 = @input.peek( 1 )
        when ESC_SEQ then alt_33 = 1
        when LCB, RCB, COMMENT, SEMICOLON, READ, BREAK, RETURN, EXIT, LB, RB, PLUS, MINUS, INT, PRINT, PRINTL, PRINTLN, IF, ELSE, ELSEIF, ELIF, WHILE, DO, FOR, COMMA, ID, OR, AND, NOT, EQ, NE, LT, GT, LE, GE, MUL, DIV, MOD, TO_INT, TO_FLOAT, FLOAT, ASSIGN, TRUE, FALSE, HEX_DIGIT, UNICODE_ESC, OCTAL_ESC, EXPONENT, WS, COLON, T__54, T__55, T__56, T__57 then alt_33 = 2
        when T__58 then alt_33 = 3
        else
          raise NoViableAlternative( "", 33, 0 )
        end
        case alt_33
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 275:4: esc= ESC_SEQ in1= innerString
          esc = match( ESC_SEQ, TOKENS_FOLLOWING_ESC_SEQ_IN_innerString_1574 )

          tree_for_esc = @adaptor.create_with_payload( esc )
          @adaptor.add_child( root_0, tree_for_esc )

          @state.following.push( TOKENS_FOLLOWING_innerString_IN_innerString_1578 )
          in1 = innerString
          @state.following.pop
          @adaptor.add_child( root_0, in1.tree )
          # --> action
          return_value.result = esc.text + ( in1.nil? ? nil : in1.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 276:4: normal=~ ( ESC_SEQ | '\"' ) in2= innerString
          normal = @input.look
          if @input.peek( 1 ).between?( LCB, FALSE ) || @input.peek( 1 ).between?( HEX_DIGIT, T__57 )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( normal ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          @state.following.push( TOKENS_FOLLOWING_innerString_IN_innerString_1598 )
          in2 = innerString
          @state.following.pop
          @adaptor.add_child( root_0, in2.tree )
          # --> action
          return_value.result = normal.text + ( in2.nil? ? nil : in2.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 277:4: 
          # --> action
          return_value.result = ""
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



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA5 < ANTLR3::DFA
      EOT = unpack( 16, -1 )
      EOF = unpack( 1, 12, 15, -1 )
      MIN = unpack( 2, 4, 14, -1 )
      MAX = unpack( 1, 55, 1, 56, 14, -1 )
      ACCEPT = unpack( 2, -1, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 
                       1, 10, 1, 11, 1, 12, 1, 14, 1, 13, 1, 1, 1, 2 )
      SPECIAL = unpack( 16, -1 )
      TRANSITION = [
        unpack( 1, 2, 3, 12, 1, -1, 1, 11, 1, 9, 1, 10, 5, -1, 1, 7, 2, 
                8, 1, 4, 3, -1, 1, 5, 1, 6, 1, 3, 1, -1, 1, 1, 25, -1, 2, 
                12 ),
        unpack( 1, 15, 7, -1, 1, 13, 15, -1, 1, 15, 15, -1, 1, 14, 11, 
                 -1, 1, 14 ),
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
          65:1: instruction returns [result] : ( assignment | func | env | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | );
        __dfa_description__
      end
    end
    class DFA27 < ANTLR3::DFA
      EOT = unpack( 10, -1 )
      EOF = unpack( 1, -1, 1, 9, 8, -1 )
      MIN = unpack( 1, 8, 1, 4, 8, -1 )
      MAX = unpack( 1, 58, 1, 57, 8, -1 )
      ACCEPT = unpack( 2, -1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 7, 1, 8, 1, 6, 
                       1, 1 )
      SPECIAL = unpack( 10, -1 )
      TRANSITION = [
        unpack( 1, 7, 3, -1, 1, 2, 3, -1, 1, 3, 11, -1, 1, 1, 14, -1, 1, 
                4, 12, -1, 1, 6, 1, -1, 1, 5 ),
        unpack( 4, 9, 4, -1, 1, 8, 3, 9, 11, -1, 1, 9, 1, -1, 2, 9, 1, 
                 -1, 9, 9, 13, -1, 4, 9 ),
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
      
      @decision = 27
      

      def description
        <<-'__dfa_description__'.strip!
          231:1: arrayIndexTarget returns [result] : ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa5 = DFA5.new( self, 5 )
      @dfa27 = DFA27.new( self, 27 )

    end
    TOKENS_FOLLOWING_block_IN_program_49 = Set[ 1 ]
    TOKENS_FOLLOWING_LCB_IN_env_64 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 20, 24, 25, 26, 28, 54, 55 ]
    TOKENS_FOLLOWING_block_IN_env_70 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_env_76 = Set[ 1 ]
    TOKENS_FOLLOWING_instruction_IN_block_96 = Set[ 6, 7, 54, 55 ]
    TOKENS_FOLLOWING_instructionRest_IN_block_106 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_instructionRest_136 = Set[ 54, 55 ]
    TOKENS_FOLLOWING_T__54_IN_instructionRest_140 = Set[ 55 ]
    TOKENS_FOLLOWING_T__55_IN_instructionRest_144 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 20, 24, 25, 26, 28, 54, 55 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_150 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 20, 24, 25, 26, 28, 54, 55 ]
    TOKENS_FOLLOWING_instruction_IN_instructionRest_157 = Set[ 6, 7, 54, 55 ]
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
    TOKENS_FOLLOWING_call_IN_instruction_284 = Set[ 1 ]
    TOKENS_FOLLOWING_READ_IN_readInstruction_307 = Set[ 1 ]
    TOKENS_FOLLOWING_BREAK_IN_breakInstruction_324 = Set[ 1 ]
    TOKENS_FOLLOWING_RETURN_IN_returnInstruction_341 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_expression_IN_returnInstruction_344 = Set[ 1 ]
    TOKENS_FOLLOWING_EXIT_IN_exitInstruction_361 = Set[ 1, 12, 14, 15, 16 ]
    TOKENS_FOLLOWING_LB_IN_exitInstruction_366 = Set[ 14, 15, 16 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_371 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_exitInstruction_373 = Set[ 1 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_386 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_statusCode_411 = Set[ 16 ]
    TOKENS_FOLLOWING_MINUS_IN_statusCode_415 = Set[ 16 ]
    TOKENS_FOLLOWING_INT_IN_statusCode_421 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINT_IN_printInstruction_442 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_expression_IN_printInstruction_445 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_printlInstruction_466 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_expression_IN_printlInstruction_475 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_ifInstruction_496 = Set[ 8, 12, 14, 15, 16, 28, 31, 41, 42, 43, 45, 46, 56, 58 ]
    TOKENS_FOLLOWING_condition_IN_ifInstruction_499 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_ifInstruction_501 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 20, 24, 25, 26, 28, 54, 55 ]
    TOKENS_FOLLOWING_block_IN_ifInstruction_504 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_ifInstruction_506 = Set[ 21, 22, 23 ]
    TOKENS_FOLLOWING_ifRest_IN_ifInstruction_509 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_ifRest_528 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_530 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 20, 24, 25, 26, 28, 54, 55 ]
    TOKENS_FOLLOWING_block_IN_ifRest_533 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_535 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_ifRest_543 = Set[ 8, 12, 14, 15, 16, 28, 31, 41, 42, 43, 45, 46, 56, 58 ]
    TOKENS_FOLLOWING_condition_IN_ifRest_551 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_553 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 20, 24, 25, 26, 28, 54, 55 ]
    TOKENS_FOLLOWING_block_IN_ifRest_556 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_558 = Set[ 21, 22, 23 ]
    TOKENS_FOLLOWING_ifRest_IN_ifRest_563 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_whileCycle_590 = Set[ 8, 12, 14, 15, 16, 28, 31, 41, 42, 43, 45, 46, 56, 58 ]
    TOKENS_FOLLOWING_condition_IN_whileCycle_592 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_whileCycle_594 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 20, 24, 25, 26, 28, 54, 55 ]
    TOKENS_FOLLOWING_block_IN_whileCycle_597 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_whileCycle_599 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_doCycle_621 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_doCycle_623 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 20, 24, 25, 26, 28, 54, 55 ]
    TOKENS_FOLLOWING_block_IN_doCycle_626 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_doCycle_628 = Set[ 24 ]
    TOKENS_FOLLOWING_WHILE_IN_doCycle_631 = Set[ 8, 12, 14, 15, 16, 28, 31, 41, 42, 43, 45, 46, 56, 58 ]
    TOKENS_FOLLOWING_condition_IN_doCycle_633 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_forCycle_654 = Set[ 28 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_658 = Set[ 27 ]
    TOKENS_FOLLOWING_COMMA_IN_forCycle_660 = Set[ 8, 12, 14, 15, 16, 28, 31, 41, 42, 43, 45, 46, 56, 58 ]
    TOKENS_FOLLOWING_condition_IN_forCycle_663 = Set[ 27 ]
    TOKENS_FOLLOWING_COMMA_IN_forCycle_665 = Set[ 28 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_670 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_forCycle_672 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 20, 24, 25, 26, 28, 54, 55 ]
    TOKENS_FOLLOWING_block_IN_forCycle_675 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_forCycle_677 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_func_699 = Set[ 4, 28 ]
    TOKENS_FOLLOWING_params_IN_func_702 = Set[ 4 ]
    TOKENS_FOLLOWING_LCB_IN_func_705 = Set[ 4, 6, 7, 9, 10, 11, 17, 18, 19, 20, 24, 25, 26, 28, 54, 55 ]
    TOKENS_FOLLOWING_block_IN_func_708 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_func_710 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_params_730 = Set[ 27 ]
    TOKENS_FOLLOWING_paramRest_IN_params_732 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_paramRest_751 = Set[ 28 ]
    TOKENS_FOLLOWING_params_IN_paramRest_754 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_call_781 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_call_784 = Set[ 8, 12, 13, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_args_IN_call_787 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_call_790 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_args_812 = Set[ 27 ]
    TOKENS_FOLLOWING_argsRest_IN_args_814 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsRest_833 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_args_IN_argsRest_836 = Set[ 1 ]
    TOKENS_FOLLOWING_orOperand_IN_condition_862 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_OR_IN_condition_869 = Set[ 8, 12, 14, 15, 16, 28, 31, 41, 42, 43, 45, 46, 56, 58 ]
    TOKENS_FOLLOWING_condition_IN_condition_874 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperand_IN_orOperand_895 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_AND_IN_orOperand_902 = Set[ 8, 12, 14, 15, 16, 28, 31, 41, 42, 43, 45, 46, 56, 58 ]
    TOKENS_FOLLOWING_orOperand_IN_orOperand_907 = Set[ 1 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_926 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_boolOperand_933 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_boolOperand_935 = Set[ 8, 12, 14, 15, 16, 28, 31, 41, 42, 43, 45, 46, 56, 58 ]
    TOKENS_FOLLOWING_condition_IN_boolOperand_938 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_boolOperand_940 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_950 = Set[ 32, 33, 34, 35, 36, 37 ]
    TOKENS_FOLLOWING_EQ_IN_boolOperand_953 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 45, 46, 56, 58 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_960 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_966 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_boolOperand_977 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 45, 46, 56, 58 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_984 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_990 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_boolOperand_1001 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 45, 46, 56, 58 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1008 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1014 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_boolOperand_1025 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 45, 46, 56, 58 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1032 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1038 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_boolOperand_1049 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 45, 46, 56, 58 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1056 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1062 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_boolOperand_1073 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 45, 46, 56, 58 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1080 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1086 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperand_IN_expression_1111 = Set[ 1, 14, 15 ]
    TOKENS_FOLLOWING_PLUS_IN_expression_1122 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_expression_IN_expression_1127 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expression_1135 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_expression_IN_expression_1140 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperand_1162 = Set[ 1, 38, 39, 40 ]
    TOKENS_FOLLOWING_MUL_IN_addOperand_1173 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1178 = Set[ 1 ]
    TOKENS_FOLLOWING_DIV_IN_addOperand_1186 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1191 = Set[ 1 ]
    TOKENS_FOLLOWING_MOD_IN_addOperand_1199 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1204 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_mulOperand_1226 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1228 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_mulOperand_1235 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1237 = Set[ 1 ]
    TOKENS_FOLLOWING_TO_INT_IN_mulOperand_1244 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1246 = Set[ 1 ]
    TOKENS_FOLLOWING_TO_FLOAT_IN_mulOperand_1253 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1255 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1262 = Set[ 1 ]
    TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1279 = Set[ 1, 56 ]
    TOKENS_FOLLOWING_T__56_IN_mulOperandRest_1287 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_expression_IN_mulOperandRest_1289 = Set[ 57 ]
    TOKENS_FOLLOWING_T__57_IN_mulOperandRest_1291 = Set[ 1, 56 ]
    TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1318 = Set[ 1 ]
    TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1325 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1328 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1330 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1338 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_arrayIndexTarget_1345 = Set[ 1 ]
    TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1352 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1359 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1366 = Set[ 1 ]
    TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1373 = Set[ 1 ]
    TOKENS_FOLLOWING_T__56_IN_array_1390 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 57, 58 ]
    TOKENS_FOLLOWING_expression_IN_array_1399 = Set[ 27, 57 ]
    TOKENS_FOLLOWING_COMMA_IN_array_1406 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_expression_IN_array_1410 = Set[ 27, 57 ]
    TOKENS_FOLLOWING_T__57_IN_array_1421 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1442 = Set[ 44, 56 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1449 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1454 = Set[ 1 ]
    TOKENS_FOLLOWING_T__56_IN_assignment_1471 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1475 = Set[ 57 ]
    TOKENS_FOLLOWING_T__57_IN_assignment_1477 = Set[ 44, 56 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1488 = Set[ 8, 12, 14, 15, 16, 28, 41, 42, 43, 56, 58 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1493 = Set[ 1 ]
    TOKENS_FOLLOWING_TRUE_IN_bool_1526 = Set[ 1 ]
    TOKENS_FOLLOWING_FALSE_IN_bool_1534 = Set[ 1 ]
    TOKENS_FOLLOWING_T__58_IN_string_1551 = Set[ 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58 ]
    TOKENS_FOLLOWING_innerString_IN_string_1553 = Set[ 58 ]
    TOKENS_FOLLOWING_T__58_IN_string_1555 = Set[ 1 ]
    TOKENS_FOLLOWING_ESC_SEQ_IN_innerString_1574 = Set[ 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57 ]
    TOKENS_FOLLOWING_innerString_IN_innerString_1578 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_innerString_1587 = Set[ 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57 ]
    TOKENS_FOLLOWING_innerString_IN_innerString_1598 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end


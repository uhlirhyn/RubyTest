#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-11-20 19:18:49
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
                   :T__65 => 65, :T__62 => 62, :RB => 11, :T__63 => 63, 
                   :WHILE => 25, :MOD => 41, :OCTAL_ESC => 55, :NEW => 45, 
                   :DO => 26, :FOR => 27, :FLOAT => 44, :NOT => 32, :RCB => 21, 
                   :ID => 28, :AND => 31, :EOF => -1, :TO_INT => 42, :BREAK => 7, 
                   :IF => 19, :TO_FLOAT => 43, :QUOTE => 59, :ESC_SEQ => 50, 
                   :CONTINUE => 56, :QM => 61, :COMMA => 18, :LCB => 20, 
                   :PRINTLN => 17, :RETURN => 8, :PLUS => 12, :SUPERCLASS => 52, 
                   :EQ => 33, :COMMENT => 4, :DOT => 29, :NE => 34, :EXIT => 9, 
                   :GE => 38, :UNICODE_ESC => 54, :ELSE => 22, :HEX_DIGIT => 53, 
                   :INT => 14, :SEMICOLON => 5, :MINUS => 13, :TRUE => 47, 
                   :MUL => 39, :PRINT => 15, :PRINTL => 16, :ELSEIF => 23, 
                   :COLON => 60, :ELIF => 24, :WS => 58, :READ => 6, :OR => 30, 
                   :ASSIGN => 46, :GT => 36, :LB => 10, :DIV => 40, :FALSE => 48, 
                   :LE => 37, :STRING => 49 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "COMMENT", "SEMICOLON", "READ", "BREAK", "RETURN", "EXIT", 
                    "LB", "RB", "PLUS", "MINUS", "INT", "PRINT", "PRINTL", 
                    "PRINTLN", "COMMA", "IF", "LCB", "RCB", "ELSE", "ELSEIF", 
                    "ELIF", "WHILE", "DO", "FOR", "ID", "DOT", "OR", "AND", 
                    "NOT", "EQ", "NE", "LT", "GT", "LE", "GE", "MUL", "DIV", 
                    "MOD", "TO_INT", "TO_FLOAT", "FLOAT", "NEW", "ASSIGN", 
                    "TRUE", "FALSE", "STRING", "ESC_SEQ", "CLASS", "SUPERCLASS", 
                    "HEX_DIGIT", "UNICODE_ESC", "OCTAL_ESC", "CONTINUE", 
                    "EXPONENT", "WS", "QUOTE", "COLON", "QM", "'\\r'", "'\\n'", 
                    "'['", "']'" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = Giraffe
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :program, :block, :instructionRest, :instruction, :readInstruction, 
                     :breakInstruction, :returnInstruction, :exitInstruction, 
                     :statusCode, :printInstruction, :printlInstruction, 
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
    # 44:1: program returns [result] : block ;
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


        # at line 45:4: block
        @state.following.push( TOKENS_FOLLOWING_block_IN_program_56 )
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

    BlockReturnValue = define_return_scope :list

    # 
    # parser rule block
    # 
    # (in Giraffe.g)
    # 48:1: block returns [list] : instruction instructionRest ;
    # 
    def block
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )
      return_value = BlockReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      instruction2 = nil
      instructionRest3 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 49:4: instruction instructionRest
        # --> action
        return_value.list = []
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_instruction_IN_block_78 )
        instruction2 = instruction
        @state.following.pop
        @adaptor.add_child( root_0, instruction2.tree )
        # --> action
        return_value.list = [[( instruction2.nil? ? nil : instruction2.result ),instruction2.tree]] unless ( instruction2.nil? ? nil : instruction2.result ) == nil
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_instructionRest_IN_block_88 )
        instructionRest3 = instructionRest
        @state.following.pop
        @adaptor.add_child( root_0, instructionRest3.tree )
        # --> action
        return_value.list = return_value.list + ( instructionRest3.nil? ? nil : instructionRest3.list )
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
        # trace_out( __method__, 2 )

      end
      
      return return_value
    end

    InstructionRestReturnValue = define_return_scope :list

    # 
    # parser rule instructionRest
    # 
    # (in Giraffe.g)
    # 56:1: instructionRest returns [list] : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | );
    # 
    def instructionRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )
      return_value = InstructionRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMENT4__ = nil
      char_literal5 = nil
      char_literal6 = nil
      __SEMICOLON7__ = nil
      block8 = nil

      tree_for_COMMENT4 = nil
      tree_for_char_literal5 = nil
      tree_for_char_literal6 = nil
      tree_for_SEMICOLON7 = nil

      begin
        # at line 57:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | )
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


          # at line 57:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block
          # at line 57:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
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
            # at line 57:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 57:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 57:8: ( COMMENT )? ( '\\r' )? '\\n'
            # at line 57:15: ( COMMENT )?
            alt_1 = 2
            look_1_0 = @input.peek( 1 )

            if ( look_1_0 == COMMENT )
              alt_1 = 1
            end
            case alt_1
            when 1
              # at line 57:15: COMMENT
              __COMMENT4__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_instructionRest_114 )

            end
            # at line 57:22: ( '\\r' )?
            alt_2 = 2
            look_2_0 = @input.peek( 1 )

            if ( look_2_0 == T__62 )
              alt_2 = 1
            end
            case alt_2
            when 1
              # at line 57:22: '\\r'
              char_literal5 = match( T__62, TOKENS_FOLLOWING_T__62_IN_instructionRest_118 )

            end
            char_literal6 = match( T__63, TOKENS_FOLLOWING_T__63_IN_instructionRest_122 )


          when 2
            # at line 57:34: SEMICOLON
            __SEMICOLON7__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_128 )

          end
          @state.following.push( TOKENS_FOLLOWING_block_IN_instructionRest_135 )
          block8 = block
          @state.following.pop
          @adaptor.add_child( root_0, block8.tree )
          # --> action
          return_value.list = ( block8.nil? ? nil : block8.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 60:4: 
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
        # trace_out( __method__, 3 )

      end
      
      return return_value
    end

    InstructionReturnValue = define_return_scope :result

    # 
    # parser rule instruction
    # 
    # (in Giraffe.g)
    # 63:1: instruction returns [result] : ( assignment | func | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | classDef | );
    # 
    def instruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )
      return_value = InstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      assignment9 = nil
      func10 = nil
      forCycle11 = nil
      ifInstruction12 = nil
      whileCycle13 = nil
      doCycle14 = nil
      printInstruction15 = nil
      printlInstruction16 = nil
      returnInstruction17 = nil
      exitInstruction18 = nil
      breakInstruction19 = nil
      call20 = nil
      classDef21 = nil


      begin
        # at line 64:2: ( assignment | func | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | classDef | )
        alt_5 = 14
        alt_5 = @dfa5.predict( @input )
        case alt_5
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 64:4: assignment
          @state.following.push( TOKENS_FOLLOWING_assignment_IN_instruction_164 )
          assignment9 = assignment
          @state.following.pop
          @adaptor.add_child( root_0, assignment9.tree )
          # --> action
          return_value.result = ( assignment9.nil? ? nil : assignment9.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 65:4: func
          @state.following.push( TOKENS_FOLLOWING_func_IN_instruction_171 )
          func10 = func
          @state.following.pop
          @adaptor.add_child( root_0, func10.tree )
          # --> action
          return_value.result = ( func10.nil? ? nil : func10.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 66:4: forCycle
          @state.following.push( TOKENS_FOLLOWING_forCycle_IN_instruction_178 )
          forCycle11 = forCycle
          @state.following.pop
          @adaptor.add_child( root_0, forCycle11.tree )
          # --> action
          return_value.result = ( forCycle11.nil? ? nil : forCycle11.result )
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 67:4: ifInstruction
          @state.following.push( TOKENS_FOLLOWING_ifInstruction_IN_instruction_185 )
          ifInstruction12 = ifInstruction
          @state.following.pop
          @adaptor.add_child( root_0, ifInstruction12.tree )
          # --> action
          return_value.result = ( ifInstruction12.nil? ? nil : ifInstruction12.result )
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 68:4: whileCycle
          @state.following.push( TOKENS_FOLLOWING_whileCycle_IN_instruction_192 )
          whileCycle13 = whileCycle
          @state.following.pop
          @adaptor.add_child( root_0, whileCycle13.tree )
          # --> action
          return_value.result = ( whileCycle13.nil? ? nil : whileCycle13.result )
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 69:4: doCycle
          @state.following.push( TOKENS_FOLLOWING_doCycle_IN_instruction_199 )
          doCycle14 = doCycle
          @state.following.pop
          @adaptor.add_child( root_0, doCycle14.tree )
          # --> action
          return_value.result = ( doCycle14.nil? ? nil : doCycle14.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 70:4: printInstruction
          @state.following.push( TOKENS_FOLLOWING_printInstruction_IN_instruction_206 )
          printInstruction15 = printInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printInstruction15.tree )
          # --> action
          return_value.result = ( printInstruction15.nil? ? nil : printInstruction15.result )
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 71:4: printlInstruction
          @state.following.push( TOKENS_FOLLOWING_printlInstruction_IN_instruction_213 )
          printlInstruction16 = printlInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printlInstruction16.tree )
          # --> action
          return_value.result = ( printlInstruction16.nil? ? nil : printlInstruction16.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 72:4: returnInstruction
          @state.following.push( TOKENS_FOLLOWING_returnInstruction_IN_instruction_220 )
          returnInstruction17 = returnInstruction
          @state.following.pop
          @adaptor.add_child( root_0, returnInstruction17.tree )
          # --> action
          return_value.result = ( returnInstruction17.nil? ? nil : returnInstruction17.result )
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 73:4: exitInstruction
          @state.following.push( TOKENS_FOLLOWING_exitInstruction_IN_instruction_228 )
          exitInstruction18 = exitInstruction
          @state.following.pop
          @adaptor.add_child( root_0, exitInstruction18.tree )
          # --> action
          return_value.result = ( exitInstruction18.nil? ? nil : exitInstruction18.result )
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 74:4: breakInstruction
          @state.following.push( TOKENS_FOLLOWING_breakInstruction_IN_instruction_235 )
          breakInstruction19 = breakInstruction
          @state.following.pop
          @adaptor.add_child( root_0, breakInstruction19.tree )
          # --> action
          return_value.result = ( breakInstruction19.nil? ? nil : breakInstruction19.result )
          # <-- action

        when 12
          root_0 = @adaptor.create_flat_list


          # at line 75:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_instruction_242 )
          call20 = call
          @state.following.pop
          @adaptor.add_child( root_0, call20.tree )
          # --> action
          return_value.result = ( call20.nil? ? nil : call20.result )
          # <-- action

        when 13
          root_0 = @adaptor.create_flat_list


          # at line 76:4: classDef
          @state.following.push( TOKENS_FOLLOWING_classDef_IN_instruction_249 )
          classDef21 = classDef
          @state.following.pop
          @adaptor.add_child( root_0, classDef21.tree )
          # --> action
          return_value.result = ( classDef21.nil? ? nil : classDef21.result )
          # <-- action

        when 14
          root_0 = @adaptor.create_flat_list


          # at line 77:4: 
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
        # trace_out( __method__, 4 )

      end
      
      return return_value
    end

    ReadInstructionReturnValue = define_return_scope :result

    # 
    # parser rule readInstruction
    # 
    # (in Giraffe.g)
    # 80:1: readInstruction returns [result] : READ ;
    # 
    def readInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      return_value = ReadInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __READ22__ = nil

      tree_for_READ22 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 81:4: READ
        __READ22__ = match( READ, TOKENS_FOLLOWING_READ_IN_readInstruction_273 )

        tree_for_READ22 = @adaptor.create_with_payload( __READ22__ )
        @adaptor.add_child( root_0, tree_for_READ22 )

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
        # trace_out( __method__, 5 )

      end
      
      return return_value
    end

    BreakInstructionReturnValue = define_return_scope :result

    # 
    # parser rule breakInstruction
    # 
    # (in Giraffe.g)
    # 84:1: breakInstruction returns [result] : BREAK ;
    # 
    def breakInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      return_value = BreakInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BREAK23__ = nil

      tree_for_BREAK23 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 85:4: BREAK
        __BREAK23__ = match( BREAK, TOKENS_FOLLOWING_BREAK_IN_breakInstruction_290 )

        tree_for_BREAK23 = @adaptor.create_with_payload( __BREAK23__ )
        @adaptor.add_child( root_0, tree_for_BREAK23 )

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
    # 88:1: returnInstruction returns [result] : RETURN expression ;
    # 
    def returnInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )
      return_value = ReturnInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __RETURN24__ = nil
      expression25 = nil

      tree_for_RETURN24 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 89:4: RETURN expression
        __RETURN24__ = match( RETURN, TOKENS_FOLLOWING_RETURN_IN_returnInstruction_307 )

        tree_for_RETURN24 = @adaptor.create_with_payload( __RETURN24__ )
        root_0 = @adaptor.become_root( tree_for_RETURN24, root_0 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_returnInstruction_310 )
        expression25 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression25.tree )
        # --> action
        return_value.result = ReturnTree.new(( expression25.nil? ? nil : expression25.result ))
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
    # 92:1: exitInstruction returns [result] : EXIT ( LB alt1= statusCode RB | alt2= statusCode )? ;
    # 
    def exitInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      return_value = ExitInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __EXIT26__ = nil
      __LB27__ = nil
      __RB28__ = nil
      alt1 = nil
      alt2 = nil

      tree_for_EXIT26 = nil
      tree_for_LB27 = nil
      tree_for_RB28 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 93:4: EXIT ( LB alt1= statusCode RB | alt2= statusCode )?
        __EXIT26__ = match( EXIT, TOKENS_FOLLOWING_EXIT_IN_exitInstruction_327 )

        tree_for_EXIT26 = @adaptor.create_with_payload( __EXIT26__ )
        root_0 = @adaptor.become_root( tree_for_EXIT26, root_0 )

        # at line 93:11: ( LB alt1= statusCode RB | alt2= statusCode )?
        alt_6 = 3
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == LB )
          alt_6 = 1
        elsif ( look_6_0.between?( PLUS, INT ) )
          alt_6 = 2
        end
        case alt_6
        when 1
          # at line 93:12: LB alt1= statusCode RB
          __LB27__ = match( LB, TOKENS_FOLLOWING_LB_IN_exitInstruction_332 )
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_337 )
          alt1 = statusCode
          @state.following.pop
          @adaptor.add_child( root_0, alt1.tree )
          __RB28__ = match( RB, TOKENS_FOLLOWING_RB_IN_exitInstruction_339 )
          # --> action
          return_value.result = ExitTree.new(( alt1.nil? ? nil : alt1.result ))
          # <-- action

        when 2
          # at line 94:6: alt2= statusCode
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_352 )
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
    # 97:1: statusCode returns [result] : ( PLUS | MINUS )? INT ;
    # 
    def statusCode
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = StatusCodeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS29__ = nil
      __MINUS30__ = nil
      __INT31__ = nil

      tree_for_PLUS29 = nil
      tree_for_MINUS30 = nil
      tree_for_INT31 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 98:4: ( PLUS | MINUS )? INT
        # --> action
        sign = ""
        # <-- action
        # at line 99:3: ( PLUS | MINUS )?
        alt_7 = 3
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == PLUS )
          alt_7 = 1
        elsif ( look_7_0 == MINUS )
          alt_7 = 2
        end
        case alt_7
        when 1
          # at line 99:4: PLUS
          __PLUS29__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_statusCode_377 )

          tree_for_PLUS29 = @adaptor.create_with_payload( __PLUS29__ )
          @adaptor.add_child( root_0, tree_for_PLUS29 )


        when 2
          # at line 99:11: MINUS
          __MINUS30__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_statusCode_381 )

          tree_for_MINUS30 = @adaptor.create_with_payload( __MINUS30__ )
          @adaptor.add_child( root_0, tree_for_MINUS30 )

          # --> action
          sign = __MINUS30__.text
          # <-- action

        end
        __INT31__ = match( INT, TOKENS_FOLLOWING_INT_IN_statusCode_387 )

        tree_for_INT31 = @adaptor.create_with_payload( __INT31__ )
        @adaptor.add_child( root_0, tree_for_INT31 )

        # --> action
        (sign + __INT31__.text).to_i
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
    # 103:1: printInstruction returns [result] : PRINT printText ;
    # 
    def printInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = PrintInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PRINT32__ = nil
      printText33 = nil

      tree_for_PRINT32 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 104:5: PRINT printText
        __PRINT32__ = match( PRINT, TOKENS_FOLLOWING_PRINT_IN_printInstruction_408 )

        tree_for_PRINT32 = @adaptor.create_with_payload( __PRINT32__ )
        root_0 = @adaptor.become_root( tree_for_PRINT32, root_0 )

        @state.following.push( TOKENS_FOLLOWING_printText_IN_printInstruction_411 )
        printText33 = printText
        @state.following.pop
        @adaptor.add_child( root_0, printText33.tree )
        # --> action
        return_value.result = PrintTree.new(( printText33.nil? ? nil : printText33.list ))
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

    PrintlInstructionReturnValue = define_return_scope :result

    # 
    # parser rule printlInstruction
    # 
    # (in Giraffe.g)
    # 107:1: printlInstruction returns [result] : ( PRINTL | PRINTLN ) printText ;
    # 
    def printlInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = PrintlInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set34 = nil
      printText35 = nil

      tree_for_set34 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 108:5: ( PRINTL | PRINTLN ) printText
        set34 = @input.look
        set34 = @input.look
        if @input.peek( 1 ).between?( PRINTL, PRINTLN )
          @input.consume
          root_0 = @adaptor.become_root( @adaptor.create_with_payload( set34 ), root_0 )
          @state.error_recovery = false
        else
          mse = MismatchedSet( nil )
          raise mse
        end


        @state.following.push( TOKENS_FOLLOWING_printText_IN_printlInstruction_441 )
        printText35 = printText
        @state.following.pop
        @adaptor.add_child( root_0, printText35.tree )
        # --> action
        return_value.result = PrintTree.new(( printText35.nil? ? nil : printText35.list ),true)
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

    PrintTextReturnValue = define_return_scope :list

    # 
    # parser rule printText
    # 
    # (in Giraffe.g)
    # 111:1: printText returns [list] : expression ( COMMA rest= printText )? ;
    # 
    def printText
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = PrintTextReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA37__ = nil
      rest = nil
      expression36 = nil

      tree_for_COMMA37 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 112:4: expression ( COMMA rest= printText )?
        @state.following.push( TOKENS_FOLLOWING_expression_IN_printText_461 )
        expression36 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression36.tree )
        # --> action
        return_value.list = [( expression36.nil? ? nil : expression36.result )]
        # <-- action
        # at line 113:3: ( COMMA rest= printText )?
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == COMMA )
          alt_8 = 1
        end
        case alt_8
        when 1
          # at line 113:4: COMMA rest= printText
          __COMMA37__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_printText_468 )

          tree_for_COMMA37 = @adaptor.create_with_payload( __COMMA37__ )
          @adaptor.add_child( root_0, tree_for_COMMA37 )

          @state.following.push( TOKENS_FOLLOWING_printText_IN_printText_472 )
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
        # trace_out( __method__, 12 )

      end
      
      return return_value
    end

    IfInstructionReturnValue = define_return_scope :result

    # 
    # parser rule ifInstruction
    # 
    # (in Giraffe.g)
    # 116:1: ifInstruction returns [result] : IF condition LCB block RCB ifRest ;
    # 
    def ifInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = IfInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __IF38__ = nil
      __LCB40__ = nil
      __RCB42__ = nil
      condition39 = nil
      block41 = nil
      ifRest43 = nil

      tree_for_IF38 = nil
      tree_for_LCB40 = nil
      tree_for_RCB42 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 117:4: IF condition LCB block RCB ifRest
        __IF38__ = match( IF, TOKENS_FOLLOWING_IF_IN_ifInstruction_495 )

        tree_for_IF38 = @adaptor.create_with_payload( __IF38__ )
        root_0 = @adaptor.become_root( tree_for_IF38, root_0 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_ifInstruction_498 )
        condition39 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition39.tree )
        __LCB40__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifInstruction_500 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_ifInstruction_503 )
        block41 = block
        @state.following.pop
        @adaptor.add_child( root_0, block41.tree )
        __RCB42__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifInstruction_505 )
        @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifInstruction_508 )
        ifRest43 = ifRest
        @state.following.pop
        @adaptor.add_child( root_0, ifRest43.tree )
        # --> action
        return_value.result = IfTree.new(( condition39.nil? ? nil : condition39.result ),( block41.nil? ? nil : block41.list ),( ifRest43.nil? ? nil : ifRest43.result ))
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
    # 121:1: ifRest returns [result] : ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | );
    # 
    def ifRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = IfRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ELSE44__ = nil
      __LCB45__ = nil
      __RCB47__ = nil
      set48 = nil
      __LCB50__ = nil
      __RCB52__ = nil
      op = nil
      block46 = nil
      condition49 = nil
      block51 = nil

      tree_for_ELSE44 = nil
      tree_for_LCB45 = nil
      tree_for_RCB47 = nil
      tree_for_set48 = nil
      tree_for_LCB50 = nil
      tree_for_RCB52 = nil

      begin
        # at line 122:2: ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | )
        alt_9 = 3
        case look_9 = @input.peek( 1 )
        when ELSE then alt_9 = 1
        when ELSEIF, ELIF then alt_9 = 2
        when EOF, COMMENT, SEMICOLON, RCB, T__62, T__63 then alt_9 = 3
        else
          raise NoViableAlternative( "", 9, 0 )
        end
        case alt_9
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 122:4: ELSE LCB block RCB
          __ELSE44__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_ifRest_527 )

          tree_for_ELSE44 = @adaptor.create_with_payload( __ELSE44__ )
          @adaptor.add_child( root_0, tree_for_ELSE44 )

          __LCB45__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_529 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_532 )
          block46 = block
          @state.following.pop
          @adaptor.add_child( root_0, block46.tree )
          __RCB47__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_534 )
          # --> action
          return_value.result = ( block46.nil? ? nil : block46.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 123:4: ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest
          set48 = @input.look
          if @input.peek( 1 ).between?( ELSEIF, ELIF )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set48 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          @state.following.push( TOKENS_FOLLOWING_condition_IN_ifRest_550 )
          condition49 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition49.tree )
          __LCB50__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_552 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_555 )
          block51 = block
          @state.following.pop
          @adaptor.add_child( root_0, block51.tree )
          __RCB52__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_557 )
          @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifRest_562 )
          op = ifRest
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = IfTree.new(( condition49.nil? ? nil : condition49.result ),( block51.nil? ? nil : block51.list ),( op.nil? ? nil : op.result ))
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 125:4: 
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
    # 128:1: whileCycle returns [result] : WHILE condition LCB block RCB ;
    # 
    def whileCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = WhileCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WHILE53__ = nil
      __LCB55__ = nil
      __RCB57__ = nil
      condition54 = nil
      block56 = nil

      tree_for_WHILE53 = nil
      tree_for_LCB55 = nil
      tree_for_RCB57 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 129:5: WHILE condition LCB block RCB
        __WHILE53__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_whileCycle_589 )

        tree_for_WHILE53 = @adaptor.create_with_payload( __WHILE53__ )
        @adaptor.add_child( root_0, tree_for_WHILE53 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_whileCycle_591 )
        condition54 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition54.tree )
        __LCB55__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_whileCycle_593 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_whileCycle_596 )
        block56 = block
        @state.following.pop
        @adaptor.add_child( root_0, block56.tree )
        __RCB57__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_whileCycle_598 )
        # --> action
        return_value.result = WhileTree.new(( condition54.nil? ? nil : condition54.result ),( block56.nil? ? nil : block56.list ))
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
    # 133:1: doCycle returns [result] : DO LCB block RCB WHILE condition ;
    # 
    def doCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = DoCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __DO58__ = nil
      __LCB59__ = nil
      __RCB61__ = nil
      __WHILE62__ = nil
      block60 = nil
      condition63 = nil

      tree_for_DO58 = nil
      tree_for_LCB59 = nil
      tree_for_RCB61 = nil
      tree_for_WHILE62 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 134:4: DO LCB block RCB WHILE condition
        __DO58__ = match( DO, TOKENS_FOLLOWING_DO_IN_doCycle_620 )

        tree_for_DO58 = @adaptor.create_with_payload( __DO58__ )
        @adaptor.add_child( root_0, tree_for_DO58 )

        __LCB59__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_doCycle_622 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_doCycle_625 )
        block60 = block
        @state.following.pop
        @adaptor.add_child( root_0, block60.tree )
        __RCB61__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_doCycle_627 )
        __WHILE62__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_doCycle_630 )

        tree_for_WHILE62 = @adaptor.create_with_payload( __WHILE62__ )
        @adaptor.add_child( root_0, tree_for_WHILE62 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_doCycle_632 )
        condition63 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition63.tree )
        # --> action
        return_value.result = DoTree.new(( condition63.nil? ? nil : condition63.result ),( block60.nil? ? nil : block60.list ))
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
    # 138:1: forCycle returns [result] : FOR as1= assignment ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) condition ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) as2= assignment LCB block RCB ;
    # 
    def forCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = ForCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __FOR64__ = nil
      __COMMENT65__ = nil
      char_literal66 = nil
      char_literal67 = nil
      __SEMICOLON68__ = nil
      __COMMENT70__ = nil
      char_literal71 = nil
      char_literal72 = nil
      __SEMICOLON73__ = nil
      __LCB74__ = nil
      __RCB76__ = nil
      as1 = nil
      as2 = nil
      condition69 = nil
      block75 = nil

      tree_for_FOR64 = nil
      tree_for_COMMENT65 = nil
      tree_for_char_literal66 = nil
      tree_for_char_literal67 = nil
      tree_for_SEMICOLON68 = nil
      tree_for_COMMENT70 = nil
      tree_for_char_literal71 = nil
      tree_for_char_literal72 = nil
      tree_for_SEMICOLON73 = nil
      tree_for_LCB74 = nil
      tree_for_RCB76 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 139:4: FOR as1= assignment ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) condition ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) as2= assignment LCB block RCB
        __FOR64__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_forCycle_653 )

        tree_for_FOR64 = @adaptor.create_with_payload( __FOR64__ )
        @adaptor.add_child( root_0, tree_for_FOR64 )

        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_657 )
        as1 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as1.tree )
        # at line 139:23: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == COMMENT || look_12_0.between?( T__62, T__63 ) )
          alt_12 = 1
        elsif ( look_12_0 == SEMICOLON )
          alt_12 = 2
        else
          raise NoViableAlternative( "", 12, 0 )
        end
        case alt_12
        when 1
          # at line 139:24: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 139:24: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 139:26: ( COMMENT )? ( '\\r' )? '\\n'
          # at line 139:33: ( COMMENT )?
          alt_10 = 2
          look_10_0 = @input.peek( 1 )

          if ( look_10_0 == COMMENT )
            alt_10 = 1
          end
          case alt_10
          when 1
            # at line 139:33: COMMENT
            __COMMENT65__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_forCycle_662 )

          end
          # at line 139:40: ( '\\r' )?
          alt_11 = 2
          look_11_0 = @input.peek( 1 )

          if ( look_11_0 == T__62 )
            alt_11 = 1
          end
          case alt_11
          when 1
            # at line 139:40: '\\r'
            char_literal66 = match( T__62, TOKENS_FOLLOWING_T__62_IN_forCycle_666 )

          end
          char_literal67 = match( T__63, TOKENS_FOLLOWING_T__63_IN_forCycle_670 )


        when 2
          # at line 139:52: SEMICOLON
          __SEMICOLON68__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_676 )

        end
        @state.following.push( TOKENS_FOLLOWING_condition_IN_forCycle_681 )
        condition69 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition69.tree )
        # at line 139:75: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
        alt_15 = 2
        look_15_0 = @input.peek( 1 )

        if ( look_15_0 == COMMENT || look_15_0.between?( T__62, T__63 ) )
          alt_15 = 1
        elsif ( look_15_0 == SEMICOLON )
          alt_15 = 2
        else
          raise NoViableAlternative( "", 15, 0 )
        end
        case alt_15
        when 1
          # at line 139:76: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 139:76: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 139:78: ( COMMENT )? ( '\\r' )? '\\n'
          # at line 139:85: ( COMMENT )?
          alt_13 = 2
          look_13_0 = @input.peek( 1 )

          if ( look_13_0 == COMMENT )
            alt_13 = 1
          end
          case alt_13
          when 1
            # at line 139:85: COMMENT
            __COMMENT70__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_forCycle_686 )

          end
          # at line 139:92: ( '\\r' )?
          alt_14 = 2
          look_14_0 = @input.peek( 1 )

          if ( look_14_0 == T__62 )
            alt_14 = 1
          end
          case alt_14
          when 1
            # at line 139:92: '\\r'
            char_literal71 = match( T__62, TOKENS_FOLLOWING_T__62_IN_forCycle_690 )

          end
          char_literal72 = match( T__63, TOKENS_FOLLOWING_T__63_IN_forCycle_694 )


        when 2
          # at line 139:104: SEMICOLON
          __SEMICOLON73__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_700 )

        end
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_707 )
        as2 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as2.tree )
        __LCB74__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_forCycle_709 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_forCycle_712 )
        block75 = block
        @state.following.pop
        @adaptor.add_child( root_0, block75.tree )
        __RCB76__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_forCycle_714 )
        # --> action
        return_value.result = ForTree.new(( as1.nil? ? nil : as1.result ),( condition69.nil? ? nil : condition69.result ),( as2.nil? ? nil : as2.result ),( block75.nil? ? nil : block75.list ))
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
    # 143:1: func returns [result] : ID ( params )? LCB block RCB ;
    # 
    def func
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = FuncReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID77__ = nil
      __LCB79__ = nil
      __RCB81__ = nil
      params78 = nil
      block80 = nil

      tree_for_ID77 = nil
      tree_for_LCB79 = nil
      tree_for_RCB81 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 144:4: ID ( params )? LCB block RCB
        __ID77__ = match( ID, TOKENS_FOLLOWING_ID_IN_func_736 )

        tree_for_ID77 = @adaptor.create_with_payload( __ID77__ )
        root_0 = @adaptor.become_root( tree_for_ID77, root_0 )

        # at line 144:8: ( params )?
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == ID )
          alt_16 = 1
        end
        case alt_16
        when 1
          # at line 144:8: params
          @state.following.push( TOKENS_FOLLOWING_params_IN_func_739 )
          params78 = params
          @state.following.pop
          @adaptor.add_child( root_0, params78.tree )

        end
        __LCB79__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_742 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_func_745 )
        block80 = block
        @state.following.pop
        @adaptor.add_child( root_0, block80.tree )
        __RCB81__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_747 )
        # --> action
        return_value.result = FuncTree.new(__ID77__.text,( params78.nil? ? nil : params78.list ),( block80.nil? ? nil : block80.list ))
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
    # 148:1: params returns [list] : ID paramRest ;
    # 
    def params
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = ParamsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID82__ = nil
      paramRest83 = nil

      tree_for_ID82 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 149:4: ID paramRest
        __ID82__ = match( ID, TOKENS_FOLLOWING_ID_IN_params_767 )

        tree_for_ID82 = @adaptor.create_with_payload( __ID82__ )
        @adaptor.add_child( root_0, tree_for_ID82 )

        @state.following.push( TOKENS_FOLLOWING_paramRest_IN_params_769 )
        paramRest83 = paramRest
        @state.following.pop
        @adaptor.add_child( root_0, paramRest83.tree )
        # --> action
        return_value.list = [__ID82__.text] + ( paramRest83.nil? ? nil : paramRest83.list )
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
    # 153:1: paramRest returns [list] : ( COMMA params | );
    # 
    def paramRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = ParamRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA84__ = nil
      params85 = nil

      tree_for_COMMA84 = nil

      begin
        # at line 154:2: ( COMMA params | )
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == COMMA )
          alt_17 = 1
        elsif ( look_17_0 == LCB )
          alt_17 = 2
        else
          raise NoViableAlternative( "", 17, 0 )
        end
        case alt_17
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 154:4: COMMA params
          __COMMA84__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_paramRest_788 )
          @state.following.push( TOKENS_FOLLOWING_params_IN_paramRest_791 )
          params85 = params
          @state.following.pop
          @adaptor.add_child( root_0, params85.tree )
          # --> action
          return_value.list = ( params85.nil? ? nil : params85.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 156:4: 
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
    # 159:1: call returns [result] : fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )* ;
    # 
    def call
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = CallReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      fun = nil
      method = nil
      __LB86__ = nil
      __RB87__ = nil
      __DOT88__ = nil
      __LB89__ = nil
      __RB90__ = nil
      args1 = nil
      args2 = nil

      tree_for_fun = nil
      tree_for_method = nil
      tree_for_LB86 = nil
      tree_for_RB87 = nil
      tree_for_DOT88 = nil
      tree_for_LB89 = nil
      tree_for_RB90 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 160:4: fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )*
        fun = match( ID, TOKENS_FOLLOWING_ID_IN_call_820 )

        tree_for_fun = @adaptor.create_with_payload( fun )
        root_0 = @adaptor.become_root( tree_for_fun, root_0 )

        __LB86__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_823 )
        # at line 160:21: (args1= args )?
        alt_18 = 2
        look_18_0 = @input.peek( 1 )

        if ( look_18_0 == READ || look_18_0 == LB || look_18_0.between?( PLUS, INT ) || look_18_0 == ID || look_18_0.between?( TO_INT, NEW ) || look_18_0 == STRING || look_18_0 == T__64 )
          alt_18 = 1
        end
        case alt_18
        when 1
          # at line 160:21: args1= args
          @state.following.push( TOKENS_FOLLOWING_args_IN_call_828 )
          args1 = args
          @state.following.pop
          @adaptor.add_child( root_0, args1.tree )

        end
        __RB87__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_831 )
        # --> action
        return_value.result = [CallTree.new(fun.text,( args1.nil? ? nil : args1.list )),tree_for_fun]
        # <-- action
        # at line 162:3: ( DOT method= ID LB (args2= args )? RB )*
        while true # decision 20
          alt_20 = 2
          look_20_0 = @input.peek( 1 )

          if ( look_20_0 == DOT )
            alt_20 = 1

          end
          case alt_20
          when 1
            # at line 162:5: DOT method= ID LB (args2= args )? RB
            __DOT88__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_call_842 )

            tree_for_DOT88 = @adaptor.create_with_payload( __DOT88__ )
            @adaptor.add_child( root_0, tree_for_DOT88 )

            method = match( ID, TOKENS_FOLLOWING_ID_IN_call_846 )

            tree_for_method = @adaptor.create_with_payload( method )
            @adaptor.add_child( root_0, tree_for_method )

            __LB89__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_848 )
            # at line 162:28: (args2= args )?
            alt_19 = 2
            look_19_0 = @input.peek( 1 )

            if ( look_19_0 == READ || look_19_0 == LB || look_19_0.between?( PLUS, INT ) || look_19_0 == ID || look_19_0.between?( TO_INT, NEW ) || look_19_0 == STRING || look_19_0 == T__64 )
              alt_19 = 1
            end
            case alt_19
            when 1
              # at line 162:28: args2= args
              @state.following.push( TOKENS_FOLLOWING_args_IN_call_853 )
              args2 = args
              @state.following.pop
              @adaptor.add_child( root_0, args2.tree )

            end
            __RB90__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_856 )
            # --> action
            return_value.result = [MethodCallTree.new(return_value.result,method.text,( args2.nil? ? nil : args2.list )),tree_for_method]
            # <-- action

          else
            break # out of loop for decision 20
          end
        end # loop for decision 20
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
    # 165:1: args returns [list] : expression argsRest ;
    # 
    def args
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ArgsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      expression91 = nil
      argsRest92 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 166:5: expression argsRest
        @state.following.push( TOKENS_FOLLOWING_expression_IN_args_878 )
        expression91 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression91.tree )
        @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_880 )
        argsRest92 = argsRest
        @state.following.pop
        @adaptor.add_child( root_0, argsRest92.tree )
        # --> action
        return_value.list = [( expression91.nil? ? nil : expression91.result )] + ( argsRest92.nil? ? nil : argsRest92.list )
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
    # 169:1: argsRest returns [list] : ( COMMA args | );
    # 
    def argsRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ArgsRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA93__ = nil
      args94 = nil

      tree_for_COMMA93 = nil

      begin
        # at line 170:2: ( COMMA args | )
        alt_21 = 2
        look_21_0 = @input.peek( 1 )

        if ( look_21_0 == COMMA )
          alt_21 = 1
        elsif ( look_21_0 == RB )
          alt_21 = 2
        else
          raise NoViableAlternative( "", 21, 0 )
        end
        case alt_21
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 170:4: COMMA args
          __COMMA93__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsRest_899 )
          @state.following.push( TOKENS_FOLLOWING_args_IN_argsRest_902 )
          args94 = args
          @state.following.pop
          @adaptor.add_child( root_0, args94.tree )
          # --> action
          return_value.list = ( args94.nil? ? nil : args94.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 172:4: 
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
    # 177:1: condition returns [result] : orOperand ( OR op= condition )? ;
    # 
    def condition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = ConditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OR96__ = nil
      op = nil
      orOperand95 = nil

      tree_for_OR96 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 178:4: orOperand ( OR op= condition )?
        @state.following.push( TOKENS_FOLLOWING_orOperand_IN_condition_928 )
        orOperand95 = orOperand
        @state.following.pop
        @adaptor.add_child( root_0, orOperand95.tree )
        # --> action
        return_value.result = ( orOperand95.nil? ? nil : orOperand95.result )
        # <-- action
        # at line 179:3: ( OR op= condition )?
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == OR )
          alt_22 = 1
        end
        case alt_22
        when 1
          # at line 179:4: OR op= condition
          __OR96__ = match( OR, TOKENS_FOLLOWING_OR_IN_condition_935 )

          tree_for_OR96 = @adaptor.create_with_payload( __OR96__ )
          root_0 = @adaptor.become_root( tree_for_OR96, root_0 )

          @state.following.push( TOKENS_FOLLOWING_condition_IN_condition_940 )
          op = condition
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:or)),op.tree]
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
    # 184:1: orOperand returns [result] : boolOperand ( AND op= orOperand )? ;
    # 
    def orOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = OrOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __AND98__ = nil
      op = nil
      boolOperand97 = nil

      tree_for_AND98 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 185:4: boolOperand ( AND op= orOperand )?
        @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_orOperand_961 )
        boolOperand97 = boolOperand
        @state.following.pop
        @adaptor.add_child( root_0, boolOperand97.tree )
        # --> action
        return_value.result = ( boolOperand97.nil? ? nil : boolOperand97.result )
        # <-- action
        # at line 186:3: ( AND op= orOperand )?
        alt_23 = 2
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == AND )
          alt_23 = 1
        end
        case alt_23
        when 1
          # at line 186:4: AND op= orOperand
          __AND98__ = match( AND, TOKENS_FOLLOWING_AND_IN_orOperand_968 )

          tree_for_AND98 = @adaptor.create_with_payload( __AND98__ )
          root_0 = @adaptor.become_root( tree_for_AND98, root_0 )

          @state.following.push( TOKENS_FOLLOWING_orOperand_IN_orOperand_973 )
          op = orOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:and)),op.tree] 
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
    # 189:1: boolOperand returns [result] : ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) );
    # 
    def boolOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = BoolOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NOT100__ = nil
      __LB101__ = nil
      __RB103__ = nil
      __EQ104__ = nil
      __NE105__ = nil
      __LT106__ = nil
      __GT107__ = nil
      __LE108__ = nil
      __GE109__ = nil
      op1 = nil
      op2 = nil
      bool99 = nil
      condition102 = nil

      tree_for_NOT100 = nil
      tree_for_LB101 = nil
      tree_for_RB103 = nil
      tree_for_EQ104 = nil
      tree_for_NE105 = nil
      tree_for_LT106 = nil
      tree_for_GT107 = nil
      tree_for_LE108 = nil
      tree_for_GE109 = nil

      begin
        # at line 190:2: ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) )
        alt_31 = 3
        case look_31 = @input.peek( 1 )
        when TRUE, FALSE then alt_31 = 1
        when NOT then alt_31 = 2
        when READ, LB, PLUS, MINUS, INT, ID, TO_INT, TO_FLOAT, FLOAT, NEW, STRING, T__64 then alt_31 = 3
        else
          raise NoViableAlternative( "", 31, 0 )
        end
        case alt_31
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 190:4: bool
          @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_992 )
          bool99 = bool
          @state.following.pop
          @adaptor.add_child( root_0, bool99.tree )
          # --> action
          return_value.result = ( bool99.nil? ? nil : bool99.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 191:4: NOT LB condition RB
          __NOT100__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_boolOperand_999 )

          tree_for_NOT100 = @adaptor.create_with_payload( __NOT100__ )
          @adaptor.add_child( root_0, tree_for_NOT100 )

          __LB101__ = match( LB, TOKENS_FOLLOWING_LB_IN_boolOperand_1001 )
          @state.following.push( TOKENS_FOLLOWING_condition_IN_boolOperand_1004 )
          condition102 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition102.tree )
          __RB103__ = match( RB, TOKENS_FOLLOWING_RB_IN_boolOperand_1006 )
          # --> action
          return_value.result = !( condition102.nil? ? nil : condition102.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 192:4: op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1016 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # at line 192:19: ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          alt_30 = 6
          case look_30 = @input.peek( 1 )
          when EQ then alt_30 = 1
          when NE then alt_30 = 2
          when LT then alt_30 = 3
          when GT then alt_30 = 4
          when LE then alt_30 = 5
          when GE then alt_30 = 6
          else
            raise NoViableAlternative( "", 30, 0 )
          end
          case alt_30
          when 1
            # at line 192:20: EQ (op2= bool | op2= expression )
            __EQ104__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_boolOperand_1019 )

            tree_for_EQ104 = @adaptor.create_with_payload( __EQ104__ )
            root_0 = @adaptor.become_root( tree_for_EQ104, root_0 )

            # at line 192:24: (op2= bool | op2= expression )
            alt_24 = 2
            look_24_0 = @input.peek( 1 )

            if ( look_24_0.between?( TRUE, FALSE ) )
              alt_24 = 1
            elsif ( look_24_0 == READ || look_24_0 == LB || look_24_0.between?( PLUS, INT ) || look_24_0 == ID || look_24_0.between?( TO_INT, NEW ) || look_24_0 == STRING || look_24_0 == T__64 )
              alt_24 = 2
            else
              raise NoViableAlternative( "", 24, 0 )
            end
            case alt_24
            when 1
              # at line 192:26: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1026 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 192:37: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1032 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:eq)),op2.tree]
            # <-- action

          when 2
            # at line 193:6: NE (op2= bool | op2= expression )
            __NE105__ = match( NE, TOKENS_FOLLOWING_NE_IN_boolOperand_1043 )

            tree_for_NE105 = @adaptor.create_with_payload( __NE105__ )
            root_0 = @adaptor.become_root( tree_for_NE105, root_0 )

            # at line 193:10: (op2= bool | op2= expression )
            alt_25 = 2
            look_25_0 = @input.peek( 1 )

            if ( look_25_0.between?( TRUE, FALSE ) )
              alt_25 = 1
            elsif ( look_25_0 == READ || look_25_0 == LB || look_25_0.between?( PLUS, INT ) || look_25_0 == ID || look_25_0.between?( TO_INT, NEW ) || look_25_0 == STRING || look_25_0 == T__64 )
              alt_25 = 2
            else
              raise NoViableAlternative( "", 25, 0 )
            end
            case alt_25
            when 1
              # at line 193:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1050 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 193:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1056 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:ne)),op2.tree]
            # <-- action

          when 3
            # at line 194:6: LT (op2= bool | op2= expression )
            __LT106__ = match( LT, TOKENS_FOLLOWING_LT_IN_boolOperand_1067 )

            tree_for_LT106 = @adaptor.create_with_payload( __LT106__ )
            root_0 = @adaptor.become_root( tree_for_LT106, root_0 )

            # at line 194:10: (op2= bool | op2= expression )
            alt_26 = 2
            look_26_0 = @input.peek( 1 )

            if ( look_26_0.between?( TRUE, FALSE ) )
              alt_26 = 1
            elsif ( look_26_0 == READ || look_26_0 == LB || look_26_0.between?( PLUS, INT ) || look_26_0 == ID || look_26_0.between?( TO_INT, NEW ) || look_26_0 == STRING || look_26_0 == T__64 )
              alt_26 = 2
            else
              raise NoViableAlternative( "", 26, 0 )
            end
            case alt_26
            when 1
              # at line 194:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1074 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 194:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1080 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:lt)),op2.tree]
            # <-- action

          when 4
            # at line 195:6: GT (op2= bool | op2= expression )
            __GT107__ = match( GT, TOKENS_FOLLOWING_GT_IN_boolOperand_1091 )

            tree_for_GT107 = @adaptor.create_with_payload( __GT107__ )
            root_0 = @adaptor.become_root( tree_for_GT107, root_0 )

            # at line 195:10: (op2= bool | op2= expression )
            alt_27 = 2
            look_27_0 = @input.peek( 1 )

            if ( look_27_0.between?( TRUE, FALSE ) )
              alt_27 = 1
            elsif ( look_27_0 == READ || look_27_0 == LB || look_27_0.between?( PLUS, INT ) || look_27_0 == ID || look_27_0.between?( TO_INT, NEW ) || look_27_0 == STRING || look_27_0 == T__64 )
              alt_27 = 2
            else
              raise NoViableAlternative( "", 27, 0 )
            end
            case alt_27
            when 1
              # at line 195:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1098 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 195:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1104 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:gt)),op2.tree]
            # <-- action

          when 5
            # at line 196:6: LE (op2= bool | op2= expression )
            __LE108__ = match( LE, TOKENS_FOLLOWING_LE_IN_boolOperand_1115 )

            tree_for_LE108 = @adaptor.create_with_payload( __LE108__ )
            root_0 = @adaptor.become_root( tree_for_LE108, root_0 )

            # at line 196:10: (op2= bool | op2= expression )
            alt_28 = 2
            look_28_0 = @input.peek( 1 )

            if ( look_28_0.between?( TRUE, FALSE ) )
              alt_28 = 1
            elsif ( look_28_0 == READ || look_28_0 == LB || look_28_0.between?( PLUS, INT ) || look_28_0 == ID || look_28_0.between?( TO_INT, NEW ) || look_28_0 == STRING || look_28_0 == T__64 )
              alt_28 = 2
            else
              raise NoViableAlternative( "", 28, 0 )
            end
            case alt_28
            when 1
              # at line 196:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1122 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 196:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1128 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:le)),op2.tree]
            # <-- action

          when 6
            # at line 197:6: GE (op2= bool | op2= expression )
            __GE109__ = match( GE, TOKENS_FOLLOWING_GE_IN_boolOperand_1139 )

            tree_for_GE109 = @adaptor.create_with_payload( __GE109__ )
            root_0 = @adaptor.become_root( tree_for_GE109, root_0 )

            # at line 197:10: (op2= bool | op2= expression )
            alt_29 = 2
            look_29_0 = @input.peek( 1 )

            if ( look_29_0.between?( TRUE, FALSE ) )
              alt_29 = 1
            elsif ( look_29_0 == READ || look_29_0 == LB || look_29_0.between?( PLUS, INT ) || look_29_0 == ID || look_29_0.between?( TO_INT, NEW ) || look_29_0 == STRING || look_29_0 == T__64 )
              alt_29 = 2
            else
              raise NoViableAlternative( "", 29, 0 )
            end
            case alt_29
            when 1
              # at line 197:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1146 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 197:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1152 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:ge)),op2.tree]
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
    # 202:1: expression returns [result] : addOperand ( PLUS op= expression | MINUS op= expression )? ;
    # 
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS111__ = nil
      __MINUS112__ = nil
      op = nil
      addOperand110 = nil

      tree_for_PLUS111 = nil
      tree_for_MINUS112 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 203:4: addOperand ( PLUS op= expression | MINUS op= expression )?
        @state.following.push( TOKENS_FOLLOWING_addOperand_IN_expression_1177 )
        addOperand110 = addOperand
        @state.following.pop
        @adaptor.add_child( root_0, addOperand110.tree )
        # --> action
        return_value.result = ( addOperand110.nil? ? nil : addOperand110.result )
        # <-- action
        # at line 204:3: ( PLUS op= expression | MINUS op= expression )?
        alt_32 = 3
        look_32_0 = @input.peek( 1 )

        if ( look_32_0 == PLUS )
          alt_32 = 1
        elsif ( look_32_0 == MINUS )
          alt_32 = 2
        end
        case alt_32
        when 1
          # at line 205:4: PLUS op= expression
          __PLUS111__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expression_1188 )

          tree_for_PLUS111 = @adaptor.create_with_payload( __PLUS111__ )
          root_0 = @adaptor.become_root( tree_for_PLUS111, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1193 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:add)),op.tree]
          # <-- action

        when 2
          # at line 206:5: MINUS op= expression
          __MINUS112__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expression_1201 )

          tree_for_MINUS112 = @adaptor.create_with_payload( __MINUS112__ )
          root_0 = @adaptor.become_root( tree_for_MINUS112, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1206 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:sub)),op.tree]
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
    # 210:1: addOperand returns [result] : mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )? ;
    # 
    def addOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = AddOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __MUL114__ = nil
      __DIV115__ = nil
      __MOD116__ = nil
      op = nil
      mulOperand113 = nil

      tree_for_MUL114 = nil
      tree_for_DIV115 = nil
      tree_for_MOD116 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 211:4: mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperand_1228 )
        mulOperand113 = mulOperand
        @state.following.pop
        @adaptor.add_child( root_0, mulOperand113.tree )
        # --> action
        return_value.result = ( mulOperand113.nil? ? nil : mulOperand113.result )
        # <-- action
        # at line 212:3: ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        alt_33 = 4
        case look_33 = @input.peek( 1 )
        when MUL then alt_33 = 1
        when DIV then alt_33 = 2
        when MOD then alt_33 = 3
        end
        case alt_33
        when 1
          # at line 213:4: MUL op= addOperand
          __MUL114__ = match( MUL, TOKENS_FOLLOWING_MUL_IN_addOperand_1239 )

          tree_for_MUL114 = @adaptor.create_with_payload( __MUL114__ )
          root_0 = @adaptor.become_root( tree_for_MUL114, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1244 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:mul)),op.tree]
          # <-- action

        when 2
          # at line 214:5: DIV op= addOperand
          __DIV115__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_addOperand_1252 )

          tree_for_DIV115 = @adaptor.create_with_payload( __DIV115__ )
          root_0 = @adaptor.become_root( tree_for_DIV115, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1257 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:div)),op.tree]
          # <-- action

        when 3
          # at line 215:5: MOD op= addOperand
          __MOD116__ = match( MOD, TOKENS_FOLLOWING_MOD_IN_addOperand_1265 )

          tree_for_MOD116 = @adaptor.create_with_payload( __MOD116__ )
          root_0 = @adaptor.become_root( tree_for_MOD116, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1270 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:mod)),op.tree]
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
    # 219:1: mulOperand returns [result] : ( PLUS mulOperandRest | MINUS mulOperandRest | TO_INT mulOperandRest | TO_FLOAT mulOperandRest | mulOperandRest );
    # 
    def mulOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = MulOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS117__ = nil
      __MINUS119__ = nil
      __TO_INT121__ = nil
      __TO_FLOAT123__ = nil
      mulOperandRest118 = nil
      mulOperandRest120 = nil
      mulOperandRest122 = nil
      mulOperandRest124 = nil
      mulOperandRest125 = nil

      tree_for_PLUS117 = nil
      tree_for_MINUS119 = nil
      tree_for_TO_INT121 = nil
      tree_for_TO_FLOAT123 = nil

      begin
        # at line 220:2: ( PLUS mulOperandRest | MINUS mulOperandRest | TO_INT mulOperandRest | TO_FLOAT mulOperandRest | mulOperandRest )
        alt_34 = 5
        case look_34 = @input.peek( 1 )
        when PLUS then alt_34 = 1
        when MINUS then alt_34 = 2
        when TO_INT then alt_34 = 3
        when TO_FLOAT then alt_34 = 4
        when READ, LB, INT, ID, FLOAT, NEW, STRING, T__64 then alt_34 = 5
        else
          raise NoViableAlternative( "", 34, 0 )
        end
        case alt_34
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 220:4: PLUS mulOperandRest
          __PLUS117__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_mulOperand_1292 )

          tree_for_PLUS117 = @adaptor.create_with_payload( __PLUS117__ )
          @adaptor.add_child( root_0, tree_for_PLUS117 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1294 )
          mulOperandRest118 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest118.tree )
          # --> action
          return_value.result = ( mulOperandRest118.nil? ? nil : mulOperandRest118.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 221:4: MINUS mulOperandRest
          __MINUS119__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_mulOperand_1301 )

          tree_for_MINUS119 = @adaptor.create_with_payload( __MINUS119__ )
          @adaptor.add_child( root_0, tree_for_MINUS119 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1303 )
          mulOperandRest120 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest120.tree )
          # --> action
          return_value.result = [UnaryOperatorTree.new(( mulOperandRest120.nil? ? nil : mulOperandRest120.result ),Operators.method(:neg)),$mulOperandRest120.tree]
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 222:4: TO_INT mulOperandRest
          __TO_INT121__ = match( TO_INT, TOKENS_FOLLOWING_TO_INT_IN_mulOperand_1310 )

          tree_for_TO_INT121 = @adaptor.create_with_payload( __TO_INT121__ )
          @adaptor.add_child( root_0, tree_for_TO_INT121 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1312 )
          mulOperandRest122 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest122.tree )
          # --> action
          return_value.result = [UnaryOperatorTree.new(( mulOperandRest122.nil? ? nil : mulOperandRest122.result ),Operators.method(:int)),$mulOperandRest122.tree]
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 223:4: TO_FLOAT mulOperandRest
          __TO_FLOAT123__ = match( TO_FLOAT, TOKENS_FOLLOWING_TO_FLOAT_IN_mulOperand_1319 )

          tree_for_TO_FLOAT123 = @adaptor.create_with_payload( __TO_FLOAT123__ )
          @adaptor.add_child( root_0, tree_for_TO_FLOAT123 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1321 )
          mulOperandRest124 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest124.tree )
          # --> action
          return_value.result = [UnaryOperatorTree.new(( mulOperandRest124.nil? ? nil : mulOperandRest124.result ),Operators.method(:float)),$mulOperandRest124.tree]
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 224:4: mulOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1328 )
          mulOperandRest125 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest125.tree )
          # --> action
          return_value.result = ( mulOperandRest125.nil? ? nil : mulOperandRest125.result )
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
    # 227:1: mulOperandRest returns [result] : arrayIndexTarget ( '[' expression ']' )* ;
    # 
    def mulOperandRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = MulOperandRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal127 = nil
      char_literal129 = nil
      arrayIndexTarget126 = nil
      expression128 = nil

      tree_for_char_literal127 = nil
      tree_for_char_literal129 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 228:4: arrayIndexTarget ( '[' expression ']' )*
        @state.following.push( TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1345 )
        arrayIndexTarget126 = arrayIndexTarget
        @state.following.pop
        @adaptor.add_child( root_0, arrayIndexTarget126.tree )
        # --> action
        return_value.result = ( arrayIndexTarget126.nil? ? nil : arrayIndexTarget126.result )
        # <-- action
        # at line 229:3: ( '[' expression ']' )*
        while true # decision 35
          alt_35 = 2
          look_35_0 = @input.peek( 1 )

          if ( look_35_0 == T__64 )
            alt_35 = 1

          end
          case alt_35
          when 1
            # at line 229:4: '[' expression ']'
            char_literal127 = match( T__64, TOKENS_FOLLOWING_T__64_IN_mulOperandRest_1353 )

            tree_for_char_literal127 = @adaptor.create_with_payload( char_literal127 )
            @adaptor.add_child( root_0, tree_for_char_literal127 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_mulOperandRest_1355 )
            expression128 = expression
            @state.following.pop
            @adaptor.add_child( root_0, expression128.tree )
            char_literal129 = match( T__65, TOKENS_FOLLOWING_T__65_IN_mulOperandRest_1357 )

            tree_for_char_literal129 = @adaptor.create_with_payload( char_literal129 )
            @adaptor.add_child( root_0, tree_for_char_literal129 )

            # --> action
             return_value.result = [IndexTree.new(return_value.result,( expression128.nil? ? nil : expression128.result )),expression128.tree] 
            # <-- action

          else
            break # out of loop for decision 35
          end
        end # loop for decision 35
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
    # 232:1: arrayIndexTarget returns [result] : ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction | new );
    # 
    def arrayIndexTarget
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = ArrayIndexTargetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID130__ = nil
      __LB131__ = nil
      __RB133__ = nil
      __INT134__ = nil
      __FLOAT135__ = nil
      expression132 = nil
      string136 = nil
      call137 = nil
      array138 = nil
      readInstruction139 = nil
      new140 = nil

      tree_for_ID130 = nil
      tree_for_LB131 = nil
      tree_for_RB133 = nil
      tree_for_INT134 = nil
      tree_for_FLOAT135 = nil

      begin
        # at line 233:2: ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction | new )
        alt_36 = 9
        alt_36 = @dfa36.predict( @input )
        case alt_36
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 233:4: ID
          __ID130__ = match( ID, TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1379 )

          tree_for_ID130 = @adaptor.create_with_payload( __ID130__ )
          @adaptor.add_child( root_0, tree_for_ID130 )

          # --> action
          return_value.result = [VarTree.new(__ID130__.text),tree_for_ID130]
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 234:4: LB expression RB
          __LB131__ = match( LB, TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1386 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1389 )
          expression132 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression132.tree )
          __RB133__ = match( RB, TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1391 )
          # --> action
          return_value.result = ( expression132.nil? ? nil : expression132.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 235:4: INT
          __INT134__ = match( INT, TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1399 )

          tree_for_INT134 = @adaptor.create_with_payload( __INT134__ )
          @adaptor.add_child( root_0, tree_for_INT134 )

          # --> action
          return_value.result = [AtomTree.new(__INT134__.text.to_i),tree_for_INT134]
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 236:4: FLOAT
          __FLOAT135__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_arrayIndexTarget_1406 )

          tree_for_FLOAT135 = @adaptor.create_with_payload( __FLOAT135__ )
          @adaptor.add_child( root_0, tree_for_FLOAT135 )

          # --> action
          return_value.result = [AtomTree.new(__FLOAT135__.text.to_f),tree_for_FLOAT135]
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 237:4: string
          @state.following.push( TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1413 )
          string136 = string
          @state.following.pop
          @adaptor.add_child( root_0, string136.tree )
          # --> action
          return_value.result = [AtomTree.new(( string136.nil? ? nil : string136.result )),string136.tree]
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 238:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1420 )
          call137 = call
          @state.following.pop
          @adaptor.add_child( root_0, call137.tree )
          # --> action
          return_value.result = ( call137.nil? ? nil : call137.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 239:4: array
          @state.following.push( TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1427 )
          array138 = array
          @state.following.pop
          @adaptor.add_child( root_0, array138.tree )
          # --> action
          return_value.result = [ArrayTree.new(( array138.nil? ? nil : array138.result )),array138.tree]
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 240:4: readInstruction
          @state.following.push( TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1434 )
          readInstruction139 = readInstruction
          @state.following.pop
          @adaptor.add_child( root_0, readInstruction139.tree )
          # --> action
          return_value.result = ( readInstruction139.nil? ? nil : readInstruction139.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 241:4: new
          @state.following.push( TOKENS_FOLLOWING_new_IN_arrayIndexTarget_1441 )
          new140 = new
          @state.following.pop
          @adaptor.add_child( root_0, new140.tree )
          # --> action
          return_value.result = ( new140.nil? ? nil : new140.result )
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

    NewReturnValue = define_return_scope :result

    # 
    # parser rule new
    # 
    # (in Giraffe.g)
    # 244:1: new returns [result] : NEW ID ( LB ( args )? RB )? ;
    # 
    def new
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = NewReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NEW141__ = nil
      __ID142__ = nil
      __LB143__ = nil
      __RB145__ = nil
      args144 = nil

      tree_for_NEW141 = nil
      tree_for_ID142 = nil
      tree_for_LB143 = nil
      tree_for_RB145 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 245:4: NEW ID ( LB ( args )? RB )?
        __NEW141__ = match( NEW, TOKENS_FOLLOWING_NEW_IN_new_1458 )

        tree_for_NEW141 = @adaptor.create_with_payload( __NEW141__ )
        @adaptor.add_child( root_0, tree_for_NEW141 )

        __ID142__ = match( ID, TOKENS_FOLLOWING_ID_IN_new_1460 )

        tree_for_ID142 = @adaptor.create_with_payload( __ID142__ )
        @adaptor.add_child( root_0, tree_for_ID142 )

        # at line 245:11: ( LB ( args )? RB )?
        alt_38 = 2
        look_38_0 = @input.peek( 1 )

        if ( look_38_0 == LB )
          alt_38 = 1
        end
        case alt_38
        when 1
          # at line 245:12: LB ( args )? RB
          __LB143__ = match( LB, TOKENS_FOLLOWING_LB_IN_new_1463 )

          tree_for_LB143 = @adaptor.create_with_payload( __LB143__ )
          @adaptor.add_child( root_0, tree_for_LB143 )

          # at line 245:15: ( args )?
          alt_37 = 2
          look_37_0 = @input.peek( 1 )

          if ( look_37_0 == READ || look_37_0 == LB || look_37_0.between?( PLUS, INT ) || look_37_0 == ID || look_37_0.between?( TO_INT, NEW ) || look_37_0 == STRING || look_37_0 == T__64 )
            alt_37 = 1
          end
          case alt_37
          when 1
            # at line 245:15: args
            @state.following.push( TOKENS_FOLLOWING_args_IN_new_1465 )
            args144 = args
            @state.following.pop
            @adaptor.add_child( root_0, args144.tree )

          end
          __RB145__ = match( RB, TOKENS_FOLLOWING_RB_IN_new_1468 )

          tree_for_RB145 = @adaptor.create_with_payload( __RB145__ )
          @adaptor.add_child( root_0, tree_for_RB145 )


        end
        # --> action
        return_value.result = [NewTree.new(__ID142__.text,( args144.nil? ? nil : args144.list )),tree_for_NEW141]
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

    ArrayReturnValue = define_return_scope :result

    # 
    # parser rule array
    # 
    # (in Giraffe.g)
    # 248:1: array returns [result] : '[' (ex1= expression ( COMMA ex2= expression )* )? ']' ;
    # 
    def array
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = ArrayReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal146 = nil
      __COMMA147__ = nil
      char_literal148 = nil
      ex1 = nil
      ex2 = nil

      tree_for_char_literal146 = nil
      tree_for_COMMA147 = nil
      tree_for_char_literal148 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 249:4: '[' (ex1= expression ( COMMA ex2= expression )* )? ']'
        char_literal146 = match( T__64, TOKENS_FOLLOWING_T__64_IN_array_1487 )

        tree_for_char_literal146 = @adaptor.create_with_payload( char_literal146 )
        @adaptor.add_child( root_0, tree_for_char_literal146 )

        # --> action
        return_value.result = []
        # <-- action
        # at line 250:3: (ex1= expression ( COMMA ex2= expression )* )?
        alt_40 = 2
        look_40_0 = @input.peek( 1 )

        if ( look_40_0 == READ || look_40_0 == LB || look_40_0.between?( PLUS, INT ) || look_40_0 == ID || look_40_0.between?( TO_INT, NEW ) || look_40_0 == STRING || look_40_0 == T__64 )
          alt_40 = 1
        end
        case alt_40
        when 1
          # at line 250:4: ex1= expression ( COMMA ex2= expression )*
          @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1496 )
          ex1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, ex1.tree )
          # --> action
          return_value.result << ( ex1.nil? ? nil : ex1.result )
          # <-- action
          # at line 251:3: ( COMMA ex2= expression )*
          while true # decision 39
            alt_39 = 2
            look_39_0 = @input.peek( 1 )

            if ( look_39_0 == COMMA )
              alt_39 = 1

            end
            case alt_39
            when 1
              # at line 251:4: COMMA ex2= expression
              __COMMA147__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_array_1503 )

              tree_for_COMMA147 = @adaptor.create_with_payload( __COMMA147__ )
              @adaptor.add_child( root_0, tree_for_COMMA147 )

              @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1507 )
              ex2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, ex2.tree )
              # --> action
              return_value.result << ( ex2.nil? ? nil : ex2.result )
              # <-- action

            else
              break # out of loop for decision 39
            end
          end # loop for decision 39

        end
        char_literal148 = match( T__65, TOKENS_FOLLOWING_T__65_IN_array_1518 )

        tree_for_char_literal148 = @adaptor.create_with_payload( char_literal148 )
        @adaptor.add_child( root_0, tree_for_char_literal148 )

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

    AssignmentReturnValue = define_return_scope :result

    # 
    # parser rule assignment
    # 
    # (in Giraffe.g)
    # 258:1: assignment returns [result] : var= ID ( ASSIGN op1= expression | ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) ) | ( DOT method2= ID LB (args2= args )? RB )+ ) ;
    # 
    def assignment
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = AssignmentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      var = nil
      method1 = nil
      method2 = nil
      __ASSIGN149__ = nil
      char_literal150 = nil
      char_literal151 = nil
      __ASSIGN152__ = nil
      __DOT153__ = nil
      __LB154__ = nil
      __RB155__ = nil
      __DOT156__ = nil
      __LB157__ = nil
      __RB158__ = nil
      op1 = nil
      index = nil
      op2 = nil
      args1 = nil
      args2 = nil

      tree_for_var = nil
      tree_for_method1 = nil
      tree_for_method2 = nil
      tree_for_ASSIGN149 = nil
      tree_for_char_literal150 = nil
      tree_for_char_literal151 = nil
      tree_for_ASSIGN152 = nil
      tree_for_DOT153 = nil
      tree_for_LB154 = nil
      tree_for_RB155 = nil
      tree_for_DOT156 = nil
      tree_for_LB157 = nil
      tree_for_RB158 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 259:4: var= ID ( ASSIGN op1= expression | ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) ) | ( DOT method2= ID LB (args2= args )? RB )+ )
        var = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1540 )

        tree_for_var = @adaptor.create_with_payload( var )
        @adaptor.add_child( root_0, tree_for_var )

        # --> action
        return_value.result = VarTree.new(var.text)
        # <-- action
        # at line 260:3: ( ASSIGN op1= expression | ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) ) | ( DOT method2= ID LB (args2= args )? RB )+ )
        alt_47 = 3
        case look_47 = @input.peek( 1 )
        when ASSIGN then alt_47 = 1
        when T__64 then alt_47 = 2
        when DOT then alt_47 = 3
        else
          raise NoViableAlternative( "", 47, 0 )
        end
        case alt_47
        when 1
          # at line 260:5: ASSIGN op1= expression
          __ASSIGN149__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1548 )

          tree_for_ASSIGN149 = @adaptor.create_with_payload( __ASSIGN149__ )
          root_0 = @adaptor.become_root( tree_for_ASSIGN149, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1553 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # --> action
           return_value.result = AssignTree.new(var.text,( op1.nil? ? nil : op1.result )) 
          # <-- action

        when 2
          # at line 261:5: ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) )
          # --> action
          index=nil
          # <-- action
          # at line 262:4: ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) )
          # at line 262:5: ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ )
          # at file 262:5: ( '[' index= expression ']' )+
          match_count_41 = 0
          while true
            alt_41 = 2
            look_41_0 = @input.peek( 1 )

            if ( look_41_0 == T__64 )
              alt_41 = 1

            end
            case alt_41
            when 1
              # at line 262:7: '[' index= expression ']'
              # --> action
              index_ = index
              # <-- action
              char_literal150 = match( T__64, TOKENS_FOLLOWING_T__64_IN_assignment_1572 )

              tree_for_char_literal150 = @adaptor.create_with_payload( char_literal150 )
              @adaptor.add_child( root_0, tree_for_char_literal150 )

              @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1576 )
              index = expression
              @state.following.pop
              @adaptor.add_child( root_0, index.tree )
              char_literal151 = match( T__65, TOKENS_FOLLOWING_T__65_IN_assignment_1578 )

              tree_for_char_literal151 = @adaptor.create_with_payload( char_literal151 )
              @adaptor.add_child( root_0, tree_for_char_literal151 )

              # --> action
              target_ = return_value.result; return_value.result = IndexTree.new(return_value.result,( index.nil? ? nil : index.result ))
              # <-- action

            else
              match_count_41 > 0 and break
              eee = EarlyExit(41)


              raise eee
            end
            match_count_41 += 1
          end

          # at line 263:4: ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ )
          alt_44 = 2
          look_44_0 = @input.peek( 1 )

          if ( look_44_0 == ASSIGN )
            alt_44 = 1
          elsif ( look_44_0 == DOT )
            alt_44 = 2
          else
            raise NoViableAlternative( "", 44, 0 )
          end
          case alt_44
          when 1
            # at line 263:6: ASSIGN op2= expression
            __ASSIGN152__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1591 )

            tree_for_ASSIGN152 = @adaptor.create_with_payload( __ASSIGN152__ )
            root_0 = @adaptor.become_root( tree_for_ASSIGN152, root_0 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1596 )
            op2 = expression
            @state.following.pop
            @adaptor.add_child( root_0, op2.tree )
            # --> action
             return_value.result = DerefTree.new(target_,( index.nil? ? nil : index.result ),( op2.nil? ? nil : op2.result )) 
            # <-- action

          when 2
            # at line 264:6: ( DOT method1= ID LB (args1= args )? RB )+
            # at file 264:6: ( DOT method1= ID LB (args1= args )? RB )+
            match_count_43 = 0
            while true
              alt_43 = 2
              look_43_0 = @input.peek( 1 )

              if ( look_43_0 == DOT )
                alt_43 = 1

              end
              case alt_43
              when 1
                # at line 264:7: DOT method1= ID LB (args1= args )? RB
                __DOT153__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_assignment_1611 )

                tree_for_DOT153 = @adaptor.create_with_payload( __DOT153__ )
                @adaptor.add_child( root_0, tree_for_DOT153 )

                method1 = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1615 )

                tree_for_method1 = @adaptor.create_with_payload( method1 )
                @adaptor.add_child( root_0, tree_for_method1 )

                __LB154__ = match( LB, TOKENS_FOLLOWING_LB_IN_assignment_1617 )
                # at line 264:31: (args1= args )?
                alt_42 = 2
                look_42_0 = @input.peek( 1 )

                if ( look_42_0 == READ || look_42_0 == LB || look_42_0.between?( PLUS, INT ) || look_42_0 == ID || look_42_0.between?( TO_INT, NEW ) || look_42_0 == STRING || look_42_0 == T__64 )
                  alt_42 = 1
                end
                case alt_42
                when 1
                  # at line 264:31: args1= args
                  @state.following.push( TOKENS_FOLLOWING_args_IN_assignment_1622 )
                  args1 = args
                  @state.following.pop
                  @adaptor.add_child( root_0, args1.tree )

                end
                __RB155__ = match( RB, TOKENS_FOLLOWING_RB_IN_assignment_1625 )
                # --> action
                return_value.result = MethodCallTree.new(return_value.result,method1.text,( args1.nil? ? nil : args1.list ))
                # <-- action

              else
                match_count_43 > 0 and break
                eee = EarlyExit(43)


                raise eee
              end
              match_count_43 += 1
            end


          end


        when 3
          # at line 266:5: ( DOT method2= ID LB (args2= args )? RB )+
          # at file 266:5: ( DOT method2= ID LB (args2= args )? RB )+
          match_count_46 = 0
          while true
            alt_46 = 2
            look_46_0 = @input.peek( 1 )

            if ( look_46_0 == DOT )
              alt_46 = 1

            end
            case alt_46
            when 1
              # at line 266:6: DOT method2= ID LB (args2= args )? RB
              __DOT156__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_assignment_1643 )

              tree_for_DOT156 = @adaptor.create_with_payload( __DOT156__ )
              @adaptor.add_child( root_0, tree_for_DOT156 )

              method2 = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1647 )

              tree_for_method2 = @adaptor.create_with_payload( method2 )
              @adaptor.add_child( root_0, tree_for_method2 )

              __LB157__ = match( LB, TOKENS_FOLLOWING_LB_IN_assignment_1649 )
              # at line 266:30: (args2= args )?
              alt_45 = 2
              look_45_0 = @input.peek( 1 )

              if ( look_45_0 == READ || look_45_0 == LB || look_45_0.between?( PLUS, INT ) || look_45_0 == ID || look_45_0.between?( TO_INT, NEW ) || look_45_0 == STRING || look_45_0 == T__64 )
                alt_45 = 1
              end
              case alt_45
              when 1
                # at line 266:30: args2= args
                @state.following.push( TOKENS_FOLLOWING_args_IN_assignment_1654 )
                args2 = args
                @state.following.pop
                @adaptor.add_child( root_0, args2.tree )

              end
              __RB158__ = match( RB, TOKENS_FOLLOWING_RB_IN_assignment_1657 )
              # --> action
              return_value.result = MethodCallTree.new(return_value.result,method2.text,( args2.nil? ? nil : args2.list )) 
              # <-- action

            else
              match_count_46 > 0 and break
              eee = EarlyExit(46)


              raise eee
            end
            match_count_46 += 1
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
        # trace_out( __method__, 34 )

      end
      
      return return_value
    end

    BoolReturnValue = define_return_scope :result

    # 
    # parser rule bool
    # 
    # (in Giraffe.g)
    # 270:1: bool returns [result] : ( TRUE | FALSE );
    # 
    def bool
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = BoolReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __TRUE159__ = nil
      __FALSE160__ = nil

      tree_for_TRUE159 = nil
      tree_for_FALSE160 = nil

      begin
        # at line 271:2: ( TRUE | FALSE )
        alt_48 = 2
        look_48_0 = @input.peek( 1 )

        if ( look_48_0 == TRUE )
          alt_48 = 1
        elsif ( look_48_0 == FALSE )
          alt_48 = 2
        else
          raise NoViableAlternative( "", 48, 0 )
        end
        case alt_48
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 271:4: TRUE
          __TRUE159__ = match( TRUE, TOKENS_FOLLOWING_TRUE_IN_bool_1684 )

          tree_for_TRUE159 = @adaptor.create_with_payload( __TRUE159__ )
          @adaptor.add_child( root_0, tree_for_TRUE159 )

          # --> action
          return_value.result = AtomTree.new(true)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 272:5: FALSE
          __FALSE160__ = match( FALSE, TOKENS_FOLLOWING_FALSE_IN_bool_1692 )

          tree_for_FALSE160 = @adaptor.create_with_payload( __FALSE160__ )
          @adaptor.add_child( root_0, tree_for_FALSE160 )

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
        # trace_out( __method__, 35 )

      end
      
      return return_value
    end

    StringReturnValue = define_return_scope :result

    # 
    # parser rule string
    # 
    # (in Giraffe.g)
    # 275:1: string returns [result] : STRING ;
    # 
    def string
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = StringReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __STRING161__ = nil

      tree_for_STRING161 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 276:4: STRING
        __STRING161__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_string_1710 )

        tree_for_STRING161 = @adaptor.create_with_payload( __STRING161__ )
        @adaptor.add_child( root_0, tree_for_STRING161 )

        # --> action
        return_value.result = __STRING161__.text[1..-2]
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
        # trace_out( __method__, 36 )

      end
      
      return return_value
    end

    ClassDefReturnValue = define_return_scope :result

    # 
    # parser rule classDef
    # 
    # (in Giraffe.g)
    # 283:1: classDef returns [result] : CLASS classid= ID ( SUPERCLASS superclassid= ID )? LCB block RCB ;
    # 
    def classDef
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = ClassDefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      classid = nil
      superclassid = nil
      __CLASS162__ = nil
      __SUPERCLASS163__ = nil
      __LCB164__ = nil
      __RCB166__ = nil
      block165 = nil

      tree_for_classid = nil
      tree_for_superclassid = nil
      tree_for_CLASS162 = nil
      tree_for_SUPERCLASS163 = nil
      tree_for_LCB164 = nil
      tree_for_RCB166 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 284:4: CLASS classid= ID ( SUPERCLASS superclassid= ID )? LCB block RCB
        # --> action
        superclass=nil
        # <-- action
        __CLASS162__ = match( CLASS, TOKENS_FOLLOWING_CLASS_IN_classDef_1773 )

        tree_for_CLASS162 = @adaptor.create_with_payload( __CLASS162__ )
        root_0 = @adaptor.become_root( tree_for_CLASS162, root_0 )

        classid = match( ID, TOKENS_FOLLOWING_ID_IN_classDef_1778 )

        tree_for_classid = @adaptor.create_with_payload( classid )
        @adaptor.add_child( root_0, tree_for_classid )

        # at line 285:21: ( SUPERCLASS superclassid= ID )?
        alt_49 = 2
        look_49_0 = @input.peek( 1 )

        if ( look_49_0 == SUPERCLASS )
          alt_49 = 1
        end
        case alt_49
        when 1
          # at line 285:22: SUPERCLASS superclassid= ID
          __SUPERCLASS163__ = match( SUPERCLASS, TOKENS_FOLLOWING_SUPERCLASS_IN_classDef_1781 )

          tree_for_SUPERCLASS163 = @adaptor.create_with_payload( __SUPERCLASS163__ )
          @adaptor.add_child( root_0, tree_for_SUPERCLASS163 )

          superclassid = match( ID, TOKENS_FOLLOWING_ID_IN_classDef_1785 )

          tree_for_superclassid = @adaptor.create_with_payload( superclassid )
          @adaptor.add_child( root_0, tree_for_superclassid )

          # --> action
          superclass=superclassid.text
          # <-- action

        end
        __LCB164__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_classDef_1791 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_classDef_1798 )
        block165 = block
        @state.following.pop
        @adaptor.add_child( root_0, block165.tree )
        __RCB166__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_classDef_1802 )
        # --> action
        return_value.result = ClassTree.new(classid.text,( block165.nil? ? nil : block165.list ),superclass)
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



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA5 < ANTLR3::DFA
      EOT = unpack( 16, -1 )
      EOF = unpack( 1, 12, 15, -1 )
      MIN = unpack( 1, 4, 1, 10, 14, -1 )
      MAX = unpack( 1, 63, 1, 64, 14, -1 )
      ACCEPT = unpack( 2, -1, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 
                       1, 10, 1, 11, 1, 13, 1, 14, 1, 12, 1, 1, 1, 2 )
      SPECIAL = unpack( 16, -1 )
      TRANSITION = [
        unpack( 2, 12, 1, -1, 1, 10, 1, 8, 1, 9, 5, -1, 1, 6, 2, 7, 1, -1, 
                1, 3, 1, -1, 1, 12, 3, -1, 1, 4, 1, 5, 1, 2, 1, 1, 22, -1, 
                1, 11, 10, -1, 2, 12 ),
        unpack( 1, 13, 9, -1, 1, 15, 7, -1, 1, 15, 1, 14, 16, -1, 1, 14, 
                 17, -1, 1, 14 ),
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
          63:1: instruction returns [result] : ( assignment | func | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | classDef | );
        __dfa_description__
      end
    end
    class DFA36 < ANTLR3::DFA
      EOT = unpack( 11, -1 )
      EOF = unpack( 1, -1, 1, 10, 9, -1 )
      MIN = unpack( 1, 6, 1, 4, 9, -1 )
      MAX = unpack( 1, 64, 1, 65, 9, -1 )
      ACCEPT = unpack( 2, -1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 7, 1, 8, 1, 9, 
                       1, 6, 1, 1 )
      SPECIAL = unpack( 11, -1 )
      TRANSITION = [
        unpack( 1, 7, 3, -1, 1, 2, 3, -1, 1, 3, 13, -1, 1, 1, 15, -1, 1, 
                4, 1, 8, 3, -1, 1, 5, 14, -1, 1, 6 ),
        unpack( 2, 10, 4, -1, 1, 9, 3, 10, 4, -1, 1, 10, 1, -1, 2, 10, 
                 8, -1, 2, 10, 1, -1, 9, 10, 20, -1, 4, 10 ),
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
      
      @decision = 36
      

      def description
        <<-'__dfa_description__'.strip!
          232:1: arrayIndexTarget returns [result] : ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction | new );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa5 = DFA5.new( self, 5 )
      @dfa36 = DFA36.new( self, 36 )

    end
    TOKENS_FOLLOWING_block_IN_program_56 = Set[ 1 ]
    TOKENS_FOLLOWING_instruction_IN_block_78 = Set[ 4, 5, 62, 63 ]
    TOKENS_FOLLOWING_instructionRest_IN_block_88 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_instructionRest_114 = Set[ 62, 63 ]
    TOKENS_FOLLOWING_T__62_IN_instructionRest_118 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_instructionRest_122 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_128 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_instructionRest_135 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_IN_instruction_164 = Set[ 1 ]
    TOKENS_FOLLOWING_func_IN_instruction_171 = Set[ 1 ]
    TOKENS_FOLLOWING_forCycle_IN_instruction_178 = Set[ 1 ]
    TOKENS_FOLLOWING_ifInstruction_IN_instruction_185 = Set[ 1 ]
    TOKENS_FOLLOWING_whileCycle_IN_instruction_192 = Set[ 1 ]
    TOKENS_FOLLOWING_doCycle_IN_instruction_199 = Set[ 1 ]
    TOKENS_FOLLOWING_printInstruction_IN_instruction_206 = Set[ 1 ]
    TOKENS_FOLLOWING_printlInstruction_IN_instruction_213 = Set[ 1 ]
    TOKENS_FOLLOWING_returnInstruction_IN_instruction_220 = Set[ 1 ]
    TOKENS_FOLLOWING_exitInstruction_IN_instruction_228 = Set[ 1 ]
    TOKENS_FOLLOWING_breakInstruction_IN_instruction_235 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_instruction_242 = Set[ 1 ]
    TOKENS_FOLLOWING_classDef_IN_instruction_249 = Set[ 1 ]
    TOKENS_FOLLOWING_READ_IN_readInstruction_273 = Set[ 1 ]
    TOKENS_FOLLOWING_BREAK_IN_breakInstruction_290 = Set[ 1 ]
    TOKENS_FOLLOWING_RETURN_IN_returnInstruction_307 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_returnInstruction_310 = Set[ 1 ]
    TOKENS_FOLLOWING_EXIT_IN_exitInstruction_327 = Set[ 1, 10, 12, 13, 14 ]
    TOKENS_FOLLOWING_LB_IN_exitInstruction_332 = Set[ 12, 13, 14 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_337 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_exitInstruction_339 = Set[ 1 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_352 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_statusCode_377 = Set[ 14 ]
    TOKENS_FOLLOWING_MINUS_IN_statusCode_381 = Set[ 14 ]
    TOKENS_FOLLOWING_INT_IN_statusCode_387 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINT_IN_printInstruction_408 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printInstruction_411 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_printlInstruction_432 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printlInstruction_441 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_printText_461 = Set[ 1, 18 ]
    TOKENS_FOLLOWING_COMMA_IN_printText_468 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printText_472 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_ifInstruction_495 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_ifInstruction_498 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_ifInstruction_500 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifInstruction_503 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_ifInstruction_505 = Set[ 22, 23, 24 ]
    TOKENS_FOLLOWING_ifRest_IN_ifInstruction_508 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_ifRest_527 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_529 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifRest_532 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_534 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_ifRest_542 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_ifRest_550 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_552 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifRest_555 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_557 = Set[ 22, 23, 24 ]
    TOKENS_FOLLOWING_ifRest_IN_ifRest_562 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_whileCycle_589 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_whileCycle_591 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_whileCycle_593 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_whileCycle_596 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_whileCycle_598 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_doCycle_620 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_doCycle_622 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_doCycle_625 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_doCycle_627 = Set[ 25 ]
    TOKENS_FOLLOWING_WHILE_IN_doCycle_630 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_doCycle_632 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_forCycle_653 = Set[ 28 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_657 = Set[ 4, 5, 62, 63 ]
    TOKENS_FOLLOWING_COMMENT_IN_forCycle_662 = Set[ 62, 63 ]
    TOKENS_FOLLOWING_T__62_IN_forCycle_666 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_forCycle_670 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_676 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_forCycle_681 = Set[ 4, 5, 62, 63 ]
    TOKENS_FOLLOWING_COMMENT_IN_forCycle_686 = Set[ 62, 63 ]
    TOKENS_FOLLOWING_T__62_IN_forCycle_690 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_forCycle_694 = Set[ 28 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_700 = Set[ 28 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_707 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_forCycle_709 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_forCycle_712 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_forCycle_714 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_func_736 = Set[ 20, 28 ]
    TOKENS_FOLLOWING_params_IN_func_739 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_func_742 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_func_745 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_func_747 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_params_767 = Set[ 18 ]
    TOKENS_FOLLOWING_paramRest_IN_params_769 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_paramRest_788 = Set[ 28 ]
    TOKENS_FOLLOWING_params_IN_paramRest_791 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_call_820 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_call_823 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_call_828 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_call_831 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_DOT_IN_call_842 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_call_846 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_call_848 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_call_853 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_call_856 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_expression_IN_args_878 = Set[ 18 ]
    TOKENS_FOLLOWING_argsRest_IN_args_880 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsRest_899 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_argsRest_902 = Set[ 1 ]
    TOKENS_FOLLOWING_orOperand_IN_condition_928 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_OR_IN_condition_935 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_condition_940 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperand_IN_orOperand_961 = Set[ 1, 31 ]
    TOKENS_FOLLOWING_AND_IN_orOperand_968 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_orOperand_IN_orOperand_973 = Set[ 1 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_992 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_boolOperand_999 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_boolOperand_1001 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_boolOperand_1004 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_boolOperand_1006 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1016 = Set[ 33, 34, 35, 36, 37, 38 ]
    TOKENS_FOLLOWING_EQ_IN_boolOperand_1019 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1026 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1032 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_boolOperand_1043 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1050 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1056 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_boolOperand_1067 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1074 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1080 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_boolOperand_1091 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1098 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1104 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_boolOperand_1115 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1122 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1128 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_boolOperand_1139 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1146 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1152 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperand_IN_expression_1177 = Set[ 1, 12, 13 ]
    TOKENS_FOLLOWING_PLUS_IN_expression_1188 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_expression_1193 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expression_1201 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_expression_1206 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperand_1228 = Set[ 1, 39, 40, 41 ]
    TOKENS_FOLLOWING_MUL_IN_addOperand_1239 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1244 = Set[ 1 ]
    TOKENS_FOLLOWING_DIV_IN_addOperand_1252 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1257 = Set[ 1 ]
    TOKENS_FOLLOWING_MOD_IN_addOperand_1265 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1270 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_mulOperand_1292 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1294 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_mulOperand_1301 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1303 = Set[ 1 ]
    TOKENS_FOLLOWING_TO_INT_IN_mulOperand_1310 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1312 = Set[ 1 ]
    TOKENS_FOLLOWING_TO_FLOAT_IN_mulOperand_1319 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1321 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1328 = Set[ 1 ]
    TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1345 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_T__64_IN_mulOperandRest_1353 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_mulOperandRest_1355 = Set[ 65 ]
    TOKENS_FOLLOWING_T__65_IN_mulOperandRest_1357 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1379 = Set[ 1 ]
    TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1386 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1389 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1391 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1399 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_arrayIndexTarget_1406 = Set[ 1 ]
    TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1413 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1420 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1427 = Set[ 1 ]
    TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1434 = Set[ 1 ]
    TOKENS_FOLLOWING_new_IN_arrayIndexTarget_1441 = Set[ 1 ]
    TOKENS_FOLLOWING_NEW_IN_new_1458 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_new_1460 = Set[ 1, 10 ]
    TOKENS_FOLLOWING_LB_IN_new_1463 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_new_1465 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_new_1468 = Set[ 1 ]
    TOKENS_FOLLOWING_T__64_IN_array_1487 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64, 65 ]
    TOKENS_FOLLOWING_expression_IN_array_1496 = Set[ 18, 65 ]
    TOKENS_FOLLOWING_COMMA_IN_array_1503 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_array_1507 = Set[ 18, 65 ]
    TOKENS_FOLLOWING_T__65_IN_array_1518 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1540 = Set[ 29, 46, 64 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1548 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1553 = Set[ 1 ]
    TOKENS_FOLLOWING_T__64_IN_assignment_1572 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1576 = Set[ 65 ]
    TOKENS_FOLLOWING_T__65_IN_assignment_1578 = Set[ 29, 46, 64 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1591 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1596 = Set[ 1 ]
    TOKENS_FOLLOWING_DOT_IN_assignment_1611 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1615 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_assignment_1617 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_assignment_1622 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_assignment_1625 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_DOT_IN_assignment_1643 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1647 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_assignment_1649 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_assignment_1654 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_assignment_1657 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_TRUE_IN_bool_1684 = Set[ 1 ]
    TOKENS_FOLLOWING_FALSE_IN_bool_1692 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_string_1710 = Set[ 1 ]
    TOKENS_FOLLOWING_CLASS_IN_classDef_1773 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_classDef_1778 = Set[ 20, 52 ]
    TOKENS_FOLLOWING_SUPERCLASS_IN_classDef_1781 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_classDef_1785 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_classDef_1791 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_classDef_1798 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_classDef_1802 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end


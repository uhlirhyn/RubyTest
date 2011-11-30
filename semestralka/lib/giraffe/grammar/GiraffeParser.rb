#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-11-30 10:14:01
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

    RULE_METHODS = [ :program, :functions, :block, :instructionRest, :instruction, 
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
    # 44:1: program returns [result] : functions block ;
    # 
    def program
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )
      return_value = ProgramReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      functions1 = nil
      block2 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 45:4: functions block
        @state.following.push( TOKENS_FOLLOWING_functions_IN_program_56 )
        functions1 = functions
        @state.following.pop
        @adaptor.add_child( root_0, functions1.tree )
        @state.following.push( TOKENS_FOLLOWING_block_IN_program_58 )
        block2 = block
        @state.following.pop
        @adaptor.add_child( root_0, block2.tree )
        # --> action
        return_value.result = ProgramTree.new(( functions1.nil? ? nil : functions1.list ), ( block2.nil? ? nil : block2.list ))
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

    FunctionsReturnValue = define_return_scope :list

    # 
    # parser rule functions
    # 
    # (in Giraffe.g)
    # 48:1: functions returns [list] : ( func )* ;
    # 
    def functions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )
      return_value = FunctionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      func3 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 49:4: ( func )*
        # --> action
        return_value.list = []
        # <-- action
        # at line 50:3: ( func )*
        while true # decision 1
          alt_1 = 2
          look_1_0 = @input.peek( 1 )

          if ( look_1_0 == ID )
            look_1_1 = @input.peek( 2 )

            if ( look_1_1 == LCB || look_1_1 == ID )
              alt_1 = 1

            end

          end
          case alt_1
          when 1
            # at line 50:4: func
            @state.following.push( TOKENS_FOLLOWING_func_IN_functions_81 )
            func3 = func
            @state.following.pop
            @adaptor.add_child( root_0, func3.tree )
            # --> action
            return_value.list << ( func3.nil? ? nil : func3.result )
            # <-- action

          else
            break # out of loop for decision 1
          end
        end # loop for decision 1
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
    # 53:1: block returns [list] : instruction instructionRest ;
    # 
    def block
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )
      return_value = BlockReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      instruction4 = nil
      instructionRest5 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 54:4: instruction instructionRest
        # --> action
        return_value.list = []
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_instruction_IN_block_104 )
        instruction4 = instruction
        @state.following.pop
        @adaptor.add_child( root_0, instruction4.tree )
        # --> action
        return_value.list = [[( instruction4.nil? ? nil : instruction4.result ),instruction4.tree]] unless ( instruction4.nil? ? nil : instruction4.result ) == nil
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_instructionRest_IN_block_114 )
        instructionRest5 = instructionRest
        @state.following.pop
        @adaptor.add_child( root_0, instructionRest5.tree )
        # --> action
        return_value.list = return_value.list + ( instructionRest5.nil? ? nil : instructionRest5.list )
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
    # 61:1: instructionRest returns [list] : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | );
    # 
    def instructionRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )
      return_value = InstructionRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMENT6__ = nil
      char_literal7 = nil
      char_literal8 = nil
      __SEMICOLON9__ = nil
      block10 = nil

      tree_for_COMMENT6 = nil
      tree_for_char_literal7 = nil
      tree_for_char_literal8 = nil
      tree_for_SEMICOLON9 = nil

      begin
        # at line 62:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | )
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0.between?( COMMENT, SEMICOLON ) || look_5_0.between?( T__62, T__63 ) )
          alt_5 = 1
        elsif ( look_5_0 == EOF || look_5_0 == RCB )
          alt_5 = 2
        else
          raise NoViableAlternative( "", 5, 0 )
        end
        case alt_5
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 62:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block
          # at line 62:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
          alt_4 = 2
          look_4_0 = @input.peek( 1 )

          if ( look_4_0 == COMMENT || look_4_0.between?( T__62, T__63 ) )
            alt_4 = 1
          elsif ( look_4_0 == SEMICOLON )
            alt_4 = 2
          else
            raise NoViableAlternative( "", 4, 0 )
          end
          case alt_4
          when 1
            # at line 62:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 62:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 62:8: ( COMMENT )? ( '\\r' )? '\\n'
            # at line 62:15: ( COMMENT )?
            alt_2 = 2
            look_2_0 = @input.peek( 1 )

            if ( look_2_0 == COMMENT )
              alt_2 = 1
            end
            case alt_2
            when 1
              # at line 62:15: COMMENT
              __COMMENT6__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_instructionRest_140 )

            end
            # at line 62:22: ( '\\r' )?
            alt_3 = 2
            look_3_0 = @input.peek( 1 )

            if ( look_3_0 == T__62 )
              alt_3 = 1
            end
            case alt_3
            when 1
              # at line 62:22: '\\r'
              char_literal7 = match( T__62, TOKENS_FOLLOWING_T__62_IN_instructionRest_144 )

            end
            char_literal8 = match( T__63, TOKENS_FOLLOWING_T__63_IN_instructionRest_148 )


          when 2
            # at line 62:34: SEMICOLON
            __SEMICOLON9__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_154 )

          end
          @state.following.push( TOKENS_FOLLOWING_block_IN_instructionRest_161 )
          block10 = block
          @state.following.pop
          @adaptor.add_child( root_0, block10.tree )
          # --> action
          return_value.list = ( block10.nil? ? nil : block10.list )
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
    # 68:1: instruction returns [result] : ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | classDef | );
    # 
    def instruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      return_value = InstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      assignment11 = nil
      forCycle12 = nil
      ifInstruction13 = nil
      whileCycle14 = nil
      doCycle15 = nil
      printInstruction16 = nil
      printlInstruction17 = nil
      returnInstruction18 = nil
      exitInstruction19 = nil
      breakInstruction20 = nil
      call21 = nil
      classDef22 = nil


      begin
        # at line 69:2: ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | classDef | )
        alt_6 = 13
        alt_6 = @dfa6.predict( @input )
        case alt_6
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 69:4: assignment
          @state.following.push( TOKENS_FOLLOWING_assignment_IN_instruction_190 )
          assignment11 = assignment
          @state.following.pop
          @adaptor.add_child( root_0, assignment11.tree )
          # --> action
          return_value.result = ( assignment11.nil? ? nil : assignment11.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 70:4: forCycle
          @state.following.push( TOKENS_FOLLOWING_forCycle_IN_instruction_197 )
          forCycle12 = forCycle
          @state.following.pop
          @adaptor.add_child( root_0, forCycle12.tree )
          # --> action
          return_value.result = ( forCycle12.nil? ? nil : forCycle12.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 71:4: ifInstruction
          @state.following.push( TOKENS_FOLLOWING_ifInstruction_IN_instruction_204 )
          ifInstruction13 = ifInstruction
          @state.following.pop
          @adaptor.add_child( root_0, ifInstruction13.tree )
          # --> action
          return_value.result = ( ifInstruction13.nil? ? nil : ifInstruction13.result )
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 72:4: whileCycle
          @state.following.push( TOKENS_FOLLOWING_whileCycle_IN_instruction_211 )
          whileCycle14 = whileCycle
          @state.following.pop
          @adaptor.add_child( root_0, whileCycle14.tree )
          # --> action
          return_value.result = ( whileCycle14.nil? ? nil : whileCycle14.result )
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 73:4: doCycle
          @state.following.push( TOKENS_FOLLOWING_doCycle_IN_instruction_218 )
          doCycle15 = doCycle
          @state.following.pop
          @adaptor.add_child( root_0, doCycle15.tree )
          # --> action
          return_value.result = ( doCycle15.nil? ? nil : doCycle15.result )
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 74:4: printInstruction
          @state.following.push( TOKENS_FOLLOWING_printInstruction_IN_instruction_225 )
          printInstruction16 = printInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printInstruction16.tree )
          # --> action
          return_value.result = ( printInstruction16.nil? ? nil : printInstruction16.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 75:4: printlInstruction
          @state.following.push( TOKENS_FOLLOWING_printlInstruction_IN_instruction_232 )
          printlInstruction17 = printlInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printlInstruction17.tree )
          # --> action
          return_value.result = ( printlInstruction17.nil? ? nil : printlInstruction17.result )
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 76:4: returnInstruction
          @state.following.push( TOKENS_FOLLOWING_returnInstruction_IN_instruction_239 )
          returnInstruction18 = returnInstruction
          @state.following.pop
          @adaptor.add_child( root_0, returnInstruction18.tree )
          # --> action
          return_value.result = ( returnInstruction18.nil? ? nil : returnInstruction18.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 77:4: exitInstruction
          @state.following.push( TOKENS_FOLLOWING_exitInstruction_IN_instruction_247 )
          exitInstruction19 = exitInstruction
          @state.following.pop
          @adaptor.add_child( root_0, exitInstruction19.tree )
          # --> action
          return_value.result = ( exitInstruction19.nil? ? nil : exitInstruction19.result )
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 78:4: breakInstruction
          @state.following.push( TOKENS_FOLLOWING_breakInstruction_IN_instruction_254 )
          breakInstruction20 = breakInstruction
          @state.following.pop
          @adaptor.add_child( root_0, breakInstruction20.tree )
          # --> action
          return_value.result = ( breakInstruction20.nil? ? nil : breakInstruction20.result )
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 79:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_instruction_261 )
          call21 = call
          @state.following.pop
          @adaptor.add_child( root_0, call21.tree )
          # --> action
          return_value.result = ( call21.nil? ? nil : call21.result )
          # <-- action

        when 12
          root_0 = @adaptor.create_flat_list


          # at line 80:4: classDef
          @state.following.push( TOKENS_FOLLOWING_classDef_IN_instruction_268 )
          classDef22 = classDef
          @state.following.pop
          @adaptor.add_child( root_0, classDef22.tree )
          # --> action
          return_value.result = ( classDef22.nil? ? nil : classDef22.result )
          # <-- action

        when 13
          root_0 = @adaptor.create_flat_list


          # at line 81:4: 
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
    # 84:1: readInstruction returns [result] : READ ;
    # 
    def readInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      return_value = ReadInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __READ23__ = nil

      tree_for_READ23 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 85:4: READ
        __READ23__ = match( READ, TOKENS_FOLLOWING_READ_IN_readInstruction_292 )

        tree_for_READ23 = @adaptor.create_with_payload( __READ23__ )
        @adaptor.add_child( root_0, tree_for_READ23 )

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
    # 88:1: breakInstruction returns [result] : BREAK ;
    # 
    def breakInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )
      return_value = BreakInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BREAK24__ = nil

      tree_for_BREAK24 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 89:4: BREAK
        __BREAK24__ = match( BREAK, TOKENS_FOLLOWING_BREAK_IN_breakInstruction_309 )

        tree_for_BREAK24 = @adaptor.create_with_payload( __BREAK24__ )
        @adaptor.add_child( root_0, tree_for_BREAK24 )

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
    # 92:1: returnInstruction returns [result] : RETURN expression ;
    # 
    def returnInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      return_value = ReturnInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __RETURN25__ = nil
      expression26 = nil

      tree_for_RETURN25 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 93:4: RETURN expression
        __RETURN25__ = match( RETURN, TOKENS_FOLLOWING_RETURN_IN_returnInstruction_326 )

        tree_for_RETURN25 = @adaptor.create_with_payload( __RETURN25__ )
        root_0 = @adaptor.become_root( tree_for_RETURN25, root_0 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_returnInstruction_329 )
        expression26 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression26.tree )
        # --> action
        return_value.result = ReturnTree.new(( expression26.nil? ? nil : expression26.result ))
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
    # 96:1: exitInstruction returns [result] : EXIT ( LB alt1= statusCode RB | alt2= statusCode )? ;
    # 
    def exitInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = ExitInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __EXIT27__ = nil
      __LB28__ = nil
      __RB29__ = nil
      alt1 = nil
      alt2 = nil

      tree_for_EXIT27 = nil
      tree_for_LB28 = nil
      tree_for_RB29 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 97:4: EXIT ( LB alt1= statusCode RB | alt2= statusCode )?
        __EXIT27__ = match( EXIT, TOKENS_FOLLOWING_EXIT_IN_exitInstruction_346 )

        tree_for_EXIT27 = @adaptor.create_with_payload( __EXIT27__ )
        root_0 = @adaptor.become_root( tree_for_EXIT27, root_0 )

        # at line 97:11: ( LB alt1= statusCode RB | alt2= statusCode )?
        alt_7 = 3
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == LB )
          alt_7 = 1
        elsif ( look_7_0.between?( PLUS, INT ) )
          alt_7 = 2
        end
        case alt_7
        when 1
          # at line 97:12: LB alt1= statusCode RB
          __LB28__ = match( LB, TOKENS_FOLLOWING_LB_IN_exitInstruction_351 )
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_356 )
          alt1 = statusCode
          @state.following.pop
          @adaptor.add_child( root_0, alt1.tree )
          __RB29__ = match( RB, TOKENS_FOLLOWING_RB_IN_exitInstruction_358 )
          # --> action
          return_value.result = ExitTree.new(( alt1.nil? ? nil : alt1.result ))
          # <-- action

        when 2
          # at line 98:6: alt2= statusCode
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_371 )
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
    # 101:1: statusCode returns [result] : ( PLUS | MINUS )? INT ;
    # 
    def statusCode
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = StatusCodeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS30__ = nil
      __MINUS31__ = nil
      __INT32__ = nil

      tree_for_PLUS30 = nil
      tree_for_MINUS31 = nil
      tree_for_INT32 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 102:4: ( PLUS | MINUS )? INT
        # --> action
        sign = ""
        # <-- action
        # at line 103:3: ( PLUS | MINUS )?
        alt_8 = 3
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == PLUS )
          alt_8 = 1
        elsif ( look_8_0 == MINUS )
          alt_8 = 2
        end
        case alt_8
        when 1
          # at line 103:4: PLUS
          __PLUS30__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_statusCode_396 )

          tree_for_PLUS30 = @adaptor.create_with_payload( __PLUS30__ )
          @adaptor.add_child( root_0, tree_for_PLUS30 )


        when 2
          # at line 103:11: MINUS
          __MINUS31__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_statusCode_400 )

          tree_for_MINUS31 = @adaptor.create_with_payload( __MINUS31__ )
          @adaptor.add_child( root_0, tree_for_MINUS31 )

          # --> action
          sign = __MINUS31__.text
          # <-- action

        end
        __INT32__ = match( INT, TOKENS_FOLLOWING_INT_IN_statusCode_406 )

        tree_for_INT32 = @adaptor.create_with_payload( __INT32__ )
        @adaptor.add_child( root_0, tree_for_INT32 )

        # --> action
        (sign + __INT32__.text).to_i
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
    # 107:1: printInstruction returns [result] : PRINT printText ;
    # 
    def printInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = PrintInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PRINT33__ = nil
      printText34 = nil

      tree_for_PRINT33 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 108:5: PRINT printText
        __PRINT33__ = match( PRINT, TOKENS_FOLLOWING_PRINT_IN_printInstruction_427 )

        tree_for_PRINT33 = @adaptor.create_with_payload( __PRINT33__ )
        root_0 = @adaptor.become_root( tree_for_PRINT33, root_0 )

        @state.following.push( TOKENS_FOLLOWING_printText_IN_printInstruction_430 )
        printText34 = printText
        @state.following.pop
        @adaptor.add_child( root_0, printText34.tree )
        # --> action
        return_value.result = PrintTree.new(( printText34.nil? ? nil : printText34.list ))
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
    # 111:1: printlInstruction returns [result] : ( PRINTL | PRINTLN ) printText ;
    # 
    def printlInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = PrintlInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set35 = nil
      printText36 = nil

      tree_for_set35 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 112:5: ( PRINTL | PRINTLN ) printText
        set35 = @input.look
        set35 = @input.look
        if @input.peek( 1 ).between?( PRINTL, PRINTLN )
          @input.consume
          root_0 = @adaptor.become_root( @adaptor.create_with_payload( set35 ), root_0 )
          @state.error_recovery = false
        else
          mse = MismatchedSet( nil )
          raise mse
        end


        @state.following.push( TOKENS_FOLLOWING_printText_IN_printlInstruction_460 )
        printText36 = printText
        @state.following.pop
        @adaptor.add_child( root_0, printText36.tree )
        # --> action
        return_value.result = PrintTree.new(( printText36.nil? ? nil : printText36.list ),true)
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
    # 115:1: printText returns [list] : expression ( COMMA rest= printText )? ;
    # 
    def printText
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = PrintTextReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA38__ = nil
      rest = nil
      expression37 = nil

      tree_for_COMMA38 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 116:4: expression ( COMMA rest= printText )?
        @state.following.push( TOKENS_FOLLOWING_expression_IN_printText_480 )
        expression37 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression37.tree )
        # --> action
        return_value.list = [( expression37.nil? ? nil : expression37.result )]
        # <-- action
        # at line 117:3: ( COMMA rest= printText )?
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == COMMA )
          alt_9 = 1
        end
        case alt_9
        when 1
          # at line 117:4: COMMA rest= printText
          __COMMA38__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_printText_487 )

          tree_for_COMMA38 = @adaptor.create_with_payload( __COMMA38__ )
          @adaptor.add_child( root_0, tree_for_COMMA38 )

          @state.following.push( TOKENS_FOLLOWING_printText_IN_printText_491 )
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
    # 120:1: ifInstruction returns [result] : IF condition LCB block RCB ifRest ;
    # 
    def ifInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
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


        # at line 121:4: IF condition LCB block RCB ifRest
        __IF39__ = match( IF, TOKENS_FOLLOWING_IF_IN_ifInstruction_514 )

        tree_for_IF39 = @adaptor.create_with_payload( __IF39__ )
        root_0 = @adaptor.become_root( tree_for_IF39, root_0 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_ifInstruction_517 )
        condition40 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition40.tree )
        __LCB41__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifInstruction_519 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_ifInstruction_522 )
        block42 = block
        @state.following.pop
        @adaptor.add_child( root_0, block42.tree )
        __RCB43__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifInstruction_524 )
        @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifInstruction_527 )
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
        # trace_out( __method__, 14 )

      end
      
      return return_value
    end

    IfRestReturnValue = define_return_scope :result

    # 
    # parser rule ifRest
    # 
    # (in Giraffe.g)
    # 125:1: ifRest returns [result] : ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | );
    # 
    def ifRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
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
        # at line 126:2: ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | )
        alt_10 = 3
        case look_10 = @input.peek( 1 )
        when ELSE then alt_10 = 1
        when ELSEIF, ELIF then alt_10 = 2
        when EOF, COMMENT, SEMICOLON, RCB, T__62, T__63 then alt_10 = 3
        else
          raise NoViableAlternative( "", 10, 0 )
        end
        case alt_10
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 126:4: ELSE LCB block RCB
          __ELSE45__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_ifRest_546 )

          tree_for_ELSE45 = @adaptor.create_with_payload( __ELSE45__ )
          @adaptor.add_child( root_0, tree_for_ELSE45 )

          __LCB46__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_548 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_551 )
          block47 = block
          @state.following.pop
          @adaptor.add_child( root_0, block47.tree )
          __RCB48__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_553 )
          # --> action
          return_value.result = ( block47.nil? ? nil : block47.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 127:4: ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest
          set49 = @input.look
          if @input.peek( 1 ).between?( ELSEIF, ELIF )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set49 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          @state.following.push( TOKENS_FOLLOWING_condition_IN_ifRest_569 )
          condition50 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition50.tree )
          __LCB51__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_571 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_574 )
          block52 = block
          @state.following.pop
          @adaptor.add_child( root_0, block52.tree )
          __RCB53__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_576 )
          @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifRest_581 )
          op = ifRest
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = IfTree.new(( condition50.nil? ? nil : condition50.result ),( block52.nil? ? nil : block52.list ),( op.nil? ? nil : op.result ))
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 129:4: 
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
    # 132:1: whileCycle returns [result] : WHILE condition LCB block RCB ;
    # 
    def whileCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
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


        # at line 133:5: WHILE condition LCB block RCB
        __WHILE54__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_whileCycle_608 )

        tree_for_WHILE54 = @adaptor.create_with_payload( __WHILE54__ )
        @adaptor.add_child( root_0, tree_for_WHILE54 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_whileCycle_610 )
        condition55 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition55.tree )
        __LCB56__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_whileCycle_612 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_whileCycle_615 )
        block57 = block
        @state.following.pop
        @adaptor.add_child( root_0, block57.tree )
        __RCB58__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_whileCycle_617 )
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
        # trace_out( __method__, 16 )

      end
      
      return return_value
    end

    DoCycleReturnValue = define_return_scope :result

    # 
    # parser rule doCycle
    # 
    # (in Giraffe.g)
    # 137:1: doCycle returns [result] : DO LCB block RCB WHILE condition ;
    # 
    def doCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
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


        # at line 138:4: DO LCB block RCB WHILE condition
        __DO59__ = match( DO, TOKENS_FOLLOWING_DO_IN_doCycle_639 )

        tree_for_DO59 = @adaptor.create_with_payload( __DO59__ )
        @adaptor.add_child( root_0, tree_for_DO59 )

        __LCB60__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_doCycle_641 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_doCycle_644 )
        block61 = block
        @state.following.pop
        @adaptor.add_child( root_0, block61.tree )
        __RCB62__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_doCycle_646 )
        __WHILE63__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_doCycle_649 )

        tree_for_WHILE63 = @adaptor.create_with_payload( __WHILE63__ )
        @adaptor.add_child( root_0, tree_for_WHILE63 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_doCycle_651 )
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
        # trace_out( __method__, 17 )

      end
      
      return return_value
    end

    ForCycleReturnValue = define_return_scope :result

    # 
    # parser rule forCycle
    # 
    # (in Giraffe.g)
    # 142:1: forCycle returns [result] : FOR as1= assignment ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) condition ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) as2= assignment LCB block RCB ;
    # 
    def forCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = ForCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __FOR65__ = nil
      __COMMENT66__ = nil
      char_literal67 = nil
      char_literal68 = nil
      __SEMICOLON69__ = nil
      __COMMENT71__ = nil
      char_literal72 = nil
      char_literal73 = nil
      __SEMICOLON74__ = nil
      __LCB75__ = nil
      __RCB77__ = nil
      as1 = nil
      as2 = nil
      condition70 = nil
      block76 = nil

      tree_for_FOR65 = nil
      tree_for_COMMENT66 = nil
      tree_for_char_literal67 = nil
      tree_for_char_literal68 = nil
      tree_for_SEMICOLON69 = nil
      tree_for_COMMENT71 = nil
      tree_for_char_literal72 = nil
      tree_for_char_literal73 = nil
      tree_for_SEMICOLON74 = nil
      tree_for_LCB75 = nil
      tree_for_RCB77 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 143:4: FOR as1= assignment ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) condition ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) as2= assignment LCB block RCB
        __FOR65__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_forCycle_672 )

        tree_for_FOR65 = @adaptor.create_with_payload( __FOR65__ )
        @adaptor.add_child( root_0, tree_for_FOR65 )

        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_676 )
        as1 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as1.tree )
        # at line 143:23: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == COMMENT || look_13_0.between?( T__62, T__63 ) )
          alt_13 = 1
        elsif ( look_13_0 == SEMICOLON )
          alt_13 = 2
        else
          raise NoViableAlternative( "", 13, 0 )
        end
        case alt_13
        when 1
          # at line 143:24: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 143:24: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 143:26: ( COMMENT )? ( '\\r' )? '\\n'
          # at line 143:33: ( COMMENT )?
          alt_11 = 2
          look_11_0 = @input.peek( 1 )

          if ( look_11_0 == COMMENT )
            alt_11 = 1
          end
          case alt_11
          when 1
            # at line 143:33: COMMENT
            __COMMENT66__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_forCycle_681 )

          end
          # at line 143:40: ( '\\r' )?
          alt_12 = 2
          look_12_0 = @input.peek( 1 )

          if ( look_12_0 == T__62 )
            alt_12 = 1
          end
          case alt_12
          when 1
            # at line 143:40: '\\r'
            char_literal67 = match( T__62, TOKENS_FOLLOWING_T__62_IN_forCycle_685 )

          end
          char_literal68 = match( T__63, TOKENS_FOLLOWING_T__63_IN_forCycle_689 )


        when 2
          # at line 143:52: SEMICOLON
          __SEMICOLON69__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_695 )

        end
        @state.following.push( TOKENS_FOLLOWING_condition_IN_forCycle_700 )
        condition70 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition70.tree )
        # at line 143:75: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == COMMENT || look_16_0.between?( T__62, T__63 ) )
          alt_16 = 1
        elsif ( look_16_0 == SEMICOLON )
          alt_16 = 2
        else
          raise NoViableAlternative( "", 16, 0 )
        end
        case alt_16
        when 1
          # at line 143:76: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 143:76: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 143:78: ( COMMENT )? ( '\\r' )? '\\n'
          # at line 143:85: ( COMMENT )?
          alt_14 = 2
          look_14_0 = @input.peek( 1 )

          if ( look_14_0 == COMMENT )
            alt_14 = 1
          end
          case alt_14
          when 1
            # at line 143:85: COMMENT
            __COMMENT71__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_forCycle_705 )

          end
          # at line 143:92: ( '\\r' )?
          alt_15 = 2
          look_15_0 = @input.peek( 1 )

          if ( look_15_0 == T__62 )
            alt_15 = 1
          end
          case alt_15
          when 1
            # at line 143:92: '\\r'
            char_literal72 = match( T__62, TOKENS_FOLLOWING_T__62_IN_forCycle_709 )

          end
          char_literal73 = match( T__63, TOKENS_FOLLOWING_T__63_IN_forCycle_713 )


        when 2
          # at line 143:104: SEMICOLON
          __SEMICOLON74__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_719 )

        end
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_726 )
        as2 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as2.tree )
        __LCB75__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_forCycle_728 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_forCycle_731 )
        block76 = block
        @state.following.pop
        @adaptor.add_child( root_0, block76.tree )
        __RCB77__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_forCycle_733 )
        # --> action
        return_value.result = ForTree.new(( as1.nil? ? nil : as1.result ),( condition70.nil? ? nil : condition70.result ),( as2.nil? ? nil : as2.result ),( block76.nil? ? nil : block76.list ))
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
    # 147:1: func returns [result] : ID ( params )? LCB block RCB ;
    # 
    def func
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = FuncReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID78__ = nil
      __LCB80__ = nil
      __RCB82__ = nil
      params79 = nil
      block81 = nil

      tree_for_ID78 = nil
      tree_for_LCB80 = nil
      tree_for_RCB82 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 148:4: ID ( params )? LCB block RCB
        __ID78__ = match( ID, TOKENS_FOLLOWING_ID_IN_func_755 )

        tree_for_ID78 = @adaptor.create_with_payload( __ID78__ )
        root_0 = @adaptor.become_root( tree_for_ID78, root_0 )

        # at line 148:8: ( params )?
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == ID )
          alt_17 = 1
        end
        case alt_17
        when 1
          # at line 148:8: params
          @state.following.push( TOKENS_FOLLOWING_params_IN_func_758 )
          params79 = params
          @state.following.pop
          @adaptor.add_child( root_0, params79.tree )

        end
        __LCB80__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_761 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_func_764 )
        block81 = block
        @state.following.pop
        @adaptor.add_child( root_0, block81.tree )
        __RCB82__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_766 )
        # --> action
        return_value.result = FuncTree.new(__ID78__.text,( params79.nil? ? nil : params79.list ),( block81.nil? ? nil : block81.list ))
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
    # 152:1: params returns [list] : ID paramRest ;
    # 
    def params
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = ParamsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID83__ = nil
      paramRest84 = nil

      tree_for_ID83 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 153:4: ID paramRest
        __ID83__ = match( ID, TOKENS_FOLLOWING_ID_IN_params_786 )

        tree_for_ID83 = @adaptor.create_with_payload( __ID83__ )
        @adaptor.add_child( root_0, tree_for_ID83 )

        @state.following.push( TOKENS_FOLLOWING_paramRest_IN_params_788 )
        paramRest84 = paramRest
        @state.following.pop
        @adaptor.add_child( root_0, paramRest84.tree )
        # --> action
        return_value.list = [__ID83__.text] + ( paramRest84.nil? ? nil : paramRest84.list )
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
    # 157:1: paramRest returns [list] : ( COMMA params | );
    # 
    def paramRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = ParamRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA85__ = nil
      params86 = nil

      tree_for_COMMA85 = nil

      begin
        # at line 158:2: ( COMMA params | )
        alt_18 = 2
        look_18_0 = @input.peek( 1 )

        if ( look_18_0 == COMMA )
          alt_18 = 1
        elsif ( look_18_0 == LCB )
          alt_18 = 2
        else
          raise NoViableAlternative( "", 18, 0 )
        end
        case alt_18
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 158:4: COMMA params
          __COMMA85__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_paramRest_807 )
          @state.following.push( TOKENS_FOLLOWING_params_IN_paramRest_810 )
          params86 = params
          @state.following.pop
          @adaptor.add_child( root_0, params86.tree )
          # --> action
          return_value.list = ( params86.nil? ? nil : params86.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 160:4: 
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
    # 163:1: call returns [result] : fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )* ;
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
      __LB87__ = nil
      __RB88__ = nil
      __DOT89__ = nil
      __LB90__ = nil
      __RB91__ = nil
      args1 = nil
      args2 = nil

      tree_for_fun = nil
      tree_for_method = nil
      tree_for_LB87 = nil
      tree_for_RB88 = nil
      tree_for_DOT89 = nil
      tree_for_LB90 = nil
      tree_for_RB91 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 164:4: fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )*
        fun = match( ID, TOKENS_FOLLOWING_ID_IN_call_839 )

        tree_for_fun = @adaptor.create_with_payload( fun )
        root_0 = @adaptor.become_root( tree_for_fun, root_0 )

        __LB87__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_842 )
        # at line 164:21: (args1= args )?
        alt_19 = 2
        look_19_0 = @input.peek( 1 )

        if ( look_19_0 == READ || look_19_0 == LB || look_19_0.between?( PLUS, INT ) || look_19_0 == ID || look_19_0.between?( TO_INT, NEW ) || look_19_0 == STRING || look_19_0 == T__64 )
          alt_19 = 1
        end
        case alt_19
        when 1
          # at line 164:21: args1= args
          @state.following.push( TOKENS_FOLLOWING_args_IN_call_847 )
          args1 = args
          @state.following.pop
          @adaptor.add_child( root_0, args1.tree )

        end
        __RB88__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_850 )
        # --> action
        return_value.result = [CallTree.new(fun.text,( args1.nil? ? nil : args1.list )),tree_for_fun]
        # <-- action
        # at line 166:3: ( DOT method= ID LB (args2= args )? RB )*
        while true # decision 21
          alt_21 = 2
          look_21_0 = @input.peek( 1 )

          if ( look_21_0 == DOT )
            alt_21 = 1

          end
          case alt_21
          when 1
            # at line 166:5: DOT method= ID LB (args2= args )? RB
            __DOT89__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_call_861 )

            tree_for_DOT89 = @adaptor.create_with_payload( __DOT89__ )
            @adaptor.add_child( root_0, tree_for_DOT89 )

            method = match( ID, TOKENS_FOLLOWING_ID_IN_call_865 )

            tree_for_method = @adaptor.create_with_payload( method )
            @adaptor.add_child( root_0, tree_for_method )

            __LB90__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_867 )
            # at line 166:28: (args2= args )?
            alt_20 = 2
            look_20_0 = @input.peek( 1 )

            if ( look_20_0 == READ || look_20_0 == LB || look_20_0.between?( PLUS, INT ) || look_20_0 == ID || look_20_0.between?( TO_INT, NEW ) || look_20_0 == STRING || look_20_0 == T__64 )
              alt_20 = 1
            end
            case alt_20
            when 1
              # at line 166:28: args2= args
              @state.following.push( TOKENS_FOLLOWING_args_IN_call_872 )
              args2 = args
              @state.following.pop
              @adaptor.add_child( root_0, args2.tree )

            end
            __RB91__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_875 )
            # --> action
            return_value.result = [MethodCallTree.new(return_value.result,method.text,( args2.nil? ? nil : args2.list )),tree_for_method]
            # <-- action

          else
            break # out of loop for decision 21
          end
        end # loop for decision 21
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
    # 169:1: args returns [list] : expression argsRest ;
    # 
    def args
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ArgsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      expression92 = nil
      argsRest93 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 170:5: expression argsRest
        @state.following.push( TOKENS_FOLLOWING_expression_IN_args_897 )
        expression92 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression92.tree )
        @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_899 )
        argsRest93 = argsRest
        @state.following.pop
        @adaptor.add_child( root_0, argsRest93.tree )
        # --> action
        return_value.list = [( expression92.nil? ? nil : expression92.result )] + ( argsRest93.nil? ? nil : argsRest93.list )
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
    # 173:1: argsRest returns [list] : ( COMMA args | );
    # 
    def argsRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = ArgsRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA94__ = nil
      args95 = nil

      tree_for_COMMA94 = nil

      begin
        # at line 174:2: ( COMMA args | )
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == COMMA )
          alt_22 = 1
        elsif ( look_22_0 == RB )
          alt_22 = 2
        else
          raise NoViableAlternative( "", 22, 0 )
        end
        case alt_22
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 174:4: COMMA args
          __COMMA94__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsRest_918 )
          @state.following.push( TOKENS_FOLLOWING_args_IN_argsRest_921 )
          args95 = args
          @state.following.pop
          @adaptor.add_child( root_0, args95.tree )
          # --> action
          return_value.list = ( args95.nil? ? nil : args95.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 176:4: 
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
    # 181:1: condition returns [result] : orOperand ( OR op= condition )? ;
    # 
    def condition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = ConditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OR97__ = nil
      op = nil
      orOperand96 = nil

      tree_for_OR97 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 182:4: orOperand ( OR op= condition )?
        @state.following.push( TOKENS_FOLLOWING_orOperand_IN_condition_947 )
        orOperand96 = orOperand
        @state.following.pop
        @adaptor.add_child( root_0, orOperand96.tree )
        # --> action
        return_value.result = ( orOperand96.nil? ? nil : orOperand96.result )
        # <-- action
        # at line 183:3: ( OR op= condition )?
        alt_23 = 2
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == OR )
          alt_23 = 1
        end
        case alt_23
        when 1
          # at line 183:4: OR op= condition
          __OR97__ = match( OR, TOKENS_FOLLOWING_OR_IN_condition_954 )

          tree_for_OR97 = @adaptor.create_with_payload( __OR97__ )
          root_0 = @adaptor.become_root( tree_for_OR97, root_0 )

          @state.following.push( TOKENS_FOLLOWING_condition_IN_condition_959 )
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
        # trace_out( __method__, 25 )

      end
      
      return return_value
    end

    OrOperandReturnValue = define_return_scope :result

    # 
    # parser rule orOperand
    # 
    # (in Giraffe.g)
    # 188:1: orOperand returns [result] : boolOperand ( AND op= orOperand )? ;
    # 
    def orOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = OrOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __AND99__ = nil
      op = nil
      boolOperand98 = nil

      tree_for_AND99 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 189:4: boolOperand ( AND op= orOperand )?
        @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_orOperand_980 )
        boolOperand98 = boolOperand
        @state.following.pop
        @adaptor.add_child( root_0, boolOperand98.tree )
        # --> action
        return_value.result = ( boolOperand98.nil? ? nil : boolOperand98.result )
        # <-- action
        # at line 190:3: ( AND op= orOperand )?
        alt_24 = 2
        look_24_0 = @input.peek( 1 )

        if ( look_24_0 == AND )
          alt_24 = 1
        end
        case alt_24
        when 1
          # at line 190:4: AND op= orOperand
          __AND99__ = match( AND, TOKENS_FOLLOWING_AND_IN_orOperand_987 )

          tree_for_AND99 = @adaptor.create_with_payload( __AND99__ )
          root_0 = @adaptor.become_root( tree_for_AND99, root_0 )

          @state.following.push( TOKENS_FOLLOWING_orOperand_IN_orOperand_992 )
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
        # trace_out( __method__, 26 )

      end
      
      return return_value
    end

    BoolOperandReturnValue = define_return_scope :result

    # 
    # parser rule boolOperand
    # 
    # (in Giraffe.g)
    # 193:1: boolOperand returns [result] : ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) );
    # 
    def boolOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = BoolOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NOT101__ = nil
      __LB102__ = nil
      __RB104__ = nil
      __EQ105__ = nil
      __NE106__ = nil
      __LT107__ = nil
      __GT108__ = nil
      __LE109__ = nil
      __GE110__ = nil
      op1 = nil
      op2 = nil
      bool100 = nil
      condition103 = nil

      tree_for_NOT101 = nil
      tree_for_LB102 = nil
      tree_for_RB104 = nil
      tree_for_EQ105 = nil
      tree_for_NE106 = nil
      tree_for_LT107 = nil
      tree_for_GT108 = nil
      tree_for_LE109 = nil
      tree_for_GE110 = nil

      begin
        # at line 194:2: ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) )
        alt_32 = 3
        case look_32 = @input.peek( 1 )
        when TRUE, FALSE then alt_32 = 1
        when NOT then alt_32 = 2
        when READ, LB, PLUS, MINUS, INT, ID, TO_INT, TO_FLOAT, FLOAT, NEW, STRING, T__64 then alt_32 = 3
        else
          raise NoViableAlternative( "", 32, 0 )
        end
        case alt_32
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 194:4: bool
          @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1011 )
          bool100 = bool
          @state.following.pop
          @adaptor.add_child( root_0, bool100.tree )
          # --> action
          return_value.result = ( bool100.nil? ? nil : bool100.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 195:4: NOT LB condition RB
          __NOT101__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_boolOperand_1018 )

          tree_for_NOT101 = @adaptor.create_with_payload( __NOT101__ )
          @adaptor.add_child( root_0, tree_for_NOT101 )

          __LB102__ = match( LB, TOKENS_FOLLOWING_LB_IN_boolOperand_1020 )
          @state.following.push( TOKENS_FOLLOWING_condition_IN_boolOperand_1023 )
          condition103 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition103.tree )
          __RB104__ = match( RB, TOKENS_FOLLOWING_RB_IN_boolOperand_1025 )
          # --> action
          return_value.result = !( condition103.nil? ? nil : condition103.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 196:4: op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1035 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # at line 196:19: ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          alt_31 = 6
          case look_31 = @input.peek( 1 )
          when EQ then alt_31 = 1
          when NE then alt_31 = 2
          when LT then alt_31 = 3
          when GT then alt_31 = 4
          when LE then alt_31 = 5
          when GE then alt_31 = 6
          else
            raise NoViableAlternative( "", 31, 0 )
          end
          case alt_31
          when 1
            # at line 196:20: EQ (op2= bool | op2= expression )
            __EQ105__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_boolOperand_1038 )

            tree_for_EQ105 = @adaptor.create_with_payload( __EQ105__ )
            root_0 = @adaptor.become_root( tree_for_EQ105, root_0 )

            # at line 196:24: (op2= bool | op2= expression )
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
              # at line 196:26: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1045 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 196:37: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1051 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:eq)),op2.tree]
            # <-- action

          when 2
            # at line 197:6: NE (op2= bool | op2= expression )
            __NE106__ = match( NE, TOKENS_FOLLOWING_NE_IN_boolOperand_1062 )

            tree_for_NE106 = @adaptor.create_with_payload( __NE106__ )
            root_0 = @adaptor.become_root( tree_for_NE106, root_0 )

            # at line 197:10: (op2= bool | op2= expression )
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
              # at line 197:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1069 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 197:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1075 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:ne)),op2.tree]
            # <-- action

          when 3
            # at line 198:6: LT (op2= bool | op2= expression )
            __LT107__ = match( LT, TOKENS_FOLLOWING_LT_IN_boolOperand_1086 )

            tree_for_LT107 = @adaptor.create_with_payload( __LT107__ )
            root_0 = @adaptor.become_root( tree_for_LT107, root_0 )

            # at line 198:10: (op2= bool | op2= expression )
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
              # at line 198:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1093 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 198:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1099 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:lt)),op2.tree]
            # <-- action

          when 4
            # at line 199:6: GT (op2= bool | op2= expression )
            __GT108__ = match( GT, TOKENS_FOLLOWING_GT_IN_boolOperand_1110 )

            tree_for_GT108 = @adaptor.create_with_payload( __GT108__ )
            root_0 = @adaptor.become_root( tree_for_GT108, root_0 )

            # at line 199:10: (op2= bool | op2= expression )
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
              # at line 199:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1117 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 199:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1123 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:gt)),op2.tree]
            # <-- action

          when 5
            # at line 200:6: LE (op2= bool | op2= expression )
            __LE109__ = match( LE, TOKENS_FOLLOWING_LE_IN_boolOperand_1134 )

            tree_for_LE109 = @adaptor.create_with_payload( __LE109__ )
            root_0 = @adaptor.become_root( tree_for_LE109, root_0 )

            # at line 200:10: (op2= bool | op2= expression )
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
              # at line 200:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1141 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 200:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1147 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:le)),op2.tree]
            # <-- action

          when 6
            # at line 201:6: GE (op2= bool | op2= expression )
            __GE110__ = match( GE, TOKENS_FOLLOWING_GE_IN_boolOperand_1158 )

            tree_for_GE110 = @adaptor.create_with_payload( __GE110__ )
            root_0 = @adaptor.become_root( tree_for_GE110, root_0 )

            # at line 201:10: (op2= bool | op2= expression )
            alt_30 = 2
            look_30_0 = @input.peek( 1 )

            if ( look_30_0.between?( TRUE, FALSE ) )
              alt_30 = 1
            elsif ( look_30_0 == READ || look_30_0 == LB || look_30_0.between?( PLUS, INT ) || look_30_0 == ID || look_30_0.between?( TO_INT, NEW ) || look_30_0 == STRING || look_30_0 == T__64 )
              alt_30 = 2
            else
              raise NoViableAlternative( "", 30, 0 )
            end
            case alt_30
            when 1
              # at line 201:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1165 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 201:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1171 )
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
        # trace_out( __method__, 27 )

      end
      
      return return_value
    end

    ExpressionReturnValue = define_return_scope :result

    # 
    # parser rule expression
    # 
    # (in Giraffe.g)
    # 206:1: expression returns [result] : addOperand ( PLUS op= expression | MINUS op= expression )? ;
    # 
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS112__ = nil
      __MINUS113__ = nil
      op = nil
      addOperand111 = nil

      tree_for_PLUS112 = nil
      tree_for_MINUS113 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 207:4: addOperand ( PLUS op= expression | MINUS op= expression )?
        @state.following.push( TOKENS_FOLLOWING_addOperand_IN_expression_1196 )
        addOperand111 = addOperand
        @state.following.pop
        @adaptor.add_child( root_0, addOperand111.tree )
        # --> action
        return_value.result = ( addOperand111.nil? ? nil : addOperand111.result )
        # <-- action
        # at line 208:3: ( PLUS op= expression | MINUS op= expression )?
        alt_33 = 3
        look_33_0 = @input.peek( 1 )

        if ( look_33_0 == PLUS )
          alt_33 = 1
        elsif ( look_33_0 == MINUS )
          alt_33 = 2
        end
        case alt_33
        when 1
          # at line 209:4: PLUS op= expression
          __PLUS112__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expression_1207 )

          tree_for_PLUS112 = @adaptor.create_with_payload( __PLUS112__ )
          root_0 = @adaptor.become_root( tree_for_PLUS112, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1212 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:add)),op.tree]
          # <-- action

        when 2
          # at line 210:5: MINUS op= expression
          __MINUS113__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expression_1220 )

          tree_for_MINUS113 = @adaptor.create_with_payload( __MINUS113__ )
          root_0 = @adaptor.become_root( tree_for_MINUS113, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1225 )
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
        # trace_out( __method__, 28 )

      end
      
      return return_value
    end

    AddOperandReturnValue = define_return_scope :result

    # 
    # parser rule addOperand
    # 
    # (in Giraffe.g)
    # 214:1: addOperand returns [result] : mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )? ;
    # 
    def addOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = AddOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __MUL115__ = nil
      __DIV116__ = nil
      __MOD117__ = nil
      op = nil
      mulOperand114 = nil

      tree_for_MUL115 = nil
      tree_for_DIV116 = nil
      tree_for_MOD117 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 215:4: mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperand_1247 )
        mulOperand114 = mulOperand
        @state.following.pop
        @adaptor.add_child( root_0, mulOperand114.tree )
        # --> action
        return_value.result = ( mulOperand114.nil? ? nil : mulOperand114.result )
        # <-- action
        # at line 216:3: ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        alt_34 = 4
        case look_34 = @input.peek( 1 )
        when MUL then alt_34 = 1
        when DIV then alt_34 = 2
        when MOD then alt_34 = 3
        end
        case alt_34
        when 1
          # at line 217:4: MUL op= addOperand
          __MUL115__ = match( MUL, TOKENS_FOLLOWING_MUL_IN_addOperand_1258 )

          tree_for_MUL115 = @adaptor.create_with_payload( __MUL115__ )
          root_0 = @adaptor.become_root( tree_for_MUL115, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1263 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:mul)),op.tree]
          # <-- action

        when 2
          # at line 218:5: DIV op= addOperand
          __DIV116__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_addOperand_1271 )

          tree_for_DIV116 = @adaptor.create_with_payload( __DIV116__ )
          root_0 = @adaptor.become_root( tree_for_DIV116, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1276 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:div)),op.tree]
          # <-- action

        when 3
          # at line 219:5: MOD op= addOperand
          __MOD117__ = match( MOD, TOKENS_FOLLOWING_MOD_IN_addOperand_1284 )

          tree_for_MOD117 = @adaptor.create_with_payload( __MOD117__ )
          root_0 = @adaptor.become_root( tree_for_MOD117, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1289 )
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
        # trace_out( __method__, 29 )

      end
      
      return return_value
    end

    MulOperandReturnValue = define_return_scope :result

    # 
    # parser rule mulOperand
    # 
    # (in Giraffe.g)
    # 223:1: mulOperand returns [result] : ( PLUS mulOperandRest | MINUS mulOperandRest | TO_INT mulOperandRest | TO_FLOAT mulOperandRest | mulOperandRest );
    # 
    def mulOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = MulOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS118__ = nil
      __MINUS120__ = nil
      __TO_INT122__ = nil
      __TO_FLOAT124__ = nil
      mulOperandRest119 = nil
      mulOperandRest121 = nil
      mulOperandRest123 = nil
      mulOperandRest125 = nil
      mulOperandRest126 = nil

      tree_for_PLUS118 = nil
      tree_for_MINUS120 = nil
      tree_for_TO_INT122 = nil
      tree_for_TO_FLOAT124 = nil

      begin
        # at line 224:2: ( PLUS mulOperandRest | MINUS mulOperandRest | TO_INT mulOperandRest | TO_FLOAT mulOperandRest | mulOperandRest )
        alt_35 = 5
        case look_35 = @input.peek( 1 )
        when PLUS then alt_35 = 1
        when MINUS then alt_35 = 2
        when TO_INT then alt_35 = 3
        when TO_FLOAT then alt_35 = 4
        when READ, LB, INT, ID, FLOAT, NEW, STRING, T__64 then alt_35 = 5
        else
          raise NoViableAlternative( "", 35, 0 )
        end
        case alt_35
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 224:4: PLUS mulOperandRest
          __PLUS118__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_mulOperand_1311 )

          tree_for_PLUS118 = @adaptor.create_with_payload( __PLUS118__ )
          @adaptor.add_child( root_0, tree_for_PLUS118 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1313 )
          mulOperandRest119 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest119.tree )
          # --> action
          return_value.result = ( mulOperandRest119.nil? ? nil : mulOperandRest119.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 225:4: MINUS mulOperandRest
          __MINUS120__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_mulOperand_1320 )

          tree_for_MINUS120 = @adaptor.create_with_payload( __MINUS120__ )
          @adaptor.add_child( root_0, tree_for_MINUS120 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1322 )
          mulOperandRest121 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest121.tree )
          # --> action
          return_value.result = [UnaryOperatorTree.new(( mulOperandRest121.nil? ? nil : mulOperandRest121.result ),Operators.method(:neg)),$mulOperandRest121.tree]
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 226:4: TO_INT mulOperandRest
          __TO_INT122__ = match( TO_INT, TOKENS_FOLLOWING_TO_INT_IN_mulOperand_1329 )

          tree_for_TO_INT122 = @adaptor.create_with_payload( __TO_INT122__ )
          @adaptor.add_child( root_0, tree_for_TO_INT122 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1331 )
          mulOperandRest123 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest123.tree )
          # --> action
          return_value.result = [UnaryOperatorTree.new(( mulOperandRest123.nil? ? nil : mulOperandRest123.result ),Operators.method(:int)),$mulOperandRest123.tree]
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 227:4: TO_FLOAT mulOperandRest
          __TO_FLOAT124__ = match( TO_FLOAT, TOKENS_FOLLOWING_TO_FLOAT_IN_mulOperand_1338 )

          tree_for_TO_FLOAT124 = @adaptor.create_with_payload( __TO_FLOAT124__ )
          @adaptor.add_child( root_0, tree_for_TO_FLOAT124 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1340 )
          mulOperandRest125 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest125.tree )
          # --> action
          return_value.result = [UnaryOperatorTree.new(( mulOperandRest125.nil? ? nil : mulOperandRest125.result ),Operators.method(:float)),$mulOperandRest125.tree]
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 228:4: mulOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1347 )
          mulOperandRest126 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest126.tree )
          # --> action
          return_value.result = ( mulOperandRest126.nil? ? nil : mulOperandRest126.result )
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
    # 231:1: mulOperandRest returns [result] : arrayIndexTarget ( '[' expression ']' )* ;
    # 
    def mulOperandRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = MulOperandRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal128 = nil
      char_literal130 = nil
      arrayIndexTarget127 = nil
      expression129 = nil

      tree_for_char_literal128 = nil
      tree_for_char_literal130 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 232:4: arrayIndexTarget ( '[' expression ']' )*
        @state.following.push( TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1364 )
        arrayIndexTarget127 = arrayIndexTarget
        @state.following.pop
        @adaptor.add_child( root_0, arrayIndexTarget127.tree )
        # --> action
        return_value.result = ( arrayIndexTarget127.nil? ? nil : arrayIndexTarget127.result )
        # <-- action
        # at line 233:3: ( '[' expression ']' )*
        while true # decision 36
          alt_36 = 2
          look_36_0 = @input.peek( 1 )

          if ( look_36_0 == T__64 )
            alt_36 = 1

          end
          case alt_36
          when 1
            # at line 233:4: '[' expression ']'
            char_literal128 = match( T__64, TOKENS_FOLLOWING_T__64_IN_mulOperandRest_1372 )

            tree_for_char_literal128 = @adaptor.create_with_payload( char_literal128 )
            @adaptor.add_child( root_0, tree_for_char_literal128 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_mulOperandRest_1374 )
            expression129 = expression
            @state.following.pop
            @adaptor.add_child( root_0, expression129.tree )
            char_literal130 = match( T__65, TOKENS_FOLLOWING_T__65_IN_mulOperandRest_1376 )

            tree_for_char_literal130 = @adaptor.create_with_payload( char_literal130 )
            @adaptor.add_child( root_0, tree_for_char_literal130 )

            # --> action
             return_value.result = [IndexTree.new(return_value.result,( expression129.nil? ? nil : expression129.result )),expression129.tree] 
            # <-- action

          else
            break # out of loop for decision 36
          end
        end # loop for decision 36
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
    # 236:1: arrayIndexTarget returns [result] : ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction | new );
    # 
    def arrayIndexTarget
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = ArrayIndexTargetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID131__ = nil
      __LB132__ = nil
      __RB134__ = nil
      __INT135__ = nil
      __FLOAT136__ = nil
      expression133 = nil
      string137 = nil
      call138 = nil
      array139 = nil
      readInstruction140 = nil
      new141 = nil

      tree_for_ID131 = nil
      tree_for_LB132 = nil
      tree_for_RB134 = nil
      tree_for_INT135 = nil
      tree_for_FLOAT136 = nil

      begin
        # at line 237:2: ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction | new )
        alt_37 = 9
        alt_37 = @dfa37.predict( @input )
        case alt_37
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 237:4: ID
          __ID131__ = match( ID, TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1398 )

          tree_for_ID131 = @adaptor.create_with_payload( __ID131__ )
          @adaptor.add_child( root_0, tree_for_ID131 )

          # --> action
          return_value.result = [VarTree.new(__ID131__.text),tree_for_ID131]
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 238:4: LB expression RB
          __LB132__ = match( LB, TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1405 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1408 )
          expression133 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression133.tree )
          __RB134__ = match( RB, TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1410 )
          # --> action
          return_value.result = ( expression133.nil? ? nil : expression133.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 239:4: INT
          __INT135__ = match( INT, TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1418 )

          tree_for_INT135 = @adaptor.create_with_payload( __INT135__ )
          @adaptor.add_child( root_0, tree_for_INT135 )

          # --> action
          return_value.result = [AtomTree.new(__INT135__.text.to_i),tree_for_INT135]
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 240:4: FLOAT
          __FLOAT136__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_arrayIndexTarget_1425 )

          tree_for_FLOAT136 = @adaptor.create_with_payload( __FLOAT136__ )
          @adaptor.add_child( root_0, tree_for_FLOAT136 )

          # --> action
          return_value.result = [AtomTree.new(__FLOAT136__.text.to_f),tree_for_FLOAT136]
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 241:4: string
          @state.following.push( TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1432 )
          string137 = string
          @state.following.pop
          @adaptor.add_child( root_0, string137.tree )
          # --> action
          return_value.result = [AtomTree.new(( string137.nil? ? nil : string137.result )),string137.tree]
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 242:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1439 )
          call138 = call
          @state.following.pop
          @adaptor.add_child( root_0, call138.tree )
          # --> action
          return_value.result = ( call138.nil? ? nil : call138.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 243:4: array
          @state.following.push( TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1446 )
          array139 = array
          @state.following.pop
          @adaptor.add_child( root_0, array139.tree )
          # --> action
          return_value.result = [ArrayTree.new(( array139.nil? ? nil : array139.result )),array139.tree]
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 244:4: readInstruction
          @state.following.push( TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1453 )
          readInstruction140 = readInstruction
          @state.following.pop
          @adaptor.add_child( root_0, readInstruction140.tree )
          # --> action
          return_value.result = ( readInstruction140.nil? ? nil : readInstruction140.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 245:4: new
          @state.following.push( TOKENS_FOLLOWING_new_IN_arrayIndexTarget_1460 )
          new141 = new
          @state.following.pop
          @adaptor.add_child( root_0, new141.tree )
          # --> action
          return_value.result = ( new141.nil? ? nil : new141.result )
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
    # 248:1: new returns [result] : NEW ID ( LB ( args )? RB )? ;
    # 
    def new
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = NewReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NEW142__ = nil
      __ID143__ = nil
      __LB144__ = nil
      __RB146__ = nil
      args145 = nil

      tree_for_NEW142 = nil
      tree_for_ID143 = nil
      tree_for_LB144 = nil
      tree_for_RB146 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 249:4: NEW ID ( LB ( args )? RB )?
        __NEW142__ = match( NEW, TOKENS_FOLLOWING_NEW_IN_new_1477 )

        tree_for_NEW142 = @adaptor.create_with_payload( __NEW142__ )
        @adaptor.add_child( root_0, tree_for_NEW142 )

        __ID143__ = match( ID, TOKENS_FOLLOWING_ID_IN_new_1479 )

        tree_for_ID143 = @adaptor.create_with_payload( __ID143__ )
        @adaptor.add_child( root_0, tree_for_ID143 )

        # at line 249:11: ( LB ( args )? RB )?
        alt_39 = 2
        look_39_0 = @input.peek( 1 )

        if ( look_39_0 == LB )
          alt_39 = 1
        end
        case alt_39
        when 1
          # at line 249:12: LB ( args )? RB
          __LB144__ = match( LB, TOKENS_FOLLOWING_LB_IN_new_1482 )

          tree_for_LB144 = @adaptor.create_with_payload( __LB144__ )
          @adaptor.add_child( root_0, tree_for_LB144 )

          # at line 249:15: ( args )?
          alt_38 = 2
          look_38_0 = @input.peek( 1 )

          if ( look_38_0 == READ || look_38_0 == LB || look_38_0.between?( PLUS, INT ) || look_38_0 == ID || look_38_0.between?( TO_INT, NEW ) || look_38_0 == STRING || look_38_0 == T__64 )
            alt_38 = 1
          end
          case alt_38
          when 1
            # at line 249:15: args
            @state.following.push( TOKENS_FOLLOWING_args_IN_new_1484 )
            args145 = args
            @state.following.pop
            @adaptor.add_child( root_0, args145.tree )

          end
          __RB146__ = match( RB, TOKENS_FOLLOWING_RB_IN_new_1487 )

          tree_for_RB146 = @adaptor.create_with_payload( __RB146__ )
          @adaptor.add_child( root_0, tree_for_RB146 )


        end
        # --> action
        return_value.result = [NewTree.new(__ID143__.text,( args145.nil? ? nil : args145.list )),tree_for_NEW142]
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
    # 252:1: array returns [result] : '[' (ex1= expression ( COMMA ex2= expression )* )? ']' ;
    # 
    def array
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = ArrayReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal147 = nil
      __COMMA148__ = nil
      char_literal149 = nil
      ex1 = nil
      ex2 = nil

      tree_for_char_literal147 = nil
      tree_for_COMMA148 = nil
      tree_for_char_literal149 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 253:4: '[' (ex1= expression ( COMMA ex2= expression )* )? ']'
        char_literal147 = match( T__64, TOKENS_FOLLOWING_T__64_IN_array_1506 )

        tree_for_char_literal147 = @adaptor.create_with_payload( char_literal147 )
        @adaptor.add_child( root_0, tree_for_char_literal147 )

        # --> action
        return_value.result = []
        # <-- action
        # at line 254:3: (ex1= expression ( COMMA ex2= expression )* )?
        alt_41 = 2
        look_41_0 = @input.peek( 1 )

        if ( look_41_0 == READ || look_41_0 == LB || look_41_0.between?( PLUS, INT ) || look_41_0 == ID || look_41_0.between?( TO_INT, NEW ) || look_41_0 == STRING || look_41_0 == T__64 )
          alt_41 = 1
        end
        case alt_41
        when 1
          # at line 254:4: ex1= expression ( COMMA ex2= expression )*
          @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1515 )
          ex1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, ex1.tree )
          # --> action
          return_value.result << ( ex1.nil? ? nil : ex1.result )
          # <-- action
          # at line 255:3: ( COMMA ex2= expression )*
          while true # decision 40
            alt_40 = 2
            look_40_0 = @input.peek( 1 )

            if ( look_40_0 == COMMA )
              alt_40 = 1

            end
            case alt_40
            when 1
              # at line 255:4: COMMA ex2= expression
              __COMMA148__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_array_1522 )

              tree_for_COMMA148 = @adaptor.create_with_payload( __COMMA148__ )
              @adaptor.add_child( root_0, tree_for_COMMA148 )

              @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1526 )
              ex2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, ex2.tree )
              # --> action
              return_value.result << ( ex2.nil? ? nil : ex2.result )
              # <-- action

            else
              break # out of loop for decision 40
            end
          end # loop for decision 40

        end
        char_literal149 = match( T__65, TOKENS_FOLLOWING_T__65_IN_array_1537 )

        tree_for_char_literal149 = @adaptor.create_with_payload( char_literal149 )
        @adaptor.add_child( root_0, tree_for_char_literal149 )

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
    # 262:1: assignment returns [result] : var= ID ( ASSIGN op1= expression | ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) ) | ( DOT method2= ID LB (args2= args )? RB )+ ) ;
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
      __ASSIGN150__ = nil
      char_literal151 = nil
      char_literal152 = nil
      __ASSIGN153__ = nil
      __DOT154__ = nil
      __LB155__ = nil
      __RB156__ = nil
      __DOT157__ = nil
      __LB158__ = nil
      __RB159__ = nil
      op1 = nil
      index = nil
      op2 = nil
      args1 = nil
      args2 = nil

      tree_for_var = nil
      tree_for_method1 = nil
      tree_for_method2 = nil
      tree_for_ASSIGN150 = nil
      tree_for_char_literal151 = nil
      tree_for_char_literal152 = nil
      tree_for_ASSIGN153 = nil
      tree_for_DOT154 = nil
      tree_for_LB155 = nil
      tree_for_RB156 = nil
      tree_for_DOT157 = nil
      tree_for_LB158 = nil
      tree_for_RB159 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 263:4: var= ID ( ASSIGN op1= expression | ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) ) | ( DOT method2= ID LB (args2= args )? RB )+ )
        var = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1559 )

        tree_for_var = @adaptor.create_with_payload( var )
        @adaptor.add_child( root_0, tree_for_var )

        # --> action
        return_value.result = VarTree.new(var.text)
        # <-- action
        # at line 264:3: ( ASSIGN op1= expression | ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) ) | ( DOT method2= ID LB (args2= args )? RB )+ )
        alt_48 = 3
        case look_48 = @input.peek( 1 )
        when ASSIGN then alt_48 = 1
        when T__64 then alt_48 = 2
        when DOT then alt_48 = 3
        else
          raise NoViableAlternative( "", 48, 0 )
        end
        case alt_48
        when 1
          # at line 264:5: ASSIGN op1= expression
          __ASSIGN150__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1567 )

          tree_for_ASSIGN150 = @adaptor.create_with_payload( __ASSIGN150__ )
          root_0 = @adaptor.become_root( tree_for_ASSIGN150, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1572 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # --> action
           return_value.result = AssignTree.new(var.text,( op1.nil? ? nil : op1.result )) 
          # <-- action

        when 2
          # at line 265:5: ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) )
          # --> action
          index=nil
          # <-- action
          # at line 266:4: ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) )
          # at line 266:5: ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ )
          # at file 266:5: ( '[' index= expression ']' )+
          match_count_42 = 0
          while true
            alt_42 = 2
            look_42_0 = @input.peek( 1 )

            if ( look_42_0 == T__64 )
              alt_42 = 1

            end
            case alt_42
            when 1
              # at line 266:7: '[' index= expression ']'
              # --> action
              index_ = index
              # <-- action
              char_literal151 = match( T__64, TOKENS_FOLLOWING_T__64_IN_assignment_1591 )

              tree_for_char_literal151 = @adaptor.create_with_payload( char_literal151 )
              @adaptor.add_child( root_0, tree_for_char_literal151 )

              @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1595 )
              index = expression
              @state.following.pop
              @adaptor.add_child( root_0, index.tree )
              char_literal152 = match( T__65, TOKENS_FOLLOWING_T__65_IN_assignment_1597 )

              tree_for_char_literal152 = @adaptor.create_with_payload( char_literal152 )
              @adaptor.add_child( root_0, tree_for_char_literal152 )

              # --> action
              target_ = return_value.result; return_value.result = IndexTree.new(return_value.result,( index.nil? ? nil : index.result ))
              # <-- action

            else
              match_count_42 > 0 and break
              eee = EarlyExit(42)


              raise eee
            end
            match_count_42 += 1
          end

          # at line 267:4: ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ )
          alt_45 = 2
          look_45_0 = @input.peek( 1 )

          if ( look_45_0 == ASSIGN )
            alt_45 = 1
          elsif ( look_45_0 == DOT )
            alt_45 = 2
          else
            raise NoViableAlternative( "", 45, 0 )
          end
          case alt_45
          when 1
            # at line 267:6: ASSIGN op2= expression
            __ASSIGN153__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1610 )

            tree_for_ASSIGN153 = @adaptor.create_with_payload( __ASSIGN153__ )
            root_0 = @adaptor.become_root( tree_for_ASSIGN153, root_0 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1615 )
            op2 = expression
            @state.following.pop
            @adaptor.add_child( root_0, op2.tree )
            # --> action
             return_value.result = DerefTree.new(target_,( index.nil? ? nil : index.result ),( op2.nil? ? nil : op2.result )) 
            # <-- action

          when 2
            # at line 268:6: ( DOT method1= ID LB (args1= args )? RB )+
            # at file 268:6: ( DOT method1= ID LB (args1= args )? RB )+
            match_count_44 = 0
            while true
              alt_44 = 2
              look_44_0 = @input.peek( 1 )

              if ( look_44_0 == DOT )
                alt_44 = 1

              end
              case alt_44
              when 1
                # at line 268:7: DOT method1= ID LB (args1= args )? RB
                __DOT154__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_assignment_1630 )

                tree_for_DOT154 = @adaptor.create_with_payload( __DOT154__ )
                @adaptor.add_child( root_0, tree_for_DOT154 )

                method1 = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1634 )

                tree_for_method1 = @adaptor.create_with_payload( method1 )
                @adaptor.add_child( root_0, tree_for_method1 )

                __LB155__ = match( LB, TOKENS_FOLLOWING_LB_IN_assignment_1636 )
                # at line 268:31: (args1= args )?
                alt_43 = 2
                look_43_0 = @input.peek( 1 )

                if ( look_43_0 == READ || look_43_0 == LB || look_43_0.between?( PLUS, INT ) || look_43_0 == ID || look_43_0.between?( TO_INT, NEW ) || look_43_0 == STRING || look_43_0 == T__64 )
                  alt_43 = 1
                end
                case alt_43
                when 1
                  # at line 268:31: args1= args
                  @state.following.push( TOKENS_FOLLOWING_args_IN_assignment_1641 )
                  args1 = args
                  @state.following.pop
                  @adaptor.add_child( root_0, args1.tree )

                end
                __RB156__ = match( RB, TOKENS_FOLLOWING_RB_IN_assignment_1644 )
                # --> action
                return_value.result = MethodCallTree.new(return_value.result,method1.text,( args1.nil? ? nil : args1.list ))
                # <-- action

              else
                match_count_44 > 0 and break
                eee = EarlyExit(44)


                raise eee
              end
              match_count_44 += 1
            end


          end


        when 3
          # at line 270:5: ( DOT method2= ID LB (args2= args )? RB )+
          # at file 270:5: ( DOT method2= ID LB (args2= args )? RB )+
          match_count_47 = 0
          while true
            alt_47 = 2
            look_47_0 = @input.peek( 1 )

            if ( look_47_0 == DOT )
              alt_47 = 1

            end
            case alt_47
            when 1
              # at line 270:6: DOT method2= ID LB (args2= args )? RB
              __DOT157__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_assignment_1662 )

              tree_for_DOT157 = @adaptor.create_with_payload( __DOT157__ )
              @adaptor.add_child( root_0, tree_for_DOT157 )

              method2 = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1666 )

              tree_for_method2 = @adaptor.create_with_payload( method2 )
              @adaptor.add_child( root_0, tree_for_method2 )

              __LB158__ = match( LB, TOKENS_FOLLOWING_LB_IN_assignment_1668 )
              # at line 270:30: (args2= args )?
              alt_46 = 2
              look_46_0 = @input.peek( 1 )

              if ( look_46_0 == READ || look_46_0 == LB || look_46_0.between?( PLUS, INT ) || look_46_0 == ID || look_46_0.between?( TO_INT, NEW ) || look_46_0 == STRING || look_46_0 == T__64 )
                alt_46 = 1
              end
              case alt_46
              when 1
                # at line 270:30: args2= args
                @state.following.push( TOKENS_FOLLOWING_args_IN_assignment_1673 )
                args2 = args
                @state.following.pop
                @adaptor.add_child( root_0, args2.tree )

              end
              __RB159__ = match( RB, TOKENS_FOLLOWING_RB_IN_assignment_1676 )
              # --> action
              return_value.result = MethodCallTree.new(return_value.result,method2.text,( args2.nil? ? nil : args2.list )) 
              # <-- action

            else
              match_count_47 > 0 and break
              eee = EarlyExit(47)


              raise eee
            end
            match_count_47 += 1
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
    # 274:1: bool returns [result] : ( TRUE | FALSE );
    # 
    def bool
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = BoolReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __TRUE160__ = nil
      __FALSE161__ = nil

      tree_for_TRUE160 = nil
      tree_for_FALSE161 = nil

      begin
        # at line 275:2: ( TRUE | FALSE )
        alt_49 = 2
        look_49_0 = @input.peek( 1 )

        if ( look_49_0 == TRUE )
          alt_49 = 1
        elsif ( look_49_0 == FALSE )
          alt_49 = 2
        else
          raise NoViableAlternative( "", 49, 0 )
        end
        case alt_49
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 275:4: TRUE
          __TRUE160__ = match( TRUE, TOKENS_FOLLOWING_TRUE_IN_bool_1703 )

          tree_for_TRUE160 = @adaptor.create_with_payload( __TRUE160__ )
          @adaptor.add_child( root_0, tree_for_TRUE160 )

          # --> action
          return_value.result = AtomTree.new(true)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 276:5: FALSE
          __FALSE161__ = match( FALSE, TOKENS_FOLLOWING_FALSE_IN_bool_1711 )

          tree_for_FALSE161 = @adaptor.create_with_payload( __FALSE161__ )
          @adaptor.add_child( root_0, tree_for_FALSE161 )

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
    # 279:1: string returns [result] : STRING ;
    # 
    def string
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = StringReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __STRING162__ = nil

      tree_for_STRING162 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 280:4: STRING
        __STRING162__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_string_1729 )

        tree_for_STRING162 = @adaptor.create_with_payload( __STRING162__ )
        @adaptor.add_child( root_0, tree_for_STRING162 )

        # --> action
        return_value.result = __STRING162__.text[1..-2]
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
    # 287:1: classDef returns [result] : CLASS classid= ID ( SUPERCLASS superclassid= ID )? LCB block RCB ;
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
      __CLASS163__ = nil
      __SUPERCLASS164__ = nil
      __LCB165__ = nil
      __RCB167__ = nil
      block166 = nil

      tree_for_classid = nil
      tree_for_superclassid = nil
      tree_for_CLASS163 = nil
      tree_for_SUPERCLASS164 = nil
      tree_for_LCB165 = nil
      tree_for_RCB167 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 288:4: CLASS classid= ID ( SUPERCLASS superclassid= ID )? LCB block RCB
        # --> action
        superclass=nil
        # <-- action
        __CLASS163__ = match( CLASS, TOKENS_FOLLOWING_CLASS_IN_classDef_1792 )

        tree_for_CLASS163 = @adaptor.create_with_payload( __CLASS163__ )
        root_0 = @adaptor.become_root( tree_for_CLASS163, root_0 )

        classid = match( ID, TOKENS_FOLLOWING_ID_IN_classDef_1797 )

        tree_for_classid = @adaptor.create_with_payload( classid )
        @adaptor.add_child( root_0, tree_for_classid )

        # at line 289:21: ( SUPERCLASS superclassid= ID )?
        alt_50 = 2
        look_50_0 = @input.peek( 1 )

        if ( look_50_0 == SUPERCLASS )
          alt_50 = 1
        end
        case alt_50
        when 1
          # at line 289:22: SUPERCLASS superclassid= ID
          __SUPERCLASS164__ = match( SUPERCLASS, TOKENS_FOLLOWING_SUPERCLASS_IN_classDef_1800 )

          tree_for_SUPERCLASS164 = @adaptor.create_with_payload( __SUPERCLASS164__ )
          @adaptor.add_child( root_0, tree_for_SUPERCLASS164 )

          superclassid = match( ID, TOKENS_FOLLOWING_ID_IN_classDef_1804 )

          tree_for_superclassid = @adaptor.create_with_payload( superclassid )
          @adaptor.add_child( root_0, tree_for_superclassid )

          # --> action
          superclass=superclassid.text
          # <-- action

        end
        __LCB165__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_classDef_1810 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_classDef_1817 )
        block166 = block
        @state.following.pop
        @adaptor.add_child( root_0, block166.tree )
        __RCB167__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_classDef_1821 )
        # --> action
        return_value.result = ClassTree.new(classid.text,( block166.nil? ? nil : block166.list ),superclass)
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
    class DFA6 < ANTLR3::DFA
      EOT = unpack( 15, -1 )
      EOF = unpack( 1, 12, 14, -1 )
      MIN = unpack( 1, 4, 1, 10, 13, -1 )
      MAX = unpack( 1, 63, 1, 64, 13, -1 )
      ACCEPT = unpack( 2, -1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 
                       1, 9, 1, 10, 1, 12, 1, 13, 1, 11, 1, 1 )
      SPECIAL = unpack( 15, -1 )
      TRANSITION = [
        unpack( 2, 12, 1, -1, 1, 10, 1, 8, 1, 9, 5, -1, 1, 6, 2, 7, 1, -1, 
                1, 3, 1, -1, 1, 12, 3, -1, 1, 4, 1, 5, 1, 2, 1, 1, 22, -1, 
                1, 11, 10, -1, 2, 12 ),
        unpack( 1, 13, 18, -1, 1, 14, 16, -1, 1, 14, 17, -1, 1, 14 ),
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
      
      @decision = 6
      

      def description
        <<-'__dfa_description__'.strip!
          68:1: instruction returns [result] : ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | classDef | );
        __dfa_description__
      end
    end
    class DFA37 < ANTLR3::DFA
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
      
      @decision = 37
      

      def description
        <<-'__dfa_description__'.strip!
          236:1: arrayIndexTarget returns [result] : ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction | new );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa6 = DFA6.new( self, 6 )
      @dfa37 = DFA37.new( self, 37 )

    end
    TOKENS_FOLLOWING_functions_IN_program_56 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_program_58 = Set[ 1 ]
    TOKENS_FOLLOWING_func_IN_functions_81 = Set[ 1, 28 ]
    TOKENS_FOLLOWING_instruction_IN_block_104 = Set[ 4, 5, 62, 63 ]
    TOKENS_FOLLOWING_instructionRest_IN_block_114 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_instructionRest_140 = Set[ 62, 63 ]
    TOKENS_FOLLOWING_T__62_IN_instructionRest_144 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_instructionRest_148 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_154 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_instructionRest_161 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_IN_instruction_190 = Set[ 1 ]
    TOKENS_FOLLOWING_forCycle_IN_instruction_197 = Set[ 1 ]
    TOKENS_FOLLOWING_ifInstruction_IN_instruction_204 = Set[ 1 ]
    TOKENS_FOLLOWING_whileCycle_IN_instruction_211 = Set[ 1 ]
    TOKENS_FOLLOWING_doCycle_IN_instruction_218 = Set[ 1 ]
    TOKENS_FOLLOWING_printInstruction_IN_instruction_225 = Set[ 1 ]
    TOKENS_FOLLOWING_printlInstruction_IN_instruction_232 = Set[ 1 ]
    TOKENS_FOLLOWING_returnInstruction_IN_instruction_239 = Set[ 1 ]
    TOKENS_FOLLOWING_exitInstruction_IN_instruction_247 = Set[ 1 ]
    TOKENS_FOLLOWING_breakInstruction_IN_instruction_254 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_instruction_261 = Set[ 1 ]
    TOKENS_FOLLOWING_classDef_IN_instruction_268 = Set[ 1 ]
    TOKENS_FOLLOWING_READ_IN_readInstruction_292 = Set[ 1 ]
    TOKENS_FOLLOWING_BREAK_IN_breakInstruction_309 = Set[ 1 ]
    TOKENS_FOLLOWING_RETURN_IN_returnInstruction_326 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_returnInstruction_329 = Set[ 1 ]
    TOKENS_FOLLOWING_EXIT_IN_exitInstruction_346 = Set[ 1, 10, 12, 13, 14 ]
    TOKENS_FOLLOWING_LB_IN_exitInstruction_351 = Set[ 12, 13, 14 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_356 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_exitInstruction_358 = Set[ 1 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_371 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_statusCode_396 = Set[ 14 ]
    TOKENS_FOLLOWING_MINUS_IN_statusCode_400 = Set[ 14 ]
    TOKENS_FOLLOWING_INT_IN_statusCode_406 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINT_IN_printInstruction_427 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printInstruction_430 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_printlInstruction_451 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printlInstruction_460 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_printText_480 = Set[ 1, 18 ]
    TOKENS_FOLLOWING_COMMA_IN_printText_487 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printText_491 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_ifInstruction_514 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_ifInstruction_517 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_ifInstruction_519 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifInstruction_522 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_ifInstruction_524 = Set[ 22, 23, 24 ]
    TOKENS_FOLLOWING_ifRest_IN_ifInstruction_527 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_ifRest_546 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_548 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifRest_551 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_553 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_ifRest_561 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_ifRest_569 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_571 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifRest_574 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_576 = Set[ 22, 23, 24 ]
    TOKENS_FOLLOWING_ifRest_IN_ifRest_581 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_whileCycle_608 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_whileCycle_610 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_whileCycle_612 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_whileCycle_615 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_whileCycle_617 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_doCycle_639 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_doCycle_641 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_doCycle_644 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_doCycle_646 = Set[ 25 ]
    TOKENS_FOLLOWING_WHILE_IN_doCycle_649 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_doCycle_651 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_forCycle_672 = Set[ 28 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_676 = Set[ 4, 5, 62, 63 ]
    TOKENS_FOLLOWING_COMMENT_IN_forCycle_681 = Set[ 62, 63 ]
    TOKENS_FOLLOWING_T__62_IN_forCycle_685 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_forCycle_689 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_695 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_forCycle_700 = Set[ 4, 5, 62, 63 ]
    TOKENS_FOLLOWING_COMMENT_IN_forCycle_705 = Set[ 62, 63 ]
    TOKENS_FOLLOWING_T__62_IN_forCycle_709 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_forCycle_713 = Set[ 28 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_719 = Set[ 28 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_726 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_forCycle_728 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_forCycle_731 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_forCycle_733 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_func_755 = Set[ 20, 28 ]
    TOKENS_FOLLOWING_params_IN_func_758 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_func_761 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_func_764 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_func_766 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_params_786 = Set[ 18 ]
    TOKENS_FOLLOWING_paramRest_IN_params_788 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_paramRest_807 = Set[ 28 ]
    TOKENS_FOLLOWING_params_IN_paramRest_810 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_call_839 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_call_842 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_call_847 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_call_850 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_DOT_IN_call_861 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_call_865 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_call_867 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_call_872 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_call_875 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_expression_IN_args_897 = Set[ 18 ]
    TOKENS_FOLLOWING_argsRest_IN_args_899 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsRest_918 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_argsRest_921 = Set[ 1 ]
    TOKENS_FOLLOWING_orOperand_IN_condition_947 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_OR_IN_condition_954 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_condition_959 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperand_IN_orOperand_980 = Set[ 1, 31 ]
    TOKENS_FOLLOWING_AND_IN_orOperand_987 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_orOperand_IN_orOperand_992 = Set[ 1 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1011 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_boolOperand_1018 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_boolOperand_1020 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_boolOperand_1023 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_boolOperand_1025 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1035 = Set[ 33, 34, 35, 36, 37, 38 ]
    TOKENS_FOLLOWING_EQ_IN_boolOperand_1038 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1045 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1051 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_boolOperand_1062 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1069 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1075 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_boolOperand_1086 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1093 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1099 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_boolOperand_1110 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1117 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1123 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_boolOperand_1134 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1141 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1147 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_boolOperand_1158 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1165 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1171 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperand_IN_expression_1196 = Set[ 1, 12, 13 ]
    TOKENS_FOLLOWING_PLUS_IN_expression_1207 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_expression_1212 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expression_1220 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_expression_1225 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperand_1247 = Set[ 1, 39, 40, 41 ]
    TOKENS_FOLLOWING_MUL_IN_addOperand_1258 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1263 = Set[ 1 ]
    TOKENS_FOLLOWING_DIV_IN_addOperand_1271 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1276 = Set[ 1 ]
    TOKENS_FOLLOWING_MOD_IN_addOperand_1284 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1289 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_mulOperand_1311 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1313 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_mulOperand_1320 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1322 = Set[ 1 ]
    TOKENS_FOLLOWING_TO_INT_IN_mulOperand_1329 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1331 = Set[ 1 ]
    TOKENS_FOLLOWING_TO_FLOAT_IN_mulOperand_1338 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1340 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1347 = Set[ 1 ]
    TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1364 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_T__64_IN_mulOperandRest_1372 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_mulOperandRest_1374 = Set[ 65 ]
    TOKENS_FOLLOWING_T__65_IN_mulOperandRest_1376 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1398 = Set[ 1 ]
    TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1405 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1408 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1410 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1418 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_arrayIndexTarget_1425 = Set[ 1 ]
    TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1432 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1439 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1446 = Set[ 1 ]
    TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1453 = Set[ 1 ]
    TOKENS_FOLLOWING_new_IN_arrayIndexTarget_1460 = Set[ 1 ]
    TOKENS_FOLLOWING_NEW_IN_new_1477 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_new_1479 = Set[ 1, 10 ]
    TOKENS_FOLLOWING_LB_IN_new_1482 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_new_1484 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_new_1487 = Set[ 1 ]
    TOKENS_FOLLOWING_T__64_IN_array_1506 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64, 65 ]
    TOKENS_FOLLOWING_expression_IN_array_1515 = Set[ 18, 65 ]
    TOKENS_FOLLOWING_COMMA_IN_array_1522 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_array_1526 = Set[ 18, 65 ]
    TOKENS_FOLLOWING_T__65_IN_array_1537 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1559 = Set[ 29, 46, 64 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1567 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1572 = Set[ 1 ]
    TOKENS_FOLLOWING_T__64_IN_assignment_1591 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1595 = Set[ 65 ]
    TOKENS_FOLLOWING_T__65_IN_assignment_1597 = Set[ 29, 46, 64 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1610 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1615 = Set[ 1 ]
    TOKENS_FOLLOWING_DOT_IN_assignment_1630 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1634 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_assignment_1636 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_assignment_1641 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_assignment_1644 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_DOT_IN_assignment_1662 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1666 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_assignment_1668 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_assignment_1673 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_assignment_1676 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_TRUE_IN_bool_1703 = Set[ 1 ]
    TOKENS_FOLLOWING_FALSE_IN_bool_1711 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_string_1729 = Set[ 1 ]
    TOKENS_FOLLOWING_CLASS_IN_classDef_1792 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_classDef_1797 = Set[ 20, 52 ]
    TOKENS_FOLLOWING_SUPERCLASS_IN_classDef_1800 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_classDef_1804 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_classDef_1810 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_classDef_1817 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_classDef_1821 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end


#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-11-19 01:01:38
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
    # 40:1: program returns [result] : block ;
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


        # at line 41:4: block
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

    BlockReturnValue = define_return_scope :list

    # 
    # parser rule block
    # 
    # (in Giraffe.g)
    # 43:1: block returns [list] : instruction instructionRest ;
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


        # at line 44:4: instruction instructionRest
        # --> action
        return_value.list = []
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_instruction_IN_block_68 )
        instruction2 = instruction
        @state.following.pop
        @adaptor.add_child( root_0, instruction2.tree )
        # --> action
        return_value.list = [( instruction2.nil? ? nil : instruction2.result )] unless ( instruction2.nil? ? nil : instruction2.result ) == nil
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_instructionRest_IN_block_78 )
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
    # 51:1: instructionRest returns [list] : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) instruction op= instructionRest | );
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
      op = nil
      instruction8 = nil

      tree_for_COMMENT4 = nil
      tree_for_char_literal5 = nil
      tree_for_char_literal6 = nil
      tree_for_SEMICOLON7 = nil

      begin
        # at line 52:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) instruction op= instructionRest | )
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


          # at line 52:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) instruction op= instructionRest
          # --> action
          return_value.list = []
          # <-- action
          # at line 53:3: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
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
              __COMMENT4__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_instructionRest_108 )

            end
            # at line 53:20: ( '\\r' )?
            alt_2 = 2
            look_2_0 = @input.peek( 1 )

            if ( look_2_0 == T__62 )
              alt_2 = 1
            end
            case alt_2
            when 1
              # at line 53:20: '\\r'
              char_literal5 = match( T__62, TOKENS_FOLLOWING_T__62_IN_instructionRest_112 )

            end
            char_literal6 = match( T__63, TOKENS_FOLLOWING_T__63_IN_instructionRest_116 )


          when 2
            # at line 53:32: SEMICOLON
            __SEMICOLON7__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_122 )

          end
          @state.following.push( TOKENS_FOLLOWING_instruction_IN_instructionRest_129 )
          instruction8 = instruction
          @state.following.pop
          @adaptor.add_child( root_0, instruction8.tree )
          # --> action
          return_value.list = [( instruction8.nil? ? nil : instruction8.result )] unless ( instruction8.nil? ? nil : instruction8.result ) == nil
          # <-- action
          @state.following.push( TOKENS_FOLLOWING_instructionRest_IN_instructionRest_142 )
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
        # trace_out( __method__, 3 )

      end
      
      return return_value
    end

    InstructionReturnValue = define_return_scope :result

    # 
    # parser rule instruction
    # 
    # (in Giraffe.g)
    # 61:1: instruction returns [result] : ( assignment | func | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | classDef | );
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
        # at line 62:2: ( assignment | func | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | classDef | )
        alt_5 = 14
        alt_5 = @dfa5.predict( @input )
        case alt_5
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 62:4: assignment
          @state.following.push( TOKENS_FOLLOWING_assignment_IN_instruction_170 )
          assignment9 = assignment
          @state.following.pop
          @adaptor.add_child( root_0, assignment9.tree )
          # --> action
          return_value.result = ( assignment9.nil? ? nil : assignment9.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 63:4: func
          @state.following.push( TOKENS_FOLLOWING_func_IN_instruction_177 )
          func10 = func
          @state.following.pop
          @adaptor.add_child( root_0, func10.tree )
          # --> action
          return_value.result = ( func10.nil? ? nil : func10.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 64:4: forCycle
          @state.following.push( TOKENS_FOLLOWING_forCycle_IN_instruction_184 )
          forCycle11 = forCycle
          @state.following.pop
          @adaptor.add_child( root_0, forCycle11.tree )
          # --> action
          return_value.result = ( forCycle11.nil? ? nil : forCycle11.result )
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 65:4: ifInstruction
          @state.following.push( TOKENS_FOLLOWING_ifInstruction_IN_instruction_191 )
          ifInstruction12 = ifInstruction
          @state.following.pop
          @adaptor.add_child( root_0, ifInstruction12.tree )
          # --> action
          return_value.result = ( ifInstruction12.nil? ? nil : ifInstruction12.result )
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 66:4: whileCycle
          @state.following.push( TOKENS_FOLLOWING_whileCycle_IN_instruction_198 )
          whileCycle13 = whileCycle
          @state.following.pop
          @adaptor.add_child( root_0, whileCycle13.tree )
          # --> action
          return_value.result = ( whileCycle13.nil? ? nil : whileCycle13.result )
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 67:4: doCycle
          @state.following.push( TOKENS_FOLLOWING_doCycle_IN_instruction_205 )
          doCycle14 = doCycle
          @state.following.pop
          @adaptor.add_child( root_0, doCycle14.tree )
          # --> action
          return_value.result = ( doCycle14.nil? ? nil : doCycle14.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 68:4: printInstruction
          @state.following.push( TOKENS_FOLLOWING_printInstruction_IN_instruction_212 )
          printInstruction15 = printInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printInstruction15.tree )
          # --> action
          return_value.result = ( printInstruction15.nil? ? nil : printInstruction15.result )
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 69:4: printlInstruction
          @state.following.push( TOKENS_FOLLOWING_printlInstruction_IN_instruction_219 )
          printlInstruction16 = printlInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printlInstruction16.tree )
          # --> action
          return_value.result = ( printlInstruction16.nil? ? nil : printlInstruction16.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 70:4: returnInstruction
          @state.following.push( TOKENS_FOLLOWING_returnInstruction_IN_instruction_226 )
          returnInstruction17 = returnInstruction
          @state.following.pop
          @adaptor.add_child( root_0, returnInstruction17.tree )
          # --> action
          return_value.result = ( returnInstruction17.nil? ? nil : returnInstruction17.result )
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 71:4: exitInstruction
          @state.following.push( TOKENS_FOLLOWING_exitInstruction_IN_instruction_234 )
          exitInstruction18 = exitInstruction
          @state.following.pop
          @adaptor.add_child( root_0, exitInstruction18.tree )
          # --> action
          return_value.result = ( exitInstruction18.nil? ? nil : exitInstruction18.result )
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 72:4: breakInstruction
          @state.following.push( TOKENS_FOLLOWING_breakInstruction_IN_instruction_241 )
          breakInstruction19 = breakInstruction
          @state.following.pop
          @adaptor.add_child( root_0, breakInstruction19.tree )
          # --> action
          return_value.result = ( breakInstruction19.nil? ? nil : breakInstruction19.result )
          # <-- action

        when 12
          root_0 = @adaptor.create_flat_list


          # at line 73:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_instruction_248 )
          call20 = call
          @state.following.pop
          @adaptor.add_child( root_0, call20.tree )
          # --> action
          return_value.result = ( call20.nil? ? nil : call20.result )
          # <-- action

        when 13
          root_0 = @adaptor.create_flat_list


          # at line 74:4: classDef
          @state.following.push( TOKENS_FOLLOWING_classDef_IN_instruction_255 )
          classDef21 = classDef
          @state.following.pop
          @adaptor.add_child( root_0, classDef21.tree )
          # --> action
          return_value.result = ( classDef21.nil? ? nil : classDef21.result )
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
        # trace_out( __method__, 4 )

      end
      
      return return_value
    end

    ReadInstructionReturnValue = define_return_scope :result

    # 
    # parser rule readInstruction
    # 
    # (in Giraffe.g)
    # 78:1: readInstruction returns [result] : READ ;
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


        # at line 79:4: READ
        __READ22__ = match( READ, TOKENS_FOLLOWING_READ_IN_readInstruction_278 )

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
    # 82:1: breakInstruction returns [result] : BREAK ;
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


        # at line 83:4: BREAK
        __BREAK23__ = match( BREAK, TOKENS_FOLLOWING_BREAK_IN_breakInstruction_295 )

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
    # 86:1: returnInstruction returns [result] : RETURN expression ;
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


        # at line 87:4: RETURN expression
        __RETURN24__ = match( RETURN, TOKENS_FOLLOWING_RETURN_IN_returnInstruction_312 )

        tree_for_RETURN24 = @adaptor.create_with_payload( __RETURN24__ )
        root_0 = @adaptor.become_root( tree_for_RETURN24, root_0 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_returnInstruction_315 )
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
    # 90:1: exitInstruction returns [result] : EXIT ( LB alt1= statusCode RB | alt2= statusCode )? ;
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


        # at line 91:4: EXIT ( LB alt1= statusCode RB | alt2= statusCode )?
        __EXIT26__ = match( EXIT, TOKENS_FOLLOWING_EXIT_IN_exitInstruction_332 )

        tree_for_EXIT26 = @adaptor.create_with_payload( __EXIT26__ )
        root_0 = @adaptor.become_root( tree_for_EXIT26, root_0 )

        # at line 91:11: ( LB alt1= statusCode RB | alt2= statusCode )?
        alt_6 = 3
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == LB )
          alt_6 = 1
        elsif ( look_6_0.between?( PLUS, INT ) )
          alt_6 = 2
        end
        case alt_6
        when 1
          # at line 91:12: LB alt1= statusCode RB
          __LB27__ = match( LB, TOKENS_FOLLOWING_LB_IN_exitInstruction_337 )
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_342 )
          alt1 = statusCode
          @state.following.pop
          @adaptor.add_child( root_0, alt1.tree )
          __RB28__ = match( RB, TOKENS_FOLLOWING_RB_IN_exitInstruction_344 )
          # --> action
          return_value.result = ExitTree.new(( alt1.nil? ? nil : alt1.result ))
          # <-- action

        when 2
          # at line 92:6: alt2= statusCode
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_357 )
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
    # 95:1: statusCode returns [result] : ( PLUS | MINUS )? INT ;
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


        # at line 96:4: ( PLUS | MINUS )? INT
        # --> action
        sign = ""
        # <-- action
        # at line 97:3: ( PLUS | MINUS )?
        alt_7 = 3
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == PLUS )
          alt_7 = 1
        elsif ( look_7_0 == MINUS )
          alt_7 = 2
        end
        case alt_7
        when 1
          # at line 97:4: PLUS
          __PLUS29__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_statusCode_382 )

          tree_for_PLUS29 = @adaptor.create_with_payload( __PLUS29__ )
          @adaptor.add_child( root_0, tree_for_PLUS29 )


        when 2
          # at line 97:11: MINUS
          __MINUS30__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_statusCode_386 )

          tree_for_MINUS30 = @adaptor.create_with_payload( __MINUS30__ )
          @adaptor.add_child( root_0, tree_for_MINUS30 )

          # --> action
          sign = __MINUS30__.text
          # <-- action

        end
        __INT31__ = match( INT, TOKENS_FOLLOWING_INT_IN_statusCode_392 )

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
    # 101:1: printInstruction returns [result] : PRINT printText ;
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


        # at line 102:5: PRINT printText
        __PRINT32__ = match( PRINT, TOKENS_FOLLOWING_PRINT_IN_printInstruction_413 )

        tree_for_PRINT32 = @adaptor.create_with_payload( __PRINT32__ )
        root_0 = @adaptor.become_root( tree_for_PRINT32, root_0 )

        @state.following.push( TOKENS_FOLLOWING_printText_IN_printInstruction_416 )
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
    # 105:1: printlInstruction returns [result] : ( PRINTL | PRINTLN ) printText ;
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


        # at line 106:5: ( PRINTL | PRINTLN ) printText
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


        @state.following.push( TOKENS_FOLLOWING_printText_IN_printlInstruction_446 )
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
    # 109:1: printText returns [list] : expression ( COMMA rest= printText )? ;
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


        # at line 110:4: expression ( COMMA rest= printText )?
        @state.following.push( TOKENS_FOLLOWING_expression_IN_printText_466 )
        expression36 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression36.tree )
        # --> action
        return_value.list = [( expression36.nil? ? nil : expression36.result )]
        # <-- action
        # at line 111:3: ( COMMA rest= printText )?
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == COMMA )
          alt_8 = 1
        end
        case alt_8
        when 1
          # at line 111:4: COMMA rest= printText
          __COMMA37__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_printText_473 )

          tree_for_COMMA37 = @adaptor.create_with_payload( __COMMA37__ )
          @adaptor.add_child( root_0, tree_for_COMMA37 )

          @state.following.push( TOKENS_FOLLOWING_printText_IN_printText_477 )
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
    # 114:1: ifInstruction returns [result] : IF condition LCB block RCB ifRest ;
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


        # at line 115:4: IF condition LCB block RCB ifRest
        __IF38__ = match( IF, TOKENS_FOLLOWING_IF_IN_ifInstruction_500 )

        tree_for_IF38 = @adaptor.create_with_payload( __IF38__ )
        root_0 = @adaptor.become_root( tree_for_IF38, root_0 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_ifInstruction_503 )
        condition39 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition39.tree )
        __LCB40__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifInstruction_505 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_ifInstruction_508 )
        block41 = block
        @state.following.pop
        @adaptor.add_child( root_0, block41.tree )
        __RCB42__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifInstruction_510 )
        @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifInstruction_513 )
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
    # 119:1: ifRest returns [result] : ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | );
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
        # at line 120:2: ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | )
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


          # at line 120:4: ELSE LCB block RCB
          __ELSE44__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_ifRest_532 )

          tree_for_ELSE44 = @adaptor.create_with_payload( __ELSE44__ )
          @adaptor.add_child( root_0, tree_for_ELSE44 )

          __LCB45__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_534 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_537 )
          block46 = block
          @state.following.pop
          @adaptor.add_child( root_0, block46.tree )
          __RCB47__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_539 )
          # --> action
          return_value.result = ( block46.nil? ? nil : block46.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 121:4: ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest
          set48 = @input.look
          if @input.peek( 1 ).between?( ELSEIF, ELIF )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set48 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          @state.following.push( TOKENS_FOLLOWING_condition_IN_ifRest_555 )
          condition49 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition49.tree )
          __LCB50__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_557 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_560 )
          block51 = block
          @state.following.pop
          @adaptor.add_child( root_0, block51.tree )
          __RCB52__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_562 )
          @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifRest_567 )
          op = ifRest
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = IfTree.new(( condition49.nil? ? nil : condition49.result ),( block51.nil? ? nil : block51.list ),( op.nil? ? nil : op.result ))
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


        # at line 127:5: WHILE condition LCB block RCB
        __WHILE53__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_whileCycle_594 )

        tree_for_WHILE53 = @adaptor.create_with_payload( __WHILE53__ )
        @adaptor.add_child( root_0, tree_for_WHILE53 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_whileCycle_596 )
        condition54 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition54.tree )
        __LCB55__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_whileCycle_598 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_whileCycle_601 )
        block56 = block
        @state.following.pop
        @adaptor.add_child( root_0, block56.tree )
        __RCB57__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_whileCycle_603 )
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
    # 131:1: doCycle returns [result] : DO LCB block RCB WHILE condition ;
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


        # at line 132:4: DO LCB block RCB WHILE condition
        __DO58__ = match( DO, TOKENS_FOLLOWING_DO_IN_doCycle_625 )

        tree_for_DO58 = @adaptor.create_with_payload( __DO58__ )
        @adaptor.add_child( root_0, tree_for_DO58 )

        __LCB59__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_doCycle_627 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_doCycle_630 )
        block60 = block
        @state.following.pop
        @adaptor.add_child( root_0, block60.tree )
        __RCB61__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_doCycle_632 )
        __WHILE62__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_doCycle_635 )

        tree_for_WHILE62 = @adaptor.create_with_payload( __WHILE62__ )
        @adaptor.add_child( root_0, tree_for_WHILE62 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_doCycle_637 )
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
    # 136:1: forCycle returns [result] : FOR as1= assignment SEMICOLON condition SEMICOLON as2= assignment LCB block RCB ;
    # 
    def forCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = ForCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __FOR64__ = nil
      __SEMICOLON65__ = nil
      __SEMICOLON67__ = nil
      __LCB68__ = nil
      __RCB70__ = nil
      as1 = nil
      as2 = nil
      condition66 = nil
      block69 = nil

      tree_for_FOR64 = nil
      tree_for_SEMICOLON65 = nil
      tree_for_SEMICOLON67 = nil
      tree_for_LCB68 = nil
      tree_for_RCB70 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 137:4: FOR as1= assignment SEMICOLON condition SEMICOLON as2= assignment LCB block RCB
        __FOR64__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_forCycle_658 )

        tree_for_FOR64 = @adaptor.create_with_payload( __FOR64__ )
        @adaptor.add_child( root_0, tree_for_FOR64 )

        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_662 )
        as1 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as1.tree )
        __SEMICOLON65__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_664 )
        @state.following.push( TOKENS_FOLLOWING_condition_IN_forCycle_667 )
        condition66 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition66.tree )
        __SEMICOLON67__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_669 )
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_674 )
        as2 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as2.tree )
        __LCB68__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_forCycle_676 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_forCycle_679 )
        block69 = block
        @state.following.pop
        @adaptor.add_child( root_0, block69.tree )
        __RCB70__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_forCycle_681 )
        # --> action
        return_value.result = ForTree.new(( as1.nil? ? nil : as1.result ),( condition66.nil? ? nil : condition66.result ),( as2.nil? ? nil : as2.result ),( block69.nil? ? nil : block69.list ))
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
      __ID71__ = nil
      __LCB73__ = nil
      __RCB75__ = nil
      params72 = nil
      block74 = nil

      tree_for_ID71 = nil
      tree_for_LCB73 = nil
      tree_for_RCB75 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 142:4: ID ( params )? LCB block RCB
        __ID71__ = match( ID, TOKENS_FOLLOWING_ID_IN_func_703 )

        tree_for_ID71 = @adaptor.create_with_payload( __ID71__ )
        root_0 = @adaptor.become_root( tree_for_ID71, root_0 )

        # at line 142:8: ( params )?
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0 == ID )
          alt_10 = 1
        end
        case alt_10
        when 1
          # at line 142:8: params
          @state.following.push( TOKENS_FOLLOWING_params_IN_func_706 )
          params72 = params
          @state.following.pop
          @adaptor.add_child( root_0, params72.tree )

        end
        __LCB73__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_709 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_func_712 )
        block74 = block
        @state.following.pop
        @adaptor.add_child( root_0, block74.tree )
        __RCB75__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_714 )
        # --> action
        return_value.result = FuncTree.new(__ID71__.text,( params72.nil? ? nil : params72.list ),( block74.nil? ? nil : block74.list ))
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
      __ID76__ = nil
      paramRest77 = nil

      tree_for_ID76 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 147:4: ID paramRest
        __ID76__ = match( ID, TOKENS_FOLLOWING_ID_IN_params_734 )

        tree_for_ID76 = @adaptor.create_with_payload( __ID76__ )
        @adaptor.add_child( root_0, tree_for_ID76 )

        @state.following.push( TOKENS_FOLLOWING_paramRest_IN_params_736 )
        paramRest77 = paramRest
        @state.following.pop
        @adaptor.add_child( root_0, paramRest77.tree )
        # --> action
        return_value.list = [__ID76__.text] + ( paramRest77.nil? ? nil : paramRest77.list )
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
      __COMMA78__ = nil
      params79 = nil

      tree_for_COMMA78 = nil

      begin
        # at line 152:2: ( COMMA params | )
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


          # at line 152:4: COMMA params
          __COMMA78__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_paramRest_755 )
          @state.following.push( TOKENS_FOLLOWING_params_IN_paramRest_758 )
          params79 = params
          @state.following.pop
          @adaptor.add_child( root_0, params79.tree )
          # --> action
          return_value.list = ( params79.nil? ? nil : params79.list )
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
    # 157:1: call returns [result] : fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )* ;
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
      __LB80__ = nil
      __RB81__ = nil
      __DOT82__ = nil
      __LB83__ = nil
      __RB84__ = nil
      args1 = nil
      args2 = nil

      tree_for_fun = nil
      tree_for_method = nil
      tree_for_LB80 = nil
      tree_for_RB81 = nil
      tree_for_DOT82 = nil
      tree_for_LB83 = nil
      tree_for_RB84 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 158:4: fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )*
        fun = match( ID, TOKENS_FOLLOWING_ID_IN_call_787 )

        tree_for_fun = @adaptor.create_with_payload( fun )
        root_0 = @adaptor.become_root( tree_for_fun, root_0 )

        __LB80__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_790 )
        # at line 158:21: (args1= args )?
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == READ || look_12_0 == LB || look_12_0.between?( PLUS, INT ) || look_12_0 == ID || look_12_0.between?( TO_INT, NEW ) || look_12_0 == STRING || look_12_0 == T__64 )
          alt_12 = 1
        end
        case alt_12
        when 1
          # at line 158:21: args1= args
          @state.following.push( TOKENS_FOLLOWING_args_IN_call_795 )
          args1 = args
          @state.following.pop
          @adaptor.add_child( root_0, args1.tree )

        end
        __RB81__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_798 )
        # --> action
        return_value.result = CallTree.new(fun.text,( args1.nil? ? nil : args1.list ))
        # <-- action
        # at line 160:3: ( DOT method= ID LB (args2= args )? RB )*
        while true # decision 14
          alt_14 = 2
          look_14_0 = @input.peek( 1 )

          if ( look_14_0 == DOT )
            alt_14 = 1

          end
          case alt_14
          when 1
            # at line 160:5: DOT method= ID LB (args2= args )? RB
            __DOT82__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_call_809 )

            tree_for_DOT82 = @adaptor.create_with_payload( __DOT82__ )
            @adaptor.add_child( root_0, tree_for_DOT82 )

            method = match( ID, TOKENS_FOLLOWING_ID_IN_call_813 )

            tree_for_method = @adaptor.create_with_payload( method )
            @adaptor.add_child( root_0, tree_for_method )

            __LB83__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_815 )
            # at line 160:28: (args2= args )?
            alt_13 = 2
            look_13_0 = @input.peek( 1 )

            if ( look_13_0 == READ || look_13_0 == LB || look_13_0.between?( PLUS, INT ) || look_13_0 == ID || look_13_0.between?( TO_INT, NEW ) || look_13_0 == STRING || look_13_0 == T__64 )
              alt_13 = 1
            end
            case alt_13
            when 1
              # at line 160:28: args2= args
              @state.following.push( TOKENS_FOLLOWING_args_IN_call_820 )
              args2 = args
              @state.following.pop
              @adaptor.add_child( root_0, args2.tree )

            end
            __RB84__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_823 )
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
        # trace_out( __method__, 21 )

      end
      
      return return_value
    end

    ArgsReturnValue = define_return_scope :list

    # 
    # parser rule args
    # 
    # (in Giraffe.g)
    # 163:1: args returns [list] : expression argsRest ;
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


        # at line 164:5: expression argsRest
        @state.following.push( TOKENS_FOLLOWING_expression_IN_args_845 )
        expression85 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression85.tree )
        @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_847 )
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
    # 167:1: argsRest returns [list] : ( COMMA args | );
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
        # at line 168:2: ( COMMA args | )
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


          # at line 168:4: COMMA args
          __COMMA87__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsRest_866 )
          @state.following.push( TOKENS_FOLLOWING_args_IN_argsRest_869 )
          args88 = args
          @state.following.pop
          @adaptor.add_child( root_0, args88.tree )
          # --> action
          return_value.list = ( args88.nil? ? nil : args88.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 170:4: 
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
    # 175:1: condition returns [result] : orOperand ( OR op= condition )? ;
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


        # at line 176:4: orOperand ( OR op= condition )?
        @state.following.push( TOKENS_FOLLOWING_orOperand_IN_condition_895 )
        orOperand89 = orOperand
        @state.following.pop
        @adaptor.add_child( root_0, orOperand89.tree )
        # --> action
        return_value.result = ( orOperand89.nil? ? nil : orOperand89.result )
        # <-- action
        # at line 177:3: ( OR op= condition )?
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == OR )
          alt_16 = 1
        end
        case alt_16
        when 1
          # at line 177:4: OR op= condition
          __OR90__ = match( OR, TOKENS_FOLLOWING_OR_IN_condition_902 )

          tree_for_OR90 = @adaptor.create_with_payload( __OR90__ )
          root_0 = @adaptor.become_root( tree_for_OR90, root_0 )

          @state.following.push( TOKENS_FOLLOWING_condition_IN_condition_907 )
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
    # 182:1: orOperand returns [result] : boolOperand ( AND op= orOperand )? ;
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


        # at line 183:4: boolOperand ( AND op= orOperand )?
        @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_orOperand_928 )
        boolOperand91 = boolOperand
        @state.following.pop
        @adaptor.add_child( root_0, boolOperand91.tree )
        # --> action
        return_value.result = ( boolOperand91.nil? ? nil : boolOperand91.result )
        # <-- action
        # at line 184:3: ( AND op= orOperand )?
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == AND )
          alt_17 = 1
        end
        case alt_17
        when 1
          # at line 184:4: AND op= orOperand
          __AND92__ = match( AND, TOKENS_FOLLOWING_AND_IN_orOperand_935 )

          tree_for_AND92 = @adaptor.create_with_payload( __AND92__ )
          root_0 = @adaptor.become_root( tree_for_AND92, root_0 )

          @state.following.push( TOKENS_FOLLOWING_orOperand_IN_orOperand_940 )
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
    # 187:1: boolOperand returns [result] : ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) );
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
        # at line 188:2: ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) )
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


          # at line 188:4: bool
          @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_959 )
          bool93 = bool
          @state.following.pop
          @adaptor.add_child( root_0, bool93.tree )
          # --> action
          return_value.result = ( bool93.nil? ? nil : bool93.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 189:4: NOT LB condition RB
          __NOT94__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_boolOperand_966 )

          tree_for_NOT94 = @adaptor.create_with_payload( __NOT94__ )
          @adaptor.add_child( root_0, tree_for_NOT94 )

          __LB95__ = match( LB, TOKENS_FOLLOWING_LB_IN_boolOperand_968 )
          @state.following.push( TOKENS_FOLLOWING_condition_IN_boolOperand_971 )
          condition96 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition96.tree )
          __RB97__ = match( RB, TOKENS_FOLLOWING_RB_IN_boolOperand_973 )
          # --> action
          return_value.result = !( condition96.nil? ? nil : condition96.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 190:4: op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_983 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # at line 190:19: ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
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
            # at line 190:20: EQ (op2= bool | op2= expression )
            __EQ98__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_boolOperand_986 )

            tree_for_EQ98 = @adaptor.create_with_payload( __EQ98__ )
            root_0 = @adaptor.become_root( tree_for_EQ98, root_0 )

            # at line 190:24: (op2= bool | op2= expression )
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
              # at line 190:26: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_993 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 190:37: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_999 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:eq))
            # <-- action

          when 2
            # at line 191:6: NE (op2= bool | op2= expression )
            __NE99__ = match( NE, TOKENS_FOLLOWING_NE_IN_boolOperand_1010 )

            tree_for_NE99 = @adaptor.create_with_payload( __NE99__ )
            root_0 = @adaptor.become_root( tree_for_NE99, root_0 )

            # at line 191:10: (op2= bool | op2= expression )
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
              # at line 191:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1017 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 191:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1023 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:ne))
            # <-- action

          when 3
            # at line 192:6: LT (op2= bool | op2= expression )
            __LT100__ = match( LT, TOKENS_FOLLOWING_LT_IN_boolOperand_1034 )

            tree_for_LT100 = @adaptor.create_with_payload( __LT100__ )
            root_0 = @adaptor.become_root( tree_for_LT100, root_0 )

            # at line 192:10: (op2= bool | op2= expression )
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
              # at line 192:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1041 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 192:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1047 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:lt))
            # <-- action

          when 4
            # at line 193:6: GT (op2= bool | op2= expression )
            __GT101__ = match( GT, TOKENS_FOLLOWING_GT_IN_boolOperand_1058 )

            tree_for_GT101 = @adaptor.create_with_payload( __GT101__ )
            root_0 = @adaptor.become_root( tree_for_GT101, root_0 )

            # at line 193:10: (op2= bool | op2= expression )
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
              # at line 193:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1065 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 193:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1071 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:gt))
            # <-- action

          when 5
            # at line 194:6: LE (op2= bool | op2= expression )
            __LE102__ = match( LE, TOKENS_FOLLOWING_LE_IN_boolOperand_1082 )

            tree_for_LE102 = @adaptor.create_with_payload( __LE102__ )
            root_0 = @adaptor.become_root( tree_for_LE102, root_0 )

            # at line 194:10: (op2= bool | op2= expression )
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
              # at line 194:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1089 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 194:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1095 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:le))
            # <-- action

          when 6
            # at line 195:6: GE (op2= bool | op2= expression )
            __GE103__ = match( GE, TOKENS_FOLLOWING_GE_IN_boolOperand_1106 )

            tree_for_GE103 = @adaptor.create_with_payload( __GE103__ )
            root_0 = @adaptor.become_root( tree_for_GE103, root_0 )

            # at line 195:10: (op2= bool | op2= expression )
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
              # at line 195:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1113 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 195:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1119 )
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
    # 200:1: expression returns [result] : addOperand ( PLUS op= expression | MINUS op= expression )? ;
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


        # at line 201:4: addOperand ( PLUS op= expression | MINUS op= expression )?
        @state.following.push( TOKENS_FOLLOWING_addOperand_IN_expression_1144 )
        addOperand104 = addOperand
        @state.following.pop
        @adaptor.add_child( root_0, addOperand104.tree )
        # --> action
        return_value.result = ( addOperand104.nil? ? nil : addOperand104.result )
        # <-- action
        # at line 202:3: ( PLUS op= expression | MINUS op= expression )?
        alt_26 = 3
        look_26_0 = @input.peek( 1 )

        if ( look_26_0 == PLUS )
          alt_26 = 1
        elsif ( look_26_0 == MINUS )
          alt_26 = 2
        end
        case alt_26
        when 1
          # at line 203:4: PLUS op= expression
          __PLUS105__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expression_1155 )

          tree_for_PLUS105 = @adaptor.create_with_payload( __PLUS105__ )
          root_0 = @adaptor.become_root( tree_for_PLUS105, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1160 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:add))
          # <-- action

        when 2
          # at line 204:5: MINUS op= expression
          __MINUS106__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expression_1168 )

          tree_for_MINUS106 = @adaptor.create_with_payload( __MINUS106__ )
          root_0 = @adaptor.become_root( tree_for_MINUS106, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1173 )
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
    # 208:1: addOperand returns [result] : mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )? ;
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


        # at line 209:4: mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperand_1195 )
        mulOperand107 = mulOperand
        @state.following.pop
        @adaptor.add_child( root_0, mulOperand107.tree )
        # --> action
        return_value.result = ( mulOperand107.nil? ? nil : mulOperand107.result )
        # <-- action
        # at line 210:3: ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        alt_27 = 4
        case look_27 = @input.peek( 1 )
        when MUL then alt_27 = 1
        when DIV then alt_27 = 2
        when MOD then alt_27 = 3
        end
        case alt_27
        when 1
          # at line 211:4: MUL op= addOperand
          __MUL108__ = match( MUL, TOKENS_FOLLOWING_MUL_IN_addOperand_1206 )

          tree_for_MUL108 = @adaptor.create_with_payload( __MUL108__ )
          root_0 = @adaptor.become_root( tree_for_MUL108, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1211 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:mul))
          # <-- action

        when 2
          # at line 212:5: DIV op= addOperand
          __DIV109__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_addOperand_1219 )

          tree_for_DIV109 = @adaptor.create_with_payload( __DIV109__ )
          root_0 = @adaptor.become_root( tree_for_DIV109, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1224 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:div))
          # <-- action

        when 3
          # at line 213:5: MOD op= addOperand
          __MOD110__ = match( MOD, TOKENS_FOLLOWING_MOD_IN_addOperand_1232 )

          tree_for_MOD110 = @adaptor.create_with_payload( __MOD110__ )
          root_0 = @adaptor.become_root( tree_for_MOD110, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1237 )
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
    # 217:1: mulOperand returns [result] : ( PLUS mulOperandRest | MINUS mulOperandRest | TO_INT mulOperandRest | TO_FLOAT mulOperandRest | mulOperandRest );
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
        # at line 218:2: ( PLUS mulOperandRest | MINUS mulOperandRest | TO_INT mulOperandRest | TO_FLOAT mulOperandRest | mulOperandRest )
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


          # at line 218:4: PLUS mulOperandRest
          __PLUS111__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_mulOperand_1259 )

          tree_for_PLUS111 = @adaptor.create_with_payload( __PLUS111__ )
          @adaptor.add_child( root_0, tree_for_PLUS111 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1261 )
          mulOperandRest112 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest112.tree )
          # --> action
          return_value.result = ( mulOperandRest112.nil? ? nil : mulOperandRest112.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 219:4: MINUS mulOperandRest
          __MINUS113__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_mulOperand_1268 )

          tree_for_MINUS113 = @adaptor.create_with_payload( __MINUS113__ )
          @adaptor.add_child( root_0, tree_for_MINUS113 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1270 )
          mulOperandRest114 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest114.tree )
          # --> action
          return_value.result = UnaryOperatorTree.new(( mulOperandRest114.nil? ? nil : mulOperandRest114.result ),Operators.method(:neg))
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 220:4: TO_INT mulOperandRest
          __TO_INT115__ = match( TO_INT, TOKENS_FOLLOWING_TO_INT_IN_mulOperand_1277 )

          tree_for_TO_INT115 = @adaptor.create_with_payload( __TO_INT115__ )
          @adaptor.add_child( root_0, tree_for_TO_INT115 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1279 )
          mulOperandRest116 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest116.tree )
          # --> action
          return_value.result = UnaryOperatorTree.new(( mulOperandRest116.nil? ? nil : mulOperandRest116.result ),Operators.method(:int))
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 221:4: TO_FLOAT mulOperandRest
          __TO_FLOAT117__ = match( TO_FLOAT, TOKENS_FOLLOWING_TO_FLOAT_IN_mulOperand_1286 )

          tree_for_TO_FLOAT117 = @adaptor.create_with_payload( __TO_FLOAT117__ )
          @adaptor.add_child( root_0, tree_for_TO_FLOAT117 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1288 )
          mulOperandRest118 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest118.tree )
          # --> action
          return_value.result = UnaryOperatorTree.new(( mulOperandRest118.nil? ? nil : mulOperandRest118.result ),Operators.method(:float))
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 222:4: mulOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1295 )
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
    # 225:1: mulOperandRest returns [result] : arrayIndexTarget ( '[' expression ']' )* ;
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


        # at line 226:4: arrayIndexTarget ( '[' expression ']' )*
        @state.following.push( TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1312 )
        arrayIndexTarget120 = arrayIndexTarget
        @state.following.pop
        @adaptor.add_child( root_0, arrayIndexTarget120.tree )
        # --> action
        return_value.result = ( arrayIndexTarget120.nil? ? nil : arrayIndexTarget120.result )
        # <-- action
        # at line 227:3: ( '[' expression ']' )*
        while true # decision 29
          alt_29 = 2
          look_29_0 = @input.peek( 1 )

          if ( look_29_0 == T__64 )
            alt_29 = 1

          end
          case alt_29
          when 1
            # at line 227:4: '[' expression ']'
            char_literal121 = match( T__64, TOKENS_FOLLOWING_T__64_IN_mulOperandRest_1320 )

            tree_for_char_literal121 = @adaptor.create_with_payload( char_literal121 )
            @adaptor.add_child( root_0, tree_for_char_literal121 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_mulOperandRest_1322 )
            expression122 = expression
            @state.following.pop
            @adaptor.add_child( root_0, expression122.tree )
            char_literal123 = match( T__65, TOKENS_FOLLOWING_T__65_IN_mulOperandRest_1324 )

            tree_for_char_literal123 = @adaptor.create_with_payload( char_literal123 )
            @adaptor.add_child( root_0, tree_for_char_literal123 )

            # --> action
             return_value.result = IndexTree.new(return_value.result,( expression122.nil? ? nil : expression122.result )) 
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
        # trace_out( __method__, 30 )

      end
      
      return return_value
    end

    ArrayIndexTargetReturnValue = define_return_scope :result

    # 
    # parser rule arrayIndexTarget
    # 
    # (in Giraffe.g)
    # 230:1: arrayIndexTarget returns [result] : ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction | new );
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
      new134 = nil

      tree_for_ID124 = nil
      tree_for_LB125 = nil
      tree_for_RB127 = nil
      tree_for_INT128 = nil
      tree_for_FLOAT129 = nil

      begin
        # at line 231:2: ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction | new )
        alt_30 = 9
        alt_30 = @dfa30.predict( @input )
        case alt_30
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 231:4: ID
          __ID124__ = match( ID, TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1347 )

          tree_for_ID124 = @adaptor.create_with_payload( __ID124__ )
          @adaptor.add_child( root_0, tree_for_ID124 )

          # --> action
          return_value.result = VarTree.new(__ID124__.text)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 232:4: LB expression RB
          __LB125__ = match( LB, TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1354 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1357 )
          expression126 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression126.tree )
          __RB127__ = match( RB, TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1359 )
          # --> action
          return_value.result = ( expression126.nil? ? nil : expression126.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 233:4: INT
          __INT128__ = match( INT, TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1367 )

          tree_for_INT128 = @adaptor.create_with_payload( __INT128__ )
          @adaptor.add_child( root_0, tree_for_INT128 )

          # --> action
          return_value.result = AtomTree.new(__INT128__.text.to_i)
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 234:4: FLOAT
          __FLOAT129__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_arrayIndexTarget_1374 )

          tree_for_FLOAT129 = @adaptor.create_with_payload( __FLOAT129__ )
          @adaptor.add_child( root_0, tree_for_FLOAT129 )

          # --> action
          return_value.result = AtomTree.new(__FLOAT129__.text.to_f)
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 235:4: string
          @state.following.push( TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1381 )
          string130 = string
          @state.following.pop
          @adaptor.add_child( root_0, string130.tree )
          # --> action
          return_value.result = AtomTree.new(( string130.nil? ? nil : string130.result ))
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 236:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1388 )
          call131 = call
          @state.following.pop
          @adaptor.add_child( root_0, call131.tree )
          # --> action
          return_value.result = ( call131.nil? ? nil : call131.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 237:4: array
          @state.following.push( TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1395 )
          array132 = array
          @state.following.pop
          @adaptor.add_child( root_0, array132.tree )
          # --> action
          return_value.result = ArrayTree.new(( array132.nil? ? nil : array132.result ))
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 238:4: readInstruction
          @state.following.push( TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1402 )
          readInstruction133 = readInstruction
          @state.following.pop
          @adaptor.add_child( root_0, readInstruction133.tree )
          # --> action
          return_value.result = ( readInstruction133.nil? ? nil : readInstruction133.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 239:4: new
          @state.following.push( TOKENS_FOLLOWING_new_IN_arrayIndexTarget_1409 )
          new134 = new
          @state.following.pop
          @adaptor.add_child( root_0, new134.tree )
          # --> action
          return_value.result = ( new134.nil? ? nil : new134.result )
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
    # 242:1: new returns [result] : NEW ID ( LB ( args )? RB )? ;
    # 
    def new
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = NewReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NEW135__ = nil
      __ID136__ = nil
      __LB137__ = nil
      __RB139__ = nil
      args138 = nil

      tree_for_NEW135 = nil
      tree_for_ID136 = nil
      tree_for_LB137 = nil
      tree_for_RB139 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 243:4: NEW ID ( LB ( args )? RB )?
        __NEW135__ = match( NEW, TOKENS_FOLLOWING_NEW_IN_new_1426 )

        tree_for_NEW135 = @adaptor.create_with_payload( __NEW135__ )
        @adaptor.add_child( root_0, tree_for_NEW135 )

        __ID136__ = match( ID, TOKENS_FOLLOWING_ID_IN_new_1428 )

        tree_for_ID136 = @adaptor.create_with_payload( __ID136__ )
        @adaptor.add_child( root_0, tree_for_ID136 )

        # at line 243:11: ( LB ( args )? RB )?
        alt_32 = 2
        look_32_0 = @input.peek( 1 )

        if ( look_32_0 == LB )
          alt_32 = 1
        end
        case alt_32
        when 1
          # at line 243:12: LB ( args )? RB
          __LB137__ = match( LB, TOKENS_FOLLOWING_LB_IN_new_1431 )

          tree_for_LB137 = @adaptor.create_with_payload( __LB137__ )
          @adaptor.add_child( root_0, tree_for_LB137 )

          # at line 243:15: ( args )?
          alt_31 = 2
          look_31_0 = @input.peek( 1 )

          if ( look_31_0 == READ || look_31_0 == LB || look_31_0.between?( PLUS, INT ) || look_31_0 == ID || look_31_0.between?( TO_INT, NEW ) || look_31_0 == STRING || look_31_0 == T__64 )
            alt_31 = 1
          end
          case alt_31
          when 1
            # at line 243:15: args
            @state.following.push( TOKENS_FOLLOWING_args_IN_new_1433 )
            args138 = args
            @state.following.pop
            @adaptor.add_child( root_0, args138.tree )

          end
          __RB139__ = match( RB, TOKENS_FOLLOWING_RB_IN_new_1436 )

          tree_for_RB139 = @adaptor.create_with_payload( __RB139__ )
          @adaptor.add_child( root_0, tree_for_RB139 )


        end
        # --> action
        return_value.result = NewTree.new(__ID136__.text,( args138.nil? ? nil : args138.list ))
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
    # 246:1: array returns [result] : '[' (ex1= expression ( COMMA ex2= expression )* )? ']' ;
    # 
    def array
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = ArrayReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal140 = nil
      __COMMA141__ = nil
      char_literal142 = nil
      ex1 = nil
      ex2 = nil

      tree_for_char_literal140 = nil
      tree_for_COMMA141 = nil
      tree_for_char_literal142 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 247:4: '[' (ex1= expression ( COMMA ex2= expression )* )? ']'
        char_literal140 = match( T__64, TOKENS_FOLLOWING_T__64_IN_array_1455 )

        tree_for_char_literal140 = @adaptor.create_with_payload( char_literal140 )
        @adaptor.add_child( root_0, tree_for_char_literal140 )

        # --> action
        return_value.result = []
        # <-- action
        # at line 248:3: (ex1= expression ( COMMA ex2= expression )* )?
        alt_34 = 2
        look_34_0 = @input.peek( 1 )

        if ( look_34_0 == READ || look_34_0 == LB || look_34_0.between?( PLUS, INT ) || look_34_0 == ID || look_34_0.between?( TO_INT, NEW ) || look_34_0 == STRING || look_34_0 == T__64 )
          alt_34 = 1
        end
        case alt_34
        when 1
          # at line 248:4: ex1= expression ( COMMA ex2= expression )*
          @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1464 )
          ex1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, ex1.tree )
          # --> action
          return_value.result << ( ex1.nil? ? nil : ex1.result )
          # <-- action
          # at line 249:3: ( COMMA ex2= expression )*
          while true # decision 33
            alt_33 = 2
            look_33_0 = @input.peek( 1 )

            if ( look_33_0 == COMMA )
              alt_33 = 1

            end
            case alt_33
            when 1
              # at line 249:4: COMMA ex2= expression
              __COMMA141__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_array_1471 )

              tree_for_COMMA141 = @adaptor.create_with_payload( __COMMA141__ )
              @adaptor.add_child( root_0, tree_for_COMMA141 )

              @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1475 )
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
        char_literal142 = match( T__65, TOKENS_FOLLOWING_T__65_IN_array_1486 )

        tree_for_char_literal142 = @adaptor.create_with_payload( char_literal142 )
        @adaptor.add_child( root_0, tree_for_char_literal142 )

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
    # 256:1: assignment returns [result] : var= ID ( ASSIGN op1= expression | ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) ) | ( DOT method2= ID LB (args2= args )? RB )+ ) ;
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
      __ASSIGN143__ = nil
      char_literal144 = nil
      char_literal145 = nil
      __ASSIGN146__ = nil
      __DOT147__ = nil
      __LB148__ = nil
      __RB149__ = nil
      __DOT150__ = nil
      __LB151__ = nil
      __RB152__ = nil
      op1 = nil
      index = nil
      op2 = nil
      args1 = nil
      args2 = nil

      tree_for_var = nil
      tree_for_method1 = nil
      tree_for_method2 = nil
      tree_for_ASSIGN143 = nil
      tree_for_char_literal144 = nil
      tree_for_char_literal145 = nil
      tree_for_ASSIGN146 = nil
      tree_for_DOT147 = nil
      tree_for_LB148 = nil
      tree_for_RB149 = nil
      tree_for_DOT150 = nil
      tree_for_LB151 = nil
      tree_for_RB152 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 257:4: var= ID ( ASSIGN op1= expression | ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) ) | ( DOT method2= ID LB (args2= args )? RB )+ )
        var = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1508 )

        tree_for_var = @adaptor.create_with_payload( var )
        @adaptor.add_child( root_0, tree_for_var )

        # --> action
        return_value.result = VarTree.new(var.text)
        # <-- action
        # at line 258:3: ( ASSIGN op1= expression | ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) ) | ( DOT method2= ID LB (args2= args )? RB )+ )
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
          # at line 258:5: ASSIGN op1= expression
          __ASSIGN143__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1516 )

          tree_for_ASSIGN143 = @adaptor.create_with_payload( __ASSIGN143__ )
          root_0 = @adaptor.become_root( tree_for_ASSIGN143, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1521 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # --> action
           return_value.result = AssignTree.new(var.text,( op1.nil? ? nil : op1.result )) 
          # <-- action

        when 2
          # at line 259:5: ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) )
          # --> action
          index=nil
          # <-- action
          # at line 260:4: ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) )
          # at line 260:5: ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ )
          # at file 260:5: ( '[' index= expression ']' )+
          match_count_35 = 0
          while true
            alt_35 = 2
            look_35_0 = @input.peek( 1 )

            if ( look_35_0 == T__64 )
              alt_35 = 1

            end
            case alt_35
            when 1
              # at line 260:7: '[' index= expression ']'
              # --> action
              index_ = index
              # <-- action
              char_literal144 = match( T__64, TOKENS_FOLLOWING_T__64_IN_assignment_1540 )

              tree_for_char_literal144 = @adaptor.create_with_payload( char_literal144 )
              @adaptor.add_child( root_0, tree_for_char_literal144 )

              @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1544 )
              index = expression
              @state.following.pop
              @adaptor.add_child( root_0, index.tree )
              char_literal145 = match( T__65, TOKENS_FOLLOWING_T__65_IN_assignment_1546 )

              tree_for_char_literal145 = @adaptor.create_with_payload( char_literal145 )
              @adaptor.add_child( root_0, tree_for_char_literal145 )

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

          # at line 261:4: ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ )
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
            # at line 261:6: ASSIGN op2= expression
            __ASSIGN146__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1559 )

            tree_for_ASSIGN146 = @adaptor.create_with_payload( __ASSIGN146__ )
            root_0 = @adaptor.become_root( tree_for_ASSIGN146, root_0 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1564 )
            op2 = expression
            @state.following.pop
            @adaptor.add_child( root_0, op2.tree )
            # --> action
             return_value.result = DerefTree.new(target_,( index.nil? ? nil : index.result ),( op2.nil? ? nil : op2.result )) 
            # <-- action

          when 2
            # at line 262:6: ( DOT method1= ID LB (args1= args )? RB )+
            # at file 262:6: ( DOT method1= ID LB (args1= args )? RB )+
            match_count_37 = 0
            while true
              alt_37 = 2
              look_37_0 = @input.peek( 1 )

              if ( look_37_0 == DOT )
                alt_37 = 1

              end
              case alt_37
              when 1
                # at line 262:7: DOT method1= ID LB (args1= args )? RB
                __DOT147__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_assignment_1579 )

                tree_for_DOT147 = @adaptor.create_with_payload( __DOT147__ )
                @adaptor.add_child( root_0, tree_for_DOT147 )

                method1 = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1583 )

                tree_for_method1 = @adaptor.create_with_payload( method1 )
                @adaptor.add_child( root_0, tree_for_method1 )

                __LB148__ = match( LB, TOKENS_FOLLOWING_LB_IN_assignment_1585 )
                # at line 262:31: (args1= args )?
                alt_36 = 2
                look_36_0 = @input.peek( 1 )

                if ( look_36_0 == READ || look_36_0 == LB || look_36_0.between?( PLUS, INT ) || look_36_0 == ID || look_36_0.between?( TO_INT, NEW ) || look_36_0 == STRING || look_36_0 == T__64 )
                  alt_36 = 1
                end
                case alt_36
                when 1
                  # at line 262:31: args1= args
                  @state.following.push( TOKENS_FOLLOWING_args_IN_assignment_1590 )
                  args1 = args
                  @state.following.pop
                  @adaptor.add_child( root_0, args1.tree )

                end
                __RB149__ = match( RB, TOKENS_FOLLOWING_RB_IN_assignment_1593 )
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
          # at line 264:5: ( DOT method2= ID LB (args2= args )? RB )+
          # at file 264:5: ( DOT method2= ID LB (args2= args )? RB )+
          match_count_40 = 0
          while true
            alt_40 = 2
            look_40_0 = @input.peek( 1 )

            if ( look_40_0 == DOT )
              alt_40 = 1

            end
            case alt_40
            when 1
              # at line 264:6: DOT method2= ID LB (args2= args )? RB
              __DOT150__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_assignment_1611 )

              tree_for_DOT150 = @adaptor.create_with_payload( __DOT150__ )
              @adaptor.add_child( root_0, tree_for_DOT150 )

              method2 = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1615 )

              tree_for_method2 = @adaptor.create_with_payload( method2 )
              @adaptor.add_child( root_0, tree_for_method2 )

              __LB151__ = match( LB, TOKENS_FOLLOWING_LB_IN_assignment_1617 )
              # at line 264:30: (args2= args )?
              alt_39 = 2
              look_39_0 = @input.peek( 1 )

              if ( look_39_0 == READ || look_39_0 == LB || look_39_0.between?( PLUS, INT ) || look_39_0 == ID || look_39_0.between?( TO_INT, NEW ) || look_39_0 == STRING || look_39_0 == T__64 )
                alt_39 = 1
              end
              case alt_39
              when 1
                # at line 264:30: args2= args
                @state.following.push( TOKENS_FOLLOWING_args_IN_assignment_1622 )
                args2 = args
                @state.following.pop
                @adaptor.add_child( root_0, args2.tree )

              end
              __RB152__ = match( RB, TOKENS_FOLLOWING_RB_IN_assignment_1625 )
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
        # trace_out( __method__, 34 )

      end
      
      return return_value
    end

    BoolReturnValue = define_return_scope :result

    # 
    # parser rule bool
    # 
    # (in Giraffe.g)
    # 268:1: bool returns [result] : ( TRUE | FALSE );
    # 
    def bool
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = BoolReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __TRUE153__ = nil
      __FALSE154__ = nil

      tree_for_TRUE153 = nil
      tree_for_FALSE154 = nil

      begin
        # at line 269:2: ( TRUE | FALSE )
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


          # at line 269:4: TRUE
          __TRUE153__ = match( TRUE, TOKENS_FOLLOWING_TRUE_IN_bool_1652 )

          tree_for_TRUE153 = @adaptor.create_with_payload( __TRUE153__ )
          @adaptor.add_child( root_0, tree_for_TRUE153 )

          # --> action
          return_value.result = AtomTree.new(true)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 270:5: FALSE
          __FALSE154__ = match( FALSE, TOKENS_FOLLOWING_FALSE_IN_bool_1660 )

          tree_for_FALSE154 = @adaptor.create_with_payload( __FALSE154__ )
          @adaptor.add_child( root_0, tree_for_FALSE154 )

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
    # 273:1: string returns [result] : STRING ;
    # 
    def string
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = StringReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __STRING155__ = nil

      tree_for_STRING155 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 274:4: STRING
        __STRING155__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_string_1678 )

        tree_for_STRING155 = @adaptor.create_with_payload( __STRING155__ )
        @adaptor.add_child( root_0, tree_for_STRING155 )

        # --> action
        return_value.result = __STRING155__.text[1..-2]
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
    # 281:1: classDef returns [result] : CLASS classid= ID ( SUPERCLASS superclassid= ID )? LCB block RCB ;
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
      __CLASS156__ = nil
      __SUPERCLASS157__ = nil
      __LCB158__ = nil
      __RCB160__ = nil
      block159 = nil

      tree_for_classid = nil
      tree_for_superclassid = nil
      tree_for_CLASS156 = nil
      tree_for_SUPERCLASS157 = nil
      tree_for_LCB158 = nil
      tree_for_RCB160 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 282:4: CLASS classid= ID ( SUPERCLASS superclassid= ID )? LCB block RCB
        # --> action
        superclass=nil
        # <-- action
        __CLASS156__ = match( CLASS, TOKENS_FOLLOWING_CLASS_IN_classDef_1741 )

        tree_for_CLASS156 = @adaptor.create_with_payload( __CLASS156__ )
        @adaptor.add_child( root_0, tree_for_CLASS156 )

        classid = match( ID, TOKENS_FOLLOWING_ID_IN_classDef_1745 )

        tree_for_classid = @adaptor.create_with_payload( classid )
        @adaptor.add_child( root_0, tree_for_classid )

        # at line 283:20: ( SUPERCLASS superclassid= ID )?
        alt_43 = 2
        look_43_0 = @input.peek( 1 )

        if ( look_43_0 == SUPERCLASS )
          alt_43 = 1
        end
        case alt_43
        when 1
          # at line 283:21: SUPERCLASS superclassid= ID
          __SUPERCLASS157__ = match( SUPERCLASS, TOKENS_FOLLOWING_SUPERCLASS_IN_classDef_1748 )

          tree_for_SUPERCLASS157 = @adaptor.create_with_payload( __SUPERCLASS157__ )
          @adaptor.add_child( root_0, tree_for_SUPERCLASS157 )

          superclassid = match( ID, TOKENS_FOLLOWING_ID_IN_classDef_1752 )

          tree_for_superclassid = @adaptor.create_with_payload( superclassid )
          @adaptor.add_child( root_0, tree_for_superclassid )

          # --> action
          superclass=superclassid.text
          # <-- action

        end
        __LCB158__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_classDef_1758 )

        tree_for_LCB158 = @adaptor.create_with_payload( __LCB158__ )
        @adaptor.add_child( root_0, tree_for_LCB158 )

        @state.following.push( TOKENS_FOLLOWING_block_IN_classDef_1764 )
        block159 = block
        @state.following.pop
        @adaptor.add_child( root_0, block159.tree )
        __RCB160__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_classDef_1768 )

        tree_for_RCB160 = @adaptor.create_with_payload( __RCB160__ )
        @adaptor.add_child( root_0, tree_for_RCB160 )

        # --> action
        return_value.result = ClassTree.new(classid.text,( block159.nil? ? nil : block159.list ),superclass)
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
          61:1: instruction returns [result] : ( assignment | func | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | classDef | );
        __dfa_description__
      end
    end
    class DFA30 < ANTLR3::DFA
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
      
      @decision = 30
      

      def description
        <<-'__dfa_description__'.strip!
          230:1: arrayIndexTarget returns [result] : ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction | new );
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
    TOKENS_FOLLOWING_instruction_IN_block_68 = Set[ 4, 5, 62, 63 ]
    TOKENS_FOLLOWING_instructionRest_IN_block_78 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_instructionRest_108 = Set[ 62, 63 ]
    TOKENS_FOLLOWING_T__62_IN_instructionRest_112 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_instructionRest_116 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_122 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_instruction_IN_instructionRest_129 = Set[ 4, 5, 62, 63 ]
    TOKENS_FOLLOWING_instructionRest_IN_instructionRest_142 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_IN_instruction_170 = Set[ 1 ]
    TOKENS_FOLLOWING_func_IN_instruction_177 = Set[ 1 ]
    TOKENS_FOLLOWING_forCycle_IN_instruction_184 = Set[ 1 ]
    TOKENS_FOLLOWING_ifInstruction_IN_instruction_191 = Set[ 1 ]
    TOKENS_FOLLOWING_whileCycle_IN_instruction_198 = Set[ 1 ]
    TOKENS_FOLLOWING_doCycle_IN_instruction_205 = Set[ 1 ]
    TOKENS_FOLLOWING_printInstruction_IN_instruction_212 = Set[ 1 ]
    TOKENS_FOLLOWING_printlInstruction_IN_instruction_219 = Set[ 1 ]
    TOKENS_FOLLOWING_returnInstruction_IN_instruction_226 = Set[ 1 ]
    TOKENS_FOLLOWING_exitInstruction_IN_instruction_234 = Set[ 1 ]
    TOKENS_FOLLOWING_breakInstruction_IN_instruction_241 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_instruction_248 = Set[ 1 ]
    TOKENS_FOLLOWING_classDef_IN_instruction_255 = Set[ 1 ]
    TOKENS_FOLLOWING_READ_IN_readInstruction_278 = Set[ 1 ]
    TOKENS_FOLLOWING_BREAK_IN_breakInstruction_295 = Set[ 1 ]
    TOKENS_FOLLOWING_RETURN_IN_returnInstruction_312 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_returnInstruction_315 = Set[ 1 ]
    TOKENS_FOLLOWING_EXIT_IN_exitInstruction_332 = Set[ 1, 10, 12, 13, 14 ]
    TOKENS_FOLLOWING_LB_IN_exitInstruction_337 = Set[ 12, 13, 14 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_342 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_exitInstruction_344 = Set[ 1 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_357 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_statusCode_382 = Set[ 14 ]
    TOKENS_FOLLOWING_MINUS_IN_statusCode_386 = Set[ 14 ]
    TOKENS_FOLLOWING_INT_IN_statusCode_392 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINT_IN_printInstruction_413 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printInstruction_416 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_printlInstruction_437 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printlInstruction_446 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_printText_466 = Set[ 1, 18 ]
    TOKENS_FOLLOWING_COMMA_IN_printText_473 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printText_477 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_ifInstruction_500 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_ifInstruction_503 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_ifInstruction_505 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifInstruction_508 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_ifInstruction_510 = Set[ 22, 23, 24 ]
    TOKENS_FOLLOWING_ifRest_IN_ifInstruction_513 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_ifRest_532 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_534 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifRest_537 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_539 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_ifRest_547 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_ifRest_555 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_557 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifRest_560 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_562 = Set[ 22, 23, 24 ]
    TOKENS_FOLLOWING_ifRest_IN_ifRest_567 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_whileCycle_594 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_whileCycle_596 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_whileCycle_598 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_whileCycle_601 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_whileCycle_603 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_doCycle_625 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_doCycle_627 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_doCycle_630 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_doCycle_632 = Set[ 25 ]
    TOKENS_FOLLOWING_WHILE_IN_doCycle_635 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_doCycle_637 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_forCycle_658 = Set[ 28 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_662 = Set[ 5 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_664 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_forCycle_667 = Set[ 5 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_669 = Set[ 28 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_674 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_forCycle_676 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_forCycle_679 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_forCycle_681 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_func_703 = Set[ 20, 28 ]
    TOKENS_FOLLOWING_params_IN_func_706 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_func_709 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_func_712 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_func_714 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_params_734 = Set[ 18 ]
    TOKENS_FOLLOWING_paramRest_IN_params_736 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_paramRest_755 = Set[ 28 ]
    TOKENS_FOLLOWING_params_IN_paramRest_758 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_call_787 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_call_790 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_call_795 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_call_798 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_DOT_IN_call_809 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_call_813 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_call_815 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_call_820 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_call_823 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_expression_IN_args_845 = Set[ 18 ]
    TOKENS_FOLLOWING_argsRest_IN_args_847 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsRest_866 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_argsRest_869 = Set[ 1 ]
    TOKENS_FOLLOWING_orOperand_IN_condition_895 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_OR_IN_condition_902 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_condition_907 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperand_IN_orOperand_928 = Set[ 1, 31 ]
    TOKENS_FOLLOWING_AND_IN_orOperand_935 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_orOperand_IN_orOperand_940 = Set[ 1 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_959 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_boolOperand_966 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_boolOperand_968 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_boolOperand_971 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_boolOperand_973 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_983 = Set[ 33, 34, 35, 36, 37, 38 ]
    TOKENS_FOLLOWING_EQ_IN_boolOperand_986 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_993 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_999 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_boolOperand_1010 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1017 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1023 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_boolOperand_1034 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1041 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1047 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_boolOperand_1058 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1065 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1071 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_boolOperand_1082 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1089 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1095 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_boolOperand_1106 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1113 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1119 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperand_IN_expression_1144 = Set[ 1, 12, 13 ]
    TOKENS_FOLLOWING_PLUS_IN_expression_1155 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_expression_1160 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expression_1168 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_expression_1173 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperand_1195 = Set[ 1, 39, 40, 41 ]
    TOKENS_FOLLOWING_MUL_IN_addOperand_1206 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1211 = Set[ 1 ]
    TOKENS_FOLLOWING_DIV_IN_addOperand_1219 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1224 = Set[ 1 ]
    TOKENS_FOLLOWING_MOD_IN_addOperand_1232 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1237 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_mulOperand_1259 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1261 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_mulOperand_1268 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1270 = Set[ 1 ]
    TOKENS_FOLLOWING_TO_INT_IN_mulOperand_1277 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1279 = Set[ 1 ]
    TOKENS_FOLLOWING_TO_FLOAT_IN_mulOperand_1286 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1288 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1295 = Set[ 1 ]
    TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1312 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_T__64_IN_mulOperandRest_1320 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_mulOperandRest_1322 = Set[ 65 ]
    TOKENS_FOLLOWING_T__65_IN_mulOperandRest_1324 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1347 = Set[ 1 ]
    TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1354 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1357 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1359 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1367 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_arrayIndexTarget_1374 = Set[ 1 ]
    TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1381 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1388 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1395 = Set[ 1 ]
    TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1402 = Set[ 1 ]
    TOKENS_FOLLOWING_new_IN_arrayIndexTarget_1409 = Set[ 1 ]
    TOKENS_FOLLOWING_NEW_IN_new_1426 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_new_1428 = Set[ 1, 10 ]
    TOKENS_FOLLOWING_LB_IN_new_1431 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_new_1433 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_new_1436 = Set[ 1 ]
    TOKENS_FOLLOWING_T__64_IN_array_1455 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64, 65 ]
    TOKENS_FOLLOWING_expression_IN_array_1464 = Set[ 18, 65 ]
    TOKENS_FOLLOWING_COMMA_IN_array_1471 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_array_1475 = Set[ 18, 65 ]
    TOKENS_FOLLOWING_T__65_IN_array_1486 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1508 = Set[ 29, 46, 64 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1516 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1521 = Set[ 1 ]
    TOKENS_FOLLOWING_T__64_IN_assignment_1540 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1544 = Set[ 65 ]
    TOKENS_FOLLOWING_T__65_IN_assignment_1546 = Set[ 29, 46, 64 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1559 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1564 = Set[ 1 ]
    TOKENS_FOLLOWING_DOT_IN_assignment_1579 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1583 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_assignment_1585 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_assignment_1590 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_assignment_1593 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_DOT_IN_assignment_1611 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1615 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_assignment_1617 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_assignment_1622 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_assignment_1625 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_TRUE_IN_bool_1652 = Set[ 1 ]
    TOKENS_FOLLOWING_FALSE_IN_bool_1660 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_string_1678 = Set[ 1 ]
    TOKENS_FOLLOWING_CLASS_IN_classDef_1741 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_classDef_1745 = Set[ 20, 52 ]
    TOKENS_FOLLOWING_SUPERCLASS_IN_classDef_1748 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_classDef_1752 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_classDef_1758 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 51, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_classDef_1764 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_classDef_1768 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end


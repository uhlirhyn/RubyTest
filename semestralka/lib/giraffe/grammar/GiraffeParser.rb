#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-11-30 11:47:52
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

    RULE_METHODS = [ :program, :funcdef, :functions, :functionsRest, :block, 
                     :instructionRest, :instruction, :readInstruction, :breakInstruction, 
                     :returnInstruction, :exitInstruction, :statusCode, 
                     :printInstruction, :printlInstruction, :printText, 
                     :ifInstruction, :ifRest, :whileCycle, :doCycle, :forCycle, 
                     :func, :params, :paramRest, :call, :args, :argsRest, 
                     :condition, :orOperand, :boolOperand, :expression, 
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
    # 44:1: program returns [result] : functions ;
    # 
    def program
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )
      return_value = ProgramReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      functions1 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 45:4: functions
        @state.following.push( TOKENS_FOLLOWING_functions_IN_program_56 )
        functions1 = functions
        @state.following.pop
        @adaptor.add_child( root_0, functions1.tree )
        # --> action
        return_value.result = ProgramTree.new(( functions1.nil? ? nil : functions1.list ))
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

    FuncdefReturnValue = define_return_scope :result

    # 
    # parser rule funcdef
    # 
    # (in Giraffe.g)
    # 48:1: funcdef returns [result] : ( func | );
    # 
    def funcdef
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )
      return_value = FuncdefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      func2 = nil


      begin
        # at line 49:2: ( func | )
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == ID )
          alt_1 = 1
        elsif ( look_1_0 == EOF || look_1_0.between?( COMMENT, SEMICOLON ) || look_1_0.between?( T__62, T__63 ) )
          alt_1 = 2
        else
          raise NoViableAlternative( "", 1, 0 )
        end
        case alt_1
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 49:4: func
          @state.following.push( TOKENS_FOLLOWING_func_IN_funcdef_74 )
          func2 = func
          @state.following.pop
          @adaptor.add_child( root_0, func2.tree )
          # --> action
          return_value.result = ( func2.nil? ? nil : func2.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 50:4: 
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
        # trace_out( __method__, 2 )

      end
      
      return return_value
    end

    FunctionsReturnValue = define_return_scope :list

    # 
    # parser rule functions
    # 
    # (in Giraffe.g)
    # 53:1: functions returns [list] : funcdef functionsRest ;
    # 
    def functions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )
      return_value = FunctionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      funcdef3 = nil
      functionsRest4 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 54:4: funcdef functionsRest
        # --> action
        return_value.list = []
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_funcdef_IN_functions_102 )
        funcdef3 = funcdef
        @state.following.pop
        @adaptor.add_child( root_0, funcdef3.tree )
        # --> action
        return_value.list = [[( funcdef3.nil? ? nil : funcdef3.result ),funcdef3.tree]] unless ( funcdef3.nil? ? nil : funcdef3.result ) == nil
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_functionsRest_IN_functions_110 )
        functionsRest4 = functionsRest
        @state.following.pop
        @adaptor.add_child( root_0, functionsRest4.tree )
        # --> action
        return_value.list = return_value.list + ( functionsRest4.nil? ? nil : functionsRest4.list )
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

    FunctionsRestReturnValue = define_return_scope :list

    # 
    # parser rule functionsRest
    # 
    # (in Giraffe.g)
    # 61:1: functionsRest returns [list] : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) functions | );
    # 
    def functionsRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )
      return_value = FunctionsRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMENT5__ = nil
      char_literal6 = nil
      char_literal7 = nil
      __SEMICOLON8__ = nil
      functions9 = nil

      tree_for_COMMENT5 = nil
      tree_for_char_literal6 = nil
      tree_for_char_literal7 = nil
      tree_for_SEMICOLON8 = nil

      begin
        # at line 62:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) functions | )
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0.between?( COMMENT, SEMICOLON ) || look_5_0.between?( T__62, T__63 ) )
          alt_5 = 1
        elsif ( look_5_0 == EOF )
          alt_5 = 2
        else
          raise NoViableAlternative( "", 5, 0 )
        end
        case alt_5
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 62:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) functions
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
              __COMMENT5__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_functionsRest_136 )

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
              char_literal6 = match( T__62, TOKENS_FOLLOWING_T__62_IN_functionsRest_140 )

            end
            char_literal7 = match( T__63, TOKENS_FOLLOWING_T__63_IN_functionsRest_144 )


          when 2
            # at line 62:34: SEMICOLON
            __SEMICOLON8__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_functionsRest_150 )

          end
          @state.following.push( TOKENS_FOLLOWING_functions_IN_functionsRest_157 )
          functions9 = functions
          @state.following.pop
          @adaptor.add_child( root_0, functions9.tree )
          # --> action
          return_value.list = ( functions9.nil? ? nil : functions9.list )
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

    BlockReturnValue = define_return_scope :list

    # 
    # parser rule block
    # 
    # (in Giraffe.g)
    # 68:1: block returns [list] : instruction instructionRest ;
    # 
    def block
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      return_value = BlockReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      instruction10 = nil
      instructionRest11 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 69:4: instruction instructionRest
        # --> action
        return_value.list = []
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_instruction_IN_block_191 )
        instruction10 = instruction
        @state.following.pop
        @adaptor.add_child( root_0, instruction10.tree )
        # --> action
        return_value.list = [[( instruction10.nil? ? nil : instruction10.result ),instruction10.tree]] unless ( instruction10.nil? ? nil : instruction10.result ) == nil
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_instructionRest_IN_block_201 )
        instructionRest11 = instructionRest
        @state.following.pop
        @adaptor.add_child( root_0, instructionRest11.tree )
        # --> action
        return_value.list = return_value.list + ( instructionRest11.nil? ? nil : instructionRest11.list )
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

    InstructionRestReturnValue = define_return_scope :list

    # 
    # parser rule instructionRest
    # 
    # (in Giraffe.g)
    # 76:1: instructionRest returns [list] : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | );
    # 
    def instructionRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      return_value = InstructionRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMENT12__ = nil
      char_literal13 = nil
      char_literal14 = nil
      __SEMICOLON15__ = nil
      block16 = nil

      tree_for_COMMENT12 = nil
      tree_for_char_literal13 = nil
      tree_for_char_literal14 = nil
      tree_for_SEMICOLON15 = nil

      begin
        # at line 77:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | )
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0.between?( COMMENT, SEMICOLON ) || look_9_0.between?( T__62, T__63 ) )
          alt_9 = 1
        elsif ( look_9_0 == RCB )
          alt_9 = 2
        else
          raise NoViableAlternative( "", 9, 0 )
        end
        case alt_9
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 77:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block
          # at line 77:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0 == COMMENT || look_8_0.between?( T__62, T__63 ) )
            alt_8 = 1
          elsif ( look_8_0 == SEMICOLON )
            alt_8 = 2
          else
            raise NoViableAlternative( "", 8, 0 )
          end
          case alt_8
          when 1
            # at line 77:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 77:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 77:8: ( COMMENT )? ( '\\r' )? '\\n'
            # at line 77:15: ( COMMENT )?
            alt_6 = 2
            look_6_0 = @input.peek( 1 )

            if ( look_6_0 == COMMENT )
              alt_6 = 1
            end
            case alt_6
            when 1
              # at line 77:15: COMMENT
              __COMMENT12__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_instructionRest_227 )

            end
            # at line 77:22: ( '\\r' )?
            alt_7 = 2
            look_7_0 = @input.peek( 1 )

            if ( look_7_0 == T__62 )
              alt_7 = 1
            end
            case alt_7
            when 1
              # at line 77:22: '\\r'
              char_literal13 = match( T__62, TOKENS_FOLLOWING_T__62_IN_instructionRest_231 )

            end
            char_literal14 = match( T__63, TOKENS_FOLLOWING_T__63_IN_instructionRest_235 )


          when 2
            # at line 77:34: SEMICOLON
            __SEMICOLON15__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_241 )

          end
          @state.following.push( TOKENS_FOLLOWING_block_IN_instructionRest_248 )
          block16 = block
          @state.following.pop
          @adaptor.add_child( root_0, block16.tree )
          # --> action
          return_value.list = ( block16.nil? ? nil : block16.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 80:4: 
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
        # trace_out( __method__, 6 )

      end
      
      return return_value
    end

    InstructionReturnValue = define_return_scope :result

    # 
    # parser rule instruction
    # 
    # (in Giraffe.g)
    # 83:1: instruction returns [result] : ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | );
    # 
    def instruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )
      return_value = InstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      assignment17 = nil
      forCycle18 = nil
      ifInstruction19 = nil
      whileCycle20 = nil
      doCycle21 = nil
      printInstruction22 = nil
      printlInstruction23 = nil
      returnInstruction24 = nil
      exitInstruction25 = nil
      breakInstruction26 = nil
      call27 = nil


      begin
        # at line 84:2: ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | )
        alt_10 = 12
        alt_10 = @dfa10.predict( @input )
        case alt_10
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 84:4: assignment
          @state.following.push( TOKENS_FOLLOWING_assignment_IN_instruction_277 )
          assignment17 = assignment
          @state.following.pop
          @adaptor.add_child( root_0, assignment17.tree )
          # --> action
          return_value.result = ( assignment17.nil? ? nil : assignment17.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 85:4: forCycle
          @state.following.push( TOKENS_FOLLOWING_forCycle_IN_instruction_284 )
          forCycle18 = forCycle
          @state.following.pop
          @adaptor.add_child( root_0, forCycle18.tree )
          # --> action
          return_value.result = ( forCycle18.nil? ? nil : forCycle18.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 86:4: ifInstruction
          @state.following.push( TOKENS_FOLLOWING_ifInstruction_IN_instruction_291 )
          ifInstruction19 = ifInstruction
          @state.following.pop
          @adaptor.add_child( root_0, ifInstruction19.tree )
          # --> action
          return_value.result = ( ifInstruction19.nil? ? nil : ifInstruction19.result )
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 87:4: whileCycle
          @state.following.push( TOKENS_FOLLOWING_whileCycle_IN_instruction_298 )
          whileCycle20 = whileCycle
          @state.following.pop
          @adaptor.add_child( root_0, whileCycle20.tree )
          # --> action
          return_value.result = ( whileCycle20.nil? ? nil : whileCycle20.result )
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 88:4: doCycle
          @state.following.push( TOKENS_FOLLOWING_doCycle_IN_instruction_305 )
          doCycle21 = doCycle
          @state.following.pop
          @adaptor.add_child( root_0, doCycle21.tree )
          # --> action
          return_value.result = ( doCycle21.nil? ? nil : doCycle21.result )
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 89:4: printInstruction
          @state.following.push( TOKENS_FOLLOWING_printInstruction_IN_instruction_312 )
          printInstruction22 = printInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printInstruction22.tree )
          # --> action
          return_value.result = ( printInstruction22.nil? ? nil : printInstruction22.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 90:4: printlInstruction
          @state.following.push( TOKENS_FOLLOWING_printlInstruction_IN_instruction_319 )
          printlInstruction23 = printlInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printlInstruction23.tree )
          # --> action
          return_value.result = ( printlInstruction23.nil? ? nil : printlInstruction23.result )
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 91:4: returnInstruction
          @state.following.push( TOKENS_FOLLOWING_returnInstruction_IN_instruction_326 )
          returnInstruction24 = returnInstruction
          @state.following.pop
          @adaptor.add_child( root_0, returnInstruction24.tree )
          # --> action
          return_value.result = ( returnInstruction24.nil? ? nil : returnInstruction24.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 92:4: exitInstruction
          @state.following.push( TOKENS_FOLLOWING_exitInstruction_IN_instruction_334 )
          exitInstruction25 = exitInstruction
          @state.following.pop
          @adaptor.add_child( root_0, exitInstruction25.tree )
          # --> action
          return_value.result = ( exitInstruction25.nil? ? nil : exitInstruction25.result )
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 93:4: breakInstruction
          @state.following.push( TOKENS_FOLLOWING_breakInstruction_IN_instruction_341 )
          breakInstruction26 = breakInstruction
          @state.following.pop
          @adaptor.add_child( root_0, breakInstruction26.tree )
          # --> action
          return_value.result = ( breakInstruction26.nil? ? nil : breakInstruction26.result )
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 94:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_instruction_348 )
          call27 = call
          @state.following.pop
          @adaptor.add_child( root_0, call27.tree )
          # --> action
          return_value.result = ( call27.nil? ? nil : call27.result )
          # <-- action

        when 12
          root_0 = @adaptor.create_flat_list


          # at line 95:4: 
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
        # trace_out( __method__, 7 )

      end
      
      return return_value
    end

    ReadInstructionReturnValue = define_return_scope :result

    # 
    # parser rule readInstruction
    # 
    # (in Giraffe.g)
    # 98:1: readInstruction returns [result] : READ ;
    # 
    def readInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      return_value = ReadInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __READ28__ = nil

      tree_for_READ28 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 99:4: READ
        __READ28__ = match( READ, TOKENS_FOLLOWING_READ_IN_readInstruction_371 )

        tree_for_READ28 = @adaptor.create_with_payload( __READ28__ )
        @adaptor.add_child( root_0, tree_for_READ28 )

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
        # trace_out( __method__, 8 )

      end
      
      return return_value
    end

    BreakInstructionReturnValue = define_return_scope :result

    # 
    # parser rule breakInstruction
    # 
    # (in Giraffe.g)
    # 102:1: breakInstruction returns [result] : BREAK ;
    # 
    def breakInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = BreakInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BREAK29__ = nil

      tree_for_BREAK29 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 103:4: BREAK
        __BREAK29__ = match( BREAK, TOKENS_FOLLOWING_BREAK_IN_breakInstruction_388 )

        tree_for_BREAK29 = @adaptor.create_with_payload( __BREAK29__ )
        @adaptor.add_child( root_0, tree_for_BREAK29 )

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
        # trace_out( __method__, 9 )

      end
      
      return return_value
    end

    ReturnInstructionReturnValue = define_return_scope :result

    # 
    # parser rule returnInstruction
    # 
    # (in Giraffe.g)
    # 106:1: returnInstruction returns [result] : RETURN expression ;
    # 
    def returnInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = ReturnInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __RETURN30__ = nil
      expression31 = nil

      tree_for_RETURN30 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 107:4: RETURN expression
        __RETURN30__ = match( RETURN, TOKENS_FOLLOWING_RETURN_IN_returnInstruction_405 )

        tree_for_RETURN30 = @adaptor.create_with_payload( __RETURN30__ )
        root_0 = @adaptor.become_root( tree_for_RETURN30, root_0 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_returnInstruction_408 )
        expression31 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression31.tree )
        # --> action
        return_value.result = ReturnTree.new(( expression31.nil? ? nil : expression31.result ))
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

    ExitInstructionReturnValue = define_return_scope :result

    # 
    # parser rule exitInstruction
    # 
    # (in Giraffe.g)
    # 110:1: exitInstruction returns [result] : EXIT ( LB alt1= statusCode RB | alt2= statusCode )? ;
    # 
    def exitInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = ExitInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __EXIT32__ = nil
      __LB33__ = nil
      __RB34__ = nil
      alt1 = nil
      alt2 = nil

      tree_for_EXIT32 = nil
      tree_for_LB33 = nil
      tree_for_RB34 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 111:4: EXIT ( LB alt1= statusCode RB | alt2= statusCode )?
        __EXIT32__ = match( EXIT, TOKENS_FOLLOWING_EXIT_IN_exitInstruction_425 )

        tree_for_EXIT32 = @adaptor.create_with_payload( __EXIT32__ )
        root_0 = @adaptor.become_root( tree_for_EXIT32, root_0 )

        # at line 111:11: ( LB alt1= statusCode RB | alt2= statusCode )?
        alt_11 = 3
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == LB )
          alt_11 = 1
        elsif ( look_11_0.between?( PLUS, INT ) )
          alt_11 = 2
        end
        case alt_11
        when 1
          # at line 111:12: LB alt1= statusCode RB
          __LB33__ = match( LB, TOKENS_FOLLOWING_LB_IN_exitInstruction_430 )
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_435 )
          alt1 = statusCode
          @state.following.pop
          @adaptor.add_child( root_0, alt1.tree )
          __RB34__ = match( RB, TOKENS_FOLLOWING_RB_IN_exitInstruction_437 )
          # --> action
          return_value.result = ExitTree.new(( alt1.nil? ? nil : alt1.result ))
          # <-- action

        when 2
          # at line 112:6: alt2= statusCode
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_450 )
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
        # trace_out( __method__, 11 )

      end
      
      return return_value
    end

    StatusCodeReturnValue = define_return_scope :result

    # 
    # parser rule statusCode
    # 
    # (in Giraffe.g)
    # 115:1: statusCode returns [result] : ( PLUS | MINUS )? INT ;
    # 
    def statusCode
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = StatusCodeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS35__ = nil
      __MINUS36__ = nil
      __INT37__ = nil

      tree_for_PLUS35 = nil
      tree_for_MINUS36 = nil
      tree_for_INT37 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 116:4: ( PLUS | MINUS )? INT
        # --> action
        sign = ""
        # <-- action
        # at line 117:3: ( PLUS | MINUS )?
        alt_12 = 3
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == PLUS )
          alt_12 = 1
        elsif ( look_12_0 == MINUS )
          alt_12 = 2
        end
        case alt_12
        when 1
          # at line 117:4: PLUS
          __PLUS35__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_statusCode_475 )

          tree_for_PLUS35 = @adaptor.create_with_payload( __PLUS35__ )
          @adaptor.add_child( root_0, tree_for_PLUS35 )


        when 2
          # at line 117:11: MINUS
          __MINUS36__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_statusCode_479 )

          tree_for_MINUS36 = @adaptor.create_with_payload( __MINUS36__ )
          @adaptor.add_child( root_0, tree_for_MINUS36 )

          # --> action
          sign = __MINUS36__.text
          # <-- action

        end
        __INT37__ = match( INT, TOKENS_FOLLOWING_INT_IN_statusCode_485 )

        tree_for_INT37 = @adaptor.create_with_payload( __INT37__ )
        @adaptor.add_child( root_0, tree_for_INT37 )

        # --> action
        (sign + __INT37__.text).to_i
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

    PrintInstructionReturnValue = define_return_scope :result

    # 
    # parser rule printInstruction
    # 
    # (in Giraffe.g)
    # 121:1: printInstruction returns [result] : PRINT printText ;
    # 
    def printInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = PrintInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PRINT38__ = nil
      printText39 = nil

      tree_for_PRINT38 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 122:5: PRINT printText
        __PRINT38__ = match( PRINT, TOKENS_FOLLOWING_PRINT_IN_printInstruction_506 )

        tree_for_PRINT38 = @adaptor.create_with_payload( __PRINT38__ )
        root_0 = @adaptor.become_root( tree_for_PRINT38, root_0 )

        @state.following.push( TOKENS_FOLLOWING_printText_IN_printInstruction_509 )
        printText39 = printText
        @state.following.pop
        @adaptor.add_child( root_0, printText39.tree )
        # --> action
        return_value.result = PrintTree.new(( printText39.nil? ? nil : printText39.list ))
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

    PrintlInstructionReturnValue = define_return_scope :result

    # 
    # parser rule printlInstruction
    # 
    # (in Giraffe.g)
    # 125:1: printlInstruction returns [result] : ( PRINTL | PRINTLN ) printText ;
    # 
    def printlInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = PrintlInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      set40 = nil
      printText41 = nil

      tree_for_set40 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 126:5: ( PRINTL | PRINTLN ) printText
        set40 = @input.look
        set40 = @input.look
        if @input.peek( 1 ).between?( PRINTL, PRINTLN )
          @input.consume
          root_0 = @adaptor.become_root( @adaptor.create_with_payload( set40 ), root_0 )
          @state.error_recovery = false
        else
          mse = MismatchedSet( nil )
          raise mse
        end


        @state.following.push( TOKENS_FOLLOWING_printText_IN_printlInstruction_539 )
        printText41 = printText
        @state.following.pop
        @adaptor.add_child( root_0, printText41.tree )
        # --> action
        return_value.result = PrintTree.new(( printText41.nil? ? nil : printText41.list ),true)
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

    PrintTextReturnValue = define_return_scope :list

    # 
    # parser rule printText
    # 
    # (in Giraffe.g)
    # 129:1: printText returns [list] : expression ( COMMA rest= printText )? ;
    # 
    def printText
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = PrintTextReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA43__ = nil
      rest = nil
      expression42 = nil

      tree_for_COMMA43 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 130:4: expression ( COMMA rest= printText )?
        @state.following.push( TOKENS_FOLLOWING_expression_IN_printText_559 )
        expression42 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression42.tree )
        # --> action
        return_value.list = [( expression42.nil? ? nil : expression42.result )]
        # <-- action
        # at line 131:3: ( COMMA rest= printText )?
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == COMMA )
          alt_13 = 1
        end
        case alt_13
        when 1
          # at line 131:4: COMMA rest= printText
          __COMMA43__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_printText_566 )

          tree_for_COMMA43 = @adaptor.create_with_payload( __COMMA43__ )
          @adaptor.add_child( root_0, tree_for_COMMA43 )

          @state.following.push( TOKENS_FOLLOWING_printText_IN_printText_570 )
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
        # trace_out( __method__, 15 )

      end
      
      return return_value
    end

    IfInstructionReturnValue = define_return_scope :result

    # 
    # parser rule ifInstruction
    # 
    # (in Giraffe.g)
    # 134:1: ifInstruction returns [result] : IF condition LCB block RCB ifRest ;
    # 
    def ifInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = IfInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __IF44__ = nil
      __LCB46__ = nil
      __RCB48__ = nil
      condition45 = nil
      block47 = nil
      ifRest49 = nil

      tree_for_IF44 = nil
      tree_for_LCB46 = nil
      tree_for_RCB48 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 135:4: IF condition LCB block RCB ifRest
        __IF44__ = match( IF, TOKENS_FOLLOWING_IF_IN_ifInstruction_593 )

        tree_for_IF44 = @adaptor.create_with_payload( __IF44__ )
        root_0 = @adaptor.become_root( tree_for_IF44, root_0 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_ifInstruction_596 )
        condition45 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition45.tree )
        __LCB46__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifInstruction_598 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_ifInstruction_601 )
        block47 = block
        @state.following.pop
        @adaptor.add_child( root_0, block47.tree )
        __RCB48__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifInstruction_603 )
        @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifInstruction_606 )
        ifRest49 = ifRest
        @state.following.pop
        @adaptor.add_child( root_0, ifRest49.tree )
        # --> action
        return_value.result = IfTree.new(( condition45.nil? ? nil : condition45.result ),( block47.nil? ? nil : block47.list ),( ifRest49.nil? ? nil : ifRest49.result ))
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

    IfRestReturnValue = define_return_scope :result

    # 
    # parser rule ifRest
    # 
    # (in Giraffe.g)
    # 139:1: ifRest returns [result] : ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | );
    # 
    def ifRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = IfRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ELSE50__ = nil
      __LCB51__ = nil
      __RCB53__ = nil
      set54 = nil
      __LCB56__ = nil
      __RCB58__ = nil
      op = nil
      block52 = nil
      condition55 = nil
      block57 = nil

      tree_for_ELSE50 = nil
      tree_for_LCB51 = nil
      tree_for_RCB53 = nil
      tree_for_set54 = nil
      tree_for_LCB56 = nil
      tree_for_RCB58 = nil

      begin
        # at line 140:2: ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | )
        alt_14 = 3
        case look_14 = @input.peek( 1 )
        when ELSE then alt_14 = 1
        when ELSEIF, ELIF then alt_14 = 2
        when COMMENT, SEMICOLON, RCB, T__62, T__63 then alt_14 = 3
        else
          raise NoViableAlternative( "", 14, 0 )
        end
        case alt_14
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 140:4: ELSE LCB block RCB
          __ELSE50__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_ifRest_625 )

          tree_for_ELSE50 = @adaptor.create_with_payload( __ELSE50__ )
          @adaptor.add_child( root_0, tree_for_ELSE50 )

          __LCB51__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_627 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_630 )
          block52 = block
          @state.following.pop
          @adaptor.add_child( root_0, block52.tree )
          __RCB53__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_632 )
          # --> action
          return_value.result = ( block52.nil? ? nil : block52.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 141:4: ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest
          set54 = @input.look
          if @input.peek( 1 ).between?( ELSEIF, ELIF )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set54 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          @state.following.push( TOKENS_FOLLOWING_condition_IN_ifRest_648 )
          condition55 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition55.tree )
          __LCB56__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_650 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_653 )
          block57 = block
          @state.following.pop
          @adaptor.add_child( root_0, block57.tree )
          __RCB58__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_655 )
          @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifRest_660 )
          op = ifRest
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = IfTree.new(( condition55.nil? ? nil : condition55.result ),( block57.nil? ? nil : block57.list ),( op.nil? ? nil : op.result ))
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 143:4: 
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
        # trace_out( __method__, 17 )

      end
      
      return return_value
    end

    WhileCycleReturnValue = define_return_scope :result

    # 
    # parser rule whileCycle
    # 
    # (in Giraffe.g)
    # 146:1: whileCycle returns [result] : WHILE condition LCB block RCB ;
    # 
    def whileCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = WhileCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WHILE59__ = nil
      __LCB61__ = nil
      __RCB63__ = nil
      condition60 = nil
      block62 = nil

      tree_for_WHILE59 = nil
      tree_for_LCB61 = nil
      tree_for_RCB63 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 147:5: WHILE condition LCB block RCB
        __WHILE59__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_whileCycle_687 )

        tree_for_WHILE59 = @adaptor.create_with_payload( __WHILE59__ )
        @adaptor.add_child( root_0, tree_for_WHILE59 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_whileCycle_689 )
        condition60 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition60.tree )
        __LCB61__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_whileCycle_691 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_whileCycle_694 )
        block62 = block
        @state.following.pop
        @adaptor.add_child( root_0, block62.tree )
        __RCB63__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_whileCycle_696 )
        # --> action
        return_value.result = WhileTree.new(( condition60.nil? ? nil : condition60.result ),( block62.nil? ? nil : block62.list ))
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

    DoCycleReturnValue = define_return_scope :result

    # 
    # parser rule doCycle
    # 
    # (in Giraffe.g)
    # 151:1: doCycle returns [result] : DO LCB block RCB WHILE condition ;
    # 
    def doCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = DoCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __DO64__ = nil
      __LCB65__ = nil
      __RCB67__ = nil
      __WHILE68__ = nil
      block66 = nil
      condition69 = nil

      tree_for_DO64 = nil
      tree_for_LCB65 = nil
      tree_for_RCB67 = nil
      tree_for_WHILE68 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 152:4: DO LCB block RCB WHILE condition
        __DO64__ = match( DO, TOKENS_FOLLOWING_DO_IN_doCycle_718 )

        tree_for_DO64 = @adaptor.create_with_payload( __DO64__ )
        @adaptor.add_child( root_0, tree_for_DO64 )

        __LCB65__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_doCycle_720 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_doCycle_723 )
        block66 = block
        @state.following.pop
        @adaptor.add_child( root_0, block66.tree )
        __RCB67__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_doCycle_725 )
        __WHILE68__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_doCycle_728 )

        tree_for_WHILE68 = @adaptor.create_with_payload( __WHILE68__ )
        @adaptor.add_child( root_0, tree_for_WHILE68 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_doCycle_730 )
        condition69 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition69.tree )
        # --> action
        return_value.result = DoTree.new(( condition69.nil? ? nil : condition69.result ),( block66.nil? ? nil : block66.list ))
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

    ForCycleReturnValue = define_return_scope :result

    # 
    # parser rule forCycle
    # 
    # (in Giraffe.g)
    # 156:1: forCycle returns [result] : FOR as1= assignment ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) condition ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) as2= assignment LCB block RCB ;
    # 
    def forCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = ForCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __FOR70__ = nil
      __COMMENT71__ = nil
      char_literal72 = nil
      char_literal73 = nil
      __SEMICOLON74__ = nil
      __COMMENT76__ = nil
      char_literal77 = nil
      char_literal78 = nil
      __SEMICOLON79__ = nil
      __LCB80__ = nil
      __RCB82__ = nil
      as1 = nil
      as2 = nil
      condition75 = nil
      block81 = nil

      tree_for_FOR70 = nil
      tree_for_COMMENT71 = nil
      tree_for_char_literal72 = nil
      tree_for_char_literal73 = nil
      tree_for_SEMICOLON74 = nil
      tree_for_COMMENT76 = nil
      tree_for_char_literal77 = nil
      tree_for_char_literal78 = nil
      tree_for_SEMICOLON79 = nil
      tree_for_LCB80 = nil
      tree_for_RCB82 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 157:4: FOR as1= assignment ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) condition ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) as2= assignment LCB block RCB
        __FOR70__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_forCycle_751 )

        tree_for_FOR70 = @adaptor.create_with_payload( __FOR70__ )
        @adaptor.add_child( root_0, tree_for_FOR70 )

        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_755 )
        as1 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as1.tree )
        # at line 157:23: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == COMMENT || look_17_0.between?( T__62, T__63 ) )
          alt_17 = 1
        elsif ( look_17_0 == SEMICOLON )
          alt_17 = 2
        else
          raise NoViableAlternative( "", 17, 0 )
        end
        case alt_17
        when 1
          # at line 157:24: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 157:24: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 157:26: ( COMMENT )? ( '\\r' )? '\\n'
          # at line 157:33: ( COMMENT )?
          alt_15 = 2
          look_15_0 = @input.peek( 1 )

          if ( look_15_0 == COMMENT )
            alt_15 = 1
          end
          case alt_15
          when 1
            # at line 157:33: COMMENT
            __COMMENT71__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_forCycle_760 )

          end
          # at line 157:40: ( '\\r' )?
          alt_16 = 2
          look_16_0 = @input.peek( 1 )

          if ( look_16_0 == T__62 )
            alt_16 = 1
          end
          case alt_16
          when 1
            # at line 157:40: '\\r'
            char_literal72 = match( T__62, TOKENS_FOLLOWING_T__62_IN_forCycle_764 )

          end
          char_literal73 = match( T__63, TOKENS_FOLLOWING_T__63_IN_forCycle_768 )


        when 2
          # at line 157:52: SEMICOLON
          __SEMICOLON74__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_774 )

        end
        @state.following.push( TOKENS_FOLLOWING_condition_IN_forCycle_779 )
        condition75 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition75.tree )
        # at line 157:75: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
        alt_20 = 2
        look_20_0 = @input.peek( 1 )

        if ( look_20_0 == COMMENT || look_20_0.between?( T__62, T__63 ) )
          alt_20 = 1
        elsif ( look_20_0 == SEMICOLON )
          alt_20 = 2
        else
          raise NoViableAlternative( "", 20, 0 )
        end
        case alt_20
        when 1
          # at line 157:76: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 157:76: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 157:78: ( COMMENT )? ( '\\r' )? '\\n'
          # at line 157:85: ( COMMENT )?
          alt_18 = 2
          look_18_0 = @input.peek( 1 )

          if ( look_18_0 == COMMENT )
            alt_18 = 1
          end
          case alt_18
          when 1
            # at line 157:85: COMMENT
            __COMMENT76__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_forCycle_784 )

          end
          # at line 157:92: ( '\\r' )?
          alt_19 = 2
          look_19_0 = @input.peek( 1 )

          if ( look_19_0 == T__62 )
            alt_19 = 1
          end
          case alt_19
          when 1
            # at line 157:92: '\\r'
            char_literal77 = match( T__62, TOKENS_FOLLOWING_T__62_IN_forCycle_788 )

          end
          char_literal78 = match( T__63, TOKENS_FOLLOWING_T__63_IN_forCycle_792 )


        when 2
          # at line 157:104: SEMICOLON
          __SEMICOLON79__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_798 )

        end
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_805 )
        as2 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as2.tree )
        __LCB80__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_forCycle_807 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_forCycle_810 )
        block81 = block
        @state.following.pop
        @adaptor.add_child( root_0, block81.tree )
        __RCB82__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_forCycle_812 )
        # --> action
        return_value.result = ForTree.new(( as1.nil? ? nil : as1.result ),( condition75.nil? ? nil : condition75.result ),( as2.nil? ? nil : as2.result ),( block81.nil? ? nil : block81.list ))
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

    FuncReturnValue = define_return_scope :result

    # 
    # parser rule func
    # 
    # (in Giraffe.g)
    # 161:1: func returns [result] : ID ( params )? LCB block RCB ;
    # 
    def func
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = FuncReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID83__ = nil
      __LCB85__ = nil
      __RCB87__ = nil
      params84 = nil
      block86 = nil

      tree_for_ID83 = nil
      tree_for_LCB85 = nil
      tree_for_RCB87 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 162:4: ID ( params )? LCB block RCB
        __ID83__ = match( ID, TOKENS_FOLLOWING_ID_IN_func_834 )

        tree_for_ID83 = @adaptor.create_with_payload( __ID83__ )
        root_0 = @adaptor.become_root( tree_for_ID83, root_0 )

        # at line 162:8: ( params )?
        alt_21 = 2
        look_21_0 = @input.peek( 1 )

        if ( look_21_0 == ID )
          alt_21 = 1
        end
        case alt_21
        when 1
          # at line 162:8: params
          @state.following.push( TOKENS_FOLLOWING_params_IN_func_837 )
          params84 = params
          @state.following.pop
          @adaptor.add_child( root_0, params84.tree )

        end
        __LCB85__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_840 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_func_843 )
        block86 = block
        @state.following.pop
        @adaptor.add_child( root_0, block86.tree )
        __RCB87__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_845 )
        # --> action
        return_value.result = FuncTree.new(__ID83__.text,( params84.nil? ? nil : params84.list ),( block86.nil? ? nil : block86.list ))
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

    ParamsReturnValue = define_return_scope :list

    # 
    # parser rule params
    # 
    # (in Giraffe.g)
    # 166:1: params returns [list] : ID paramRest ;
    # 
    def params
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ParamsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID88__ = nil
      paramRest89 = nil

      tree_for_ID88 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 167:4: ID paramRest
        __ID88__ = match( ID, TOKENS_FOLLOWING_ID_IN_params_865 )

        tree_for_ID88 = @adaptor.create_with_payload( __ID88__ )
        @adaptor.add_child( root_0, tree_for_ID88 )

        @state.following.push( TOKENS_FOLLOWING_paramRest_IN_params_867 )
        paramRest89 = paramRest
        @state.following.pop
        @adaptor.add_child( root_0, paramRest89.tree )
        # --> action
        return_value.list = [__ID88__.text] + ( paramRest89.nil? ? nil : paramRest89.list )
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

    ParamRestReturnValue = define_return_scope :list

    # 
    # parser rule paramRest
    # 
    # (in Giraffe.g)
    # 171:1: paramRest returns [list] : ( COMMA params | );
    # 
    def paramRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ParamRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA90__ = nil
      params91 = nil

      tree_for_COMMA90 = nil

      begin
        # at line 172:2: ( COMMA params | )
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == COMMA )
          alt_22 = 1
        elsif ( look_22_0 == LCB )
          alt_22 = 2
        else
          raise NoViableAlternative( "", 22, 0 )
        end
        case alt_22
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 172:4: COMMA params
          __COMMA90__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_paramRest_886 )
          @state.following.push( TOKENS_FOLLOWING_params_IN_paramRest_889 )
          params91 = params
          @state.following.pop
          @adaptor.add_child( root_0, params91.tree )
          # --> action
          return_value.list = ( params91.nil? ? nil : params91.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 174:4: 
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

    CallReturnValue = define_return_scope :result

    # 
    # parser rule call
    # 
    # (in Giraffe.g)
    # 177:1: call returns [result] : fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )* ;
    # 
    def call
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = CallReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      fun = nil
      method = nil
      __LB92__ = nil
      __RB93__ = nil
      __DOT94__ = nil
      __LB95__ = nil
      __RB96__ = nil
      args1 = nil
      args2 = nil

      tree_for_fun = nil
      tree_for_method = nil
      tree_for_LB92 = nil
      tree_for_RB93 = nil
      tree_for_DOT94 = nil
      tree_for_LB95 = nil
      tree_for_RB96 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 178:4: fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )*
        fun = match( ID, TOKENS_FOLLOWING_ID_IN_call_918 )

        tree_for_fun = @adaptor.create_with_payload( fun )
        root_0 = @adaptor.become_root( tree_for_fun, root_0 )

        __LB92__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_921 )
        # at line 178:21: (args1= args )?
        alt_23 = 2
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == READ || look_23_0 == LB || look_23_0.between?( PLUS, INT ) || look_23_0 == ID || look_23_0.between?( TO_INT, NEW ) || look_23_0 == STRING || look_23_0 == T__64 )
          alt_23 = 1
        end
        case alt_23
        when 1
          # at line 178:21: args1= args
          @state.following.push( TOKENS_FOLLOWING_args_IN_call_926 )
          args1 = args
          @state.following.pop
          @adaptor.add_child( root_0, args1.tree )

        end
        __RB93__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_929 )
        # --> action
        return_value.result = [CallTree.new(fun.text,( args1.nil? ? nil : args1.list )),tree_for_fun]
        # <-- action
        # at line 180:3: ( DOT method= ID LB (args2= args )? RB )*
        while true # decision 25
          alt_25 = 2
          look_25_0 = @input.peek( 1 )

          if ( look_25_0 == DOT )
            alt_25 = 1

          end
          case alt_25
          when 1
            # at line 180:5: DOT method= ID LB (args2= args )? RB
            __DOT94__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_call_940 )

            tree_for_DOT94 = @adaptor.create_with_payload( __DOT94__ )
            @adaptor.add_child( root_0, tree_for_DOT94 )

            method = match( ID, TOKENS_FOLLOWING_ID_IN_call_944 )

            tree_for_method = @adaptor.create_with_payload( method )
            @adaptor.add_child( root_0, tree_for_method )

            __LB95__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_946 )
            # at line 180:28: (args2= args )?
            alt_24 = 2
            look_24_0 = @input.peek( 1 )

            if ( look_24_0 == READ || look_24_0 == LB || look_24_0.between?( PLUS, INT ) || look_24_0 == ID || look_24_0.between?( TO_INT, NEW ) || look_24_0 == STRING || look_24_0 == T__64 )
              alt_24 = 1
            end
            case alt_24
            when 1
              # at line 180:28: args2= args
              @state.following.push( TOKENS_FOLLOWING_args_IN_call_951 )
              args2 = args
              @state.following.pop
              @adaptor.add_child( root_0, args2.tree )

            end
            __RB96__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_954 )
            # --> action
            return_value.result = [MethodCallTree.new(return_value.result,method.text,( args2.nil? ? nil : args2.list )),tree_for_method]
            # <-- action

          else
            break # out of loop for decision 25
          end
        end # loop for decision 25
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

    ArgsReturnValue = define_return_scope :list

    # 
    # parser rule args
    # 
    # (in Giraffe.g)
    # 183:1: args returns [list] : expression argsRest ;
    # 
    def args
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = ArgsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      expression97 = nil
      argsRest98 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 184:5: expression argsRest
        @state.following.push( TOKENS_FOLLOWING_expression_IN_args_976 )
        expression97 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression97.tree )
        @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_978 )
        argsRest98 = argsRest
        @state.following.pop
        @adaptor.add_child( root_0, argsRest98.tree )
        # --> action
        return_value.list = [( expression97.nil? ? nil : expression97.result )] + ( argsRest98.nil? ? nil : argsRest98.list )
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
        # trace_out( __method__, 25 )

      end
      
      return return_value
    end

    ArgsRestReturnValue = define_return_scope :list

    # 
    # parser rule argsRest
    # 
    # (in Giraffe.g)
    # 187:1: argsRest returns [list] : ( COMMA args | );
    # 
    def argsRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = ArgsRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA99__ = nil
      args100 = nil

      tree_for_COMMA99 = nil

      begin
        # at line 188:2: ( COMMA args | )
        alt_26 = 2
        look_26_0 = @input.peek( 1 )

        if ( look_26_0 == COMMA )
          alt_26 = 1
        elsif ( look_26_0 == RB )
          alt_26 = 2
        else
          raise NoViableAlternative( "", 26, 0 )
        end
        case alt_26
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 188:4: COMMA args
          __COMMA99__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsRest_997 )
          @state.following.push( TOKENS_FOLLOWING_args_IN_argsRest_1000 )
          args100 = args
          @state.following.pop
          @adaptor.add_child( root_0, args100.tree )
          # --> action
          return_value.list = ( args100.nil? ? nil : args100.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 190:4: 
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
        # trace_out( __method__, 26 )

      end
      
      return return_value
    end

    ConditionReturnValue = define_return_scope :result

    # 
    # parser rule condition
    # 
    # (in Giraffe.g)
    # 195:1: condition returns [result] : orOperand ( OR op= condition )? ;
    # 
    def condition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = ConditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OR102__ = nil
      op = nil
      orOperand101 = nil

      tree_for_OR102 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 196:4: orOperand ( OR op= condition )?
        @state.following.push( TOKENS_FOLLOWING_orOperand_IN_condition_1026 )
        orOperand101 = orOperand
        @state.following.pop
        @adaptor.add_child( root_0, orOperand101.tree )
        # --> action
        return_value.result = ( orOperand101.nil? ? nil : orOperand101.result )
        # <-- action
        # at line 197:3: ( OR op= condition )?
        alt_27 = 2
        look_27_0 = @input.peek( 1 )

        if ( look_27_0 == OR )
          alt_27 = 1
        end
        case alt_27
        when 1
          # at line 197:4: OR op= condition
          __OR102__ = match( OR, TOKENS_FOLLOWING_OR_IN_condition_1033 )

          tree_for_OR102 = @adaptor.create_with_payload( __OR102__ )
          root_0 = @adaptor.become_root( tree_for_OR102, root_0 )

          @state.following.push( TOKENS_FOLLOWING_condition_IN_condition_1038 )
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
        # trace_out( __method__, 27 )

      end
      
      return return_value
    end

    OrOperandReturnValue = define_return_scope :result

    # 
    # parser rule orOperand
    # 
    # (in Giraffe.g)
    # 202:1: orOperand returns [result] : boolOperand ( AND op= orOperand )? ;
    # 
    def orOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = OrOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __AND104__ = nil
      op = nil
      boolOperand103 = nil

      tree_for_AND104 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 203:4: boolOperand ( AND op= orOperand )?
        @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_orOperand_1059 )
        boolOperand103 = boolOperand
        @state.following.pop
        @adaptor.add_child( root_0, boolOperand103.tree )
        # --> action
        return_value.result = ( boolOperand103.nil? ? nil : boolOperand103.result )
        # <-- action
        # at line 204:3: ( AND op= orOperand )?
        alt_28 = 2
        look_28_0 = @input.peek( 1 )

        if ( look_28_0 == AND )
          alt_28 = 1
        end
        case alt_28
        when 1
          # at line 204:4: AND op= orOperand
          __AND104__ = match( AND, TOKENS_FOLLOWING_AND_IN_orOperand_1066 )

          tree_for_AND104 = @adaptor.create_with_payload( __AND104__ )
          root_0 = @adaptor.become_root( tree_for_AND104, root_0 )

          @state.following.push( TOKENS_FOLLOWING_orOperand_IN_orOperand_1071 )
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
        # trace_out( __method__, 28 )

      end
      
      return return_value
    end

    BoolOperandReturnValue = define_return_scope :result

    # 
    # parser rule boolOperand
    # 
    # (in Giraffe.g)
    # 207:1: boolOperand returns [result] : ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) );
    # 
    def boolOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = BoolOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NOT106__ = nil
      __LB107__ = nil
      __RB109__ = nil
      __EQ110__ = nil
      __NE111__ = nil
      __LT112__ = nil
      __GT113__ = nil
      __LE114__ = nil
      __GE115__ = nil
      op1 = nil
      op2 = nil
      bool105 = nil
      condition108 = nil

      tree_for_NOT106 = nil
      tree_for_LB107 = nil
      tree_for_RB109 = nil
      tree_for_EQ110 = nil
      tree_for_NE111 = nil
      tree_for_LT112 = nil
      tree_for_GT113 = nil
      tree_for_LE114 = nil
      tree_for_GE115 = nil

      begin
        # at line 208:2: ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) )
        alt_36 = 3
        case look_36 = @input.peek( 1 )
        when TRUE, FALSE then alt_36 = 1
        when NOT then alt_36 = 2
        when READ, LB, PLUS, MINUS, INT, ID, TO_INT, TO_FLOAT, FLOAT, NEW, STRING, T__64 then alt_36 = 3
        else
          raise NoViableAlternative( "", 36, 0 )
        end
        case alt_36
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 208:4: bool
          @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1090 )
          bool105 = bool
          @state.following.pop
          @adaptor.add_child( root_0, bool105.tree )
          # --> action
          return_value.result = ( bool105.nil? ? nil : bool105.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 209:4: NOT LB condition RB
          __NOT106__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_boolOperand_1097 )

          tree_for_NOT106 = @adaptor.create_with_payload( __NOT106__ )
          @adaptor.add_child( root_0, tree_for_NOT106 )

          __LB107__ = match( LB, TOKENS_FOLLOWING_LB_IN_boolOperand_1099 )
          @state.following.push( TOKENS_FOLLOWING_condition_IN_boolOperand_1102 )
          condition108 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition108.tree )
          __RB109__ = match( RB, TOKENS_FOLLOWING_RB_IN_boolOperand_1104 )
          # --> action
          return_value.result = !( condition108.nil? ? nil : condition108.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 210:4: op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1114 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # at line 210:19: ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          alt_35 = 6
          case look_35 = @input.peek( 1 )
          when EQ then alt_35 = 1
          when NE then alt_35 = 2
          when LT then alt_35 = 3
          when GT then alt_35 = 4
          when LE then alt_35 = 5
          when GE then alt_35 = 6
          else
            raise NoViableAlternative( "", 35, 0 )
          end
          case alt_35
          when 1
            # at line 210:20: EQ (op2= bool | op2= expression )
            __EQ110__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_boolOperand_1117 )

            tree_for_EQ110 = @adaptor.create_with_payload( __EQ110__ )
            root_0 = @adaptor.become_root( tree_for_EQ110, root_0 )

            # at line 210:24: (op2= bool | op2= expression )
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
              # at line 210:26: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1124 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 210:37: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1130 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:eq)),op2.tree]
            # <-- action

          when 2
            # at line 211:6: NE (op2= bool | op2= expression )
            __NE111__ = match( NE, TOKENS_FOLLOWING_NE_IN_boolOperand_1141 )

            tree_for_NE111 = @adaptor.create_with_payload( __NE111__ )
            root_0 = @adaptor.become_root( tree_for_NE111, root_0 )

            # at line 211:10: (op2= bool | op2= expression )
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
              # at line 211:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1148 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 211:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1154 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:ne)),op2.tree]
            # <-- action

          when 3
            # at line 212:6: LT (op2= bool | op2= expression )
            __LT112__ = match( LT, TOKENS_FOLLOWING_LT_IN_boolOperand_1165 )

            tree_for_LT112 = @adaptor.create_with_payload( __LT112__ )
            root_0 = @adaptor.become_root( tree_for_LT112, root_0 )

            # at line 212:10: (op2= bool | op2= expression )
            alt_31 = 2
            look_31_0 = @input.peek( 1 )

            if ( look_31_0.between?( TRUE, FALSE ) )
              alt_31 = 1
            elsif ( look_31_0 == READ || look_31_0 == LB || look_31_0.between?( PLUS, INT ) || look_31_0 == ID || look_31_0.between?( TO_INT, NEW ) || look_31_0 == STRING || look_31_0 == T__64 )
              alt_31 = 2
            else
              raise NoViableAlternative( "", 31, 0 )
            end
            case alt_31
            when 1
              # at line 212:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1172 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 212:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1178 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:lt)),op2.tree]
            # <-- action

          when 4
            # at line 213:6: GT (op2= bool | op2= expression )
            __GT113__ = match( GT, TOKENS_FOLLOWING_GT_IN_boolOperand_1189 )

            tree_for_GT113 = @adaptor.create_with_payload( __GT113__ )
            root_0 = @adaptor.become_root( tree_for_GT113, root_0 )

            # at line 213:10: (op2= bool | op2= expression )
            alt_32 = 2
            look_32_0 = @input.peek( 1 )

            if ( look_32_0.between?( TRUE, FALSE ) )
              alt_32 = 1
            elsif ( look_32_0 == READ || look_32_0 == LB || look_32_0.between?( PLUS, INT ) || look_32_0 == ID || look_32_0.between?( TO_INT, NEW ) || look_32_0 == STRING || look_32_0 == T__64 )
              alt_32 = 2
            else
              raise NoViableAlternative( "", 32, 0 )
            end
            case alt_32
            when 1
              # at line 213:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1196 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 213:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1202 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:gt)),op2.tree]
            # <-- action

          when 5
            # at line 214:6: LE (op2= bool | op2= expression )
            __LE114__ = match( LE, TOKENS_FOLLOWING_LE_IN_boolOperand_1213 )

            tree_for_LE114 = @adaptor.create_with_payload( __LE114__ )
            root_0 = @adaptor.become_root( tree_for_LE114, root_0 )

            # at line 214:10: (op2= bool | op2= expression )
            alt_33 = 2
            look_33_0 = @input.peek( 1 )

            if ( look_33_0.between?( TRUE, FALSE ) )
              alt_33 = 1
            elsif ( look_33_0 == READ || look_33_0 == LB || look_33_0.between?( PLUS, INT ) || look_33_0 == ID || look_33_0.between?( TO_INT, NEW ) || look_33_0 == STRING || look_33_0 == T__64 )
              alt_33 = 2
            else
              raise NoViableAlternative( "", 33, 0 )
            end
            case alt_33
            when 1
              # at line 214:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1220 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 214:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1226 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:le)),op2.tree]
            # <-- action

          when 6
            # at line 215:6: GE (op2= bool | op2= expression )
            __GE115__ = match( GE, TOKENS_FOLLOWING_GE_IN_boolOperand_1237 )

            tree_for_GE115 = @adaptor.create_with_payload( __GE115__ )
            root_0 = @adaptor.become_root( tree_for_GE115, root_0 )

            # at line 215:10: (op2= bool | op2= expression )
            alt_34 = 2
            look_34_0 = @input.peek( 1 )

            if ( look_34_0.between?( TRUE, FALSE ) )
              alt_34 = 1
            elsif ( look_34_0 == READ || look_34_0 == LB || look_34_0.between?( PLUS, INT ) || look_34_0 == ID || look_34_0.between?( TO_INT, NEW ) || look_34_0 == STRING || look_34_0 == T__64 )
              alt_34 = 2
            else
              raise NoViableAlternative( "", 34, 0 )
            end
            case alt_34
            when 1
              # at line 215:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1244 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 215:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1250 )
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
        # trace_out( __method__, 29 )

      end
      
      return return_value
    end

    ExpressionReturnValue = define_return_scope :result

    # 
    # parser rule expression
    # 
    # (in Giraffe.g)
    # 220:1: expression returns [result] : addOperand ( PLUS op= expression | MINUS op= expression )? ;
    # 
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS117__ = nil
      __MINUS118__ = nil
      op = nil
      addOperand116 = nil

      tree_for_PLUS117 = nil
      tree_for_MINUS118 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 221:4: addOperand ( PLUS op= expression | MINUS op= expression )?
        @state.following.push( TOKENS_FOLLOWING_addOperand_IN_expression_1275 )
        addOperand116 = addOperand
        @state.following.pop
        @adaptor.add_child( root_0, addOperand116.tree )
        # --> action
        return_value.result = ( addOperand116.nil? ? nil : addOperand116.result )
        # <-- action
        # at line 222:3: ( PLUS op= expression | MINUS op= expression )?
        alt_37 = 3
        look_37_0 = @input.peek( 1 )

        if ( look_37_0 == PLUS )
          alt_37 = 1
        elsif ( look_37_0 == MINUS )
          alt_37 = 2
        end
        case alt_37
        when 1
          # at line 223:4: PLUS op= expression
          __PLUS117__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expression_1286 )

          tree_for_PLUS117 = @adaptor.create_with_payload( __PLUS117__ )
          root_0 = @adaptor.become_root( tree_for_PLUS117, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1291 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:add)),op.tree]
          # <-- action

        when 2
          # at line 224:5: MINUS op= expression
          __MINUS118__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expression_1299 )

          tree_for_MINUS118 = @adaptor.create_with_payload( __MINUS118__ )
          root_0 = @adaptor.become_root( tree_for_MINUS118, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1304 )
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
        # trace_out( __method__, 30 )

      end
      
      return return_value
    end

    AddOperandReturnValue = define_return_scope :result

    # 
    # parser rule addOperand
    # 
    # (in Giraffe.g)
    # 228:1: addOperand returns [result] : mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )? ;
    # 
    def addOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = AddOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __MUL120__ = nil
      __DIV121__ = nil
      __MOD122__ = nil
      op = nil
      mulOperand119 = nil

      tree_for_MUL120 = nil
      tree_for_DIV121 = nil
      tree_for_MOD122 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 229:4: mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperand_1326 )
        mulOperand119 = mulOperand
        @state.following.pop
        @adaptor.add_child( root_0, mulOperand119.tree )
        # --> action
        return_value.result = ( mulOperand119.nil? ? nil : mulOperand119.result )
        # <-- action
        # at line 230:3: ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        alt_38 = 4
        case look_38 = @input.peek( 1 )
        when MUL then alt_38 = 1
        when DIV then alt_38 = 2
        when MOD then alt_38 = 3
        end
        case alt_38
        when 1
          # at line 231:4: MUL op= addOperand
          __MUL120__ = match( MUL, TOKENS_FOLLOWING_MUL_IN_addOperand_1337 )

          tree_for_MUL120 = @adaptor.create_with_payload( __MUL120__ )
          root_0 = @adaptor.become_root( tree_for_MUL120, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1342 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:mul)),op.tree]
          # <-- action

        when 2
          # at line 232:5: DIV op= addOperand
          __DIV121__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_addOperand_1350 )

          tree_for_DIV121 = @adaptor.create_with_payload( __DIV121__ )
          root_0 = @adaptor.become_root( tree_for_DIV121, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1355 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:div)),op.tree]
          # <-- action

        when 3
          # at line 233:5: MOD op= addOperand
          __MOD122__ = match( MOD, TOKENS_FOLLOWING_MOD_IN_addOperand_1363 )

          tree_for_MOD122 = @adaptor.create_with_payload( __MOD122__ )
          root_0 = @adaptor.become_root( tree_for_MOD122, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1368 )
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
        # trace_out( __method__, 31 )

      end
      
      return return_value
    end

    MulOperandReturnValue = define_return_scope :result

    # 
    # parser rule mulOperand
    # 
    # (in Giraffe.g)
    # 237:1: mulOperand returns [result] : ( PLUS mulOperandRest | MINUS mulOperandRest | TO_INT mulOperandRest | TO_FLOAT mulOperandRest | mulOperandRest );
    # 
    def mulOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = MulOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS123__ = nil
      __MINUS125__ = nil
      __TO_INT127__ = nil
      __TO_FLOAT129__ = nil
      mulOperandRest124 = nil
      mulOperandRest126 = nil
      mulOperandRest128 = nil
      mulOperandRest130 = nil
      mulOperandRest131 = nil

      tree_for_PLUS123 = nil
      tree_for_MINUS125 = nil
      tree_for_TO_INT127 = nil
      tree_for_TO_FLOAT129 = nil

      begin
        # at line 238:2: ( PLUS mulOperandRest | MINUS mulOperandRest | TO_INT mulOperandRest | TO_FLOAT mulOperandRest | mulOperandRest )
        alt_39 = 5
        case look_39 = @input.peek( 1 )
        when PLUS then alt_39 = 1
        when MINUS then alt_39 = 2
        when TO_INT then alt_39 = 3
        when TO_FLOAT then alt_39 = 4
        when READ, LB, INT, ID, FLOAT, NEW, STRING, T__64 then alt_39 = 5
        else
          raise NoViableAlternative( "", 39, 0 )
        end
        case alt_39
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 238:4: PLUS mulOperandRest
          __PLUS123__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_mulOperand_1390 )

          tree_for_PLUS123 = @adaptor.create_with_payload( __PLUS123__ )
          @adaptor.add_child( root_0, tree_for_PLUS123 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1392 )
          mulOperandRest124 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest124.tree )
          # --> action
          return_value.result = ( mulOperandRest124.nil? ? nil : mulOperandRest124.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 239:4: MINUS mulOperandRest
          __MINUS125__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_mulOperand_1399 )

          tree_for_MINUS125 = @adaptor.create_with_payload( __MINUS125__ )
          @adaptor.add_child( root_0, tree_for_MINUS125 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1401 )
          mulOperandRest126 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest126.tree )
          # --> action
          return_value.result = [UnaryOperatorTree.new(( mulOperandRest126.nil? ? nil : mulOperandRest126.result ),Operators.method(:neg)),$mulOperandRest126.tree]
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 240:4: TO_INT mulOperandRest
          __TO_INT127__ = match( TO_INT, TOKENS_FOLLOWING_TO_INT_IN_mulOperand_1408 )

          tree_for_TO_INT127 = @adaptor.create_with_payload( __TO_INT127__ )
          @adaptor.add_child( root_0, tree_for_TO_INT127 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1410 )
          mulOperandRest128 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest128.tree )
          # --> action
          return_value.result = [UnaryOperatorTree.new(( mulOperandRest128.nil? ? nil : mulOperandRest128.result ),Operators.method(:int)),$mulOperandRest128.tree]
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 241:4: TO_FLOAT mulOperandRest
          __TO_FLOAT129__ = match( TO_FLOAT, TOKENS_FOLLOWING_TO_FLOAT_IN_mulOperand_1417 )

          tree_for_TO_FLOAT129 = @adaptor.create_with_payload( __TO_FLOAT129__ )
          @adaptor.add_child( root_0, tree_for_TO_FLOAT129 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1419 )
          mulOperandRest130 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest130.tree )
          # --> action
          return_value.result = [UnaryOperatorTree.new(( mulOperandRest130.nil? ? nil : mulOperandRest130.result ),Operators.method(:float)),$mulOperandRest130.tree]
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 242:4: mulOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1426 )
          mulOperandRest131 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest131.tree )
          # --> action
          return_value.result = ( mulOperandRest131.nil? ? nil : mulOperandRest131.result )
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

    MulOperandRestReturnValue = define_return_scope :result

    # 
    # parser rule mulOperandRest
    # 
    # (in Giraffe.g)
    # 245:1: mulOperandRest returns [result] : arrayIndexTarget ( '[' expression ']' )* ;
    # 
    def mulOperandRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = MulOperandRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal133 = nil
      char_literal135 = nil
      arrayIndexTarget132 = nil
      expression134 = nil

      tree_for_char_literal133 = nil
      tree_for_char_literal135 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 246:4: arrayIndexTarget ( '[' expression ']' )*
        @state.following.push( TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1443 )
        arrayIndexTarget132 = arrayIndexTarget
        @state.following.pop
        @adaptor.add_child( root_0, arrayIndexTarget132.tree )
        # --> action
        return_value.result = ( arrayIndexTarget132.nil? ? nil : arrayIndexTarget132.result )
        # <-- action
        # at line 247:3: ( '[' expression ']' )*
        while true # decision 40
          alt_40 = 2
          look_40_0 = @input.peek( 1 )

          if ( look_40_0 == T__64 )
            alt_40 = 1

          end
          case alt_40
          when 1
            # at line 247:4: '[' expression ']'
            char_literal133 = match( T__64, TOKENS_FOLLOWING_T__64_IN_mulOperandRest_1451 )

            tree_for_char_literal133 = @adaptor.create_with_payload( char_literal133 )
            @adaptor.add_child( root_0, tree_for_char_literal133 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_mulOperandRest_1453 )
            expression134 = expression
            @state.following.pop
            @adaptor.add_child( root_0, expression134.tree )
            char_literal135 = match( T__65, TOKENS_FOLLOWING_T__65_IN_mulOperandRest_1455 )

            tree_for_char_literal135 = @adaptor.create_with_payload( char_literal135 )
            @adaptor.add_child( root_0, tree_for_char_literal135 )

            # --> action
             return_value.result = [IndexTree.new(return_value.result,( expression134.nil? ? nil : expression134.result )),expression134.tree] 
            # <-- action

          else
            break # out of loop for decision 40
          end
        end # loop for decision 40
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

    ArrayIndexTargetReturnValue = define_return_scope :result

    # 
    # parser rule arrayIndexTarget
    # 
    # (in Giraffe.g)
    # 250:1: arrayIndexTarget returns [result] : ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction | new );
    # 
    def arrayIndexTarget
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = ArrayIndexTargetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID136__ = nil
      __LB137__ = nil
      __RB139__ = nil
      __INT140__ = nil
      __FLOAT141__ = nil
      expression138 = nil
      string142 = nil
      call143 = nil
      array144 = nil
      readInstruction145 = nil
      new146 = nil

      tree_for_ID136 = nil
      tree_for_LB137 = nil
      tree_for_RB139 = nil
      tree_for_INT140 = nil
      tree_for_FLOAT141 = nil

      begin
        # at line 251:2: ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction | new )
        alt_41 = 9
        alt_41 = @dfa41.predict( @input )
        case alt_41
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 251:4: ID
          __ID136__ = match( ID, TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1477 )

          tree_for_ID136 = @adaptor.create_with_payload( __ID136__ )
          @adaptor.add_child( root_0, tree_for_ID136 )

          # --> action
          return_value.result = [VarTree.new(__ID136__.text),tree_for_ID136]
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 252:4: LB expression RB
          __LB137__ = match( LB, TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1484 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1487 )
          expression138 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression138.tree )
          __RB139__ = match( RB, TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1489 )
          # --> action
          return_value.result = ( expression138.nil? ? nil : expression138.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 253:4: INT
          __INT140__ = match( INT, TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1497 )

          tree_for_INT140 = @adaptor.create_with_payload( __INT140__ )
          @adaptor.add_child( root_0, tree_for_INT140 )

          # --> action
          return_value.result = [AtomTree.new(__INT140__.text.to_i),tree_for_INT140]
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 254:4: FLOAT
          __FLOAT141__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_arrayIndexTarget_1504 )

          tree_for_FLOAT141 = @adaptor.create_with_payload( __FLOAT141__ )
          @adaptor.add_child( root_0, tree_for_FLOAT141 )

          # --> action
          return_value.result = [AtomTree.new(__FLOAT141__.text.to_f),tree_for_FLOAT141]
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 255:4: string
          @state.following.push( TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1511 )
          string142 = string
          @state.following.pop
          @adaptor.add_child( root_0, string142.tree )
          # --> action
          return_value.result = [AtomTree.new(( string142.nil? ? nil : string142.result )),string142.tree]
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 256:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1518 )
          call143 = call
          @state.following.pop
          @adaptor.add_child( root_0, call143.tree )
          # --> action
          return_value.result = ( call143.nil? ? nil : call143.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 257:4: array
          @state.following.push( TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1525 )
          array144 = array
          @state.following.pop
          @adaptor.add_child( root_0, array144.tree )
          # --> action
          return_value.result = [ArrayTree.new(( array144.nil? ? nil : array144.result )),array144.tree]
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 258:4: readInstruction
          @state.following.push( TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1532 )
          readInstruction145 = readInstruction
          @state.following.pop
          @adaptor.add_child( root_0, readInstruction145.tree )
          # --> action
          return_value.result = ( readInstruction145.nil? ? nil : readInstruction145.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 259:4: new
          @state.following.push( TOKENS_FOLLOWING_new_IN_arrayIndexTarget_1539 )
          new146 = new
          @state.following.pop
          @adaptor.add_child( root_0, new146.tree )
          # --> action
          return_value.result = ( new146.nil? ? nil : new146.result )
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

    NewReturnValue = define_return_scope :result

    # 
    # parser rule new
    # 
    # (in Giraffe.g)
    # 262:1: new returns [result] : NEW ID ( LB ( args )? RB )? ;
    # 
    def new
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = NewReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NEW147__ = nil
      __ID148__ = nil
      __LB149__ = nil
      __RB151__ = nil
      args150 = nil

      tree_for_NEW147 = nil
      tree_for_ID148 = nil
      tree_for_LB149 = nil
      tree_for_RB151 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 263:4: NEW ID ( LB ( args )? RB )?
        __NEW147__ = match( NEW, TOKENS_FOLLOWING_NEW_IN_new_1556 )

        tree_for_NEW147 = @adaptor.create_with_payload( __NEW147__ )
        @adaptor.add_child( root_0, tree_for_NEW147 )

        __ID148__ = match( ID, TOKENS_FOLLOWING_ID_IN_new_1558 )

        tree_for_ID148 = @adaptor.create_with_payload( __ID148__ )
        @adaptor.add_child( root_0, tree_for_ID148 )

        # at line 263:11: ( LB ( args )? RB )?
        alt_43 = 2
        look_43_0 = @input.peek( 1 )

        if ( look_43_0 == LB )
          alt_43 = 1
        end
        case alt_43
        when 1
          # at line 263:12: LB ( args )? RB
          __LB149__ = match( LB, TOKENS_FOLLOWING_LB_IN_new_1561 )

          tree_for_LB149 = @adaptor.create_with_payload( __LB149__ )
          @adaptor.add_child( root_0, tree_for_LB149 )

          # at line 263:15: ( args )?
          alt_42 = 2
          look_42_0 = @input.peek( 1 )

          if ( look_42_0 == READ || look_42_0 == LB || look_42_0.between?( PLUS, INT ) || look_42_0 == ID || look_42_0.between?( TO_INT, NEW ) || look_42_0 == STRING || look_42_0 == T__64 )
            alt_42 = 1
          end
          case alt_42
          when 1
            # at line 263:15: args
            @state.following.push( TOKENS_FOLLOWING_args_IN_new_1563 )
            args150 = args
            @state.following.pop
            @adaptor.add_child( root_0, args150.tree )

          end
          __RB151__ = match( RB, TOKENS_FOLLOWING_RB_IN_new_1566 )

          tree_for_RB151 = @adaptor.create_with_payload( __RB151__ )
          @adaptor.add_child( root_0, tree_for_RB151 )


        end
        # --> action
        return_value.result = [NewTree.new(__ID148__.text,( args150.nil? ? nil : args150.list )),tree_for_NEW147]
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

    ArrayReturnValue = define_return_scope :result

    # 
    # parser rule array
    # 
    # (in Giraffe.g)
    # 266:1: array returns [result] : '[' (ex1= expression ( COMMA ex2= expression )* )? ']' ;
    # 
    def array
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = ArrayReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal152 = nil
      __COMMA153__ = nil
      char_literal154 = nil
      ex1 = nil
      ex2 = nil

      tree_for_char_literal152 = nil
      tree_for_COMMA153 = nil
      tree_for_char_literal154 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 267:4: '[' (ex1= expression ( COMMA ex2= expression )* )? ']'
        char_literal152 = match( T__64, TOKENS_FOLLOWING_T__64_IN_array_1585 )

        tree_for_char_literal152 = @adaptor.create_with_payload( char_literal152 )
        @adaptor.add_child( root_0, tree_for_char_literal152 )

        # --> action
        return_value.result = []
        # <-- action
        # at line 268:3: (ex1= expression ( COMMA ex2= expression )* )?
        alt_45 = 2
        look_45_0 = @input.peek( 1 )

        if ( look_45_0 == READ || look_45_0 == LB || look_45_0.between?( PLUS, INT ) || look_45_0 == ID || look_45_0.between?( TO_INT, NEW ) || look_45_0 == STRING || look_45_0 == T__64 )
          alt_45 = 1
        end
        case alt_45
        when 1
          # at line 268:4: ex1= expression ( COMMA ex2= expression )*
          @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1594 )
          ex1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, ex1.tree )
          # --> action
          return_value.result << ( ex1.nil? ? nil : ex1.result )
          # <-- action
          # at line 269:3: ( COMMA ex2= expression )*
          while true # decision 44
            alt_44 = 2
            look_44_0 = @input.peek( 1 )

            if ( look_44_0 == COMMA )
              alt_44 = 1

            end
            case alt_44
            when 1
              # at line 269:4: COMMA ex2= expression
              __COMMA153__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_array_1601 )

              tree_for_COMMA153 = @adaptor.create_with_payload( __COMMA153__ )
              @adaptor.add_child( root_0, tree_for_COMMA153 )

              @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1605 )
              ex2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, ex2.tree )
              # --> action
              return_value.result << ( ex2.nil? ? nil : ex2.result )
              # <-- action

            else
              break # out of loop for decision 44
            end
          end # loop for decision 44

        end
        char_literal154 = match( T__65, TOKENS_FOLLOWING_T__65_IN_array_1616 )

        tree_for_char_literal154 = @adaptor.create_with_payload( char_literal154 )
        @adaptor.add_child( root_0, tree_for_char_literal154 )

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

    AssignmentReturnValue = define_return_scope :result

    # 
    # parser rule assignment
    # 
    # (in Giraffe.g)
    # 276:1: assignment returns [result] : var= ID ( ASSIGN op1= expression | ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) ) | ( DOT method2= ID LB (args2= args )? RB )+ ) ;
    # 
    def assignment
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = AssignmentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      var = nil
      method1 = nil
      method2 = nil
      __ASSIGN155__ = nil
      char_literal156 = nil
      char_literal157 = nil
      __ASSIGN158__ = nil
      __DOT159__ = nil
      __LB160__ = nil
      __RB161__ = nil
      __DOT162__ = nil
      __LB163__ = nil
      __RB164__ = nil
      op1 = nil
      index = nil
      op2 = nil
      args1 = nil
      args2 = nil

      tree_for_var = nil
      tree_for_method1 = nil
      tree_for_method2 = nil
      tree_for_ASSIGN155 = nil
      tree_for_char_literal156 = nil
      tree_for_char_literal157 = nil
      tree_for_ASSIGN158 = nil
      tree_for_DOT159 = nil
      tree_for_LB160 = nil
      tree_for_RB161 = nil
      tree_for_DOT162 = nil
      tree_for_LB163 = nil
      tree_for_RB164 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 277:4: var= ID ( ASSIGN op1= expression | ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) ) | ( DOT method2= ID LB (args2= args )? RB )+ )
        var = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1638 )

        tree_for_var = @adaptor.create_with_payload( var )
        @adaptor.add_child( root_0, tree_for_var )

        # --> action
        return_value.result = VarTree.new(var.text)
        # <-- action
        # at line 278:3: ( ASSIGN op1= expression | ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) ) | ( DOT method2= ID LB (args2= args )? RB )+ )
        alt_52 = 3
        case look_52 = @input.peek( 1 )
        when ASSIGN then alt_52 = 1
        when T__64 then alt_52 = 2
        when DOT then alt_52 = 3
        else
          raise NoViableAlternative( "", 52, 0 )
        end
        case alt_52
        when 1
          # at line 278:5: ASSIGN op1= expression
          __ASSIGN155__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1646 )

          tree_for_ASSIGN155 = @adaptor.create_with_payload( __ASSIGN155__ )
          root_0 = @adaptor.become_root( tree_for_ASSIGN155, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1651 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # --> action
           return_value.result = AssignTree.new(var.text,( op1.nil? ? nil : op1.result )) 
          # <-- action

        when 2
          # at line 279:5: ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) )
          # --> action
          index=nil
          # <-- action
          # at line 280:4: ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) )
          # at line 280:5: ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ )
          # at file 280:5: ( '[' index= expression ']' )+
          match_count_46 = 0
          while true
            alt_46 = 2
            look_46_0 = @input.peek( 1 )

            if ( look_46_0 == T__64 )
              alt_46 = 1

            end
            case alt_46
            when 1
              # at line 280:7: '[' index= expression ']'
              # --> action
              index_ = index
              # <-- action
              char_literal156 = match( T__64, TOKENS_FOLLOWING_T__64_IN_assignment_1670 )

              tree_for_char_literal156 = @adaptor.create_with_payload( char_literal156 )
              @adaptor.add_child( root_0, tree_for_char_literal156 )

              @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1674 )
              index = expression
              @state.following.pop
              @adaptor.add_child( root_0, index.tree )
              char_literal157 = match( T__65, TOKENS_FOLLOWING_T__65_IN_assignment_1676 )

              tree_for_char_literal157 = @adaptor.create_with_payload( char_literal157 )
              @adaptor.add_child( root_0, tree_for_char_literal157 )

              # --> action
              target_ = return_value.result; return_value.result = IndexTree.new(return_value.result,( index.nil? ? nil : index.result ))
              # <-- action

            else
              match_count_46 > 0 and break
              eee = EarlyExit(46)


              raise eee
            end
            match_count_46 += 1
          end

          # at line 281:4: ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ )
          alt_49 = 2
          look_49_0 = @input.peek( 1 )

          if ( look_49_0 == ASSIGN )
            alt_49 = 1
          elsif ( look_49_0 == DOT )
            alt_49 = 2
          else
            raise NoViableAlternative( "", 49, 0 )
          end
          case alt_49
          when 1
            # at line 281:6: ASSIGN op2= expression
            __ASSIGN158__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1689 )

            tree_for_ASSIGN158 = @adaptor.create_with_payload( __ASSIGN158__ )
            root_0 = @adaptor.become_root( tree_for_ASSIGN158, root_0 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1694 )
            op2 = expression
            @state.following.pop
            @adaptor.add_child( root_0, op2.tree )
            # --> action
             return_value.result = DerefTree.new(target_,( index.nil? ? nil : index.result ),( op2.nil? ? nil : op2.result )) 
            # <-- action

          when 2
            # at line 282:6: ( DOT method1= ID LB (args1= args )? RB )+
            # at file 282:6: ( DOT method1= ID LB (args1= args )? RB )+
            match_count_48 = 0
            while true
              alt_48 = 2
              look_48_0 = @input.peek( 1 )

              if ( look_48_0 == DOT )
                alt_48 = 1

              end
              case alt_48
              when 1
                # at line 282:7: DOT method1= ID LB (args1= args )? RB
                __DOT159__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_assignment_1709 )

                tree_for_DOT159 = @adaptor.create_with_payload( __DOT159__ )
                @adaptor.add_child( root_0, tree_for_DOT159 )

                method1 = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1713 )

                tree_for_method1 = @adaptor.create_with_payload( method1 )
                @adaptor.add_child( root_0, tree_for_method1 )

                __LB160__ = match( LB, TOKENS_FOLLOWING_LB_IN_assignment_1715 )
                # at line 282:31: (args1= args )?
                alt_47 = 2
                look_47_0 = @input.peek( 1 )

                if ( look_47_0 == READ || look_47_0 == LB || look_47_0.between?( PLUS, INT ) || look_47_0 == ID || look_47_0.between?( TO_INT, NEW ) || look_47_0 == STRING || look_47_0 == T__64 )
                  alt_47 = 1
                end
                case alt_47
                when 1
                  # at line 282:31: args1= args
                  @state.following.push( TOKENS_FOLLOWING_args_IN_assignment_1720 )
                  args1 = args
                  @state.following.pop
                  @adaptor.add_child( root_0, args1.tree )

                end
                __RB161__ = match( RB, TOKENS_FOLLOWING_RB_IN_assignment_1723 )
                # --> action
                return_value.result = MethodCallTree.new(return_value.result,method1.text,( args1.nil? ? nil : args1.list ))
                # <-- action

              else
                match_count_48 > 0 and break
                eee = EarlyExit(48)


                raise eee
              end
              match_count_48 += 1
            end


          end


        when 3
          # at line 284:5: ( DOT method2= ID LB (args2= args )? RB )+
          # at file 284:5: ( DOT method2= ID LB (args2= args )? RB )+
          match_count_51 = 0
          while true
            alt_51 = 2
            look_51_0 = @input.peek( 1 )

            if ( look_51_0 == DOT )
              alt_51 = 1

            end
            case alt_51
            when 1
              # at line 284:6: DOT method2= ID LB (args2= args )? RB
              __DOT162__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_assignment_1741 )

              tree_for_DOT162 = @adaptor.create_with_payload( __DOT162__ )
              @adaptor.add_child( root_0, tree_for_DOT162 )

              method2 = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1745 )

              tree_for_method2 = @adaptor.create_with_payload( method2 )
              @adaptor.add_child( root_0, tree_for_method2 )

              __LB163__ = match( LB, TOKENS_FOLLOWING_LB_IN_assignment_1747 )
              # at line 284:30: (args2= args )?
              alt_50 = 2
              look_50_0 = @input.peek( 1 )

              if ( look_50_0 == READ || look_50_0 == LB || look_50_0.between?( PLUS, INT ) || look_50_0 == ID || look_50_0.between?( TO_INT, NEW ) || look_50_0 == STRING || look_50_0 == T__64 )
                alt_50 = 1
              end
              case alt_50
              when 1
                # at line 284:30: args2= args
                @state.following.push( TOKENS_FOLLOWING_args_IN_assignment_1752 )
                args2 = args
                @state.following.pop
                @adaptor.add_child( root_0, args2.tree )

              end
              __RB164__ = match( RB, TOKENS_FOLLOWING_RB_IN_assignment_1755 )
              # --> action
              return_value.result = MethodCallTree.new(return_value.result,method2.text,( args2.nil? ? nil : args2.list )) 
              # <-- action

            else
              match_count_51 > 0 and break
              eee = EarlyExit(51)


              raise eee
            end
            match_count_51 += 1
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
        # trace_out( __method__, 37 )

      end
      
      return return_value
    end

    BoolReturnValue = define_return_scope :result

    # 
    # parser rule bool
    # 
    # (in Giraffe.g)
    # 288:1: bool returns [result] : ( TRUE | FALSE );
    # 
    def bool
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = BoolReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __TRUE165__ = nil
      __FALSE166__ = nil

      tree_for_TRUE165 = nil
      tree_for_FALSE166 = nil

      begin
        # at line 289:2: ( TRUE | FALSE )
        alt_53 = 2
        look_53_0 = @input.peek( 1 )

        if ( look_53_0 == TRUE )
          alt_53 = 1
        elsif ( look_53_0 == FALSE )
          alt_53 = 2
        else
          raise NoViableAlternative( "", 53, 0 )
        end
        case alt_53
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 289:4: TRUE
          __TRUE165__ = match( TRUE, TOKENS_FOLLOWING_TRUE_IN_bool_1782 )

          tree_for_TRUE165 = @adaptor.create_with_payload( __TRUE165__ )
          @adaptor.add_child( root_0, tree_for_TRUE165 )

          # --> action
          return_value.result = AtomTree.new(true)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 290:5: FALSE
          __FALSE166__ = match( FALSE, TOKENS_FOLLOWING_FALSE_IN_bool_1790 )

          tree_for_FALSE166 = @adaptor.create_with_payload( __FALSE166__ )
          @adaptor.add_child( root_0, tree_for_FALSE166 )

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
        # trace_out( __method__, 38 )

      end
      
      return return_value
    end

    StringReturnValue = define_return_scope :result

    # 
    # parser rule string
    # 
    # (in Giraffe.g)
    # 293:1: string returns [result] : STRING ;
    # 
    def string
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = StringReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __STRING167__ = nil

      tree_for_STRING167 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 294:4: STRING
        __STRING167__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_string_1808 )

        tree_for_STRING167 = @adaptor.create_with_payload( __STRING167__ )
        @adaptor.add_child( root_0, tree_for_STRING167 )

        # --> action
        return_value.result = __STRING167__.text[1..-2]
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
        # trace_out( __method__, 39 )

      end
      
      return return_value
    end

    ClassDefReturnValue = define_return_scope :result

    # 
    # parser rule classDef
    # 
    # (in Giraffe.g)
    # 301:1: classDef returns [result] : CLASS classid= ID ( SUPERCLASS superclassid= ID )? LCB block RCB ;
    # 
    def classDef
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = ClassDefReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      classid = nil
      superclassid = nil
      __CLASS168__ = nil
      __SUPERCLASS169__ = nil
      __LCB170__ = nil
      __RCB172__ = nil
      block171 = nil

      tree_for_classid = nil
      tree_for_superclassid = nil
      tree_for_CLASS168 = nil
      tree_for_SUPERCLASS169 = nil
      tree_for_LCB170 = nil
      tree_for_RCB172 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 302:4: CLASS classid= ID ( SUPERCLASS superclassid= ID )? LCB block RCB
        # --> action
        superclass=nil
        # <-- action
        __CLASS168__ = match( CLASS, TOKENS_FOLLOWING_CLASS_IN_classDef_1871 )

        tree_for_CLASS168 = @adaptor.create_with_payload( __CLASS168__ )
        root_0 = @adaptor.become_root( tree_for_CLASS168, root_0 )

        classid = match( ID, TOKENS_FOLLOWING_ID_IN_classDef_1876 )

        tree_for_classid = @adaptor.create_with_payload( classid )
        @adaptor.add_child( root_0, tree_for_classid )

        # at line 303:21: ( SUPERCLASS superclassid= ID )?
        alt_54 = 2
        look_54_0 = @input.peek( 1 )

        if ( look_54_0 == SUPERCLASS )
          alt_54 = 1
        end
        case alt_54
        when 1
          # at line 303:22: SUPERCLASS superclassid= ID
          __SUPERCLASS169__ = match( SUPERCLASS, TOKENS_FOLLOWING_SUPERCLASS_IN_classDef_1879 )

          tree_for_SUPERCLASS169 = @adaptor.create_with_payload( __SUPERCLASS169__ )
          @adaptor.add_child( root_0, tree_for_SUPERCLASS169 )

          superclassid = match( ID, TOKENS_FOLLOWING_ID_IN_classDef_1883 )

          tree_for_superclassid = @adaptor.create_with_payload( superclassid )
          @adaptor.add_child( root_0, tree_for_superclassid )

          # --> action
          superclass=superclassid.text
          # <-- action

        end
        __LCB170__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_classDef_1889 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_classDef_1896 )
        block171 = block
        @state.following.pop
        @adaptor.add_child( root_0, block171.tree )
        __RCB172__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_classDef_1900 )
        # --> action
        return_value.result = ClassTree.new(classid.text,( block171.nil? ? nil : block171.list ),superclass)
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
        # trace_out( __method__, 40 )

      end
      
      return return_value
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA10 < ANTLR3::DFA
      EOT = unpack( 14, -1 )
      EOF = unpack( 14, -1 )
      MIN = unpack( 1, 4, 1, 10, 12, -1 )
      MAX = unpack( 1, 63, 1, 64, 12, -1 )
      ACCEPT = unpack( 2, -1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 
                       1, 9, 1, 10, 1, 12, 1, 11, 1, 1 )
      SPECIAL = unpack( 14, -1 )
      TRANSITION = [
        unpack( 2, 11, 1, -1, 1, 10, 1, 8, 1, 9, 5, -1, 1, 6, 2, 7, 1, -1, 
                1, 3, 1, -1, 1, 11, 3, -1, 1, 4, 1, 5, 1, 2, 1, 1, 33, -1, 
                2, 11 ),
        unpack( 1, 12, 18, -1, 1, 13, 16, -1, 1, 13, 17, -1, 1, 13 ),
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
      
      @decision = 10
      

      def description
        <<-'__dfa_description__'.strip!
          83:1: instruction returns [result] : ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | returnInstruction | exitInstruction | breakInstruction | call | );
        __dfa_description__
      end
    end
    class DFA41 < ANTLR3::DFA
      EOT = unpack( 11, -1 )
      EOF = unpack( 11, -1 )
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
      
      @decision = 41
      

      def description
        <<-'__dfa_description__'.strip!
          250:1: arrayIndexTarget returns [result] : ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction | new );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa10 = DFA10.new( self, 10 )
      @dfa41 = DFA41.new( self, 41 )

    end
    TOKENS_FOLLOWING_functions_IN_program_56 = Set[ 1 ]
    TOKENS_FOLLOWING_func_IN_funcdef_74 = Set[ 1 ]
    TOKENS_FOLLOWING_funcdef_IN_functions_102 = Set[ 4, 5, 62, 63 ]
    TOKENS_FOLLOWING_functionsRest_IN_functions_110 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_functionsRest_136 = Set[ 62, 63 ]
    TOKENS_FOLLOWING_T__62_IN_functionsRest_140 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_functionsRest_144 = Set[ 4, 5, 28, 62, 63 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_functionsRest_150 = Set[ 4, 5, 28, 62, 63 ]
    TOKENS_FOLLOWING_functions_IN_functionsRest_157 = Set[ 1 ]
    TOKENS_FOLLOWING_instruction_IN_block_191 = Set[ 4, 5, 62, 63 ]
    TOKENS_FOLLOWING_instructionRest_IN_block_201 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_instructionRest_227 = Set[ 62, 63 ]
    TOKENS_FOLLOWING_T__62_IN_instructionRest_231 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_instructionRest_235 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_241 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_instructionRest_248 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_IN_instruction_277 = Set[ 1 ]
    TOKENS_FOLLOWING_forCycle_IN_instruction_284 = Set[ 1 ]
    TOKENS_FOLLOWING_ifInstruction_IN_instruction_291 = Set[ 1 ]
    TOKENS_FOLLOWING_whileCycle_IN_instruction_298 = Set[ 1 ]
    TOKENS_FOLLOWING_doCycle_IN_instruction_305 = Set[ 1 ]
    TOKENS_FOLLOWING_printInstruction_IN_instruction_312 = Set[ 1 ]
    TOKENS_FOLLOWING_printlInstruction_IN_instruction_319 = Set[ 1 ]
    TOKENS_FOLLOWING_returnInstruction_IN_instruction_326 = Set[ 1 ]
    TOKENS_FOLLOWING_exitInstruction_IN_instruction_334 = Set[ 1 ]
    TOKENS_FOLLOWING_breakInstruction_IN_instruction_341 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_instruction_348 = Set[ 1 ]
    TOKENS_FOLLOWING_READ_IN_readInstruction_371 = Set[ 1 ]
    TOKENS_FOLLOWING_BREAK_IN_breakInstruction_388 = Set[ 1 ]
    TOKENS_FOLLOWING_RETURN_IN_returnInstruction_405 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_returnInstruction_408 = Set[ 1 ]
    TOKENS_FOLLOWING_EXIT_IN_exitInstruction_425 = Set[ 1, 10, 12, 13, 14 ]
    TOKENS_FOLLOWING_LB_IN_exitInstruction_430 = Set[ 12, 13, 14 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_435 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_exitInstruction_437 = Set[ 1 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_450 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_statusCode_475 = Set[ 14 ]
    TOKENS_FOLLOWING_MINUS_IN_statusCode_479 = Set[ 14 ]
    TOKENS_FOLLOWING_INT_IN_statusCode_485 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINT_IN_printInstruction_506 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printInstruction_509 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_printlInstruction_530 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printlInstruction_539 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_printText_559 = Set[ 1, 18 ]
    TOKENS_FOLLOWING_COMMA_IN_printText_566 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printText_570 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_ifInstruction_593 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_ifInstruction_596 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_ifInstruction_598 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifInstruction_601 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_ifInstruction_603 = Set[ 22, 23, 24 ]
    TOKENS_FOLLOWING_ifRest_IN_ifInstruction_606 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_ifRest_625 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_627 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifRest_630 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_632 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_ifRest_640 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_ifRest_648 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_650 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifRest_653 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_655 = Set[ 22, 23, 24 ]
    TOKENS_FOLLOWING_ifRest_IN_ifRest_660 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_whileCycle_687 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_whileCycle_689 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_whileCycle_691 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_whileCycle_694 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_whileCycle_696 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_doCycle_718 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_doCycle_720 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_doCycle_723 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_doCycle_725 = Set[ 25 ]
    TOKENS_FOLLOWING_WHILE_IN_doCycle_728 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_doCycle_730 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_forCycle_751 = Set[ 28 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_755 = Set[ 4, 5, 62, 63 ]
    TOKENS_FOLLOWING_COMMENT_IN_forCycle_760 = Set[ 62, 63 ]
    TOKENS_FOLLOWING_T__62_IN_forCycle_764 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_forCycle_768 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_774 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_forCycle_779 = Set[ 4, 5, 62, 63 ]
    TOKENS_FOLLOWING_COMMENT_IN_forCycle_784 = Set[ 62, 63 ]
    TOKENS_FOLLOWING_T__62_IN_forCycle_788 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_forCycle_792 = Set[ 28 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_798 = Set[ 28 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_805 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_forCycle_807 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_forCycle_810 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_forCycle_812 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_func_834 = Set[ 20, 28 ]
    TOKENS_FOLLOWING_params_IN_func_837 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_func_840 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_func_843 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_func_845 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_params_865 = Set[ 18 ]
    TOKENS_FOLLOWING_paramRest_IN_params_867 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_paramRest_886 = Set[ 28 ]
    TOKENS_FOLLOWING_params_IN_paramRest_889 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_call_918 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_call_921 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_call_926 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_call_929 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_DOT_IN_call_940 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_call_944 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_call_946 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_call_951 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_call_954 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_expression_IN_args_976 = Set[ 18 ]
    TOKENS_FOLLOWING_argsRest_IN_args_978 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsRest_997 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_argsRest_1000 = Set[ 1 ]
    TOKENS_FOLLOWING_orOperand_IN_condition_1026 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_OR_IN_condition_1033 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_condition_1038 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperand_IN_orOperand_1059 = Set[ 1, 31 ]
    TOKENS_FOLLOWING_AND_IN_orOperand_1066 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_orOperand_IN_orOperand_1071 = Set[ 1 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1090 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_boolOperand_1097 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_boolOperand_1099 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_boolOperand_1102 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_boolOperand_1104 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1114 = Set[ 33, 34, 35, 36, 37, 38 ]
    TOKENS_FOLLOWING_EQ_IN_boolOperand_1117 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1124 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1130 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_boolOperand_1141 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1148 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1154 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_boolOperand_1165 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1172 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1178 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_boolOperand_1189 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1196 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1202 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_boolOperand_1213 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1220 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1226 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_boolOperand_1237 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1244 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1250 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperand_IN_expression_1275 = Set[ 1, 12, 13 ]
    TOKENS_FOLLOWING_PLUS_IN_expression_1286 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_expression_1291 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expression_1299 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_expression_1304 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperand_1326 = Set[ 1, 39, 40, 41 ]
    TOKENS_FOLLOWING_MUL_IN_addOperand_1337 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1342 = Set[ 1 ]
    TOKENS_FOLLOWING_DIV_IN_addOperand_1350 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1355 = Set[ 1 ]
    TOKENS_FOLLOWING_MOD_IN_addOperand_1363 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1368 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_mulOperand_1390 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1392 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_mulOperand_1399 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1401 = Set[ 1 ]
    TOKENS_FOLLOWING_TO_INT_IN_mulOperand_1408 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1410 = Set[ 1 ]
    TOKENS_FOLLOWING_TO_FLOAT_IN_mulOperand_1417 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1419 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1426 = Set[ 1 ]
    TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1443 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_T__64_IN_mulOperandRest_1451 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_mulOperandRest_1453 = Set[ 65 ]
    TOKENS_FOLLOWING_T__65_IN_mulOperandRest_1455 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1477 = Set[ 1 ]
    TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1484 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1487 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1489 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1497 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_arrayIndexTarget_1504 = Set[ 1 ]
    TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1511 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1518 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1525 = Set[ 1 ]
    TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1532 = Set[ 1 ]
    TOKENS_FOLLOWING_new_IN_arrayIndexTarget_1539 = Set[ 1 ]
    TOKENS_FOLLOWING_NEW_IN_new_1556 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_new_1558 = Set[ 1, 10 ]
    TOKENS_FOLLOWING_LB_IN_new_1561 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_new_1563 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_new_1566 = Set[ 1 ]
    TOKENS_FOLLOWING_T__64_IN_array_1585 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64, 65 ]
    TOKENS_FOLLOWING_expression_IN_array_1594 = Set[ 18, 65 ]
    TOKENS_FOLLOWING_COMMA_IN_array_1601 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_array_1605 = Set[ 18, 65 ]
    TOKENS_FOLLOWING_T__65_IN_array_1616 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1638 = Set[ 29, 46, 64 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1646 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1651 = Set[ 1 ]
    TOKENS_FOLLOWING_T__64_IN_assignment_1670 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1674 = Set[ 65 ]
    TOKENS_FOLLOWING_T__65_IN_assignment_1676 = Set[ 29, 46, 64 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1689 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1694 = Set[ 1 ]
    TOKENS_FOLLOWING_DOT_IN_assignment_1709 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1713 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_assignment_1715 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_assignment_1720 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_assignment_1723 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_DOT_IN_assignment_1741 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1745 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_assignment_1747 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_assignment_1752 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_assignment_1755 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_TRUE_IN_bool_1782 = Set[ 1 ]
    TOKENS_FOLLOWING_FALSE_IN_bool_1790 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_string_1808 = Set[ 1 ]
    TOKENS_FOLLOWING_CLASS_IN_classDef_1871 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_classDef_1876 = Set[ 20, 52 ]
    TOKENS_FOLLOWING_SUPERCLASS_IN_classDef_1879 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_classDef_1883 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_classDef_1889 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_classDef_1896 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_classDef_1900 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end


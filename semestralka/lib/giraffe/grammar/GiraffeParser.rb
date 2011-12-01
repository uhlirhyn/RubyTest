#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-12-01 23:36:48
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
        return_value.list = [( funcdef3.nil? ? nil : funcdef3.result )] unless ( funcdef3.nil? ? nil : funcdef3.result ) == nil
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
        return_value.list = [( instruction10.nil? ? nil : instruction10.result )] unless ( instruction10.nil? ? nil : instruction10.result ) == nil
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
          return_value.result = [( assignment17.nil? ? nil : assignment17.result ),assignment17.tree]
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
        return_value.result = [ReturnTree.new(( expression31.nil? ? nil : expression31.result )),tree_for_RETURN30]
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
    # 121:1: printInstruction returns [result] : PRINT LB printText RB ;
    # 
    def printInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = PrintInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PRINT38__ = nil
      __LB39__ = nil
      __RB41__ = nil
      printText40 = nil

      tree_for_PRINT38 = nil
      tree_for_LB39 = nil
      tree_for_RB41 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 122:5: PRINT LB printText RB
        __PRINT38__ = match( PRINT, TOKENS_FOLLOWING_PRINT_IN_printInstruction_506 )

        tree_for_PRINT38 = @adaptor.create_with_payload( __PRINT38__ )
        root_0 = @adaptor.become_root( tree_for_PRINT38, root_0 )

        __LB39__ = match( LB, TOKENS_FOLLOWING_LB_IN_printInstruction_509 )
        @state.following.push( TOKENS_FOLLOWING_printText_IN_printInstruction_512 )
        printText40 = printText
        @state.following.pop
        @adaptor.add_child( root_0, printText40.tree )
        __RB41__ = match( RB, TOKENS_FOLLOWING_RB_IN_printInstruction_514 )
        # --> action
        return_value.result = [PrintTree.new(( printText40.nil? ? nil : printText40.list )),tree_for_PRINT38]
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
    # 125:1: printlInstruction returns [result] : (an= PRINTL | an= PRINTLN ) LB printText RB ;
    # 
    def printlInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = PrintlInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      an = nil
      __LB42__ = nil
      __RB44__ = nil
      printText43 = nil

      tree_for_an = nil
      tree_for_LB42 = nil
      tree_for_RB44 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 126:5: (an= PRINTL | an= PRINTLN ) LB printText RB
        # at line 126:5: (an= PRINTL | an= PRINTLN )
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == PRINTL )
          alt_13 = 1
        elsif ( look_13_0 == PRINTLN )
          alt_13 = 2
        else
          raise NoViableAlternative( "", 13, 0 )
        end
        case alt_13
        when 1
          # at line 126:6: an= PRINTL
          an = match( PRINTL, TOKENS_FOLLOWING_PRINTL_IN_printlInstruction_540 )

          tree_for_an = @adaptor.create_with_payload( an )
          @adaptor.add_child( root_0, tree_for_an )


        when 2
          # at line 126:18: an= PRINTLN
          an = match( PRINTLN, TOKENS_FOLLOWING_PRINTLN_IN_printlInstruction_546 )

          tree_for_an = @adaptor.create_with_payload( an )
          @adaptor.add_child( root_0, tree_for_an )


        end
        __LB42__ = match( LB, TOKENS_FOLLOWING_LB_IN_printlInstruction_550 )
        @state.following.push( TOKENS_FOLLOWING_printText_IN_printlInstruction_553 )
        printText43 = printText
        @state.following.pop
        @adaptor.add_child( root_0, printText43.tree )
        __RB44__ = match( RB, TOKENS_FOLLOWING_RB_IN_printlInstruction_555 )
        # --> action
        return_value.result = [PrintTree.new(( printText43.nil? ? nil : printText43.list ),true),tree_for_an]
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
      __COMMA46__ = nil
      rest = nil
      expression45 = nil

      tree_for_COMMA46 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 130:4: expression ( COMMA rest= printText )?
        @state.following.push( TOKENS_FOLLOWING_expression_IN_printText_575 )
        expression45 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression45.tree )
        # --> action
        return_value.list = [( expression45.nil? ? nil : expression45.result )]
        # <-- action
        # at line 131:3: ( COMMA rest= printText )?
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == COMMA )
          alt_14 = 1
        end
        case alt_14
        when 1
          # at line 131:4: COMMA rest= printText
          __COMMA46__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_printText_582 )

          tree_for_COMMA46 = @adaptor.create_with_payload( __COMMA46__ )
          @adaptor.add_child( root_0, tree_for_COMMA46 )

          @state.following.push( TOKENS_FOLLOWING_printText_IN_printText_586 )
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
      __IF47__ = nil
      __LCB49__ = nil
      __RCB51__ = nil
      condition48 = nil
      block50 = nil
      ifRest52 = nil

      tree_for_IF47 = nil
      tree_for_LCB49 = nil
      tree_for_RCB51 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 135:4: IF condition LCB block RCB ifRest
        __IF47__ = match( IF, TOKENS_FOLLOWING_IF_IN_ifInstruction_610 )

        tree_for_IF47 = @adaptor.create_with_payload( __IF47__ )
        root_0 = @adaptor.become_root( tree_for_IF47, root_0 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_ifInstruction_613 )
        condition48 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition48.tree )
        __LCB49__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifInstruction_615 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_ifInstruction_618 )
        block50 = block
        @state.following.pop
        @adaptor.add_child( root_0, block50.tree )
        __RCB51__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifInstruction_620 )
        @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifInstruction_623 )
        ifRest52 = ifRest
        @state.following.pop
        @adaptor.add_child( root_0, ifRest52.tree )
        # --> action
        return_value.result = [IfTree.new(( condition48.nil? ? nil : condition48.result ),( block50.nil? ? nil : block50.list ),( ifRest52.nil? ? nil : ifRest52.result )),tree_for_IF47]
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
      __ELSE53__ = nil
      __LCB54__ = nil
      __RCB56__ = nil
      set57 = nil
      __LCB59__ = nil
      __RCB61__ = nil
      op = nil
      block55 = nil
      condition58 = nil
      block60 = nil

      tree_for_ELSE53 = nil
      tree_for_LCB54 = nil
      tree_for_RCB56 = nil
      tree_for_set57 = nil
      tree_for_LCB59 = nil
      tree_for_RCB61 = nil

      begin
        # at line 140:2: ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | )
        alt_15 = 3
        case look_15 = @input.peek( 1 )
        when ELSE then alt_15 = 1
        when ELSEIF, ELIF then alt_15 = 2
        when COMMENT, SEMICOLON, RCB, T__62, T__63 then alt_15 = 3
        else
          raise NoViableAlternative( "", 15, 0 )
        end
        case alt_15
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 140:4: ELSE LCB block RCB
          __ELSE53__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_ifRest_642 )

          tree_for_ELSE53 = @adaptor.create_with_payload( __ELSE53__ )
          @adaptor.add_child( root_0, tree_for_ELSE53 )

          __LCB54__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_644 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_647 )
          block55 = block
          @state.following.pop
          @adaptor.add_child( root_0, block55.tree )
          __RCB56__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_649 )
          # --> action
          return_value.result = ( block55.nil? ? nil : block55.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 141:4: ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest
          set57 = @input.look
          if @input.peek( 1 ).between?( ELSEIF, ELIF )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set57 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          @state.following.push( TOKENS_FOLLOWING_condition_IN_ifRest_665 )
          condition58 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition58.tree )
          __LCB59__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_667 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_670 )
          block60 = block
          @state.following.pop
          @adaptor.add_child( root_0, block60.tree )
          __RCB61__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_672 )
          @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifRest_677 )
          op = ifRest
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = IfTree.new(( condition58.nil? ? nil : condition58.result ),( block60.nil? ? nil : block60.list ),( op.nil? ? nil : op.result ))
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
      __WHILE62__ = nil
      __LCB64__ = nil
      __RCB66__ = nil
      condition63 = nil
      block65 = nil

      tree_for_WHILE62 = nil
      tree_for_LCB64 = nil
      tree_for_RCB66 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 147:5: WHILE condition LCB block RCB
        __WHILE62__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_whileCycle_704 )

        tree_for_WHILE62 = @adaptor.create_with_payload( __WHILE62__ )
        @adaptor.add_child( root_0, tree_for_WHILE62 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_whileCycle_706 )
        condition63 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition63.tree )
        __LCB64__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_whileCycle_708 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_whileCycle_711 )
        block65 = block
        @state.following.pop
        @adaptor.add_child( root_0, block65.tree )
        __RCB66__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_whileCycle_713 )
        # --> action
        return_value.result = WhileTree.new(( condition63.nil? ? nil : condition63.result ),( block65.nil? ? nil : block65.list ))
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
      __DO67__ = nil
      __LCB68__ = nil
      __RCB70__ = nil
      __WHILE71__ = nil
      block69 = nil
      condition72 = nil

      tree_for_DO67 = nil
      tree_for_LCB68 = nil
      tree_for_RCB70 = nil
      tree_for_WHILE71 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 152:4: DO LCB block RCB WHILE condition
        __DO67__ = match( DO, TOKENS_FOLLOWING_DO_IN_doCycle_735 )

        tree_for_DO67 = @adaptor.create_with_payload( __DO67__ )
        @adaptor.add_child( root_0, tree_for_DO67 )

        __LCB68__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_doCycle_737 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_doCycle_740 )
        block69 = block
        @state.following.pop
        @adaptor.add_child( root_0, block69.tree )
        __RCB70__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_doCycle_742 )
        __WHILE71__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_doCycle_745 )

        tree_for_WHILE71 = @adaptor.create_with_payload( __WHILE71__ )
        @adaptor.add_child( root_0, tree_for_WHILE71 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_doCycle_747 )
        condition72 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition72.tree )
        # --> action
        return_value.result = DoTree.new(( condition72.nil? ? nil : condition72.result ),( block69.nil? ? nil : block69.list ))
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
      __FOR73__ = nil
      __COMMENT74__ = nil
      char_literal75 = nil
      char_literal76 = nil
      __SEMICOLON77__ = nil
      __COMMENT79__ = nil
      char_literal80 = nil
      char_literal81 = nil
      __SEMICOLON82__ = nil
      __LCB83__ = nil
      __RCB85__ = nil
      as1 = nil
      as2 = nil
      condition78 = nil
      block84 = nil

      tree_for_FOR73 = nil
      tree_for_COMMENT74 = nil
      tree_for_char_literal75 = nil
      tree_for_char_literal76 = nil
      tree_for_SEMICOLON77 = nil
      tree_for_COMMENT79 = nil
      tree_for_char_literal80 = nil
      tree_for_char_literal81 = nil
      tree_for_SEMICOLON82 = nil
      tree_for_LCB83 = nil
      tree_for_RCB85 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 157:4: FOR as1= assignment ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) condition ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) as2= assignment LCB block RCB
        __FOR73__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_forCycle_768 )

        tree_for_FOR73 = @adaptor.create_with_payload( __FOR73__ )
        @adaptor.add_child( root_0, tree_for_FOR73 )

        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_772 )
        as1 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as1.tree )
        # at line 157:23: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
        alt_18 = 2
        look_18_0 = @input.peek( 1 )

        if ( look_18_0 == COMMENT || look_18_0.between?( T__62, T__63 ) )
          alt_18 = 1
        elsif ( look_18_0 == SEMICOLON )
          alt_18 = 2
        else
          raise NoViableAlternative( "", 18, 0 )
        end
        case alt_18
        when 1
          # at line 157:24: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 157:24: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 157:26: ( COMMENT )? ( '\\r' )? '\\n'
          # at line 157:33: ( COMMENT )?
          alt_16 = 2
          look_16_0 = @input.peek( 1 )

          if ( look_16_0 == COMMENT )
            alt_16 = 1
          end
          case alt_16
          when 1
            # at line 157:33: COMMENT
            __COMMENT74__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_forCycle_777 )

          end
          # at line 157:40: ( '\\r' )?
          alt_17 = 2
          look_17_0 = @input.peek( 1 )

          if ( look_17_0 == T__62 )
            alt_17 = 1
          end
          case alt_17
          when 1
            # at line 157:40: '\\r'
            char_literal75 = match( T__62, TOKENS_FOLLOWING_T__62_IN_forCycle_781 )

          end
          char_literal76 = match( T__63, TOKENS_FOLLOWING_T__63_IN_forCycle_785 )


        when 2
          # at line 157:52: SEMICOLON
          __SEMICOLON77__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_791 )

        end
        @state.following.push( TOKENS_FOLLOWING_condition_IN_forCycle_796 )
        condition78 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition78.tree )
        # at line 157:75: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
        alt_21 = 2
        look_21_0 = @input.peek( 1 )

        if ( look_21_0 == COMMENT || look_21_0.between?( T__62, T__63 ) )
          alt_21 = 1
        elsif ( look_21_0 == SEMICOLON )
          alt_21 = 2
        else
          raise NoViableAlternative( "", 21, 0 )
        end
        case alt_21
        when 1
          # at line 157:76: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 157:76: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 157:78: ( COMMENT )? ( '\\r' )? '\\n'
          # at line 157:85: ( COMMENT )?
          alt_19 = 2
          look_19_0 = @input.peek( 1 )

          if ( look_19_0 == COMMENT )
            alt_19 = 1
          end
          case alt_19
          when 1
            # at line 157:85: COMMENT
            __COMMENT79__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_forCycle_801 )

          end
          # at line 157:92: ( '\\r' )?
          alt_20 = 2
          look_20_0 = @input.peek( 1 )

          if ( look_20_0 == T__62 )
            alt_20 = 1
          end
          case alt_20
          when 1
            # at line 157:92: '\\r'
            char_literal80 = match( T__62, TOKENS_FOLLOWING_T__62_IN_forCycle_805 )

          end
          char_literal81 = match( T__63, TOKENS_FOLLOWING_T__63_IN_forCycle_809 )


        when 2
          # at line 157:104: SEMICOLON
          __SEMICOLON82__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_815 )

        end
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_822 )
        as2 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as2.tree )
        __LCB83__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_forCycle_824 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_forCycle_827 )
        block84 = block
        @state.following.pop
        @adaptor.add_child( root_0, block84.tree )
        __RCB85__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_forCycle_829 )
        # --> action
        return_value.result = ForTree.new(( as1.nil? ? nil : as1.result ),( condition78.nil? ? nil : condition78.result ),( as2.nil? ? nil : as2.result ),( block84.nil? ? nil : block84.list ))
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
      __ID86__ = nil
      __LCB88__ = nil
      __RCB90__ = nil
      params87 = nil
      block89 = nil

      tree_for_ID86 = nil
      tree_for_LCB88 = nil
      tree_for_RCB90 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 162:4: ID ( params )? LCB block RCB
        __ID86__ = match( ID, TOKENS_FOLLOWING_ID_IN_func_851 )

        tree_for_ID86 = @adaptor.create_with_payload( __ID86__ )
        root_0 = @adaptor.become_root( tree_for_ID86, root_0 )

        # at line 162:8: ( params )?
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == ID )
          alt_22 = 1
        end
        case alt_22
        when 1
          # at line 162:8: params
          @state.following.push( TOKENS_FOLLOWING_params_IN_func_854 )
          params87 = params
          @state.following.pop
          @adaptor.add_child( root_0, params87.tree )

        end
        __LCB88__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_857 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_func_860 )
        block89 = block
        @state.following.pop
        @adaptor.add_child( root_0, block89.tree )
        __RCB90__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_862 )
        # --> action
        return_value.result = [FuncTree.new(__ID86__.text,( params87.nil? ? nil : params87.list ),( block89.nil? ? nil : block89.list )),tree_for_ID86]
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
      __ID91__ = nil
      paramRest92 = nil

      tree_for_ID91 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 167:4: ID paramRest
        __ID91__ = match( ID, TOKENS_FOLLOWING_ID_IN_params_882 )

        tree_for_ID91 = @adaptor.create_with_payload( __ID91__ )
        @adaptor.add_child( root_0, tree_for_ID91 )

        @state.following.push( TOKENS_FOLLOWING_paramRest_IN_params_884 )
        paramRest92 = paramRest
        @state.following.pop
        @adaptor.add_child( root_0, paramRest92.tree )
        # --> action
        return_value.list = [__ID91__.text] + ( paramRest92.nil? ? nil : paramRest92.list )
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
      __COMMA93__ = nil
      params94 = nil

      tree_for_COMMA93 = nil

      begin
        # at line 172:2: ( COMMA params | )
        alt_23 = 2
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == COMMA )
          alt_23 = 1
        elsif ( look_23_0 == LCB )
          alt_23 = 2
        else
          raise NoViableAlternative( "", 23, 0 )
        end
        case alt_23
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 172:4: COMMA params
          __COMMA93__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_paramRest_903 )
          @state.following.push( TOKENS_FOLLOWING_params_IN_paramRest_906 )
          params94 = params
          @state.following.pop
          @adaptor.add_child( root_0, params94.tree )
          # --> action
          return_value.list = ( params94.nil? ? nil : params94.list )
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
      __LB95__ = nil
      __RB96__ = nil
      __DOT97__ = nil
      __LB98__ = nil
      __RB99__ = nil
      args1 = nil
      args2 = nil

      tree_for_fun = nil
      tree_for_method = nil
      tree_for_LB95 = nil
      tree_for_RB96 = nil
      tree_for_DOT97 = nil
      tree_for_LB98 = nil
      tree_for_RB99 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 178:4: fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )*
        fun = match( ID, TOKENS_FOLLOWING_ID_IN_call_935 )

        tree_for_fun = @adaptor.create_with_payload( fun )
        root_0 = @adaptor.become_root( tree_for_fun, root_0 )

        __LB95__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_938 )
        # at line 178:21: (args1= args )?
        alt_24 = 2
        look_24_0 = @input.peek( 1 )

        if ( look_24_0 == READ || look_24_0 == LB || look_24_0.between?( PLUS, INT ) || look_24_0 == ID || look_24_0.between?( TO_INT, NEW ) || look_24_0 == STRING || look_24_0 == T__64 )
          alt_24 = 1
        end
        case alt_24
        when 1
          # at line 178:21: args1= args
          @state.following.push( TOKENS_FOLLOWING_args_IN_call_943 )
          args1 = args
          @state.following.pop
          @adaptor.add_child( root_0, args1.tree )

        end
        __RB96__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_946 )
        # --> action
        return_value.result = [CallTree.new(fun.text,( args1.nil? ? nil : args1.list )),tree_for_fun]
        # <-- action
        # at line 180:3: ( DOT method= ID LB (args2= args )? RB )*
        while true # decision 26
          alt_26 = 2
          look_26_0 = @input.peek( 1 )

          if ( look_26_0 == DOT )
            alt_26 = 1

          end
          case alt_26
          when 1
            # at line 180:5: DOT method= ID LB (args2= args )? RB
            __DOT97__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_call_957 )

            tree_for_DOT97 = @adaptor.create_with_payload( __DOT97__ )
            @adaptor.add_child( root_0, tree_for_DOT97 )

            method = match( ID, TOKENS_FOLLOWING_ID_IN_call_961 )

            tree_for_method = @adaptor.create_with_payload( method )
            @adaptor.add_child( root_0, tree_for_method )

            __LB98__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_963 )
            # at line 180:28: (args2= args )?
            alt_25 = 2
            look_25_0 = @input.peek( 1 )

            if ( look_25_0 == READ || look_25_0 == LB || look_25_0.between?( PLUS, INT ) || look_25_0 == ID || look_25_0.between?( TO_INT, NEW ) || look_25_0 == STRING || look_25_0 == T__64 )
              alt_25 = 1
            end
            case alt_25
            when 1
              # at line 180:28: args2= args
              @state.following.push( TOKENS_FOLLOWING_args_IN_call_968 )
              args2 = args
              @state.following.pop
              @adaptor.add_child( root_0, args2.tree )

            end
            __RB99__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_971 )
            # --> action
            return_value.result = [MethodCallTree.new(return_value.result,method.text,( args2.nil? ? nil : args2.list )),tree_for_method]
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
      expression100 = nil
      argsRest101 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 184:5: expression argsRest
        @state.following.push( TOKENS_FOLLOWING_expression_IN_args_993 )
        expression100 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression100.tree )
        @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_995 )
        argsRest101 = argsRest
        @state.following.pop
        @adaptor.add_child( root_0, argsRest101.tree )
        # --> action
        return_value.list = [( expression100.nil? ? nil : expression100.result )] + ( argsRest101.nil? ? nil : argsRest101.list )
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
      __COMMA102__ = nil
      args103 = nil

      tree_for_COMMA102 = nil

      begin
        # at line 188:2: ( COMMA args | )
        alt_27 = 2
        look_27_0 = @input.peek( 1 )

        if ( look_27_0 == COMMA )
          alt_27 = 1
        elsif ( look_27_0 == RB )
          alt_27 = 2
        else
          raise NoViableAlternative( "", 27, 0 )
        end
        case alt_27
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 188:4: COMMA args
          __COMMA102__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsRest_1014 )
          @state.following.push( TOKENS_FOLLOWING_args_IN_argsRest_1017 )
          args103 = args
          @state.following.pop
          @adaptor.add_child( root_0, args103.tree )
          # --> action
          return_value.list = ( args103.nil? ? nil : args103.list )
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
      __OR105__ = nil
      op = nil
      orOperand104 = nil

      tree_for_OR105 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 196:4: orOperand ( OR op= condition )?
        @state.following.push( TOKENS_FOLLOWING_orOperand_IN_condition_1043 )
        orOperand104 = orOperand
        @state.following.pop
        @adaptor.add_child( root_0, orOperand104.tree )
        # --> action
        return_value.result = ( orOperand104.nil? ? nil : orOperand104.result )
        # <-- action
        # at line 197:3: ( OR op= condition )?
        alt_28 = 2
        look_28_0 = @input.peek( 1 )

        if ( look_28_0 == OR )
          alt_28 = 1
        end
        case alt_28
        when 1
          # at line 197:4: OR op= condition
          __OR105__ = match( OR, TOKENS_FOLLOWING_OR_IN_condition_1050 )

          tree_for_OR105 = @adaptor.create_with_payload( __OR105__ )
          root_0 = @adaptor.become_root( tree_for_OR105, root_0 )

          @state.following.push( TOKENS_FOLLOWING_condition_IN_condition_1055 )
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
      __AND107__ = nil
      op = nil
      boolOperand106 = nil

      tree_for_AND107 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 203:4: boolOperand ( AND op= orOperand )?
        @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_orOperand_1076 )
        boolOperand106 = boolOperand
        @state.following.pop
        @adaptor.add_child( root_0, boolOperand106.tree )
        # --> action
        return_value.result = ( boolOperand106.nil? ? nil : boolOperand106.result )
        # <-- action
        # at line 204:3: ( AND op= orOperand )?
        alt_29 = 2
        look_29_0 = @input.peek( 1 )

        if ( look_29_0 == AND )
          alt_29 = 1
        end
        case alt_29
        when 1
          # at line 204:4: AND op= orOperand
          __AND107__ = match( AND, TOKENS_FOLLOWING_AND_IN_orOperand_1083 )

          tree_for_AND107 = @adaptor.create_with_payload( __AND107__ )
          root_0 = @adaptor.become_root( tree_for_AND107, root_0 )

          @state.following.push( TOKENS_FOLLOWING_orOperand_IN_orOperand_1088 )
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
      __NOT109__ = nil
      __LB110__ = nil
      __RB112__ = nil
      __EQ113__ = nil
      __NE114__ = nil
      __LT115__ = nil
      __GT116__ = nil
      __LE117__ = nil
      __GE118__ = nil
      op1 = nil
      op2 = nil
      bool108 = nil
      condition111 = nil

      tree_for_NOT109 = nil
      tree_for_LB110 = nil
      tree_for_RB112 = nil
      tree_for_EQ113 = nil
      tree_for_NE114 = nil
      tree_for_LT115 = nil
      tree_for_GT116 = nil
      tree_for_LE117 = nil
      tree_for_GE118 = nil

      begin
        # at line 208:2: ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) )
        alt_37 = 3
        case look_37 = @input.peek( 1 )
        when TRUE, FALSE then alt_37 = 1
        when NOT then alt_37 = 2
        when READ, LB, PLUS, MINUS, INT, ID, TO_INT, TO_FLOAT, FLOAT, NEW, STRING, T__64 then alt_37 = 3
        else
          raise NoViableAlternative( "", 37, 0 )
        end
        case alt_37
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 208:4: bool
          @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1107 )
          bool108 = bool
          @state.following.pop
          @adaptor.add_child( root_0, bool108.tree )
          # --> action
          return_value.result = ( bool108.nil? ? nil : bool108.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 209:4: NOT LB condition RB
          __NOT109__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_boolOperand_1114 )

          tree_for_NOT109 = @adaptor.create_with_payload( __NOT109__ )
          @adaptor.add_child( root_0, tree_for_NOT109 )

          __LB110__ = match( LB, TOKENS_FOLLOWING_LB_IN_boolOperand_1116 )
          @state.following.push( TOKENS_FOLLOWING_condition_IN_boolOperand_1119 )
          condition111 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition111.tree )
          __RB112__ = match( RB, TOKENS_FOLLOWING_RB_IN_boolOperand_1121 )
          # --> action
          return_value.result = !( condition111.nil? ? nil : condition111.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 210:4: op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1131 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # at line 210:19: ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          alt_36 = 6
          case look_36 = @input.peek( 1 )
          when EQ then alt_36 = 1
          when NE then alt_36 = 2
          when LT then alt_36 = 3
          when GT then alt_36 = 4
          when LE then alt_36 = 5
          when GE then alt_36 = 6
          else
            raise NoViableAlternative( "", 36, 0 )
          end
          case alt_36
          when 1
            # at line 210:20: EQ (op2= bool | op2= expression )
            __EQ113__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_boolOperand_1134 )

            tree_for_EQ113 = @adaptor.create_with_payload( __EQ113__ )
            root_0 = @adaptor.become_root( tree_for_EQ113, root_0 )

            # at line 210:24: (op2= bool | op2= expression )
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
              # at line 210:26: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1141 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 210:37: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1147 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:eq)),op2.tree]
            # <-- action

          when 2
            # at line 211:6: NE (op2= bool | op2= expression )
            __NE114__ = match( NE, TOKENS_FOLLOWING_NE_IN_boolOperand_1158 )

            tree_for_NE114 = @adaptor.create_with_payload( __NE114__ )
            root_0 = @adaptor.become_root( tree_for_NE114, root_0 )

            # at line 211:10: (op2= bool | op2= expression )
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
              # at line 211:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1165 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 211:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1171 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:ne)),op2.tree]
            # <-- action

          when 3
            # at line 212:6: LT (op2= bool | op2= expression )
            __LT115__ = match( LT, TOKENS_FOLLOWING_LT_IN_boolOperand_1182 )

            tree_for_LT115 = @adaptor.create_with_payload( __LT115__ )
            root_0 = @adaptor.become_root( tree_for_LT115, root_0 )

            # at line 212:10: (op2= bool | op2= expression )
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
              # at line 212:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1189 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 212:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1195 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:lt)),op2.tree]
            # <-- action

          when 4
            # at line 213:6: GT (op2= bool | op2= expression )
            __GT116__ = match( GT, TOKENS_FOLLOWING_GT_IN_boolOperand_1206 )

            tree_for_GT116 = @adaptor.create_with_payload( __GT116__ )
            root_0 = @adaptor.become_root( tree_for_GT116, root_0 )

            # at line 213:10: (op2= bool | op2= expression )
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
              # at line 213:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1213 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 213:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1219 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:gt)),op2.tree]
            # <-- action

          when 5
            # at line 214:6: LE (op2= bool | op2= expression )
            __LE117__ = match( LE, TOKENS_FOLLOWING_LE_IN_boolOperand_1230 )

            tree_for_LE117 = @adaptor.create_with_payload( __LE117__ )
            root_0 = @adaptor.become_root( tree_for_LE117, root_0 )

            # at line 214:10: (op2= bool | op2= expression )
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
              # at line 214:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1237 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 214:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1243 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:le)),op2.tree]
            # <-- action

          when 6
            # at line 215:6: GE (op2= bool | op2= expression )
            __GE118__ = match( GE, TOKENS_FOLLOWING_GE_IN_boolOperand_1254 )

            tree_for_GE118 = @adaptor.create_with_payload( __GE118__ )
            root_0 = @adaptor.become_root( tree_for_GE118, root_0 )

            # at line 215:10: (op2= bool | op2= expression )
            alt_35 = 2
            look_35_0 = @input.peek( 1 )

            if ( look_35_0.between?( TRUE, FALSE ) )
              alt_35 = 1
            elsif ( look_35_0 == READ || look_35_0 == LB || look_35_0.between?( PLUS, INT ) || look_35_0 == ID || look_35_0.between?( TO_INT, NEW ) || look_35_0 == STRING || look_35_0 == T__64 )
              alt_35 = 2
            else
              raise NoViableAlternative( "", 35, 0 )
            end
            case alt_35
            when 1
              # at line 215:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1261 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 215:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1267 )
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
      __PLUS120__ = nil
      __MINUS121__ = nil
      op = nil
      addOperand119 = nil

      tree_for_PLUS120 = nil
      tree_for_MINUS121 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 221:4: addOperand ( PLUS op= expression | MINUS op= expression )?
        @state.following.push( TOKENS_FOLLOWING_addOperand_IN_expression_1292 )
        addOperand119 = addOperand
        @state.following.pop
        @adaptor.add_child( root_0, addOperand119.tree )
        # --> action
        return_value.result = ( addOperand119.nil? ? nil : addOperand119.result )
        # <-- action
        # at line 222:3: ( PLUS op= expression | MINUS op= expression )?
        alt_38 = 3
        look_38_0 = @input.peek( 1 )

        if ( look_38_0 == PLUS )
          alt_38 = 1
        elsif ( look_38_0 == MINUS )
          alt_38 = 2
        end
        case alt_38
        when 1
          # at line 223:4: PLUS op= expression
          __PLUS120__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expression_1303 )

          tree_for_PLUS120 = @adaptor.create_with_payload( __PLUS120__ )
          root_0 = @adaptor.become_root( tree_for_PLUS120, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1308 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:add)),op.tree]
          # <-- action

        when 2
          # at line 224:5: MINUS op= expression
          __MINUS121__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expression_1316 )

          tree_for_MINUS121 = @adaptor.create_with_payload( __MINUS121__ )
          root_0 = @adaptor.become_root( tree_for_MINUS121, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1321 )
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
      __MUL123__ = nil
      __DIV124__ = nil
      __MOD125__ = nil
      op = nil
      mulOperand122 = nil

      tree_for_MUL123 = nil
      tree_for_DIV124 = nil
      tree_for_MOD125 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 229:4: mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperand_1343 )
        mulOperand122 = mulOperand
        @state.following.pop
        @adaptor.add_child( root_0, mulOperand122.tree )
        # --> action
        return_value.result = ( mulOperand122.nil? ? nil : mulOperand122.result )
        # <-- action
        # at line 230:3: ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        alt_39 = 4
        case look_39 = @input.peek( 1 )
        when MUL then alt_39 = 1
        when DIV then alt_39 = 2
        when MOD then alt_39 = 3
        end
        case alt_39
        when 1
          # at line 231:4: MUL op= addOperand
          __MUL123__ = match( MUL, TOKENS_FOLLOWING_MUL_IN_addOperand_1354 )

          tree_for_MUL123 = @adaptor.create_with_payload( __MUL123__ )
          root_0 = @adaptor.become_root( tree_for_MUL123, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1359 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:mul)),op.tree]
          # <-- action

        when 2
          # at line 232:5: DIV op= addOperand
          __DIV124__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_addOperand_1367 )

          tree_for_DIV124 = @adaptor.create_with_payload( __DIV124__ )
          root_0 = @adaptor.become_root( tree_for_DIV124, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1372 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:div)),op.tree]
          # <-- action

        when 3
          # at line 233:5: MOD op= addOperand
          __MOD125__ = match( MOD, TOKENS_FOLLOWING_MOD_IN_addOperand_1380 )

          tree_for_MOD125 = @adaptor.create_with_payload( __MOD125__ )
          root_0 = @adaptor.become_root( tree_for_MOD125, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1385 )
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
      __PLUS126__ = nil
      __MINUS128__ = nil
      __TO_INT130__ = nil
      __TO_FLOAT132__ = nil
      mulOperandRest127 = nil
      mulOperandRest129 = nil
      mulOperandRest131 = nil
      mulOperandRest133 = nil
      mulOperandRest134 = nil

      tree_for_PLUS126 = nil
      tree_for_MINUS128 = nil
      tree_for_TO_INT130 = nil
      tree_for_TO_FLOAT132 = nil

      begin
        # at line 238:2: ( PLUS mulOperandRest | MINUS mulOperandRest | TO_INT mulOperandRest | TO_FLOAT mulOperandRest | mulOperandRest )
        alt_40 = 5
        case look_40 = @input.peek( 1 )
        when PLUS then alt_40 = 1
        when MINUS then alt_40 = 2
        when TO_INT then alt_40 = 3
        when TO_FLOAT then alt_40 = 4
        when READ, LB, INT, ID, FLOAT, NEW, STRING, T__64 then alt_40 = 5
        else
          raise NoViableAlternative( "", 40, 0 )
        end
        case alt_40
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 238:4: PLUS mulOperandRest
          __PLUS126__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_mulOperand_1407 )

          tree_for_PLUS126 = @adaptor.create_with_payload( __PLUS126__ )
          @adaptor.add_child( root_0, tree_for_PLUS126 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1409 )
          mulOperandRest127 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest127.tree )
          # --> action
          return_value.result = ( mulOperandRest127.nil? ? nil : mulOperandRest127.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 239:4: MINUS mulOperandRest
          __MINUS128__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_mulOperand_1416 )

          tree_for_MINUS128 = @adaptor.create_with_payload( __MINUS128__ )
          @adaptor.add_child( root_0, tree_for_MINUS128 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1418 )
          mulOperandRest129 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest129.tree )
          # --> action
          return_value.result = [UnaryOperatorTree.new(( mulOperandRest129.nil? ? nil : mulOperandRest129.result ),Operators.method(:neg)),$mulOperandRest129.tree]
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 240:4: TO_INT mulOperandRest
          __TO_INT130__ = match( TO_INT, TOKENS_FOLLOWING_TO_INT_IN_mulOperand_1425 )

          tree_for_TO_INT130 = @adaptor.create_with_payload( __TO_INT130__ )
          @adaptor.add_child( root_0, tree_for_TO_INT130 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1427 )
          mulOperandRest131 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest131.tree )
          # --> action
          return_value.result = [UnaryOperatorTree.new(( mulOperandRest131.nil? ? nil : mulOperandRest131.result ),Operators.method(:int)),$mulOperandRest131.tree]
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 241:4: TO_FLOAT mulOperandRest
          __TO_FLOAT132__ = match( TO_FLOAT, TOKENS_FOLLOWING_TO_FLOAT_IN_mulOperand_1434 )

          tree_for_TO_FLOAT132 = @adaptor.create_with_payload( __TO_FLOAT132__ )
          @adaptor.add_child( root_0, tree_for_TO_FLOAT132 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1436 )
          mulOperandRest133 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest133.tree )
          # --> action
          return_value.result = [UnaryOperatorTree.new(( mulOperandRest133.nil? ? nil : mulOperandRest133.result ),Operators.method(:float)),$mulOperandRest133.tree]
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 242:4: mulOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1443 )
          mulOperandRest134 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest134.tree )
          # --> action
          return_value.result = ( mulOperandRest134.nil? ? nil : mulOperandRest134.result )
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
      char_literal136 = nil
      char_literal138 = nil
      arrayIndexTarget135 = nil
      expression137 = nil

      tree_for_char_literal136 = nil
      tree_for_char_literal138 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 246:4: arrayIndexTarget ( '[' expression ']' )*
        @state.following.push( TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1460 )
        arrayIndexTarget135 = arrayIndexTarget
        @state.following.pop
        @adaptor.add_child( root_0, arrayIndexTarget135.tree )
        # --> action
        return_value.result = ( arrayIndexTarget135.nil? ? nil : arrayIndexTarget135.result )
        # <-- action
        # at line 247:3: ( '[' expression ']' )*
        while true # decision 41
          alt_41 = 2
          look_41_0 = @input.peek( 1 )

          if ( look_41_0 == T__64 )
            alt_41 = 1

          end
          case alt_41
          when 1
            # at line 247:4: '[' expression ']'
            char_literal136 = match( T__64, TOKENS_FOLLOWING_T__64_IN_mulOperandRest_1468 )

            tree_for_char_literal136 = @adaptor.create_with_payload( char_literal136 )
            @adaptor.add_child( root_0, tree_for_char_literal136 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_mulOperandRest_1470 )
            expression137 = expression
            @state.following.pop
            @adaptor.add_child( root_0, expression137.tree )
            char_literal138 = match( T__65, TOKENS_FOLLOWING_T__65_IN_mulOperandRest_1472 )

            tree_for_char_literal138 = @adaptor.create_with_payload( char_literal138 )
            @adaptor.add_child( root_0, tree_for_char_literal138 )

            # --> action
             return_value.result = [IndexTree.new(return_value.result,( expression137.nil? ? nil : expression137.result )),expression137.tree] 
            # <-- action

          else
            break # out of loop for decision 41
          end
        end # loop for decision 41
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
      __ID139__ = nil
      __LB140__ = nil
      __RB142__ = nil
      __INT143__ = nil
      __FLOAT144__ = nil
      expression141 = nil
      string145 = nil
      call146 = nil
      array147 = nil
      readInstruction148 = nil
      new149 = nil

      tree_for_ID139 = nil
      tree_for_LB140 = nil
      tree_for_RB142 = nil
      tree_for_INT143 = nil
      tree_for_FLOAT144 = nil

      begin
        # at line 251:2: ( ID | LB expression RB | INT | FLOAT | string | call | array | readInstruction | new )
        alt_42 = 9
        alt_42 = @dfa42.predict( @input )
        case alt_42
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 251:4: ID
          __ID139__ = match( ID, TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1494 )

          tree_for_ID139 = @adaptor.create_with_payload( __ID139__ )
          @adaptor.add_child( root_0, tree_for_ID139 )

          # --> action
          return_value.result = [VarTree.new(__ID139__.text),tree_for_ID139]
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 252:4: LB expression RB
          __LB140__ = match( LB, TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1501 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1504 )
          expression141 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression141.tree )
          __RB142__ = match( RB, TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1506 )
          # --> action
          return_value.result = ( expression141.nil? ? nil : expression141.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 253:4: INT
          __INT143__ = match( INT, TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1514 )

          tree_for_INT143 = @adaptor.create_with_payload( __INT143__ )
          @adaptor.add_child( root_0, tree_for_INT143 )

          # --> action
          return_value.result = [AtomTree.new(__INT143__.text.to_i),tree_for_INT143]
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 254:4: FLOAT
          __FLOAT144__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_arrayIndexTarget_1521 )

          tree_for_FLOAT144 = @adaptor.create_with_payload( __FLOAT144__ )
          @adaptor.add_child( root_0, tree_for_FLOAT144 )

          # --> action
          return_value.result = [AtomTree.new(__FLOAT144__.text.to_f),tree_for_FLOAT144]
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 255:4: string
          @state.following.push( TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1528 )
          string145 = string
          @state.following.pop
          @adaptor.add_child( root_0, string145.tree )
          # --> action
          return_value.result = [AtomTree.new(( string145.nil? ? nil : string145.result )),string145.tree]
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 256:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1535 )
          call146 = call
          @state.following.pop
          @adaptor.add_child( root_0, call146.tree )
          # --> action
          return_value.result = ( call146.nil? ? nil : call146.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 257:4: array
          @state.following.push( TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1542 )
          array147 = array
          @state.following.pop
          @adaptor.add_child( root_0, array147.tree )
          # --> action
          return_value.result = [ArrayTree.new(( array147.nil? ? nil : array147.result )),array147.tree]
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 258:4: readInstruction
          @state.following.push( TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1549 )
          readInstruction148 = readInstruction
          @state.following.pop
          @adaptor.add_child( root_0, readInstruction148.tree )
          # --> action
          return_value.result = ( readInstruction148.nil? ? nil : readInstruction148.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 259:4: new
          @state.following.push( TOKENS_FOLLOWING_new_IN_arrayIndexTarget_1556 )
          new149 = new
          @state.following.pop
          @adaptor.add_child( root_0, new149.tree )
          # --> action
          return_value.result = ( new149.nil? ? nil : new149.result )
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
      __NEW150__ = nil
      __ID151__ = nil
      __LB152__ = nil
      __RB154__ = nil
      args153 = nil

      tree_for_NEW150 = nil
      tree_for_ID151 = nil
      tree_for_LB152 = nil
      tree_for_RB154 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 263:4: NEW ID ( LB ( args )? RB )?
        __NEW150__ = match( NEW, TOKENS_FOLLOWING_NEW_IN_new_1573 )

        tree_for_NEW150 = @adaptor.create_with_payload( __NEW150__ )
        @adaptor.add_child( root_0, tree_for_NEW150 )

        __ID151__ = match( ID, TOKENS_FOLLOWING_ID_IN_new_1575 )

        tree_for_ID151 = @adaptor.create_with_payload( __ID151__ )
        @adaptor.add_child( root_0, tree_for_ID151 )

        # at line 263:11: ( LB ( args )? RB )?
        alt_44 = 2
        look_44_0 = @input.peek( 1 )

        if ( look_44_0 == LB )
          alt_44 = 1
        end
        case alt_44
        when 1
          # at line 263:12: LB ( args )? RB
          __LB152__ = match( LB, TOKENS_FOLLOWING_LB_IN_new_1578 )

          tree_for_LB152 = @adaptor.create_with_payload( __LB152__ )
          @adaptor.add_child( root_0, tree_for_LB152 )

          # at line 263:15: ( args )?
          alt_43 = 2
          look_43_0 = @input.peek( 1 )

          if ( look_43_0 == READ || look_43_0 == LB || look_43_0.between?( PLUS, INT ) || look_43_0 == ID || look_43_0.between?( TO_INT, NEW ) || look_43_0 == STRING || look_43_0 == T__64 )
            alt_43 = 1
          end
          case alt_43
          when 1
            # at line 263:15: args
            @state.following.push( TOKENS_FOLLOWING_args_IN_new_1580 )
            args153 = args
            @state.following.pop
            @adaptor.add_child( root_0, args153.tree )

          end
          __RB154__ = match( RB, TOKENS_FOLLOWING_RB_IN_new_1583 )

          tree_for_RB154 = @adaptor.create_with_payload( __RB154__ )
          @adaptor.add_child( root_0, tree_for_RB154 )


        end
        # --> action
        return_value.result = [NewTree.new(__ID151__.text,( args153.nil? ? nil : args153.list )),tree_for_NEW150]
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
      char_literal155 = nil
      __COMMA156__ = nil
      char_literal157 = nil
      ex1 = nil
      ex2 = nil

      tree_for_char_literal155 = nil
      tree_for_COMMA156 = nil
      tree_for_char_literal157 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 267:4: '[' (ex1= expression ( COMMA ex2= expression )* )? ']'
        char_literal155 = match( T__64, TOKENS_FOLLOWING_T__64_IN_array_1602 )

        tree_for_char_literal155 = @adaptor.create_with_payload( char_literal155 )
        @adaptor.add_child( root_0, tree_for_char_literal155 )

        # --> action
        return_value.result = []
        # <-- action
        # at line 268:3: (ex1= expression ( COMMA ex2= expression )* )?
        alt_46 = 2
        look_46_0 = @input.peek( 1 )

        if ( look_46_0 == READ || look_46_0 == LB || look_46_0.between?( PLUS, INT ) || look_46_0 == ID || look_46_0.between?( TO_INT, NEW ) || look_46_0 == STRING || look_46_0 == T__64 )
          alt_46 = 1
        end
        case alt_46
        when 1
          # at line 268:4: ex1= expression ( COMMA ex2= expression )*
          @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1611 )
          ex1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, ex1.tree )
          # --> action
          return_value.result << ( ex1.nil? ? nil : ex1.result )
          # <-- action
          # at line 269:3: ( COMMA ex2= expression )*
          while true # decision 45
            alt_45 = 2
            look_45_0 = @input.peek( 1 )

            if ( look_45_0 == COMMA )
              alt_45 = 1

            end
            case alt_45
            when 1
              # at line 269:4: COMMA ex2= expression
              __COMMA156__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_array_1618 )

              tree_for_COMMA156 = @adaptor.create_with_payload( __COMMA156__ )
              @adaptor.add_child( root_0, tree_for_COMMA156 )

              @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1622 )
              ex2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, ex2.tree )
              # --> action
              return_value.result << ( ex2.nil? ? nil : ex2.result )
              # <-- action

            else
              break # out of loop for decision 45
            end
          end # loop for decision 45

        end
        char_literal157 = match( T__65, TOKENS_FOLLOWING_T__65_IN_array_1633 )

        tree_for_char_literal157 = @adaptor.create_with_payload( char_literal157 )
        @adaptor.add_child( root_0, tree_for_char_literal157 )

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
      __ASSIGN158__ = nil
      char_literal159 = nil
      char_literal160 = nil
      __ASSIGN161__ = nil
      __DOT162__ = nil
      __LB163__ = nil
      __RB164__ = nil
      __DOT165__ = nil
      __LB166__ = nil
      __RB167__ = nil
      op1 = nil
      index = nil
      op2 = nil
      args1 = nil
      args2 = nil

      tree_for_var = nil
      tree_for_method1 = nil
      tree_for_method2 = nil
      tree_for_ASSIGN158 = nil
      tree_for_char_literal159 = nil
      tree_for_char_literal160 = nil
      tree_for_ASSIGN161 = nil
      tree_for_DOT162 = nil
      tree_for_LB163 = nil
      tree_for_RB164 = nil
      tree_for_DOT165 = nil
      tree_for_LB166 = nil
      tree_for_RB167 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 277:4: var= ID ( ASSIGN op1= expression | ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) ) | ( DOT method2= ID LB (args2= args )? RB )+ )
        var = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1655 )

        tree_for_var = @adaptor.create_with_payload( var )
        @adaptor.add_child( root_0, tree_for_var )

        # --> action
        return_value.result = VarTree.new(var.text)
        # <-- action
        # at line 278:3: ( ASSIGN op1= expression | ( ( '[' index= expression ']' )+ ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ ) ) | ( DOT method2= ID LB (args2= args )? RB )+ )
        alt_53 = 3
        case look_53 = @input.peek( 1 )
        when ASSIGN then alt_53 = 1
        when T__64 then alt_53 = 2
        when DOT then alt_53 = 3
        else
          raise NoViableAlternative( "", 53, 0 )
        end
        case alt_53
        when 1
          # at line 278:5: ASSIGN op1= expression
          __ASSIGN158__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1663 )

          tree_for_ASSIGN158 = @adaptor.create_with_payload( __ASSIGN158__ )
          root_0 = @adaptor.become_root( tree_for_ASSIGN158, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1668 )
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
          match_count_47 = 0
          while true
            alt_47 = 2
            look_47_0 = @input.peek( 1 )

            if ( look_47_0 == T__64 )
              alt_47 = 1

            end
            case alt_47
            when 1
              # at line 280:7: '[' index= expression ']'
              # --> action
              index_ = index
              # <-- action
              char_literal159 = match( T__64, TOKENS_FOLLOWING_T__64_IN_assignment_1687 )

              tree_for_char_literal159 = @adaptor.create_with_payload( char_literal159 )
              @adaptor.add_child( root_0, tree_for_char_literal159 )

              @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1691 )
              index = expression
              @state.following.pop
              @adaptor.add_child( root_0, index.tree )
              char_literal160 = match( T__65, TOKENS_FOLLOWING_T__65_IN_assignment_1693 )

              tree_for_char_literal160 = @adaptor.create_with_payload( char_literal160 )
              @adaptor.add_child( root_0, tree_for_char_literal160 )

              # --> action
              target_ = return_value.result; return_value.result = IndexTree.new(return_value.result,( index.nil? ? nil : index.result ))
              # <-- action

            else
              match_count_47 > 0 and break
              eee = EarlyExit(47)


              raise eee
            end
            match_count_47 += 1
          end

          # at line 281:4: ( ASSIGN op2= expression | ( DOT method1= ID LB (args1= args )? RB )+ )
          alt_50 = 2
          look_50_0 = @input.peek( 1 )

          if ( look_50_0 == ASSIGN )
            alt_50 = 1
          elsif ( look_50_0 == DOT )
            alt_50 = 2
          else
            raise NoViableAlternative( "", 50, 0 )
          end
          case alt_50
          when 1
            # at line 281:6: ASSIGN op2= expression
            __ASSIGN161__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1706 )

            tree_for_ASSIGN161 = @adaptor.create_with_payload( __ASSIGN161__ )
            root_0 = @adaptor.become_root( tree_for_ASSIGN161, root_0 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1711 )
            op2 = expression
            @state.following.pop
            @adaptor.add_child( root_0, op2.tree )
            # --> action
             return_value.result = DerefTree.new(target_,( index.nil? ? nil : index.result ),( op2.nil? ? nil : op2.result )) 
            # <-- action

          when 2
            # at line 282:6: ( DOT method1= ID LB (args1= args )? RB )+
            # at file 282:6: ( DOT method1= ID LB (args1= args )? RB )+
            match_count_49 = 0
            while true
              alt_49 = 2
              look_49_0 = @input.peek( 1 )

              if ( look_49_0 == DOT )
                alt_49 = 1

              end
              case alt_49
              when 1
                # at line 282:7: DOT method1= ID LB (args1= args )? RB
                __DOT162__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_assignment_1726 )

                tree_for_DOT162 = @adaptor.create_with_payload( __DOT162__ )
                @adaptor.add_child( root_0, tree_for_DOT162 )

                method1 = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1730 )

                tree_for_method1 = @adaptor.create_with_payload( method1 )
                @adaptor.add_child( root_0, tree_for_method1 )

                __LB163__ = match( LB, TOKENS_FOLLOWING_LB_IN_assignment_1732 )
                # at line 282:31: (args1= args )?
                alt_48 = 2
                look_48_0 = @input.peek( 1 )

                if ( look_48_0 == READ || look_48_0 == LB || look_48_0.between?( PLUS, INT ) || look_48_0 == ID || look_48_0.between?( TO_INT, NEW ) || look_48_0 == STRING || look_48_0 == T__64 )
                  alt_48 = 1
                end
                case alt_48
                when 1
                  # at line 282:31: args1= args
                  @state.following.push( TOKENS_FOLLOWING_args_IN_assignment_1737 )
                  args1 = args
                  @state.following.pop
                  @adaptor.add_child( root_0, args1.tree )

                end
                __RB164__ = match( RB, TOKENS_FOLLOWING_RB_IN_assignment_1740 )
                # --> action
                return_value.result = MethodCallTree.new(return_value.result,method1.text,( args1.nil? ? nil : args1.list ))
                # <-- action

              else
                match_count_49 > 0 and break
                eee = EarlyExit(49)


                raise eee
              end
              match_count_49 += 1
            end


          end


        when 3
          # at line 284:5: ( DOT method2= ID LB (args2= args )? RB )+
          # at file 284:5: ( DOT method2= ID LB (args2= args )? RB )+
          match_count_52 = 0
          while true
            alt_52 = 2
            look_52_0 = @input.peek( 1 )

            if ( look_52_0 == DOT )
              alt_52 = 1

            end
            case alt_52
            when 1
              # at line 284:6: DOT method2= ID LB (args2= args )? RB
              __DOT165__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_assignment_1758 )

              tree_for_DOT165 = @adaptor.create_with_payload( __DOT165__ )
              @adaptor.add_child( root_0, tree_for_DOT165 )

              method2 = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1762 )

              tree_for_method2 = @adaptor.create_with_payload( method2 )
              @adaptor.add_child( root_0, tree_for_method2 )

              __LB166__ = match( LB, TOKENS_FOLLOWING_LB_IN_assignment_1764 )
              # at line 284:30: (args2= args )?
              alt_51 = 2
              look_51_0 = @input.peek( 1 )

              if ( look_51_0 == READ || look_51_0 == LB || look_51_0.between?( PLUS, INT ) || look_51_0 == ID || look_51_0.between?( TO_INT, NEW ) || look_51_0 == STRING || look_51_0 == T__64 )
                alt_51 = 1
              end
              case alt_51
              when 1
                # at line 284:30: args2= args
                @state.following.push( TOKENS_FOLLOWING_args_IN_assignment_1769 )
                args2 = args
                @state.following.pop
                @adaptor.add_child( root_0, args2.tree )

              end
              __RB167__ = match( RB, TOKENS_FOLLOWING_RB_IN_assignment_1772 )
              # --> action
              return_value.result = MethodCallTree.new(return_value.result,method2.text,( args2.nil? ? nil : args2.list )) 
              # <-- action

            else
              match_count_52 > 0 and break
              eee = EarlyExit(52)


              raise eee
            end
            match_count_52 += 1
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
      __TRUE168__ = nil
      __FALSE169__ = nil

      tree_for_TRUE168 = nil
      tree_for_FALSE169 = nil

      begin
        # at line 289:2: ( TRUE | FALSE )
        alt_54 = 2
        look_54_0 = @input.peek( 1 )

        if ( look_54_0 == TRUE )
          alt_54 = 1
        elsif ( look_54_0 == FALSE )
          alt_54 = 2
        else
          raise NoViableAlternative( "", 54, 0 )
        end
        case alt_54
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 289:4: TRUE
          __TRUE168__ = match( TRUE, TOKENS_FOLLOWING_TRUE_IN_bool_1799 )

          tree_for_TRUE168 = @adaptor.create_with_payload( __TRUE168__ )
          @adaptor.add_child( root_0, tree_for_TRUE168 )

          # --> action
          return_value.result = AtomTree.new(true)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 290:5: FALSE
          __FALSE169__ = match( FALSE, TOKENS_FOLLOWING_FALSE_IN_bool_1807 )

          tree_for_FALSE169 = @adaptor.create_with_payload( __FALSE169__ )
          @adaptor.add_child( root_0, tree_for_FALSE169 )

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
      __STRING170__ = nil

      tree_for_STRING170 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 294:4: STRING
        __STRING170__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_string_1825 )

        tree_for_STRING170 = @adaptor.create_with_payload( __STRING170__ )
        @adaptor.add_child( root_0, tree_for_STRING170 )

        # --> action
        return_value.result = __STRING170__.text[1..-2]
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
      __CLASS171__ = nil
      __SUPERCLASS172__ = nil
      __LCB173__ = nil
      __RCB175__ = nil
      block174 = nil

      tree_for_classid = nil
      tree_for_superclassid = nil
      tree_for_CLASS171 = nil
      tree_for_SUPERCLASS172 = nil
      tree_for_LCB173 = nil
      tree_for_RCB175 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 302:4: CLASS classid= ID ( SUPERCLASS superclassid= ID )? LCB block RCB
        # --> action
        superclass=nil
        # <-- action
        __CLASS171__ = match( CLASS, TOKENS_FOLLOWING_CLASS_IN_classDef_1888 )

        tree_for_CLASS171 = @adaptor.create_with_payload( __CLASS171__ )
        root_0 = @adaptor.become_root( tree_for_CLASS171, root_0 )

        classid = match( ID, TOKENS_FOLLOWING_ID_IN_classDef_1893 )

        tree_for_classid = @adaptor.create_with_payload( classid )
        @adaptor.add_child( root_0, tree_for_classid )

        # at line 303:21: ( SUPERCLASS superclassid= ID )?
        alt_55 = 2
        look_55_0 = @input.peek( 1 )

        if ( look_55_0 == SUPERCLASS )
          alt_55 = 1
        end
        case alt_55
        when 1
          # at line 303:22: SUPERCLASS superclassid= ID
          __SUPERCLASS172__ = match( SUPERCLASS, TOKENS_FOLLOWING_SUPERCLASS_IN_classDef_1896 )

          tree_for_SUPERCLASS172 = @adaptor.create_with_payload( __SUPERCLASS172__ )
          @adaptor.add_child( root_0, tree_for_SUPERCLASS172 )

          superclassid = match( ID, TOKENS_FOLLOWING_ID_IN_classDef_1900 )

          tree_for_superclassid = @adaptor.create_with_payload( superclassid )
          @adaptor.add_child( root_0, tree_for_superclassid )

          # --> action
          superclass=superclassid.text
          # <-- action

        end
        __LCB173__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_classDef_1906 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_classDef_1913 )
        block174 = block
        @state.following.pop
        @adaptor.add_child( root_0, block174.tree )
        __RCB175__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_classDef_1917 )
        # --> action
        return_value.result = ClassTree.new(classid.text,( block174.nil? ? nil : block174.list ),superclass)
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
    class DFA42 < ANTLR3::DFA
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
      
      @decision = 42
      

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
      @dfa42 = DFA42.new( self, 42 )

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
    TOKENS_FOLLOWING_PRINT_IN_printInstruction_506 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_printInstruction_509 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printInstruction_512 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_printInstruction_514 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINTL_IN_printlInstruction_540 = Set[ 10 ]
    TOKENS_FOLLOWING_PRINTLN_IN_printlInstruction_546 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_printlInstruction_550 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printlInstruction_553 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_printlInstruction_555 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_printText_575 = Set[ 1, 18 ]
    TOKENS_FOLLOWING_COMMA_IN_printText_582 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_printText_IN_printText_586 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_ifInstruction_610 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_ifInstruction_613 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_ifInstruction_615 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifInstruction_618 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_ifInstruction_620 = Set[ 22, 23, 24 ]
    TOKENS_FOLLOWING_ifRest_IN_ifInstruction_623 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_ifRest_642 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_644 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifRest_647 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_649 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_ifRest_657 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_ifRest_665 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_667 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_ifRest_670 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_672 = Set[ 22, 23, 24 ]
    TOKENS_FOLLOWING_ifRest_IN_ifRest_677 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_whileCycle_704 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_whileCycle_706 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_whileCycle_708 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_whileCycle_711 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_whileCycle_713 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_doCycle_735 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_doCycle_737 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_doCycle_740 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_doCycle_742 = Set[ 25 ]
    TOKENS_FOLLOWING_WHILE_IN_doCycle_745 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_doCycle_747 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_forCycle_768 = Set[ 28 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_772 = Set[ 4, 5, 62, 63 ]
    TOKENS_FOLLOWING_COMMENT_IN_forCycle_777 = Set[ 62, 63 ]
    TOKENS_FOLLOWING_T__62_IN_forCycle_781 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_forCycle_785 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_791 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_forCycle_796 = Set[ 4, 5, 62, 63 ]
    TOKENS_FOLLOWING_COMMENT_IN_forCycle_801 = Set[ 62, 63 ]
    TOKENS_FOLLOWING_T__62_IN_forCycle_805 = Set[ 63 ]
    TOKENS_FOLLOWING_T__63_IN_forCycle_809 = Set[ 28 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_815 = Set[ 28 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_822 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_forCycle_824 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_forCycle_827 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_forCycle_829 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_func_851 = Set[ 20, 28 ]
    TOKENS_FOLLOWING_params_IN_func_854 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_func_857 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_func_860 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_func_862 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_params_882 = Set[ 18 ]
    TOKENS_FOLLOWING_paramRest_IN_params_884 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_paramRest_903 = Set[ 28 ]
    TOKENS_FOLLOWING_params_IN_paramRest_906 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_call_935 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_call_938 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_call_943 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_call_946 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_DOT_IN_call_957 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_call_961 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_call_963 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_call_968 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_call_971 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_expression_IN_args_993 = Set[ 18 ]
    TOKENS_FOLLOWING_argsRest_IN_args_995 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsRest_1014 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_argsRest_1017 = Set[ 1 ]
    TOKENS_FOLLOWING_orOperand_IN_condition_1043 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_OR_IN_condition_1050 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_condition_1055 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperand_IN_orOperand_1076 = Set[ 1, 31 ]
    TOKENS_FOLLOWING_AND_IN_orOperand_1083 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_orOperand_IN_orOperand_1088 = Set[ 1 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1107 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_boolOperand_1114 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_boolOperand_1116 = Set[ 6, 10, 12, 13, 14, 28, 32, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_condition_IN_boolOperand_1119 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_boolOperand_1121 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1131 = Set[ 33, 34, 35, 36, 37, 38 ]
    TOKENS_FOLLOWING_EQ_IN_boolOperand_1134 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1141 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1147 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_boolOperand_1158 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1165 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1171 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_boolOperand_1182 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1189 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1195 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_boolOperand_1206 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1213 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1219 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_boolOperand_1230 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1237 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1243 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_boolOperand_1254 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 47, 48, 49, 64 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1261 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1267 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperand_IN_expression_1292 = Set[ 1, 12, 13 ]
    TOKENS_FOLLOWING_PLUS_IN_expression_1303 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_expression_1308 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expression_1316 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_expression_1321 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperand_1343 = Set[ 1, 39, 40, 41 ]
    TOKENS_FOLLOWING_MUL_IN_addOperand_1354 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1359 = Set[ 1 ]
    TOKENS_FOLLOWING_DIV_IN_addOperand_1367 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1372 = Set[ 1 ]
    TOKENS_FOLLOWING_MOD_IN_addOperand_1380 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1385 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_mulOperand_1407 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1409 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_mulOperand_1416 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1418 = Set[ 1 ]
    TOKENS_FOLLOWING_TO_INT_IN_mulOperand_1425 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1427 = Set[ 1 ]
    TOKENS_FOLLOWING_TO_FLOAT_IN_mulOperand_1434 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1436 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1443 = Set[ 1 ]
    TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1460 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_T__64_IN_mulOperandRest_1468 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_mulOperandRest_1470 = Set[ 65 ]
    TOKENS_FOLLOWING_T__65_IN_mulOperandRest_1472 = Set[ 1, 64 ]
    TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1494 = Set[ 1 ]
    TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1501 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1504 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1506 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1514 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_arrayIndexTarget_1521 = Set[ 1 ]
    TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1528 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1535 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1542 = Set[ 1 ]
    TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1549 = Set[ 1 ]
    TOKENS_FOLLOWING_new_IN_arrayIndexTarget_1556 = Set[ 1 ]
    TOKENS_FOLLOWING_NEW_IN_new_1573 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_new_1575 = Set[ 1, 10 ]
    TOKENS_FOLLOWING_LB_IN_new_1578 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_new_1580 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_new_1583 = Set[ 1 ]
    TOKENS_FOLLOWING_T__64_IN_array_1602 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64, 65 ]
    TOKENS_FOLLOWING_expression_IN_array_1611 = Set[ 18, 65 ]
    TOKENS_FOLLOWING_COMMA_IN_array_1618 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_array_1622 = Set[ 18, 65 ]
    TOKENS_FOLLOWING_T__65_IN_array_1633 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1655 = Set[ 29, 46, 64 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1663 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1668 = Set[ 1 ]
    TOKENS_FOLLOWING_T__64_IN_assignment_1687 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1691 = Set[ 65 ]
    TOKENS_FOLLOWING_T__65_IN_assignment_1693 = Set[ 29, 46, 64 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1706 = Set[ 6, 10, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1711 = Set[ 1 ]
    TOKENS_FOLLOWING_DOT_IN_assignment_1726 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1730 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_assignment_1732 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_assignment_1737 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_assignment_1740 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_DOT_IN_assignment_1758 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1762 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_assignment_1764 = Set[ 6, 10, 11, 12, 13, 14, 28, 42, 43, 44, 45, 49, 64 ]
    TOKENS_FOLLOWING_args_IN_assignment_1769 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_assignment_1772 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_TRUE_IN_bool_1799 = Set[ 1 ]
    TOKENS_FOLLOWING_FALSE_IN_bool_1807 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_string_1825 = Set[ 1 ]
    TOKENS_FOLLOWING_CLASS_IN_classDef_1888 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_classDef_1893 = Set[ 20, 52 ]
    TOKENS_FOLLOWING_SUPERCLASS_IN_classDef_1896 = Set[ 28 ]
    TOKENS_FOLLOWING_ID_IN_classDef_1900 = Set[ 20 ]
    TOKENS_FOLLOWING_LCB_IN_classDef_1906 = Set[ 4, 5, 7, 8, 9, 15, 16, 17, 19, 25, 26, 27, 28, 62, 63 ]
    TOKENS_FOLLOWING_block_IN_classDef_1913 = Set[ 21 ]
    TOKENS_FOLLOWING_RCB_IN_classDef_1917 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end


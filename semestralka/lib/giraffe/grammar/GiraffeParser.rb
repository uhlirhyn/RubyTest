#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-12-11 22:21:00
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
require './lib/giraffe/tree/stringTree.rb'
require './lib/giraffe/tree/openFileTree.rb'
require './lib/giraffe/tree/closeFileTree.rb'
require './lib/giraffe/tree/readNumberTree.rb'
require './lib/giraffe/tree/nilTree.rb'
require './lib/giraffe/tree/allocTree.rb'
require './lib/giraffe/operators.rb'

# - - - - - - end action @parser::header - - - - - - -


module Giraffe
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :T__66 => 66, :EXPONENT => 57, :MAIN => 27, :LT => 34, 
                   :T__64 => 64, :T__65 => 65, :RB => 11, :T__63 => 63, 
                   :WHILE => 23, :MOD => 40, :OPENFILE => 42, :OCTAL_ESC => 53, 
                   :READNUMBER => 43, :DO => 24, :FOR => 25, :FLOAT => 58, 
                   :NOT => 31, :RCB => 19, :ID => 26, :AND => 30, :EOF => -1, 
                   :BREAK => 7, :IF => 17, :QUOTE => 60, :ESC_SEQ => 50, 
                   :CONTINUE => 56, :QM => 62, :COMMA => 16, :LCB => 18, 
                   :PRINTLN => 55, :RETURN => 8, :PLUS => 12, :EQ => 32, 
                   :COMMENT => 4, :DOT => 28, :NE => 33, :EXIT => 9, :GE => 37, 
                   :UNICODE_ESC => 52, :NULL => 44, :ELSE => 20, :HEX_DIGIT => 51, 
                   :INT => 14, :SEMICOLON => 5, :MINUS => 13, :TRUE => 47, 
                   :MUL => 38, :PRINT => 15, :PRINTL => 54, :ELSEIF => 21, 
                   :COLON => 61, :ELIF => 22, :WS => 59, :READ => 6, :OR => 29, 
                   :ASSIGN => 46, :ALLOC => 45, :GT => 35, :LB => 10, :CLOSEFILE => 41, 
                   :DIV => 39, :FALSE => 48, :LE => 36, :STRING => 49 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "COMMENT", "SEMICOLON", "READ", "BREAK", "RETURN", "EXIT", 
                    "LB", "RB", "PLUS", "MINUS", "INT", "PRINT", "COMMA", 
                    "IF", "LCB", "RCB", "ELSE", "ELSEIF", "ELIF", "WHILE", 
                    "DO", "FOR", "ID", "MAIN", "DOT", "OR", "AND", "NOT", 
                    "EQ", "NE", "LT", "GT", "LE", "GE", "MUL", "DIV", "MOD", 
                    "CLOSEFILE", "OPENFILE", "READNUMBER", "NULL", "ALLOC", 
                    "ASSIGN", "TRUE", "FALSE", "STRING", "ESC_SEQ", "HEX_DIGIT", 
                    "UNICODE_ESC", "OCTAL_ESC", "PRINTL", "PRINTLN", "CONTINUE", 
                    "EXPONENT", "FLOAT", "WS", "QUOTE", "COLON", "QM", "'\\r'", 
                    "'\\n'", "'['", "']'" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = Giraffe
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :program, :funcdef, :functions, :functionsRest, :block, 
                     :instructionRest, :instruction, :readInstruction, :breakInstruction, 
                     :returnInstruction, :exitInstruction, :statusCode, 
                     :printInstruction, :printText, :ifInstruction, :ifRest, 
                     :whileCycle, :doCycle, :forCycle, :func, :params, :paramRest, 
                     :aloneCall, :call, :args, :argsRest, :condition, :orOperand, 
                     :boolOperand, :expression, :addOperand, :mulOperand, 
                     :mulOperandRest, :closeFile, :openFile, :readNumber, 
                     :arrayIndexTarget, :array, :alloc, :indexed, :identified, 
                     :assignment, :bool, :string ].freeze


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
    # 45:1: program returns [result] : functions ;
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


        # at line 46:4: functions
        @state.following.push( TOKENS_FOLLOWING_functions_IN_program_52 )
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
    # 49:1: funcdef returns [result] : ( func | );
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
        # at line 50:2: ( func | )
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0.between?( ID, MAIN ) )
          alt_1 = 1
        elsif ( look_1_0 == EOF || look_1_0.between?( COMMENT, SEMICOLON ) || look_1_0.between?( T__63, T__64 ) )
          alt_1 = 2
        else
          raise NoViableAlternative( "", 1, 0 )
        end
        case alt_1
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 50:4: func
          @state.following.push( TOKENS_FOLLOWING_func_IN_funcdef_70 )
          func2 = func
          @state.following.pop
          @adaptor.add_child( root_0, func2.tree )
          # --> action
          return_value.result = ( func2.nil? ? nil : func2.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 51:4: 
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
    # 54:1: functions returns [list] : funcdef functionsRest ;
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


        # at line 55:4: funcdef functionsRest
        # --> action
        return_value.list = []
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_funcdef_IN_functions_98 )
        funcdef3 = funcdef
        @state.following.pop
        @adaptor.add_child( root_0, funcdef3.tree )
        # --> action
        return_value.list = [( funcdef3.nil? ? nil : funcdef3.result )] unless ( funcdef3.nil? ? nil : funcdef3.result ) == nil
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_functionsRest_IN_functions_106 )
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
    # 62:1: functionsRest returns [list] : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) functions | );
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
        # at line 63:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) functions | )
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0.between?( COMMENT, SEMICOLON ) || look_5_0.between?( T__63, T__64 ) )
          alt_5 = 1
        elsif ( look_5_0 == EOF )
          alt_5 = 2
        else
          raise NoViableAlternative( "", 5, 0 )
        end
        case alt_5
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 63:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) functions
          # at line 63:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
          alt_4 = 2
          look_4_0 = @input.peek( 1 )

          if ( look_4_0 == COMMENT || look_4_0.between?( T__63, T__64 ) )
            alt_4 = 1
          elsif ( look_4_0 == SEMICOLON )
            alt_4 = 2
          else
            raise NoViableAlternative( "", 4, 0 )
          end
          case alt_4
          when 1
            # at line 63:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 63:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 63:8: ( COMMENT )? ( '\\r' )? '\\n'
            # at line 63:15: ( COMMENT )?
            alt_2 = 2
            look_2_0 = @input.peek( 1 )

            if ( look_2_0 == COMMENT )
              alt_2 = 1
            end
            case alt_2
            when 1
              # at line 63:15: COMMENT
              __COMMENT5__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_functionsRest_132 )

            end
            # at line 63:22: ( '\\r' )?
            alt_3 = 2
            look_3_0 = @input.peek( 1 )

            if ( look_3_0 == T__63 )
              alt_3 = 1
            end
            case alt_3
            when 1
              # at line 63:22: '\\r'
              char_literal6 = match( T__63, TOKENS_FOLLOWING_T__63_IN_functionsRest_136 )

            end
            char_literal7 = match( T__64, TOKENS_FOLLOWING_T__64_IN_functionsRest_140 )


          when 2
            # at line 63:34: SEMICOLON
            __SEMICOLON8__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_functionsRest_146 )

          end
          @state.following.push( TOKENS_FOLLOWING_functions_IN_functionsRest_153 )
          functions9 = functions
          @state.following.pop
          @adaptor.add_child( root_0, functions9.tree )
          # --> action
          return_value.list = ( functions9.nil? ? nil : functions9.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 66:4: 
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
    # 69:1: block returns [list] : instruction instructionRest ;
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


        # at line 70:4: instruction instructionRest
        # --> action
        return_value.list = []
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_instruction_IN_block_187 )
        instruction10 = instruction
        @state.following.pop
        @adaptor.add_child( root_0, instruction10.tree )
        # --> action
        return_value.list = [( instruction10.nil? ? nil : instruction10.result )] unless ( instruction10.nil? ? nil : instruction10.result ) == nil
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_instructionRest_IN_block_197 )
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
    # 77:1: instructionRest returns [list] : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | );
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
        # at line 78:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | )
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0.between?( COMMENT, SEMICOLON ) || look_9_0.between?( T__63, T__64 ) )
          alt_9 = 1
        elsif ( look_9_0 == RCB )
          alt_9 = 2
        else
          raise NoViableAlternative( "", 9, 0 )
        end
        case alt_9
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 78:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block
          # at line 78:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0 == COMMENT || look_8_0.between?( T__63, T__64 ) )
            alt_8 = 1
          elsif ( look_8_0 == SEMICOLON )
            alt_8 = 2
          else
            raise NoViableAlternative( "", 8, 0 )
          end
          case alt_8
          when 1
            # at line 78:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 78:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 78:8: ( COMMENT )? ( '\\r' )? '\\n'
            # at line 78:15: ( COMMENT )?
            alt_6 = 2
            look_6_0 = @input.peek( 1 )

            if ( look_6_0 == COMMENT )
              alt_6 = 1
            end
            case alt_6
            when 1
              # at line 78:15: COMMENT
              __COMMENT12__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_instructionRest_223 )

            end
            # at line 78:22: ( '\\r' )?
            alt_7 = 2
            look_7_0 = @input.peek( 1 )

            if ( look_7_0 == T__63 )
              alt_7 = 1
            end
            case alt_7
            when 1
              # at line 78:22: '\\r'
              char_literal13 = match( T__63, TOKENS_FOLLOWING_T__63_IN_instructionRest_227 )

            end
            char_literal14 = match( T__64, TOKENS_FOLLOWING_T__64_IN_instructionRest_231 )


          when 2
            # at line 78:34: SEMICOLON
            __SEMICOLON15__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_237 )

          end
          @state.following.push( TOKENS_FOLLOWING_block_IN_instructionRest_244 )
          block16 = block
          @state.following.pop
          @adaptor.add_child( root_0, block16.tree )
          # --> action
          return_value.list = ( block16.nil? ? nil : block16.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 81:4: 
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
    # 84:1: instruction returns [result] : ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | returnInstruction | exitInstruction | breakInstruction | aloneCall | closeFile | );
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
      returnInstruction23 = nil
      exitInstruction24 = nil
      breakInstruction25 = nil
      aloneCall26 = nil
      closeFile27 = nil


      begin
        # at line 85:2: ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | returnInstruction | exitInstruction | breakInstruction | aloneCall | closeFile | )
        alt_10 = 12
        alt_10 = @dfa10.predict( @input )
        case alt_10
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 85:4: assignment
          @state.following.push( TOKENS_FOLLOWING_assignment_IN_instruction_273 )
          assignment17 = assignment
          @state.following.pop
          @adaptor.add_child( root_0, assignment17.tree )
          # --> action
          return_value.result = ( assignment17.nil? ? nil : assignment17.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 86:4: forCycle
          @state.following.push( TOKENS_FOLLOWING_forCycle_IN_instruction_280 )
          forCycle18 = forCycle
          @state.following.pop
          @adaptor.add_child( root_0, forCycle18.tree )
          # --> action
          return_value.result = ( forCycle18.nil? ? nil : forCycle18.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 87:4: ifInstruction
          @state.following.push( TOKENS_FOLLOWING_ifInstruction_IN_instruction_287 )
          ifInstruction19 = ifInstruction
          @state.following.pop
          @adaptor.add_child( root_0, ifInstruction19.tree )
          # --> action
          return_value.result = ( ifInstruction19.nil? ? nil : ifInstruction19.result )
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 88:4: whileCycle
          @state.following.push( TOKENS_FOLLOWING_whileCycle_IN_instruction_294 )
          whileCycle20 = whileCycle
          @state.following.pop
          @adaptor.add_child( root_0, whileCycle20.tree )
          # --> action
          return_value.result = ( whileCycle20.nil? ? nil : whileCycle20.result )
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 89:4: doCycle
          @state.following.push( TOKENS_FOLLOWING_doCycle_IN_instruction_301 )
          doCycle21 = doCycle
          @state.following.pop
          @adaptor.add_child( root_0, doCycle21.tree )
          # --> action
          return_value.result = ( doCycle21.nil? ? nil : doCycle21.result )
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 90:4: printInstruction
          @state.following.push( TOKENS_FOLLOWING_printInstruction_IN_instruction_308 )
          printInstruction22 = printInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printInstruction22.tree )
          # --> action
          return_value.result = ( printInstruction22.nil? ? nil : printInstruction22.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 91:4: returnInstruction
          @state.following.push( TOKENS_FOLLOWING_returnInstruction_IN_instruction_315 )
          returnInstruction23 = returnInstruction
          @state.following.pop
          @adaptor.add_child( root_0, returnInstruction23.tree )
          # --> action
          return_value.result = ( returnInstruction23.nil? ? nil : returnInstruction23.result )
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 92:4: exitInstruction
          @state.following.push( TOKENS_FOLLOWING_exitInstruction_IN_instruction_323 )
          exitInstruction24 = exitInstruction
          @state.following.pop
          @adaptor.add_child( root_0, exitInstruction24.tree )
          # --> action
          return_value.result = ( exitInstruction24.nil? ? nil : exitInstruction24.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 93:4: breakInstruction
          @state.following.push( TOKENS_FOLLOWING_breakInstruction_IN_instruction_330 )
          breakInstruction25 = breakInstruction
          @state.following.pop
          @adaptor.add_child( root_0, breakInstruction25.tree )
          # --> action
          return_value.result = ( breakInstruction25.nil? ? nil : breakInstruction25.result )
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 94:4: aloneCall
          @state.following.push( TOKENS_FOLLOWING_aloneCall_IN_instruction_337 )
          aloneCall26 = aloneCall
          @state.following.pop
          @adaptor.add_child( root_0, aloneCall26.tree )
          # --> action
          return_value.result = ( aloneCall26.nil? ? nil : aloneCall26.result )
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 95:4: closeFile
          @state.following.push( TOKENS_FOLLOWING_closeFile_IN_instruction_344 )
          closeFile27 = closeFile
          @state.following.pop
          @adaptor.add_child( root_0, closeFile27.tree )
          # --> action
          return_value.result = ( closeFile27.nil? ? nil : closeFile27.result )
          # <-- action

        when 12
          root_0 = @adaptor.create_flat_list


          # at line 96:4: 
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
    # 99:1: readInstruction returns [result] : READ ;
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


        # at line 100:4: READ
        __READ28__ = match( READ, TOKENS_FOLLOWING_READ_IN_readInstruction_367 )

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
    # 103:1: breakInstruction returns [result] : BREAK ;
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


        # at line 104:4: BREAK
        __BREAK29__ = match( BREAK, TOKENS_FOLLOWING_BREAK_IN_breakInstruction_384 )

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
    # 107:1: returnInstruction returns [result] : RETURN expression ;
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


        # at line 108:4: RETURN expression
        __RETURN30__ = match( RETURN, TOKENS_FOLLOWING_RETURN_IN_returnInstruction_401 )

        tree_for_RETURN30 = @adaptor.create_with_payload( __RETURN30__ )
        root_0 = @adaptor.become_root( tree_for_RETURN30, root_0 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_returnInstruction_404 )
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
    # 111:1: exitInstruction returns [result] : EXIT ( LB alt1= statusCode RB | alt2= statusCode )? ;
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


        # at line 112:4: EXIT ( LB alt1= statusCode RB | alt2= statusCode )?
        __EXIT32__ = match( EXIT, TOKENS_FOLLOWING_EXIT_IN_exitInstruction_421 )

        tree_for_EXIT32 = @adaptor.create_with_payload( __EXIT32__ )
        root_0 = @adaptor.become_root( tree_for_EXIT32, root_0 )

        # at line 112:11: ( LB alt1= statusCode RB | alt2= statusCode )?
        alt_11 = 3
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == LB )
          alt_11 = 1
        elsif ( look_11_0.between?( PLUS, INT ) )
          alt_11 = 2
        end
        case alt_11
        when 1
          # at line 112:12: LB alt1= statusCode RB
          __LB33__ = match( LB, TOKENS_FOLLOWING_LB_IN_exitInstruction_426 )
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_431 )
          alt1 = statusCode
          @state.following.pop
          @adaptor.add_child( root_0, alt1.tree )
          __RB34__ = match( RB, TOKENS_FOLLOWING_RB_IN_exitInstruction_433 )
          # --> action
          return_value.result = ExitTree.new(( alt1.nil? ? nil : alt1.result ))
          # <-- action

        when 2
          # at line 113:6: alt2= statusCode
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_446 )
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
    # 116:1: statusCode returns [result] : ( PLUS | MINUS )? INT ;
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


        # at line 117:4: ( PLUS | MINUS )? INT
        # --> action
        sign = ""
        # <-- action
        # at line 118:3: ( PLUS | MINUS )?
        alt_12 = 3
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == PLUS )
          alt_12 = 1
        elsif ( look_12_0 == MINUS )
          alt_12 = 2
        end
        case alt_12
        when 1
          # at line 118:4: PLUS
          __PLUS35__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_statusCode_471 )

          tree_for_PLUS35 = @adaptor.create_with_payload( __PLUS35__ )
          @adaptor.add_child( root_0, tree_for_PLUS35 )


        when 2
          # at line 118:11: MINUS
          __MINUS36__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_statusCode_475 )

          tree_for_MINUS36 = @adaptor.create_with_payload( __MINUS36__ )
          @adaptor.add_child( root_0, tree_for_MINUS36 )

          # --> action
          sign = __MINUS36__.text
          # <-- action

        end
        __INT37__ = match( INT, TOKENS_FOLLOWING_INT_IN_statusCode_481 )

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
    # 122:1: printInstruction returns [result] : PRINT LB printText RB ;
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


        # at line 123:5: PRINT LB printText RB
        __PRINT38__ = match( PRINT, TOKENS_FOLLOWING_PRINT_IN_printInstruction_502 )

        tree_for_PRINT38 = @adaptor.create_with_payload( __PRINT38__ )
        root_0 = @adaptor.become_root( tree_for_PRINT38, root_0 )

        __LB39__ = match( LB, TOKENS_FOLLOWING_LB_IN_printInstruction_505 )
        @state.following.push( TOKENS_FOLLOWING_printText_IN_printInstruction_508 )
        printText40 = printText
        @state.following.pop
        @adaptor.add_child( root_0, printText40.tree )
        __RB41__ = match( RB, TOKENS_FOLLOWING_RB_IN_printInstruction_510 )
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

    PrintTextReturnValue = define_return_scope :list

    # 
    # parser rule printText
    # 
    # (in Giraffe.g)
    # 126:1: printText returns [list] : expression ( COMMA rest= printText )? ;
    # 
    def printText
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
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


        # at line 127:4: expression ( COMMA rest= printText )?
        @state.following.push( TOKENS_FOLLOWING_expression_IN_printText_535 )
        expression42 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression42.tree )
        # --> action
        return_value.list = [( expression42.nil? ? nil : expression42.result )]
        # <-- action
        # at line 128:3: ( COMMA rest= printText )?
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == COMMA )
          alt_13 = 1
        end
        case alt_13
        when 1
          # at line 128:4: COMMA rest= printText
          __COMMA43__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_printText_542 )

          tree_for_COMMA43 = @adaptor.create_with_payload( __COMMA43__ )
          @adaptor.add_child( root_0, tree_for_COMMA43 )

          @state.following.push( TOKENS_FOLLOWING_printText_IN_printText_546 )
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
        # trace_out( __method__, 14 )

      end
      
      return return_value
    end

    IfInstructionReturnValue = define_return_scope :result

    # 
    # parser rule ifInstruction
    # 
    # (in Giraffe.g)
    # 131:1: ifInstruction returns [result] : IF LB condition RB LCB block RCB ifRest ;
    # 
    def ifInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = IfInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __IF44__ = nil
      __LB45__ = nil
      __RB47__ = nil
      __LCB48__ = nil
      __RCB50__ = nil
      condition46 = nil
      block49 = nil
      ifRest51 = nil

      tree_for_IF44 = nil
      tree_for_LB45 = nil
      tree_for_RB47 = nil
      tree_for_LCB48 = nil
      tree_for_RCB50 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 132:4: IF LB condition RB LCB block RCB ifRest
        __IF44__ = match( IF, TOKENS_FOLLOWING_IF_IN_ifInstruction_570 )

        tree_for_IF44 = @adaptor.create_with_payload( __IF44__ )
        root_0 = @adaptor.become_root( tree_for_IF44, root_0 )

        __LB45__ = match( LB, TOKENS_FOLLOWING_LB_IN_ifInstruction_573 )
        @state.following.push( TOKENS_FOLLOWING_condition_IN_ifInstruction_576 )
        condition46 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition46.tree )
        __RB47__ = match( RB, TOKENS_FOLLOWING_RB_IN_ifInstruction_578 )
        __LCB48__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifInstruction_581 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_ifInstruction_584 )
        block49 = block
        @state.following.pop
        @adaptor.add_child( root_0, block49.tree )
        __RCB50__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifInstruction_586 )
        @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifInstruction_589 )
        ifRest51 = ifRest
        @state.following.pop
        @adaptor.add_child( root_0, ifRest51.tree )
        # --> action
        return_value.result = [IfTree.new(( condition46.nil? ? nil : condition46.result ),( block49.nil? ? nil : block49.list ),( ifRest51.nil? ? nil : ifRest51.result )),tree_for_IF44]
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

    IfRestReturnValue = define_return_scope :result

    # 
    # parser rule ifRest
    # 
    # (in Giraffe.g)
    # 136:1: ifRest returns [result] : ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | );
    # 
    def ifRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = IfRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ELSE52__ = nil
      __LCB53__ = nil
      __RCB55__ = nil
      set56 = nil
      __LCB58__ = nil
      __RCB60__ = nil
      op = nil
      block54 = nil
      condition57 = nil
      block59 = nil

      tree_for_ELSE52 = nil
      tree_for_LCB53 = nil
      tree_for_RCB55 = nil
      tree_for_set56 = nil
      tree_for_LCB58 = nil
      tree_for_RCB60 = nil

      begin
        # at line 137:2: ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | )
        alt_14 = 3
        case look_14 = @input.peek( 1 )
        when ELSE then alt_14 = 1
        when ELSEIF, ELIF then alt_14 = 2
        when COMMENT, SEMICOLON, RCB, T__63, T__64 then alt_14 = 3
        else
          raise NoViableAlternative( "", 14, 0 )
        end
        case alt_14
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 137:4: ELSE LCB block RCB
          __ELSE52__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_ifRest_608 )

          tree_for_ELSE52 = @adaptor.create_with_payload( __ELSE52__ )
          @adaptor.add_child( root_0, tree_for_ELSE52 )

          __LCB53__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_610 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_613 )
          block54 = block
          @state.following.pop
          @adaptor.add_child( root_0, block54.tree )
          __RCB55__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_615 )
          # --> action
          return_value.result = ( block54.nil? ? nil : block54.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 138:4: ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest
          set56 = @input.look
          if @input.peek( 1 ).between?( ELSEIF, ELIF )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set56 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          @state.following.push( TOKENS_FOLLOWING_condition_IN_ifRest_631 )
          condition57 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition57.tree )
          __LCB58__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_633 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_636 )
          block59 = block
          @state.following.pop
          @adaptor.add_child( root_0, block59.tree )
          __RCB60__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_638 )
          @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifRest_643 )
          op = ifRest
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = IfTree.new(( condition57.nil? ? nil : condition57.result ),( block59.nil? ? nil : block59.list ),( op.nil? ? nil : op.result ))
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 140:4: 
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
        # trace_out( __method__, 16 )

      end
      
      return return_value
    end

    WhileCycleReturnValue = define_return_scope :result

    # 
    # parser rule whileCycle
    # 
    # (in Giraffe.g)
    # 143:1: whileCycle returns [result] : WHILE LB condition RB LCB block RCB ;
    # 
    def whileCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = WhileCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WHILE61__ = nil
      __LB62__ = nil
      __RB64__ = nil
      __LCB65__ = nil
      __RCB67__ = nil
      condition63 = nil
      block66 = nil

      tree_for_WHILE61 = nil
      tree_for_LB62 = nil
      tree_for_RB64 = nil
      tree_for_LCB65 = nil
      tree_for_RCB67 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 144:5: WHILE LB condition RB LCB block RCB
        __WHILE61__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_whileCycle_670 )

        tree_for_WHILE61 = @adaptor.create_with_payload( __WHILE61__ )
        @adaptor.add_child( root_0, tree_for_WHILE61 )

        __LB62__ = match( LB, TOKENS_FOLLOWING_LB_IN_whileCycle_672 )

        tree_for_LB62 = @adaptor.create_with_payload( __LB62__ )
        @adaptor.add_child( root_0, tree_for_LB62 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_whileCycle_674 )
        condition63 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition63.tree )
        __RB64__ = match( RB, TOKENS_FOLLOWING_RB_IN_whileCycle_676 )

        tree_for_RB64 = @adaptor.create_with_payload( __RB64__ )
        @adaptor.add_child( root_0, tree_for_RB64 )

        __LCB65__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_whileCycle_678 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_whileCycle_681 )
        block66 = block
        @state.following.pop
        @adaptor.add_child( root_0, block66.tree )
        __RCB67__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_whileCycle_683 )
        # --> action
        return_value.result = [WhileTree.new(( condition63.nil? ? nil : condition63.result ),( block66.nil? ? nil : block66.list )),tree_for_WHILE61]
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

    DoCycleReturnValue = define_return_scope :result

    # 
    # parser rule doCycle
    # 
    # (in Giraffe.g)
    # 148:1: doCycle returns [result] : DO LCB block RCB WHILE LB condition RB ;
    # 
    def doCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = DoCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __DO68__ = nil
      __LCB69__ = nil
      __RCB71__ = nil
      __WHILE72__ = nil
      __LB73__ = nil
      __RB75__ = nil
      block70 = nil
      condition74 = nil

      tree_for_DO68 = nil
      tree_for_LCB69 = nil
      tree_for_RCB71 = nil
      tree_for_WHILE72 = nil
      tree_for_LB73 = nil
      tree_for_RB75 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 149:4: DO LCB block RCB WHILE LB condition RB
        __DO68__ = match( DO, TOKENS_FOLLOWING_DO_IN_doCycle_705 )

        tree_for_DO68 = @adaptor.create_with_payload( __DO68__ )
        @adaptor.add_child( root_0, tree_for_DO68 )

        __LCB69__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_doCycle_707 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_doCycle_710 )
        block70 = block
        @state.following.pop
        @adaptor.add_child( root_0, block70.tree )
        __RCB71__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_doCycle_712 )
        __WHILE72__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_doCycle_715 )

        tree_for_WHILE72 = @adaptor.create_with_payload( __WHILE72__ )
        @adaptor.add_child( root_0, tree_for_WHILE72 )

        __LB73__ = match( LB, TOKENS_FOLLOWING_LB_IN_doCycle_717 )

        tree_for_LB73 = @adaptor.create_with_payload( __LB73__ )
        @adaptor.add_child( root_0, tree_for_LB73 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_doCycle_719 )
        condition74 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition74.tree )
        __RB75__ = match( RB, TOKENS_FOLLOWING_RB_IN_doCycle_721 )

        tree_for_RB75 = @adaptor.create_with_payload( __RB75__ )
        @adaptor.add_child( root_0, tree_for_RB75 )

        # --> action
        return_value.result = [DoTree.new(( condition74.nil? ? nil : condition74.result ),( block70.nil? ? nil : block70.list )),tree_for_DO68]
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

    ForCycleReturnValue = define_return_scope :result

    # 
    # parser rule forCycle
    # 
    # (in Giraffe.g)
    # 153:1: forCycle returns [result] : FOR LB as1= assignment ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) condition ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) as2= assignment RB LCB block RCB ;
    # 
    def forCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = ForCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __FOR76__ = nil
      __LB77__ = nil
      __COMMENT78__ = nil
      char_literal79 = nil
      char_literal80 = nil
      __SEMICOLON81__ = nil
      __COMMENT83__ = nil
      char_literal84 = nil
      char_literal85 = nil
      __SEMICOLON86__ = nil
      __RB87__ = nil
      __LCB88__ = nil
      __RCB90__ = nil
      as1 = nil
      as2 = nil
      condition82 = nil
      block89 = nil

      tree_for_FOR76 = nil
      tree_for_LB77 = nil
      tree_for_COMMENT78 = nil
      tree_for_char_literal79 = nil
      tree_for_char_literal80 = nil
      tree_for_SEMICOLON81 = nil
      tree_for_COMMENT83 = nil
      tree_for_char_literal84 = nil
      tree_for_char_literal85 = nil
      tree_for_SEMICOLON86 = nil
      tree_for_RB87 = nil
      tree_for_LCB88 = nil
      tree_for_RCB90 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 154:4: FOR LB as1= assignment ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) condition ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) as2= assignment RB LCB block RCB
        __FOR76__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_forCycle_742 )

        tree_for_FOR76 = @adaptor.create_with_payload( __FOR76__ )
        @adaptor.add_child( root_0, tree_for_FOR76 )

        __LB77__ = match( LB, TOKENS_FOLLOWING_LB_IN_forCycle_744 )

        tree_for_LB77 = @adaptor.create_with_payload( __LB77__ )
        @adaptor.add_child( root_0, tree_for_LB77 )

        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_748 )
        as1 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as1.tree )
        # at line 154:26: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == COMMENT || look_17_0.between?( T__63, T__64 ) )
          alt_17 = 1
        elsif ( look_17_0 == SEMICOLON )
          alt_17 = 2
        else
          raise NoViableAlternative( "", 17, 0 )
        end
        case alt_17
        when 1
          # at line 154:27: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 154:27: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 154:29: ( COMMENT )? ( '\\r' )? '\\n'
          # at line 154:36: ( COMMENT )?
          alt_15 = 2
          look_15_0 = @input.peek( 1 )

          if ( look_15_0 == COMMENT )
            alt_15 = 1
          end
          case alt_15
          when 1
            # at line 154:36: COMMENT
            __COMMENT78__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_forCycle_753 )

          end
          # at line 154:43: ( '\\r' )?
          alt_16 = 2
          look_16_0 = @input.peek( 1 )

          if ( look_16_0 == T__63 )
            alt_16 = 1
          end
          case alt_16
          when 1
            # at line 154:43: '\\r'
            char_literal79 = match( T__63, TOKENS_FOLLOWING_T__63_IN_forCycle_757 )

          end
          char_literal80 = match( T__64, TOKENS_FOLLOWING_T__64_IN_forCycle_761 )


        when 2
          # at line 154:55: SEMICOLON
          __SEMICOLON81__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_767 )

        end
        @state.following.push( TOKENS_FOLLOWING_condition_IN_forCycle_772 )
        condition82 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition82.tree )
        # at line 154:78: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
        alt_20 = 2
        look_20_0 = @input.peek( 1 )

        if ( look_20_0 == COMMENT || look_20_0.between?( T__63, T__64 ) )
          alt_20 = 1
        elsif ( look_20_0 == SEMICOLON )
          alt_20 = 2
        else
          raise NoViableAlternative( "", 20, 0 )
        end
        case alt_20
        when 1
          # at line 154:79: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 154:79: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 154:81: ( COMMENT )? ( '\\r' )? '\\n'
          # at line 154:88: ( COMMENT )?
          alt_18 = 2
          look_18_0 = @input.peek( 1 )

          if ( look_18_0 == COMMENT )
            alt_18 = 1
          end
          case alt_18
          when 1
            # at line 154:88: COMMENT
            __COMMENT83__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_forCycle_777 )

          end
          # at line 154:95: ( '\\r' )?
          alt_19 = 2
          look_19_0 = @input.peek( 1 )

          if ( look_19_0 == T__63 )
            alt_19 = 1
          end
          case alt_19
          when 1
            # at line 154:95: '\\r'
            char_literal84 = match( T__63, TOKENS_FOLLOWING_T__63_IN_forCycle_781 )

          end
          char_literal85 = match( T__64, TOKENS_FOLLOWING_T__64_IN_forCycle_785 )


        when 2
          # at line 154:107: SEMICOLON
          __SEMICOLON86__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_791 )

        end
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_798 )
        as2 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as2.tree )
        __RB87__ = match( RB, TOKENS_FOLLOWING_RB_IN_forCycle_800 )

        tree_for_RB87 = @adaptor.create_with_payload( __RB87__ )
        @adaptor.add_child( root_0, tree_for_RB87 )

        __LCB88__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_forCycle_802 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_forCycle_805 )
        block89 = block
        @state.following.pop
        @adaptor.add_child( root_0, block89.tree )
        __RCB90__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_forCycle_807 )
        # --> action
        return_value.result = [ForTree.new(( as1.nil? ? nil : as1.result ),( condition82.nil? ? nil : condition82.result ),( as2.nil? ? nil : as2.result ),( block89.nil? ? nil : block89.list )), tree_for_FOR76]
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

    FuncReturnValue = define_return_scope :result

    # 
    # parser rule func
    # 
    # (in Giraffe.g)
    # 158:1: func returns [result] : ( ID ( LB params RB )? LCB block RCB | MAIN LCB block RCB );
    # 
    def func
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = FuncReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID91__ = nil
      __LB92__ = nil
      __RB94__ = nil
      __LCB95__ = nil
      __RCB97__ = nil
      __MAIN98__ = nil
      __LCB99__ = nil
      __RCB101__ = nil
      params93 = nil
      block96 = nil
      block100 = nil

      tree_for_ID91 = nil
      tree_for_LB92 = nil
      tree_for_RB94 = nil
      tree_for_LCB95 = nil
      tree_for_RCB97 = nil
      tree_for_MAIN98 = nil
      tree_for_LCB99 = nil
      tree_for_RCB101 = nil

      begin
        # at line 159:2: ( ID ( LB params RB )? LCB block RCB | MAIN LCB block RCB )
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == ID )
          alt_22 = 1
        elsif ( look_22_0 == MAIN )
          alt_22 = 2
        else
          raise NoViableAlternative( "", 22, 0 )
        end
        case alt_22
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 159:4: ID ( LB params RB )? LCB block RCB
          __ID91__ = match( ID, TOKENS_FOLLOWING_ID_IN_func_829 )

          tree_for_ID91 = @adaptor.create_with_payload( __ID91__ )
          @adaptor.add_child( root_0, tree_for_ID91 )

          # at line 159:7: ( LB params RB )?
          alt_21 = 2
          look_21_0 = @input.peek( 1 )

          if ( look_21_0 == LB )
            alt_21 = 1
          end
          case alt_21
          when 1
            # at line 159:8: LB params RB
            __LB92__ = match( LB, TOKENS_FOLLOWING_LB_IN_func_832 )
            @state.following.push( TOKENS_FOLLOWING_params_IN_func_835 )
            params93 = params
            @state.following.pop
            @adaptor.add_child( root_0, params93.tree )
            __RB94__ = match( RB, TOKENS_FOLLOWING_RB_IN_func_837 )

          end
          __LCB95__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_842 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_func_845 )
          block96 = block
          @state.following.pop
          @adaptor.add_child( root_0, block96.tree )
          __RCB97__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_847 )
          # --> action
          return_value.result = [FuncTree.new(__ID91__.text,( params93.nil? ? nil : params93.list ) == nil ? [] : ( params93.nil? ? nil : params93.list ),( block96.nil? ? nil : block96.list )),tree_for_ID91]
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 161:4: MAIN LCB block RCB
          __MAIN98__ = match( MAIN, TOKENS_FOLLOWING_MAIN_IN_func_857 )

          tree_for_MAIN98 = @adaptor.create_with_payload( __MAIN98__ )
          root_0 = @adaptor.become_root( tree_for_MAIN98, root_0 )

          __LCB99__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_860 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_func_863 )
          block100 = block
          @state.following.pop
          @adaptor.add_child( root_0, block100.tree )
          __RCB101__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_865 )
          # --> action
          return_value.result = [FuncTree.new("main",[],( block100.nil? ? nil : block100.list )),tree_for_MAIN98]
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

    ParamsReturnValue = define_return_scope :list

    # 
    # parser rule params
    # 
    # (in Giraffe.g)
    # 165:1: params returns [list] : ( ID paramRest | );
    # 
    def params
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = ParamsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID102__ = nil
      paramRest103 = nil

      tree_for_ID102 = nil

      begin
        # at line 166:2: ( ID paramRest | )
        alt_23 = 2
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == ID )
          alt_23 = 1
        elsif ( look_23_0 == RB )
          alt_23 = 2
        else
          raise NoViableAlternative( "", 23, 0 )
        end
        case alt_23
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 166:4: ID paramRest
          __ID102__ = match( ID, TOKENS_FOLLOWING_ID_IN_params_885 )

          tree_for_ID102 = @adaptor.create_with_payload( __ID102__ )
          @adaptor.add_child( root_0, tree_for_ID102 )

          @state.following.push( TOKENS_FOLLOWING_paramRest_IN_params_887 )
          paramRest103 = paramRest
          @state.following.pop
          @adaptor.add_child( root_0, paramRest103.tree )
          # --> action
          return_value.list = [__ID102__.text] + ( paramRest103.nil? ? nil : paramRest103.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 168:5: 
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

    ParamRestReturnValue = define_return_scope :list

    # 
    # parser rule paramRest
    # 
    # (in Giraffe.g)
    # 171:1: paramRest returns [list] : ( COMMA params | );
    # 
    def paramRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ParamRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA104__ = nil
      params105 = nil

      tree_for_COMMA104 = nil

      begin
        # at line 172:2: ( COMMA params | )
        alt_24 = 2
        look_24_0 = @input.peek( 1 )

        if ( look_24_0 == COMMA )
          alt_24 = 1
        elsif ( look_24_0 == RB )
          alt_24 = 2
        else
          raise NoViableAlternative( "", 24, 0 )
        end
        case alt_24
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 172:4: COMMA params
          __COMMA104__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_paramRest_912 )
          @state.following.push( TOKENS_FOLLOWING_params_IN_paramRest_915 )
          params105 = params
          @state.following.pop
          @adaptor.add_child( root_0, params105.tree )
          # --> action
          return_value.list = ( params105.nil? ? nil : params105.list )
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
        # trace_out( __method__, 22 )

      end
      
      return return_value
    end

    AloneCallReturnValue = define_return_scope :result

    # 
    # parser rule aloneCall
    # 
    # (in Giraffe.g)
    # 177:1: aloneCall returns [result] : fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )* ;
    # 
    def aloneCall
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = AloneCallReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      fun = nil
      method = nil
      __LB106__ = nil
      __RB107__ = nil
      __DOT108__ = nil
      __LB109__ = nil
      __RB110__ = nil
      args1 = nil
      args2 = nil

      tree_for_fun = nil
      tree_for_method = nil
      tree_for_LB106 = nil
      tree_for_RB107 = nil
      tree_for_DOT108 = nil
      tree_for_LB109 = nil
      tree_for_RB110 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 178:4: fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )*
        fun = match( ID, TOKENS_FOLLOWING_ID_IN_aloneCall_943 )

        tree_for_fun = @adaptor.create_with_payload( fun )
        root_0 = @adaptor.become_root( tree_for_fun, root_0 )

        __LB106__ = match( LB, TOKENS_FOLLOWING_LB_IN_aloneCall_946 )
        # at line 178:21: (args1= args )?
        alt_25 = 2
        look_25_0 = @input.peek( 1 )

        if ( look_25_0 == READ || look_25_0 == LB || look_25_0.between?( PLUS, INT ) || look_25_0 == ID || look_25_0.between?( OPENFILE, ALLOC ) || look_25_0 == STRING || look_25_0 == T__65 )
          alt_25 = 1
        end
        case alt_25
        when 1
          # at line 178:21: args1= args
          @state.following.push( TOKENS_FOLLOWING_args_IN_aloneCall_951 )
          args1 = args
          @state.following.pop
          @adaptor.add_child( root_0, args1.tree )

        end
        __RB107__ = match( RB, TOKENS_FOLLOWING_RB_IN_aloneCall_954 )
        # --> action
        return_value.result = [CallTree.new(fun.text,( args1.nil? ? nil : args1.list ),true),tree_for_fun]
        # <-- action
        # at line 180:3: ( DOT method= ID LB (args2= args )? RB )*
        while true # decision 27
          alt_27 = 2
          look_27_0 = @input.peek( 1 )

          if ( look_27_0 == DOT )
            alt_27 = 1

          end
          case alt_27
          when 1
            # at line 180:5: DOT method= ID LB (args2= args )? RB
            __DOT108__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_aloneCall_965 )

            tree_for_DOT108 = @adaptor.create_with_payload( __DOT108__ )
            @adaptor.add_child( root_0, tree_for_DOT108 )

            method = match( ID, TOKENS_FOLLOWING_ID_IN_aloneCall_969 )

            tree_for_method = @adaptor.create_with_payload( method )
            @adaptor.add_child( root_0, tree_for_method )

            __LB109__ = match( LB, TOKENS_FOLLOWING_LB_IN_aloneCall_971 )
            # at line 180:28: (args2= args )?
            alt_26 = 2
            look_26_0 = @input.peek( 1 )

            if ( look_26_0 == READ || look_26_0 == LB || look_26_0.between?( PLUS, INT ) || look_26_0 == ID || look_26_0.between?( OPENFILE, ALLOC ) || look_26_0 == STRING || look_26_0 == T__65 )
              alt_26 = 1
            end
            case alt_26
            when 1
              # at line 180:28: args2= args
              @state.following.push( TOKENS_FOLLOWING_args_IN_aloneCall_976 )
              args2 = args
              @state.following.pop
              @adaptor.add_child( root_0, args2.tree )

            end
            __RB110__ = match( RB, TOKENS_FOLLOWING_RB_IN_aloneCall_979 )
            # --> action
            return_value.result = [MethodCallTree.new(return_value.result,method.text,( args2.nil? ? nil : args2.list )),tree_for_method]
            # <-- action

          else
            break # out of loop for decision 27
          end
        end # loop for decision 27
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

    CallReturnValue = define_return_scope :result

    # 
    # parser rule call
    # 
    # (in Giraffe.g)
    # 183:1: call returns [result] : fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )* ;
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
      __LB111__ = nil
      __RB112__ = nil
      __DOT113__ = nil
      __LB114__ = nil
      __RB115__ = nil
      args1 = nil
      args2 = nil

      tree_for_fun = nil
      tree_for_method = nil
      tree_for_LB111 = nil
      tree_for_RB112 = nil
      tree_for_DOT113 = nil
      tree_for_LB114 = nil
      tree_for_RB115 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 184:4: fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )*
        fun = match( ID, TOKENS_FOLLOWING_ID_IN_call_1002 )

        tree_for_fun = @adaptor.create_with_payload( fun )
        root_0 = @adaptor.become_root( tree_for_fun, root_0 )

        __LB111__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_1005 )
        # at line 184:21: (args1= args )?
        alt_28 = 2
        look_28_0 = @input.peek( 1 )

        if ( look_28_0 == READ || look_28_0 == LB || look_28_0.between?( PLUS, INT ) || look_28_0 == ID || look_28_0.between?( OPENFILE, ALLOC ) || look_28_0 == STRING || look_28_0 == T__65 )
          alt_28 = 1
        end
        case alt_28
        when 1
          # at line 184:21: args1= args
          @state.following.push( TOKENS_FOLLOWING_args_IN_call_1010 )
          args1 = args
          @state.following.pop
          @adaptor.add_child( root_0, args1.tree )

        end
        __RB112__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_1013 )
        # --> action
        return_value.result = [CallTree.new(fun.text,( args1.nil? ? nil : args1.list ),false),tree_for_fun]
        # <-- action
        # at line 186:3: ( DOT method= ID LB (args2= args )? RB )*
        while true # decision 30
          alt_30 = 2
          look_30_0 = @input.peek( 1 )

          if ( look_30_0 == DOT )
            alt_30 = 1

          end
          case alt_30
          when 1
            # at line 186:5: DOT method= ID LB (args2= args )? RB
            __DOT113__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_call_1024 )

            tree_for_DOT113 = @adaptor.create_with_payload( __DOT113__ )
            @adaptor.add_child( root_0, tree_for_DOT113 )

            method = match( ID, TOKENS_FOLLOWING_ID_IN_call_1028 )

            tree_for_method = @adaptor.create_with_payload( method )
            @adaptor.add_child( root_0, tree_for_method )

            __LB114__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_1030 )
            # at line 186:28: (args2= args )?
            alt_29 = 2
            look_29_0 = @input.peek( 1 )

            if ( look_29_0 == READ || look_29_0 == LB || look_29_0.between?( PLUS, INT ) || look_29_0 == ID || look_29_0.between?( OPENFILE, ALLOC ) || look_29_0 == STRING || look_29_0 == T__65 )
              alt_29 = 1
            end
            case alt_29
            when 1
              # at line 186:28: args2= args
              @state.following.push( TOKENS_FOLLOWING_args_IN_call_1035 )
              args2 = args
              @state.following.pop
              @adaptor.add_child( root_0, args2.tree )

            end
            __RB115__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_1038 )
            # --> action
            return_value.result = [MethodCallTree.new(return_value.result,method.text,( args2.nil? ? nil : args2.list )),tree_for_method]
            # <-- action

          else
            break # out of loop for decision 30
          end
        end # loop for decision 30
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
    # 189:1: args returns [list] : expression argsRest ;
    # 
    def args
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = ArgsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      expression116 = nil
      argsRest117 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 190:5: expression argsRest
        @state.following.push( TOKENS_FOLLOWING_expression_IN_args_1060 )
        expression116 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression116.tree )
        @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_1062 )
        argsRest117 = argsRest
        @state.following.pop
        @adaptor.add_child( root_0, argsRest117.tree )
        # --> action
        return_value.list = [( expression116.nil? ? nil : expression116.result )] + ( argsRest117.nil? ? nil : argsRest117.list )
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
    # 193:1: argsRest returns [list] : ( COMMA args | );
    # 
    def argsRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = ArgsRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA118__ = nil
      args119 = nil

      tree_for_COMMA118 = nil

      begin
        # at line 194:2: ( COMMA args | )
        alt_31 = 2
        look_31_0 = @input.peek( 1 )

        if ( look_31_0 == COMMA )
          alt_31 = 1
        elsif ( look_31_0 == RB )
          alt_31 = 2
        else
          raise NoViableAlternative( "", 31, 0 )
        end
        case alt_31
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 194:4: COMMA args
          __COMMA118__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsRest_1081 )
          @state.following.push( TOKENS_FOLLOWING_args_IN_argsRest_1084 )
          args119 = args
          @state.following.pop
          @adaptor.add_child( root_0, args119.tree )
          # --> action
          return_value.list = ( args119.nil? ? nil : args119.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 196:4: 
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
    # 201:1: condition returns [result] : orOperand ( OR op= condition )? ;
    # 
    def condition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = ConditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OR121__ = nil
      op = nil
      orOperand120 = nil

      tree_for_OR121 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 202:4: orOperand ( OR op= condition )?
        @state.following.push( TOKENS_FOLLOWING_orOperand_IN_condition_1110 )
        orOperand120 = orOperand
        @state.following.pop
        @adaptor.add_child( root_0, orOperand120.tree )
        # --> action
        return_value.result = ( orOperand120.nil? ? nil : orOperand120.result )
        # <-- action
        # at line 203:3: ( OR op= condition )?
        alt_32 = 2
        look_32_0 = @input.peek( 1 )

        if ( look_32_0 == OR )
          alt_32 = 1
        end
        case alt_32
        when 1
          # at line 203:4: OR op= condition
          __OR121__ = match( OR, TOKENS_FOLLOWING_OR_IN_condition_1117 )

          tree_for_OR121 = @adaptor.create_with_payload( __OR121__ )
          root_0 = @adaptor.become_root( tree_for_OR121, root_0 )

          @state.following.push( TOKENS_FOLLOWING_condition_IN_condition_1122 )
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
    # 208:1: orOperand returns [result] : boolOperand ( AND op= orOperand )? ;
    # 
    def orOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = OrOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __AND123__ = nil
      op = nil
      boolOperand122 = nil

      tree_for_AND123 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 209:4: boolOperand ( AND op= orOperand )?
        @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_orOperand_1143 )
        boolOperand122 = boolOperand
        @state.following.pop
        @adaptor.add_child( root_0, boolOperand122.tree )
        # --> action
        return_value.result = ( boolOperand122.nil? ? nil : boolOperand122.result )
        # <-- action
        # at line 210:3: ( AND op= orOperand )?
        alt_33 = 2
        look_33_0 = @input.peek( 1 )

        if ( look_33_0 == AND )
          alt_33 = 1
        end
        case alt_33
        when 1
          # at line 210:4: AND op= orOperand
          __AND123__ = match( AND, TOKENS_FOLLOWING_AND_IN_orOperand_1150 )

          tree_for_AND123 = @adaptor.create_with_payload( __AND123__ )
          root_0 = @adaptor.become_root( tree_for_AND123, root_0 )

          @state.following.push( TOKENS_FOLLOWING_orOperand_IN_orOperand_1155 )
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
    # 213:1: boolOperand returns [result] : ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) );
    # 
    def boolOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = BoolOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NOT125__ = nil
      __LB126__ = nil
      __RB128__ = nil
      __EQ129__ = nil
      __NE130__ = nil
      __LT131__ = nil
      __GT132__ = nil
      __LE133__ = nil
      __GE134__ = nil
      op1 = nil
      op2 = nil
      bool124 = nil
      condition127 = nil

      tree_for_NOT125 = nil
      tree_for_LB126 = nil
      tree_for_RB128 = nil
      tree_for_EQ129 = nil
      tree_for_NE130 = nil
      tree_for_LT131 = nil
      tree_for_GT132 = nil
      tree_for_LE133 = nil
      tree_for_GE134 = nil

      begin
        # at line 214:2: ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) )
        alt_41 = 3
        case look_41 = @input.peek( 1 )
        when TRUE, FALSE then alt_41 = 1
        when NOT then alt_41 = 2
        when READ, LB, PLUS, MINUS, INT, ID, OPENFILE, READNUMBER, NULL, ALLOC, STRING, T__65 then alt_41 = 3
        else
          raise NoViableAlternative( "", 41, 0 )
        end
        case alt_41
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 214:4: bool
          @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1174 )
          bool124 = bool
          @state.following.pop
          @adaptor.add_child( root_0, bool124.tree )
          # --> action
          return_value.result = ( bool124.nil? ? nil : bool124.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 215:4: NOT LB condition RB
          __NOT125__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_boolOperand_1181 )

          tree_for_NOT125 = @adaptor.create_with_payload( __NOT125__ )
          @adaptor.add_child( root_0, tree_for_NOT125 )

          __LB126__ = match( LB, TOKENS_FOLLOWING_LB_IN_boolOperand_1183 )
          @state.following.push( TOKENS_FOLLOWING_condition_IN_boolOperand_1186 )
          condition127 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition127.tree )
          __RB128__ = match( RB, TOKENS_FOLLOWING_RB_IN_boolOperand_1188 )
          # --> action
          return_value.result = !( condition127.nil? ? nil : condition127.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 216:4: op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1198 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # at line 216:19: ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          alt_40 = 6
          case look_40 = @input.peek( 1 )
          when EQ then alt_40 = 1
          when NE then alt_40 = 2
          when LT then alt_40 = 3
          when GT then alt_40 = 4
          when LE then alt_40 = 5
          when GE then alt_40 = 6
          else
            raise NoViableAlternative( "", 40, 0 )
          end
          case alt_40
          when 1
            # at line 216:20: EQ (op2= bool | op2= expression )
            __EQ129__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_boolOperand_1201 )

            tree_for_EQ129 = @adaptor.create_with_payload( __EQ129__ )
            root_0 = @adaptor.become_root( tree_for_EQ129, root_0 )

            # at line 216:24: (op2= bool | op2= expression )
            alt_34 = 2
            look_34_0 = @input.peek( 1 )

            if ( look_34_0.between?( TRUE, FALSE ) )
              alt_34 = 1
            elsif ( look_34_0 == READ || look_34_0 == LB || look_34_0.between?( PLUS, INT ) || look_34_0 == ID || look_34_0.between?( OPENFILE, ALLOC ) || look_34_0 == STRING || look_34_0 == T__65 )
              alt_34 = 2
            else
              raise NoViableAlternative( "", 34, 0 )
            end
            case alt_34
            when 1
              # at line 216:26: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1208 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 216:37: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1214 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:eq)),op2.tree]
            # <-- action

          when 2
            # at line 217:6: NE (op2= bool | op2= expression )
            __NE130__ = match( NE, TOKENS_FOLLOWING_NE_IN_boolOperand_1225 )

            tree_for_NE130 = @adaptor.create_with_payload( __NE130__ )
            root_0 = @adaptor.become_root( tree_for_NE130, root_0 )

            # at line 217:10: (op2= bool | op2= expression )
            alt_35 = 2
            look_35_0 = @input.peek( 1 )

            if ( look_35_0.between?( TRUE, FALSE ) )
              alt_35 = 1
            elsif ( look_35_0 == READ || look_35_0 == LB || look_35_0.between?( PLUS, INT ) || look_35_0 == ID || look_35_0.between?( OPENFILE, ALLOC ) || look_35_0 == STRING || look_35_0 == T__65 )
              alt_35 = 2
            else
              raise NoViableAlternative( "", 35, 0 )
            end
            case alt_35
            when 1
              # at line 217:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1232 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 217:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1238 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:ne)),op2.tree]
            # <-- action

          when 3
            # at line 218:6: LT (op2= bool | op2= expression )
            __LT131__ = match( LT, TOKENS_FOLLOWING_LT_IN_boolOperand_1249 )

            tree_for_LT131 = @adaptor.create_with_payload( __LT131__ )
            root_0 = @adaptor.become_root( tree_for_LT131, root_0 )

            # at line 218:10: (op2= bool | op2= expression )
            alt_36 = 2
            look_36_0 = @input.peek( 1 )

            if ( look_36_0.between?( TRUE, FALSE ) )
              alt_36 = 1
            elsif ( look_36_0 == READ || look_36_0 == LB || look_36_0.between?( PLUS, INT ) || look_36_0 == ID || look_36_0.between?( OPENFILE, ALLOC ) || look_36_0 == STRING || look_36_0 == T__65 )
              alt_36 = 2
            else
              raise NoViableAlternative( "", 36, 0 )
            end
            case alt_36
            when 1
              # at line 218:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1256 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 218:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1262 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:lt)),op2.tree]
            # <-- action

          when 4
            # at line 219:6: GT (op2= bool | op2= expression )
            __GT132__ = match( GT, TOKENS_FOLLOWING_GT_IN_boolOperand_1273 )

            tree_for_GT132 = @adaptor.create_with_payload( __GT132__ )
            root_0 = @adaptor.become_root( tree_for_GT132, root_0 )

            # at line 219:10: (op2= bool | op2= expression )
            alt_37 = 2
            look_37_0 = @input.peek( 1 )

            if ( look_37_0.between?( TRUE, FALSE ) )
              alt_37 = 1
            elsif ( look_37_0 == READ || look_37_0 == LB || look_37_0.between?( PLUS, INT ) || look_37_0 == ID || look_37_0.between?( OPENFILE, ALLOC ) || look_37_0 == STRING || look_37_0 == T__65 )
              alt_37 = 2
            else
              raise NoViableAlternative( "", 37, 0 )
            end
            case alt_37
            when 1
              # at line 219:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1280 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 219:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1286 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:gt)),op2.tree]
            # <-- action

          when 5
            # at line 220:6: LE (op2= bool | op2= expression )
            __LE133__ = match( LE, TOKENS_FOLLOWING_LE_IN_boolOperand_1297 )

            tree_for_LE133 = @adaptor.create_with_payload( __LE133__ )
            root_0 = @adaptor.become_root( tree_for_LE133, root_0 )

            # at line 220:10: (op2= bool | op2= expression )
            alt_38 = 2
            look_38_0 = @input.peek( 1 )

            if ( look_38_0.between?( TRUE, FALSE ) )
              alt_38 = 1
            elsif ( look_38_0 == READ || look_38_0 == LB || look_38_0.between?( PLUS, INT ) || look_38_0 == ID || look_38_0.between?( OPENFILE, ALLOC ) || look_38_0 == STRING || look_38_0 == T__65 )
              alt_38 = 2
            else
              raise NoViableAlternative( "", 38, 0 )
            end
            case alt_38
            when 1
              # at line 220:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1304 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 220:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1310 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:le)),op2.tree]
            # <-- action

          when 6
            # at line 221:6: GE (op2= bool | op2= expression )
            __GE134__ = match( GE, TOKENS_FOLLOWING_GE_IN_boolOperand_1321 )

            tree_for_GE134 = @adaptor.create_with_payload( __GE134__ )
            root_0 = @adaptor.become_root( tree_for_GE134, root_0 )

            # at line 221:10: (op2= bool | op2= expression )
            alt_39 = 2
            look_39_0 = @input.peek( 1 )

            if ( look_39_0.between?( TRUE, FALSE ) )
              alt_39 = 1
            elsif ( look_39_0 == READ || look_39_0 == LB || look_39_0.between?( PLUS, INT ) || look_39_0 == ID || look_39_0.between?( OPENFILE, ALLOC ) || look_39_0 == STRING || look_39_0 == T__65 )
              alt_39 = 2
            else
              raise NoViableAlternative( "", 39, 0 )
            end
            case alt_39
            when 1
              # at line 221:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1328 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 221:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1334 )
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
    # 226:1: expression returns [result] : addOperand ( PLUS op= expression | MINUS op= expression )? ;
    # 
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS136__ = nil
      __MINUS137__ = nil
      op = nil
      addOperand135 = nil

      tree_for_PLUS136 = nil
      tree_for_MINUS137 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 227:4: addOperand ( PLUS op= expression | MINUS op= expression )?
        @state.following.push( TOKENS_FOLLOWING_addOperand_IN_expression_1359 )
        addOperand135 = addOperand
        @state.following.pop
        @adaptor.add_child( root_0, addOperand135.tree )
        # --> action
        return_value.result = ( addOperand135.nil? ? nil : addOperand135.result )
        # <-- action
        # at line 228:3: ( PLUS op= expression | MINUS op= expression )?
        alt_42 = 3
        look_42_0 = @input.peek( 1 )

        if ( look_42_0 == PLUS )
          alt_42 = 1
        elsif ( look_42_0 == MINUS )
          alt_42 = 2
        end
        case alt_42
        when 1
          # at line 229:4: PLUS op= expression
          __PLUS136__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expression_1370 )

          tree_for_PLUS136 = @adaptor.create_with_payload( __PLUS136__ )
          root_0 = @adaptor.become_root( tree_for_PLUS136, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1375 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:add)),op.tree]
          # <-- action

        when 2
          # at line 230:5: MINUS op= expression
          __MINUS137__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expression_1383 )

          tree_for_MINUS137 = @adaptor.create_with_payload( __MINUS137__ )
          root_0 = @adaptor.become_root( tree_for_MINUS137, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1388 )
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
    # 234:1: addOperand returns [result] : mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )? ;
    # 
    def addOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = AddOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __MUL139__ = nil
      __DIV140__ = nil
      __MOD141__ = nil
      op = nil
      mulOperand138 = nil

      tree_for_MUL139 = nil
      tree_for_DIV140 = nil
      tree_for_MOD141 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 235:4: mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperand_1410 )
        mulOperand138 = mulOperand
        @state.following.pop
        @adaptor.add_child( root_0, mulOperand138.tree )
        # --> action
        return_value.result = ( mulOperand138.nil? ? nil : mulOperand138.result )
        # <-- action
        # at line 236:3: ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        alt_43 = 4
        case look_43 = @input.peek( 1 )
        when MUL then alt_43 = 1
        when DIV then alt_43 = 2
        when MOD then alt_43 = 3
        end
        case alt_43
        when 1
          # at line 237:4: MUL op= addOperand
          __MUL139__ = match( MUL, TOKENS_FOLLOWING_MUL_IN_addOperand_1421 )

          tree_for_MUL139 = @adaptor.create_with_payload( __MUL139__ )
          root_0 = @adaptor.become_root( tree_for_MUL139, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1426 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:mul)),op.tree]
          # <-- action

        when 2
          # at line 238:5: DIV op= addOperand
          __DIV140__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_addOperand_1434 )

          tree_for_DIV140 = @adaptor.create_with_payload( __DIV140__ )
          root_0 = @adaptor.become_root( tree_for_DIV140, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1439 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:div)),op.tree]
          # <-- action

        when 3
          # at line 239:5: MOD op= addOperand
          __MOD141__ = match( MOD, TOKENS_FOLLOWING_MOD_IN_addOperand_1447 )

          tree_for_MOD141 = @adaptor.create_with_payload( __MOD141__ )
          root_0 = @adaptor.become_root( tree_for_MOD141, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1452 )
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
    # 243:1: mulOperand returns [result] : ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest );
    # 
    def mulOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = MulOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS142__ = nil
      __MINUS144__ = nil
      mulOperandRest143 = nil
      mulOperandRest145 = nil
      mulOperandRest146 = nil

      tree_for_PLUS142 = nil
      tree_for_MINUS144 = nil

      begin
        # at line 244:2: ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest )
        alt_44 = 3
        case look_44 = @input.peek( 1 )
        when PLUS then alt_44 = 1
        when MINUS then alt_44 = 2
        when READ, LB, INT, ID, OPENFILE, READNUMBER, NULL, ALLOC, STRING, T__65 then alt_44 = 3
        else
          raise NoViableAlternative( "", 44, 0 )
        end
        case alt_44
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 244:4: PLUS mulOperandRest
          __PLUS142__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_mulOperand_1474 )

          tree_for_PLUS142 = @adaptor.create_with_payload( __PLUS142__ )
          @adaptor.add_child( root_0, tree_for_PLUS142 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1476 )
          mulOperandRest143 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest143.tree )
          # --> action
          return_value.result = ( mulOperandRest143.nil? ? nil : mulOperandRest143.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 245:4: MINUS mulOperandRest
          __MINUS144__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_mulOperand_1483 )

          tree_for_MINUS144 = @adaptor.create_with_payload( __MINUS144__ )
          @adaptor.add_child( root_0, tree_for_MINUS144 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1485 )
          mulOperandRest145 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest145.tree )
          # --> action
          return_value.result = [UnaryOperatorTree.new(( mulOperandRest145.nil? ? nil : mulOperandRest145.result ),Operators.method(:neg)),mulOperandRest145.tree]
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 246:4: mulOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1492 )
          mulOperandRest146 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest146.tree )
          # --> action
          return_value.result = ( mulOperandRest146.nil? ? nil : mulOperandRest146.result )
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
    # 249:1: mulOperandRest returns [result] : arrayIndexTarget ( '[' expression ']' )* ;
    # 
    def mulOperandRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = MulOperandRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal148 = nil
      char_literal150 = nil
      arrayIndexTarget147 = nil
      expression149 = nil

      tree_for_char_literal148 = nil
      tree_for_char_literal150 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 250:4: arrayIndexTarget ( '[' expression ']' )*
        @state.following.push( TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1509 )
        arrayIndexTarget147 = arrayIndexTarget
        @state.following.pop
        @adaptor.add_child( root_0, arrayIndexTarget147.tree )
        # --> action
        return_value.result = ( arrayIndexTarget147.nil? ? nil : arrayIndexTarget147.result )
        # <-- action
        # at line 251:3: ( '[' expression ']' )*
        while true # decision 45
          alt_45 = 2
          look_45_0 = @input.peek( 1 )

          if ( look_45_0 == T__65 )
            alt_45 = 1

          end
          case alt_45
          when 1
            # at line 251:4: '[' expression ']'
            char_literal148 = match( T__65, TOKENS_FOLLOWING_T__65_IN_mulOperandRest_1517 )

            tree_for_char_literal148 = @adaptor.create_with_payload( char_literal148 )
            @adaptor.add_child( root_0, tree_for_char_literal148 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_mulOperandRest_1519 )
            expression149 = expression
            @state.following.pop
            @adaptor.add_child( root_0, expression149.tree )
            char_literal150 = match( T__66, TOKENS_FOLLOWING_T__66_IN_mulOperandRest_1521 )

            tree_for_char_literal150 = @adaptor.create_with_payload( char_literal150 )
            @adaptor.add_child( root_0, tree_for_char_literal150 )

            # --> action
             return_value.result = [IndexTree.new(return_value.result,( expression149.nil? ? nil : expression149.result )),expression149.tree] 
            # <-- action

          else
            break # out of loop for decision 45
          end
        end # loop for decision 45
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

    CloseFileReturnValue = define_return_scope :result

    # 
    # parser rule closeFile
    # 
    # (in Giraffe.g)
    # 254:1: closeFile returns [result] : CLOSEFILE LB expression RB ;
    # 
    def closeFile
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = CloseFileReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __CLOSEFILE151__ = nil
      __LB152__ = nil
      __RB154__ = nil
      expression153 = nil

      tree_for_CLOSEFILE151 = nil
      tree_for_LB152 = nil
      tree_for_RB154 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 255:4: CLOSEFILE LB expression RB
        __CLOSEFILE151__ = match( CLOSEFILE, TOKENS_FOLLOWING_CLOSEFILE_IN_closeFile_1542 )

        tree_for_CLOSEFILE151 = @adaptor.create_with_payload( __CLOSEFILE151__ )
        @adaptor.add_child( root_0, tree_for_CLOSEFILE151 )

        __LB152__ = match( LB, TOKENS_FOLLOWING_LB_IN_closeFile_1544 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_closeFile_1547 )
        expression153 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression153.tree )
        __RB154__ = match( RB, TOKENS_FOLLOWING_RB_IN_closeFile_1549 )
        # --> action
        return_value.result = [CloseFileTree.new(( expression153.nil? ? nil : expression153.result )),tree_for_CLOSEFILE151]
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
        # trace_out( __method__, 34 )

      end
      
      return return_value
    end

    OpenFileReturnValue = define_return_scope :result

    # 
    # parser rule openFile
    # 
    # (in Giraffe.g)
    # 258:1: openFile returns [result] : OPENFILE LB expression RB ;
    # 
    def openFile
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = OpenFileReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENFILE155__ = nil
      __LB156__ = nil
      __RB158__ = nil
      expression157 = nil

      tree_for_OPENFILE155 = nil
      tree_for_LB156 = nil
      tree_for_RB158 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 259:4: OPENFILE LB expression RB
        __OPENFILE155__ = match( OPENFILE, TOKENS_FOLLOWING_OPENFILE_IN_openFile_1570 )

        tree_for_OPENFILE155 = @adaptor.create_with_payload( __OPENFILE155__ )
        @adaptor.add_child( root_0, tree_for_OPENFILE155 )

        __LB156__ = match( LB, TOKENS_FOLLOWING_LB_IN_openFile_1572 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_openFile_1575 )
        expression157 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression157.tree )
        __RB158__ = match( RB, TOKENS_FOLLOWING_RB_IN_openFile_1577 )
        # --> action
        return_value.result = [OpenFileTree.new(( expression157.nil? ? nil : expression157.result )),tree_for_OPENFILE155]
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

    ReadNumberReturnValue = define_return_scope :result

    # 
    # parser rule readNumber
    # 
    # (in Giraffe.g)
    # 262:1: readNumber returns [result] : READNUMBER LB expression RB ;
    # 
    def readNumber
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = ReadNumberReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __READNUMBER159__ = nil
      __LB160__ = nil
      __RB162__ = nil
      expression161 = nil

      tree_for_READNUMBER159 = nil
      tree_for_LB160 = nil
      tree_for_RB162 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 263:4: READNUMBER LB expression RB
        __READNUMBER159__ = match( READNUMBER, TOKENS_FOLLOWING_READNUMBER_IN_readNumber_1597 )

        tree_for_READNUMBER159 = @adaptor.create_with_payload( __READNUMBER159__ )
        @adaptor.add_child( root_0, tree_for_READNUMBER159 )

        __LB160__ = match( LB, TOKENS_FOLLOWING_LB_IN_readNumber_1599 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_readNumber_1602 )
        expression161 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression161.tree )
        __RB162__ = match( RB, TOKENS_FOLLOWING_RB_IN_readNumber_1604 )
        # --> action
        return_value.result = [ReadNumberTree.new(( expression161.nil? ? nil : expression161.result )),tree_for_READNUMBER159]
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

    ArrayIndexTargetReturnValue = define_return_scope :result

    # 
    # parser rule arrayIndexTarget
    # 
    # (in Giraffe.g)
    # 266:1: arrayIndexTarget returns [result] : ( ID | LB expression RB | INT | call | array | alloc | readInstruction | string | NULL | openFile | readNumber );
    # 
    def arrayIndexTarget
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = ArrayIndexTargetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID163__ = nil
      __LB164__ = nil
      __RB166__ = nil
      __INT167__ = nil
      __NULL173__ = nil
      expression165 = nil
      call168 = nil
      array169 = nil
      alloc170 = nil
      readInstruction171 = nil
      string172 = nil
      openFile174 = nil
      readNumber175 = nil

      tree_for_ID163 = nil
      tree_for_LB164 = nil
      tree_for_RB166 = nil
      tree_for_INT167 = nil
      tree_for_NULL173 = nil

      begin
        # at line 267:2: ( ID | LB expression RB | INT | call | array | alloc | readInstruction | string | NULL | openFile | readNumber )
        alt_46 = 11
        alt_46 = @dfa46.predict( @input )
        case alt_46
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 267:4: ID
          __ID163__ = match( ID, TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1628 )

          tree_for_ID163 = @adaptor.create_with_payload( __ID163__ )
          @adaptor.add_child( root_0, tree_for_ID163 )

          # --> action
          return_value.result = [VarTree.new(__ID163__.text),tree_for_ID163]
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 268:4: LB expression RB
          __LB164__ = match( LB, TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1635 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1638 )
          expression165 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression165.tree )
          __RB166__ = match( RB, TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1640 )
          # --> action
          return_value.result = ( expression165.nil? ? nil : expression165.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 269:4: INT
          __INT167__ = match( INT, TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1648 )

          tree_for_INT167 = @adaptor.create_with_payload( __INT167__ )
          @adaptor.add_child( root_0, tree_for_INT167 )

          # --> action
          return_value.result = [AtomTree.new(__INT167__.text.to_i),tree_for_INT167]
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 270:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1655 )
          call168 = call
          @state.following.pop
          @adaptor.add_child( root_0, call168.tree )
          # --> action
          return_value.result = ( call168.nil? ? nil : call168.result )
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 271:4: array
          @state.following.push( TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1662 )
          array169 = array
          @state.following.pop
          @adaptor.add_child( root_0, array169.tree )
          # --> action
          return_value.result = [ArrayTree.new(( array169.nil? ? nil : array169.result )),array169.tree]
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 272:4: alloc
          @state.following.push( TOKENS_FOLLOWING_alloc_IN_arrayIndexTarget_1669 )
          alloc170 = alloc
          @state.following.pop
          @adaptor.add_child( root_0, alloc170.tree )
          # --> action
          return_value.result = ( alloc170.nil? ? nil : alloc170.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 273:4: readInstruction
          @state.following.push( TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1676 )
          readInstruction171 = readInstruction
          @state.following.pop
          @adaptor.add_child( root_0, readInstruction171.tree )
          # --> action
          return_value.result = ( readInstruction171.nil? ? nil : readInstruction171.result )
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 274:4: string
          @state.following.push( TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1683 )
          string172 = string
          @state.following.pop
          @adaptor.add_child( root_0, string172.tree )
          # --> action
          return_value.result = [StringTree.new(( string172.nil? ? nil : string172.result )),string172.tree]
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 275:4: NULL
          __NULL173__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_arrayIndexTarget_1690 )

          tree_for_NULL173 = @adaptor.create_with_payload( __NULL173__ )
          @adaptor.add_child( root_0, tree_for_NULL173 )

          # --> action
          return_value.result = [NilTree.new,tree_for_NULL173]
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 276:4: openFile
          @state.following.push( TOKENS_FOLLOWING_openFile_IN_arrayIndexTarget_1697 )
          openFile174 = openFile
          @state.following.pop
          @adaptor.add_child( root_0, openFile174.tree )
          # --> action
          return_value.result = ( openFile174.nil? ? nil : openFile174.result )
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 277:4: readNumber
          @state.following.push( TOKENS_FOLLOWING_readNumber_IN_arrayIndexTarget_1704 )
          readNumber175 = readNumber
          @state.following.pop
          @adaptor.add_child( root_0, readNumber175.tree )
          # --> action
          return_value.result = ( readNumber175.nil? ? nil : readNumber175.result )
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
        # trace_out( __method__, 37 )

      end
      
      return return_value
    end

    ArrayReturnValue = define_return_scope :result

    # 
    # parser rule array
    # 
    # (in Giraffe.g)
    # 280:1: array returns [result] : '[' ( ( '\\n' )? ex1= expression ( COMMA ( '\\n' )? ex2= expression )* )? ( '\\n' )? ']' ;
    # 
    def array
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = ArrayReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal176 = nil
      char_literal177 = nil
      __COMMA178__ = nil
      char_literal179 = nil
      char_literal180 = nil
      char_literal181 = nil
      ex1 = nil
      ex2 = nil

      tree_for_char_literal176 = nil
      tree_for_char_literal177 = nil
      tree_for_COMMA178 = nil
      tree_for_char_literal179 = nil
      tree_for_char_literal180 = nil
      tree_for_char_literal181 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 281:4: '[' ( ( '\\n' )? ex1= expression ( COMMA ( '\\n' )? ex2= expression )* )? ( '\\n' )? ']'
        char_literal176 = match( T__65, TOKENS_FOLLOWING_T__65_IN_array_1721 )

        tree_for_char_literal176 = @adaptor.create_with_payload( char_literal176 )
        @adaptor.add_child( root_0, tree_for_char_literal176 )

        # --> action
        return_value.result = []
        # <-- action
        # at line 282:3: ( ( '\\n' )? ex1= expression ( COMMA ( '\\n' )? ex2= expression )* )?
        alt_50 = 2
        look_50_0 = @input.peek( 1 )

        if ( look_50_0 == T__64 )
          look_50_1 = @input.peek( 2 )

          if ( look_50_1 == READ || look_50_1 == LB || look_50_1.between?( PLUS, INT ) || look_50_1 == ID || look_50_1.between?( OPENFILE, ALLOC ) || look_50_1 == STRING || look_50_1 == T__65 )
            alt_50 = 1
          end
        elsif ( look_50_0 == READ || look_50_0 == LB || look_50_0.between?( PLUS, INT ) || look_50_0 == ID || look_50_0.between?( OPENFILE, ALLOC ) || look_50_0 == STRING || look_50_0 == T__65 )
          alt_50 = 1
        end
        case alt_50
        when 1
          # at line 282:4: ( '\\n' )? ex1= expression ( COMMA ( '\\n' )? ex2= expression )*
          # at line 282:4: ( '\\n' )?
          alt_47 = 2
          look_47_0 = @input.peek( 1 )

          if ( look_47_0 == T__64 )
            alt_47 = 1
          end
          case alt_47
          when 1
            # at line 282:4: '\\n'
            char_literal177 = match( T__64, TOKENS_FOLLOWING_T__64_IN_array_1728 )

            tree_for_char_literal177 = @adaptor.create_with_payload( char_literal177 )
            @adaptor.add_child( root_0, tree_for_char_literal177 )


          end
          @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1733 )
          ex1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, ex1.tree )
          # --> action
          return_value.result << ( ex1.nil? ? nil : ex1.result )
          # <-- action
          # at line 283:3: ( COMMA ( '\\n' )? ex2= expression )*
          while true # decision 49
            alt_49 = 2
            look_49_0 = @input.peek( 1 )

            if ( look_49_0 == COMMA )
              alt_49 = 1

            end
            case alt_49
            when 1
              # at line 283:4: COMMA ( '\\n' )? ex2= expression
              __COMMA178__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_array_1740 )

              tree_for_COMMA178 = @adaptor.create_with_payload( __COMMA178__ )
              @adaptor.add_child( root_0, tree_for_COMMA178 )

              # at line 283:10: ( '\\n' )?
              alt_48 = 2
              look_48_0 = @input.peek( 1 )

              if ( look_48_0 == T__64 )
                alt_48 = 1
              end
              case alt_48
              when 1
                # at line 283:10: '\\n'
                char_literal179 = match( T__64, TOKENS_FOLLOWING_T__64_IN_array_1742 )

                tree_for_char_literal179 = @adaptor.create_with_payload( char_literal179 )
                @adaptor.add_child( root_0, tree_for_char_literal179 )


              end
              @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1747 )
              ex2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, ex2.tree )
              # --> action
              return_value.result << ( ex2.nil? ? nil : ex2.result )
              # <-- action

            else
              break # out of loop for decision 49
            end
          end # loop for decision 49

        end
        # at line 284:3: ( '\\n' )?
        alt_51 = 2
        look_51_0 = @input.peek( 1 )

        if ( look_51_0 == T__64 )
          alt_51 = 1
        end
        case alt_51
        when 1
          # at line 284:3: '\\n'
          char_literal180 = match( T__64, TOKENS_FOLLOWING_T__64_IN_array_1758 )

          tree_for_char_literal180 = @adaptor.create_with_payload( char_literal180 )
          @adaptor.add_child( root_0, tree_for_char_literal180 )


        end
        char_literal181 = match( T__66, TOKENS_FOLLOWING_T__66_IN_array_1761 )

        tree_for_char_literal181 = @adaptor.create_with_payload( char_literal181 )
        @adaptor.add_child( root_0, tree_for_char_literal181 )

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

    AllocReturnValue = define_return_scope :result

    # 
    # parser rule alloc
    # 
    # (in Giraffe.g)
    # 287:1: alloc returns [result] : ALLOC LB expression RB ;
    # 
    def alloc
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = AllocReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ALLOC182__ = nil
      __LB183__ = nil
      __RB185__ = nil
      expression184 = nil

      tree_for_ALLOC182 = nil
      tree_for_LB183 = nil
      tree_for_RB185 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 288:4: ALLOC LB expression RB
        __ALLOC182__ = match( ALLOC, TOKENS_FOLLOWING_ALLOC_IN_alloc_1777 )

        tree_for_ALLOC182 = @adaptor.create_with_payload( __ALLOC182__ )
        @adaptor.add_child( root_0, tree_for_ALLOC182 )

        __LB183__ = match( LB, TOKENS_FOLLOWING_LB_IN_alloc_1779 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_alloc_1782 )
        expression184 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression184.tree )
        __RB185__ = match( RB, TOKENS_FOLLOWING_RB_IN_alloc_1784 )
        # --> action
        return_value.result = [AllocTree.new(( expression184.nil? ? nil : expression184.result )),tree_for_ALLOC182]
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

    IndexedReturnValue = define_return_scope :result

    # 
    # parser rule indexed
    # 
    # (in Giraffe.g)
    # 293:1: indexed returns [result] : identified ( '[' expression ']' )* ;
    # 
    def indexed
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = IndexedReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal187 = nil
      char_literal189 = nil
      identified186 = nil
      expression188 = nil

      tree_for_char_literal187 = nil
      tree_for_char_literal189 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 294:4: identified ( '[' expression ']' )*
        @state.following.push( TOKENS_FOLLOWING_identified_IN_indexed_1807 )
        identified186 = identified
        @state.following.pop
        @adaptor.add_child( root_0, identified186.tree )
        # --> action
        return_value.result = ( identified186.nil? ? nil : identified186.result )
        # <-- action
        # at line 296:3: ( '[' expression ']' )*
        while true # decision 52
          alt_52 = 2
          look_52_0 = @input.peek( 1 )

          if ( look_52_0 == T__65 )
            alt_52 = 1

          end
          case alt_52
          when 1
            # at line 296:4: '[' expression ']'
            char_literal187 = match( T__65, TOKENS_FOLLOWING_T__65_IN_indexed_1817 )

            tree_for_char_literal187 = @adaptor.create_with_payload( char_literal187 )
            @adaptor.add_child( root_0, tree_for_char_literal187 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_indexed_1819 )
            expression188 = expression
            @state.following.pop
            @adaptor.add_child( root_0, expression188.tree )
            char_literal189 = match( T__66, TOKENS_FOLLOWING_T__66_IN_indexed_1821 )

            tree_for_char_literal189 = @adaptor.create_with_payload( char_literal189 )
            @adaptor.add_child( root_0, tree_for_char_literal189 )

            # --> action
            return_value.result = [IndexTree.new(return_value.result, ( expression188.nil? ? nil : expression188.result )),identified186.tree]
            # <-- action

          else
            break # out of loop for decision 52
          end
        end # loop for decision 52
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

    IdentifiedReturnValue = define_return_scope :result

    # 
    # parser rule identified
    # 
    # (in Giraffe.g)
    # 301:1: identified returns [result] : ID ;
    # 
    def identified
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = IdentifiedReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID190__ = nil

      tree_for_ID190 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 302:4: ID
        __ID190__ = match( ID, TOKENS_FOLLOWING_ID_IN_identified_1842 )

        tree_for_ID190 = @adaptor.create_with_payload( __ID190__ )
        @adaptor.add_child( root_0, tree_for_ID190 )

        # --> action
        return_value.result = [VarTree.new(__ID190__.text),tree_for_ID190]
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
        # trace_out( __method__, 41 )

      end
      
      return return_value
    end

    AssignmentReturnValue = define_return_scope :result

    # 
    # parser rule assignment
    # 
    # (in Giraffe.g)
    # 305:1: assignment returns [result] : indexed ASSIGN expression ;
    # 
    def assignment
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = AssignmentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ASSIGN192__ = nil
      indexed191 = nil
      expression193 = nil

      tree_for_ASSIGN192 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 306:4: indexed ASSIGN expression
        @state.following.push( TOKENS_FOLLOWING_indexed_IN_assignment_1859 )
        indexed191 = indexed
        @state.following.pop
        @adaptor.add_child( root_0, indexed191.tree )
        __ASSIGN192__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1861 )

        tree_for_ASSIGN192 = @adaptor.create_with_payload( __ASSIGN192__ )
        root_0 = @adaptor.become_root( tree_for_ASSIGN192, root_0 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1864 )
        expression193 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression193.tree )
        # --> action
         return_value.result = [AssignTree.new(( indexed191.nil? ? nil : indexed191.result ),( expression193.nil? ? nil : expression193.result )),indexed191.tree] 
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
        # trace_out( __method__, 42 )

      end
      
      return return_value
    end

    BoolReturnValue = define_return_scope :result

    # 
    # parser rule bool
    # 
    # (in Giraffe.g)
    # 309:1: fragment bool returns [result] : ( TRUE | FALSE );
    # 
    def bool
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = BoolReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __TRUE194__ = nil
      __FALSE195__ = nil

      tree_for_TRUE194 = nil
      tree_for_FALSE195 = nil

      begin
        # at line 311:2: ( TRUE | FALSE )
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


          # at line 311:4: TRUE
          __TRUE194__ = match( TRUE, TOKENS_FOLLOWING_TRUE_IN_bool_1885 )

          tree_for_TRUE194 = @adaptor.create_with_payload( __TRUE194__ )
          @adaptor.add_child( root_0, tree_for_TRUE194 )

          # --> action
          return_value.result = new AtomTree(1)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 312:5: FALSE
          __FALSE195__ = match( FALSE, TOKENS_FOLLOWING_FALSE_IN_bool_1893 )

          tree_for_FALSE195 = @adaptor.create_with_payload( __FALSE195__ )
          @adaptor.add_child( root_0, tree_for_FALSE195 )

          # --> action
          return_value.result = new AtomTree(0)
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
        # trace_out( __method__, 43 )

      end
      
      return return_value
    end

    fragment :bool rescue nil

    StringReturnValue = define_return_scope :result

    # 
    # parser rule string
    # 
    # (in Giraffe.g)
    # 315:1: string returns [result] : STRING ;
    # 
    def string
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = StringReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __STRING196__ = nil

      tree_for_STRING196 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 316:4: STRING
        __STRING196__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_string_1914 )

        tree_for_STRING196 = @adaptor.create_with_payload( __STRING196__ )
        @adaptor.add_child( root_0, tree_for_STRING196 )

        # --> action
        return_value.result = __STRING196__.text[1..-2]
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
        # trace_out( __method__, 44 )

      end
      
      return return_value
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA10 < ANTLR3::DFA
      EOT = unpack( 14, -1 )
      EOF = unpack( 14, -1 )
      MIN = unpack( 1, 4, 1, 10, 12, -1 )
      MAX = unpack( 1, 64, 1, 65, 12, -1 )
      ACCEPT = unpack( 2, -1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 
                       1, 9, 1, 11, 1, 12, 1, 10, 1, 1 )
      SPECIAL = unpack( 14, -1 )
      TRANSITION = [
        unpack( 2, 11, 1, -1, 1, 9, 1, 7, 1, 8, 5, -1, 1, 6, 1, -1, 1, 3, 
                1, -1, 1, 11, 3, -1, 1, 4, 1, 5, 1, 2, 1, 1, 14, -1, 1, 
                10, 21, -1, 2, 11 ),
        unpack( 1, 12, 35, -1, 1, 13, 18, -1, 1, 13 ),
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
          84:1: instruction returns [result] : ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | returnInstruction | exitInstruction | breakInstruction | aloneCall | closeFile | );
        __dfa_description__
      end
    end
    class DFA46 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 6, 1, 4, 11, -1 )
      MAX = unpack( 1, 65, 1, 66, 11, -1 )
      ACCEPT = unpack( 2, -1, 1, 2, 1, 3, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 
                       1, 10, 1, 11, 1, 4, 1, 1 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 6, 3, -1, 1, 2, 3, -1, 1, 3, 11, -1, 1, 1, 15, -1, 1, 
                9, 1, 10, 1, 8, 1, 5, 3, -1, 1, 7, 15, -1, 1, 4 ),
        unpack( 2, 12, 4, -1, 1, 11, 3, 12, 2, -1, 1, 12, 1, -1, 2, 12, 
                 9, -1, 2, 12, 1, -1, 9, 12, 22, -1, 4, 12 ),
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
      
      @decision = 46
      

      def description
        <<-'__dfa_description__'.strip!
          266:1: arrayIndexTarget returns [result] : ( ID | LB expression RB | INT | call | array | alloc | readInstruction | string | NULL | openFile | readNumber );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa10 = DFA10.new( self, 10 )
      @dfa46 = DFA46.new( self, 46 )

    end
    TOKENS_FOLLOWING_functions_IN_program_52 = Set[ 1 ]
    TOKENS_FOLLOWING_func_IN_funcdef_70 = Set[ 1 ]
    TOKENS_FOLLOWING_funcdef_IN_functions_98 = Set[ 4, 5, 63, 64 ]
    TOKENS_FOLLOWING_functionsRest_IN_functions_106 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_functionsRest_132 = Set[ 63, 64 ]
    TOKENS_FOLLOWING_T__63_IN_functionsRest_136 = Set[ 64 ]
    TOKENS_FOLLOWING_T__64_IN_functionsRest_140 = Set[ 4, 5, 26, 27, 63, 64 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_functionsRest_146 = Set[ 4, 5, 26, 27, 63, 64 ]
    TOKENS_FOLLOWING_functions_IN_functionsRest_153 = Set[ 1 ]
    TOKENS_FOLLOWING_instruction_IN_block_187 = Set[ 4, 5, 63, 64 ]
    TOKENS_FOLLOWING_instructionRest_IN_block_197 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_instructionRest_223 = Set[ 63, 64 ]
    TOKENS_FOLLOWING_T__63_IN_instructionRest_227 = Set[ 64 ]
    TOKENS_FOLLOWING_T__64_IN_instructionRest_231 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 63, 64 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_237 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 63, 64 ]
    TOKENS_FOLLOWING_block_IN_instructionRest_244 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_IN_instruction_273 = Set[ 1 ]
    TOKENS_FOLLOWING_forCycle_IN_instruction_280 = Set[ 1 ]
    TOKENS_FOLLOWING_ifInstruction_IN_instruction_287 = Set[ 1 ]
    TOKENS_FOLLOWING_whileCycle_IN_instruction_294 = Set[ 1 ]
    TOKENS_FOLLOWING_doCycle_IN_instruction_301 = Set[ 1 ]
    TOKENS_FOLLOWING_printInstruction_IN_instruction_308 = Set[ 1 ]
    TOKENS_FOLLOWING_returnInstruction_IN_instruction_315 = Set[ 1 ]
    TOKENS_FOLLOWING_exitInstruction_IN_instruction_323 = Set[ 1 ]
    TOKENS_FOLLOWING_breakInstruction_IN_instruction_330 = Set[ 1 ]
    TOKENS_FOLLOWING_aloneCall_IN_instruction_337 = Set[ 1 ]
    TOKENS_FOLLOWING_closeFile_IN_instruction_344 = Set[ 1 ]
    TOKENS_FOLLOWING_READ_IN_readInstruction_367 = Set[ 1 ]
    TOKENS_FOLLOWING_BREAK_IN_breakInstruction_384 = Set[ 1 ]
    TOKENS_FOLLOWING_RETURN_IN_returnInstruction_401 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_expression_IN_returnInstruction_404 = Set[ 1 ]
    TOKENS_FOLLOWING_EXIT_IN_exitInstruction_421 = Set[ 1, 10, 12, 13, 14 ]
    TOKENS_FOLLOWING_LB_IN_exitInstruction_426 = Set[ 12, 13, 14 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_431 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_exitInstruction_433 = Set[ 1 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_446 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_statusCode_471 = Set[ 14 ]
    TOKENS_FOLLOWING_MINUS_IN_statusCode_475 = Set[ 14 ]
    TOKENS_FOLLOWING_INT_IN_statusCode_481 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINT_IN_printInstruction_502 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_printInstruction_505 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_printText_IN_printInstruction_508 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_printInstruction_510 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_printText_535 = Set[ 1, 16 ]
    TOKENS_FOLLOWING_COMMA_IN_printText_542 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_printText_IN_printText_546 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_ifInstruction_570 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_ifInstruction_573 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 45, 47, 48, 49, 65 ]
    TOKENS_FOLLOWING_condition_IN_ifInstruction_576 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_ifInstruction_578 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_ifInstruction_581 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 63, 64 ]
    TOKENS_FOLLOWING_block_IN_ifInstruction_584 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_ifInstruction_586 = Set[ 20, 21, 22 ]
    TOKENS_FOLLOWING_ifRest_IN_ifInstruction_589 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_ifRest_608 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_610 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 63, 64 ]
    TOKENS_FOLLOWING_block_IN_ifRest_613 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_615 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_ifRest_623 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 45, 47, 48, 49, 65 ]
    TOKENS_FOLLOWING_condition_IN_ifRest_631 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_633 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 63, 64 ]
    TOKENS_FOLLOWING_block_IN_ifRest_636 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_638 = Set[ 20, 21, 22 ]
    TOKENS_FOLLOWING_ifRest_IN_ifRest_643 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_whileCycle_670 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_whileCycle_672 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 45, 47, 48, 49, 65 ]
    TOKENS_FOLLOWING_condition_IN_whileCycle_674 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_whileCycle_676 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_whileCycle_678 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 63, 64 ]
    TOKENS_FOLLOWING_block_IN_whileCycle_681 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_whileCycle_683 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_doCycle_705 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_doCycle_707 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 63, 64 ]
    TOKENS_FOLLOWING_block_IN_doCycle_710 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_doCycle_712 = Set[ 23 ]
    TOKENS_FOLLOWING_WHILE_IN_doCycle_715 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_doCycle_717 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 45, 47, 48, 49, 65 ]
    TOKENS_FOLLOWING_condition_IN_doCycle_719 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_doCycle_721 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_forCycle_742 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_forCycle_744 = Set[ 26 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_748 = Set[ 4, 5, 63, 64 ]
    TOKENS_FOLLOWING_COMMENT_IN_forCycle_753 = Set[ 63, 64 ]
    TOKENS_FOLLOWING_T__63_IN_forCycle_757 = Set[ 64 ]
    TOKENS_FOLLOWING_T__64_IN_forCycle_761 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 45, 47, 48, 49, 65 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_767 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 45, 47, 48, 49, 65 ]
    TOKENS_FOLLOWING_condition_IN_forCycle_772 = Set[ 4, 5, 63, 64 ]
    TOKENS_FOLLOWING_COMMENT_IN_forCycle_777 = Set[ 63, 64 ]
    TOKENS_FOLLOWING_T__63_IN_forCycle_781 = Set[ 64 ]
    TOKENS_FOLLOWING_T__64_IN_forCycle_785 = Set[ 26 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_791 = Set[ 26 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_798 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_forCycle_800 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_forCycle_802 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 63, 64 ]
    TOKENS_FOLLOWING_block_IN_forCycle_805 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_forCycle_807 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_func_829 = Set[ 10, 18 ]
    TOKENS_FOLLOWING_LB_IN_func_832 = Set[ 11, 26 ]
    TOKENS_FOLLOWING_params_IN_func_835 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_func_837 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_func_842 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 63, 64 ]
    TOKENS_FOLLOWING_block_IN_func_845 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_func_847 = Set[ 1 ]
    TOKENS_FOLLOWING_MAIN_IN_func_857 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_func_860 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 63, 64 ]
    TOKENS_FOLLOWING_block_IN_func_863 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_func_865 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_params_885 = Set[ 16 ]
    TOKENS_FOLLOWING_paramRest_IN_params_887 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_paramRest_912 = Set[ 26 ]
    TOKENS_FOLLOWING_params_IN_paramRest_915 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_aloneCall_943 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_aloneCall_946 = Set[ 6, 10, 11, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_args_IN_aloneCall_951 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_aloneCall_954 = Set[ 1, 28 ]
    TOKENS_FOLLOWING_DOT_IN_aloneCall_965 = Set[ 26 ]
    TOKENS_FOLLOWING_ID_IN_aloneCall_969 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_aloneCall_971 = Set[ 6, 10, 11, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_args_IN_aloneCall_976 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_aloneCall_979 = Set[ 1, 28 ]
    TOKENS_FOLLOWING_ID_IN_call_1002 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_call_1005 = Set[ 6, 10, 11, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_args_IN_call_1010 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_call_1013 = Set[ 1, 28 ]
    TOKENS_FOLLOWING_DOT_IN_call_1024 = Set[ 26 ]
    TOKENS_FOLLOWING_ID_IN_call_1028 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_call_1030 = Set[ 6, 10, 11, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_args_IN_call_1035 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_call_1038 = Set[ 1, 28 ]
    TOKENS_FOLLOWING_expression_IN_args_1060 = Set[ 16 ]
    TOKENS_FOLLOWING_argsRest_IN_args_1062 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsRest_1081 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_args_IN_argsRest_1084 = Set[ 1 ]
    TOKENS_FOLLOWING_orOperand_IN_condition_1110 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_OR_IN_condition_1117 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 45, 47, 48, 49, 65 ]
    TOKENS_FOLLOWING_condition_IN_condition_1122 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperand_IN_orOperand_1143 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_AND_IN_orOperand_1150 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 45, 47, 48, 49, 65 ]
    TOKENS_FOLLOWING_orOperand_IN_orOperand_1155 = Set[ 1 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1174 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_boolOperand_1181 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_boolOperand_1183 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 45, 47, 48, 49, 65 ]
    TOKENS_FOLLOWING_condition_IN_boolOperand_1186 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_boolOperand_1188 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1198 = Set[ 32, 33, 34, 35, 36, 37 ]
    TOKENS_FOLLOWING_EQ_IN_boolOperand_1201 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 47, 48, 49, 65 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1208 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1214 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_boolOperand_1225 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 47, 48, 49, 65 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1232 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1238 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_boolOperand_1249 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 47, 48, 49, 65 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1256 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1262 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_boolOperand_1273 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 47, 48, 49, 65 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1280 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1286 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_boolOperand_1297 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 47, 48, 49, 65 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1304 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1310 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_boolOperand_1321 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 47, 48, 49, 65 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1328 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1334 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperand_IN_expression_1359 = Set[ 1, 12, 13 ]
    TOKENS_FOLLOWING_PLUS_IN_expression_1370 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_expression_IN_expression_1375 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expression_1383 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_expression_IN_expression_1388 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperand_1410 = Set[ 1, 38, 39, 40 ]
    TOKENS_FOLLOWING_MUL_IN_addOperand_1421 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1426 = Set[ 1 ]
    TOKENS_FOLLOWING_DIV_IN_addOperand_1434 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1439 = Set[ 1 ]
    TOKENS_FOLLOWING_MOD_IN_addOperand_1447 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1452 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_mulOperand_1474 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1476 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_mulOperand_1483 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1485 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1492 = Set[ 1 ]
    TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1509 = Set[ 1, 65 ]
    TOKENS_FOLLOWING_T__65_IN_mulOperandRest_1517 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_expression_IN_mulOperandRest_1519 = Set[ 66 ]
    TOKENS_FOLLOWING_T__66_IN_mulOperandRest_1521 = Set[ 1, 65 ]
    TOKENS_FOLLOWING_CLOSEFILE_IN_closeFile_1542 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_closeFile_1544 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_expression_IN_closeFile_1547 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_closeFile_1549 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENFILE_IN_openFile_1570 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_openFile_1572 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_expression_IN_openFile_1575 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_openFile_1577 = Set[ 1 ]
    TOKENS_FOLLOWING_READNUMBER_IN_readNumber_1597 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_readNumber_1599 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_expression_IN_readNumber_1602 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_readNumber_1604 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1628 = Set[ 1 ]
    TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1635 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1638 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1640 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1648 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1655 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1662 = Set[ 1 ]
    TOKENS_FOLLOWING_alloc_IN_arrayIndexTarget_1669 = Set[ 1 ]
    TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1676 = Set[ 1 ]
    TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1683 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_arrayIndexTarget_1690 = Set[ 1 ]
    TOKENS_FOLLOWING_openFile_IN_arrayIndexTarget_1697 = Set[ 1 ]
    TOKENS_FOLLOWING_readNumber_IN_arrayIndexTarget_1704 = Set[ 1 ]
    TOKENS_FOLLOWING_T__65_IN_array_1721 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 64, 65, 66 ]
    TOKENS_FOLLOWING_T__64_IN_array_1728 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_expression_IN_array_1733 = Set[ 16, 64, 66 ]
    TOKENS_FOLLOWING_COMMA_IN_array_1740 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 64, 65 ]
    TOKENS_FOLLOWING_T__64_IN_array_1742 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_expression_IN_array_1747 = Set[ 16, 64, 66 ]
    TOKENS_FOLLOWING_T__64_IN_array_1758 = Set[ 66 ]
    TOKENS_FOLLOWING_T__66_IN_array_1761 = Set[ 1 ]
    TOKENS_FOLLOWING_ALLOC_IN_alloc_1777 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_alloc_1779 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_expression_IN_alloc_1782 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_alloc_1784 = Set[ 1 ]
    TOKENS_FOLLOWING_identified_IN_indexed_1807 = Set[ 1, 65 ]
    TOKENS_FOLLOWING_T__65_IN_indexed_1817 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_expression_IN_indexed_1819 = Set[ 66 ]
    TOKENS_FOLLOWING_T__66_IN_indexed_1821 = Set[ 1, 65 ]
    TOKENS_FOLLOWING_ID_IN_identified_1842 = Set[ 1 ]
    TOKENS_FOLLOWING_indexed_IN_assignment_1859 = Set[ 46 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1861 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 45, 49, 65 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1864 = Set[ 1 ]
    TOKENS_FOLLOWING_TRUE_IN_bool_1885 = Set[ 1 ]
    TOKENS_FOLLOWING_FALSE_IN_bool_1893 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_string_1914 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end


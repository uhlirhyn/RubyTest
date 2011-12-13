#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-12-13 20:20:20
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
require './lib/giraffe/tree/writeFileTree.rb'
require './lib/giraffe/tree/readNumberTree.rb'
require './lib/giraffe/tree/nilTree.rb'
require './lib/giraffe/tree/allocTree.rb'
require './lib/giraffe/tree/sizeofTree.rb'
require './lib/giraffe/operators.rb'
require './lib/giraffe/debug.rb'

# - - - - - - end action @parser::header - - - - - - -


module Giraffe
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :T__68 => 68, :T__66 => 66, :EXPONENT => 59, :T__67 => 67, 
                   :MAIN => 27, :LT => 34, :T__65 => 65, :RB => 11, :WHILE => 23, 
                   :MOD => 40, :OPENFILE => 42, :OCTAL_ESC => 55, :READNUMBER => 44, 
                   :DO => 24, :FOR => 25, :FLOAT => 60, :NOT => 31, :RCB => 19, 
                   :ID => 26, :AND => 30, :EOF => -1, :BREAK => 7, :IF => 17, 
                   :QUOTE => 62, :ESC_SEQ => 52, :CONTINUE => 58, :QM => 64, 
                   :COMMA => 16, :LCB => 18, :PRINTLN => 57, :RETURN => 8, 
                   :PLUS => 12, :EQ => 32, :COMMENT => 4, :DOT => 28, :NE => 33, 
                   :EXIT => 9, :GE => 37, :UNICODE_ESC => 54, :NULL => 46, 
                   :ELSE => 20, :HEX_DIGIT => 53, :INT => 14, :SEMICOLON => 5, 
                   :MINUS => 13, :TRUE => 49, :MUL => 38, :PRINT => 15, 
                   :PRINTL => 56, :ELSEIF => 21, :COLON => 63, :ELIF => 22, 
                   :WS => 61, :WRITEFILE => 45, :READ => 6, :OR => 29, :ASSIGN => 48, 
                   :SIZEOF => 43, :ALLOC => 47, :GT => 35, :LB => 10, :CLOSEFILE => 41, 
                   :DIV => 39, :FALSE => 50, :LE => 36, :STRING => 51 )

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
                    "CLOSEFILE", "OPENFILE", "SIZEOF", "READNUMBER", "WRITEFILE", 
                    "NULL", "ALLOC", "ASSIGN", "TRUE", "FALSE", "STRING", 
                    "ESC_SEQ", "HEX_DIGIT", "UNICODE_ESC", "OCTAL_ESC", 
                    "PRINTL", "PRINTLN", "CONTINUE", "EXPONENT", "FLOAT", 
                    "WS", "QUOTE", "COLON", "QM", "'\\r'", "'\\n'", "'['", 
                    "']'" )
    
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
                     :mulOperandRest, :closeFile, :openFile, :sizeOf, :readNumber, 
                     :writeFile, :arrayIndexTarget, :array, :alloc, :indexed, 
                     :identified, :assignment, :bool, :string ].freeze


    include TokenData

    begin
      generated_using( "Giraffe.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )


    end


    include Debug

    def emit_error_message(message) 
    	#@syntax_error = :error
    	puts red("Error: ") + orange(message)
    	#@error_output.puts( message ) if @error_output

                    puts red("\n BUILD FAILED ...\n")
    	exit
    end

    attr_reader :syntax_error

    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -
    ProgramReturnValue = define_return_scope :result

    # 
    # parser rule program
    # 
    # (in Giraffe.g)
    # 60:1: program returns [result] : functions ;
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


        # at line 61:4: functions
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
    # 64:1: funcdef returns [result] : ( func | );
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
        # at line 65:2: ( func | )
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0.between?( ID, MAIN ) )
          alt_1 = 1
        elsif ( look_1_0 == EOF || look_1_0.between?( COMMENT, SEMICOLON ) || look_1_0.between?( T__65, T__66 ) )
          alt_1 = 2
        else
          raise NoViableAlternative( "", 1, 0 )
        end
        case alt_1
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 65:4: func
          @state.following.push( TOKENS_FOLLOWING_func_IN_funcdef_70 )
          func2 = func
          @state.following.pop
          @adaptor.add_child( root_0, func2.tree )
          # --> action
          return_value.result = ( func2.nil? ? nil : func2.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 66:4: 
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
    # 69:1: functions returns [list] : funcdef functionsRest ;
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


        # at line 70:4: funcdef functionsRest
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
    # 77:1: functionsRest returns [list] : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) functions | );
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
        # at line 78:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) functions | )
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0.between?( COMMENT, SEMICOLON ) || look_5_0.between?( T__65, T__66 ) )
          alt_5 = 1
        elsif ( look_5_0 == EOF )
          alt_5 = 2
        else
          raise NoViableAlternative( "", 5, 0 )
        end
        case alt_5
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 78:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) functions
          # at line 78:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
          alt_4 = 2
          look_4_0 = @input.peek( 1 )

          if ( look_4_0 == COMMENT || look_4_0.between?( T__65, T__66 ) )
            alt_4 = 1
          elsif ( look_4_0 == SEMICOLON )
            alt_4 = 2
          else
            raise NoViableAlternative( "", 4, 0 )
          end
          case alt_4
          when 1
            # at line 78:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 78:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 78:8: ( COMMENT )? ( '\\r' )? '\\n'
            # at line 78:15: ( COMMENT )?
            alt_2 = 2
            look_2_0 = @input.peek( 1 )

            if ( look_2_0 == COMMENT )
              alt_2 = 1
            end
            case alt_2
            when 1
              # at line 78:15: COMMENT
              __COMMENT5__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_functionsRest_132 )

            end
            # at line 78:22: ( '\\r' )?
            alt_3 = 2
            look_3_0 = @input.peek( 1 )

            if ( look_3_0 == T__65 )
              alt_3 = 1
            end
            case alt_3
            when 1
              # at line 78:22: '\\r'
              char_literal6 = match( T__65, TOKENS_FOLLOWING_T__65_IN_functionsRest_136 )

            end
            char_literal7 = match( T__66, TOKENS_FOLLOWING_T__66_IN_functionsRest_140 )


          when 2
            # at line 78:34: SEMICOLON
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
        # trace_out( __method__, 4 )

      end
      
      return return_value
    end

    BlockReturnValue = define_return_scope :list

    # 
    # parser rule block
    # 
    # (in Giraffe.g)
    # 84:1: block returns [list] : instruction instructionRest ;
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


        # at line 85:4: instruction instructionRest
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
    # 92:1: instructionRest returns [list] : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | );
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
        # at line 93:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | )
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0.between?( COMMENT, SEMICOLON ) || look_9_0.between?( T__65, T__66 ) )
          alt_9 = 1
        elsif ( look_9_0 == RCB )
          alt_9 = 2
        else
          raise NoViableAlternative( "", 9, 0 )
        end
        case alt_9
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 93:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block
          # at line 93:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0 == COMMENT || look_8_0.between?( T__65, T__66 ) )
            alt_8 = 1
          elsif ( look_8_0 == SEMICOLON )
            alt_8 = 2
          else
            raise NoViableAlternative( "", 8, 0 )
          end
          case alt_8
          when 1
            # at line 93:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 93:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 93:8: ( COMMENT )? ( '\\r' )? '\\n'
            # at line 93:15: ( COMMENT )?
            alt_6 = 2
            look_6_0 = @input.peek( 1 )

            if ( look_6_0 == COMMENT )
              alt_6 = 1
            end
            case alt_6
            when 1
              # at line 93:15: COMMENT
              __COMMENT12__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_instructionRest_223 )

            end
            # at line 93:22: ( '\\r' )?
            alt_7 = 2
            look_7_0 = @input.peek( 1 )

            if ( look_7_0 == T__65 )
              alt_7 = 1
            end
            case alt_7
            when 1
              # at line 93:22: '\\r'
              char_literal13 = match( T__65, TOKENS_FOLLOWING_T__65_IN_instructionRest_227 )

            end
            char_literal14 = match( T__66, TOKENS_FOLLOWING_T__66_IN_instructionRest_231 )


          when 2
            # at line 93:34: SEMICOLON
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


          # at line 96:4: 
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
    # 99:1: instruction returns [result] : ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | returnInstruction | exitInstruction | breakInstruction | aloneCall | closeFile | writeFile | );
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
      writeFile28 = nil


      begin
        # at line 100:2: ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | returnInstruction | exitInstruction | breakInstruction | aloneCall | closeFile | writeFile | )
        alt_10 = 13
        alt_10 = @dfa10.predict( @input )
        case alt_10
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 100:4: assignment
          @state.following.push( TOKENS_FOLLOWING_assignment_IN_instruction_273 )
          assignment17 = assignment
          @state.following.pop
          @adaptor.add_child( root_0, assignment17.tree )
          # --> action
          return_value.result = ( assignment17.nil? ? nil : assignment17.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 101:4: forCycle
          @state.following.push( TOKENS_FOLLOWING_forCycle_IN_instruction_280 )
          forCycle18 = forCycle
          @state.following.pop
          @adaptor.add_child( root_0, forCycle18.tree )
          # --> action
          return_value.result = ( forCycle18.nil? ? nil : forCycle18.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 102:4: ifInstruction
          @state.following.push( TOKENS_FOLLOWING_ifInstruction_IN_instruction_287 )
          ifInstruction19 = ifInstruction
          @state.following.pop
          @adaptor.add_child( root_0, ifInstruction19.tree )
          # --> action
          return_value.result = ( ifInstruction19.nil? ? nil : ifInstruction19.result )
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 103:4: whileCycle
          @state.following.push( TOKENS_FOLLOWING_whileCycle_IN_instruction_294 )
          whileCycle20 = whileCycle
          @state.following.pop
          @adaptor.add_child( root_0, whileCycle20.tree )
          # --> action
          return_value.result = ( whileCycle20.nil? ? nil : whileCycle20.result )
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 104:4: doCycle
          @state.following.push( TOKENS_FOLLOWING_doCycle_IN_instruction_301 )
          doCycle21 = doCycle
          @state.following.pop
          @adaptor.add_child( root_0, doCycle21.tree )
          # --> action
          return_value.result = ( doCycle21.nil? ? nil : doCycle21.result )
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 105:4: printInstruction
          @state.following.push( TOKENS_FOLLOWING_printInstruction_IN_instruction_308 )
          printInstruction22 = printInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printInstruction22.tree )
          # --> action
          return_value.result = ( printInstruction22.nil? ? nil : printInstruction22.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 106:4: returnInstruction
          @state.following.push( TOKENS_FOLLOWING_returnInstruction_IN_instruction_315 )
          returnInstruction23 = returnInstruction
          @state.following.pop
          @adaptor.add_child( root_0, returnInstruction23.tree )
          # --> action
          return_value.result = ( returnInstruction23.nil? ? nil : returnInstruction23.result )
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 107:4: exitInstruction
          @state.following.push( TOKENS_FOLLOWING_exitInstruction_IN_instruction_323 )
          exitInstruction24 = exitInstruction
          @state.following.pop
          @adaptor.add_child( root_0, exitInstruction24.tree )
          # --> action
          return_value.result = ( exitInstruction24.nil? ? nil : exitInstruction24.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 108:4: breakInstruction
          @state.following.push( TOKENS_FOLLOWING_breakInstruction_IN_instruction_330 )
          breakInstruction25 = breakInstruction
          @state.following.pop
          @adaptor.add_child( root_0, breakInstruction25.tree )
          # --> action
          return_value.result = ( breakInstruction25.nil? ? nil : breakInstruction25.result )
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 109:4: aloneCall
          @state.following.push( TOKENS_FOLLOWING_aloneCall_IN_instruction_337 )
          aloneCall26 = aloneCall
          @state.following.pop
          @adaptor.add_child( root_0, aloneCall26.tree )
          # --> action
          return_value.result = ( aloneCall26.nil? ? nil : aloneCall26.result )
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 110:4: closeFile
          @state.following.push( TOKENS_FOLLOWING_closeFile_IN_instruction_344 )
          closeFile27 = closeFile
          @state.following.pop
          @adaptor.add_child( root_0, closeFile27.tree )
          # --> action
          return_value.result = ( closeFile27.nil? ? nil : closeFile27.result )
          # <-- action

        when 12
          root_0 = @adaptor.create_flat_list


          # at line 111:4: writeFile
          @state.following.push( TOKENS_FOLLOWING_writeFile_IN_instruction_351 )
          writeFile28 = writeFile
          @state.following.pop
          @adaptor.add_child( root_0, writeFile28.tree )
          # --> action
          return_value.result = ( writeFile28.nil? ? nil : writeFile28.result )
          # <-- action

        when 13
          root_0 = @adaptor.create_flat_list


          # at line 112:4: 
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
    # 115:1: readInstruction returns [result] : READ ;
    # 
    def readInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      return_value = ReadInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __READ29__ = nil

      tree_for_READ29 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 116:4: READ
        __READ29__ = match( READ, TOKENS_FOLLOWING_READ_IN_readInstruction_374 )

        tree_for_READ29 = @adaptor.create_with_payload( __READ29__ )
        @adaptor.add_child( root_0, tree_for_READ29 )

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
    # 119:1: breakInstruction returns [result] : BREAK ;
    # 
    def breakInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = BreakInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __BREAK30__ = nil

      tree_for_BREAK30 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 120:4: BREAK
        __BREAK30__ = match( BREAK, TOKENS_FOLLOWING_BREAK_IN_breakInstruction_391 )

        tree_for_BREAK30 = @adaptor.create_with_payload( __BREAK30__ )
        @adaptor.add_child( root_0, tree_for_BREAK30 )

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
    # 123:1: returnInstruction returns [result] : RETURN expression ;
    # 
    def returnInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = ReturnInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __RETURN31__ = nil
      expression32 = nil

      tree_for_RETURN31 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 124:4: RETURN expression
        __RETURN31__ = match( RETURN, TOKENS_FOLLOWING_RETURN_IN_returnInstruction_408 )

        tree_for_RETURN31 = @adaptor.create_with_payload( __RETURN31__ )
        root_0 = @adaptor.become_root( tree_for_RETURN31, root_0 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_returnInstruction_411 )
        expression32 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression32.tree )
        # --> action
        return_value.result = [ReturnTree.new(( expression32.nil? ? nil : expression32.result )),tree_for_RETURN31]
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
    # 127:1: exitInstruction returns [result] : EXIT ( LB alt1= statusCode RB | alt2= statusCode )? ;
    # 
    def exitInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = ExitInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __EXIT33__ = nil
      __LB34__ = nil
      __RB35__ = nil
      alt1 = nil
      alt2 = nil

      tree_for_EXIT33 = nil
      tree_for_LB34 = nil
      tree_for_RB35 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 128:4: EXIT ( LB alt1= statusCode RB | alt2= statusCode )?
        __EXIT33__ = match( EXIT, TOKENS_FOLLOWING_EXIT_IN_exitInstruction_428 )

        tree_for_EXIT33 = @adaptor.create_with_payload( __EXIT33__ )
        root_0 = @adaptor.become_root( tree_for_EXIT33, root_0 )

        # at line 128:11: ( LB alt1= statusCode RB | alt2= statusCode )?
        alt_11 = 3
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == LB )
          alt_11 = 1
        elsif ( look_11_0.between?( PLUS, INT ) )
          alt_11 = 2
        end
        case alt_11
        when 1
          # at line 128:12: LB alt1= statusCode RB
          __LB34__ = match( LB, TOKENS_FOLLOWING_LB_IN_exitInstruction_433 )
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_438 )
          alt1 = statusCode
          @state.following.pop
          @adaptor.add_child( root_0, alt1.tree )
          __RB35__ = match( RB, TOKENS_FOLLOWING_RB_IN_exitInstruction_440 )
          # --> action
          return_value.result = ExitTree.new(( alt1.nil? ? nil : alt1.result ))
          # <-- action

        when 2
          # at line 129:6: alt2= statusCode
          @state.following.push( TOKENS_FOLLOWING_statusCode_IN_exitInstruction_453 )
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
    # 132:1: statusCode returns [result] : ( PLUS | MINUS )? INT ;
    # 
    def statusCode
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = StatusCodeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS36__ = nil
      __MINUS37__ = nil
      __INT38__ = nil

      tree_for_PLUS36 = nil
      tree_for_MINUS37 = nil
      tree_for_INT38 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 133:4: ( PLUS | MINUS )? INT
        # --> action
        sign = ""
        # <-- action
        # at line 134:3: ( PLUS | MINUS )?
        alt_12 = 3
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == PLUS )
          alt_12 = 1
        elsif ( look_12_0 == MINUS )
          alt_12 = 2
        end
        case alt_12
        when 1
          # at line 134:4: PLUS
          __PLUS36__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_statusCode_478 )

          tree_for_PLUS36 = @adaptor.create_with_payload( __PLUS36__ )
          @adaptor.add_child( root_0, tree_for_PLUS36 )


        when 2
          # at line 134:11: MINUS
          __MINUS37__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_statusCode_482 )

          tree_for_MINUS37 = @adaptor.create_with_payload( __MINUS37__ )
          @adaptor.add_child( root_0, tree_for_MINUS37 )

          # --> action
          sign = __MINUS37__.text
          # <-- action

        end
        __INT38__ = match( INT, TOKENS_FOLLOWING_INT_IN_statusCode_488 )

        tree_for_INT38 = @adaptor.create_with_payload( __INT38__ )
        @adaptor.add_child( root_0, tree_for_INT38 )

        # --> action
        (sign + __INT38__.text).to_i
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
    # 138:1: printInstruction returns [result] : PRINT LB printText RB ;
    # 
    def printInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = PrintInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PRINT39__ = nil
      __LB40__ = nil
      __RB42__ = nil
      printText41 = nil

      tree_for_PRINT39 = nil
      tree_for_LB40 = nil
      tree_for_RB42 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 139:5: PRINT LB printText RB
        __PRINT39__ = match( PRINT, TOKENS_FOLLOWING_PRINT_IN_printInstruction_509 )

        tree_for_PRINT39 = @adaptor.create_with_payload( __PRINT39__ )
        root_0 = @adaptor.become_root( tree_for_PRINT39, root_0 )

        __LB40__ = match( LB, TOKENS_FOLLOWING_LB_IN_printInstruction_512 )
        @state.following.push( TOKENS_FOLLOWING_printText_IN_printInstruction_515 )
        printText41 = printText
        @state.following.pop
        @adaptor.add_child( root_0, printText41.tree )
        __RB42__ = match( RB, TOKENS_FOLLOWING_RB_IN_printInstruction_517 )
        # --> action
        return_value.result = [PrintTree.new(( printText41.nil? ? nil : printText41.list )),tree_for_PRINT39]
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
    # 142:1: printText returns [list] : expression ( COMMA rest= printText )? ;
    # 
    def printText
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = PrintTextReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA44__ = nil
      rest = nil
      expression43 = nil

      tree_for_COMMA44 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 143:4: expression ( COMMA rest= printText )?
        @state.following.push( TOKENS_FOLLOWING_expression_IN_printText_542 )
        expression43 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression43.tree )
        # --> action
        return_value.list = [( expression43.nil? ? nil : expression43.result )]
        # <-- action
        # at line 144:3: ( COMMA rest= printText )?
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == COMMA )
          alt_13 = 1
        end
        case alt_13
        when 1
          # at line 144:4: COMMA rest= printText
          __COMMA44__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_printText_549 )

          tree_for_COMMA44 = @adaptor.create_with_payload( __COMMA44__ )
          @adaptor.add_child( root_0, tree_for_COMMA44 )

          @state.following.push( TOKENS_FOLLOWING_printText_IN_printText_553 )
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
    # 147:1: ifInstruction returns [result] : IF LB condition RB LCB block RCB ifRest ;
    # 
    def ifInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = IfInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __IF45__ = nil
      __LB46__ = nil
      __RB48__ = nil
      __LCB49__ = nil
      __RCB51__ = nil
      condition47 = nil
      block50 = nil
      ifRest52 = nil

      tree_for_IF45 = nil
      tree_for_LB46 = nil
      tree_for_RB48 = nil
      tree_for_LCB49 = nil
      tree_for_RCB51 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 148:4: IF LB condition RB LCB block RCB ifRest
        __IF45__ = match( IF, TOKENS_FOLLOWING_IF_IN_ifInstruction_577 )

        tree_for_IF45 = @adaptor.create_with_payload( __IF45__ )
        root_0 = @adaptor.become_root( tree_for_IF45, root_0 )

        __LB46__ = match( LB, TOKENS_FOLLOWING_LB_IN_ifInstruction_580 )
        @state.following.push( TOKENS_FOLLOWING_condition_IN_ifInstruction_583 )
        condition47 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition47.tree )
        __RB48__ = match( RB, TOKENS_FOLLOWING_RB_IN_ifInstruction_585 )
        __LCB49__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifInstruction_588 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_ifInstruction_591 )
        block50 = block
        @state.following.pop
        @adaptor.add_child( root_0, block50.tree )
        __RCB51__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifInstruction_593 )
        @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifInstruction_596 )
        ifRest52 = ifRest
        @state.following.pop
        @adaptor.add_child( root_0, ifRest52.tree )
        # --> action
        return_value.result = [IfTree.new(( condition47.nil? ? nil : condition47.result ),( block50.nil? ? nil : block50.list ),( ifRest52.nil? ? nil : ifRest52.result )),tree_for_IF45]
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
    # 152:1: ifRest returns [result] : ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | );
    # 
    def ifRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
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
        # at line 153:2: ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | )
        alt_14 = 3
        case look_14 = @input.peek( 1 )
        when ELSE then alt_14 = 1
        when ELSEIF, ELIF then alt_14 = 2
        when COMMENT, SEMICOLON, RCB, T__65, T__66 then alt_14 = 3
        else
          raise NoViableAlternative( "", 14, 0 )
        end
        case alt_14
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 153:4: ELSE LCB block RCB
          __ELSE53__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_ifRest_615 )

          tree_for_ELSE53 = @adaptor.create_with_payload( __ELSE53__ )
          @adaptor.add_child( root_0, tree_for_ELSE53 )

          __LCB54__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_617 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_620 )
          block55 = block
          @state.following.pop
          @adaptor.add_child( root_0, block55.tree )
          __RCB56__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_622 )
          # --> action
          return_value.result = ( block55.nil? ? nil : block55.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 154:4: ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest
          set57 = @input.look
          if @input.peek( 1 ).between?( ELSEIF, ELIF )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set57 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          @state.following.push( TOKENS_FOLLOWING_condition_IN_ifRest_638 )
          condition58 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition58.tree )
          __LCB59__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_640 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_643 )
          block60 = block
          @state.following.pop
          @adaptor.add_child( root_0, block60.tree )
          __RCB61__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_645 )
          @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifRest_650 )
          op = ifRest
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = IfTree.new(( condition58.nil? ? nil : condition58.result ),( block60.nil? ? nil : block60.list ),( op.nil? ? nil : op.result ))
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 156:4: 
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
    # 159:1: whileCycle returns [result] : WHILE LB condition RB LCB block RCB ;
    # 
    def whileCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = WhileCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WHILE62__ = nil
      __LB63__ = nil
      __RB65__ = nil
      __LCB66__ = nil
      __RCB68__ = nil
      condition64 = nil
      block67 = nil

      tree_for_WHILE62 = nil
      tree_for_LB63 = nil
      tree_for_RB65 = nil
      tree_for_LCB66 = nil
      tree_for_RCB68 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 160:5: WHILE LB condition RB LCB block RCB
        __WHILE62__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_whileCycle_677 )

        tree_for_WHILE62 = @adaptor.create_with_payload( __WHILE62__ )
        @adaptor.add_child( root_0, tree_for_WHILE62 )

        __LB63__ = match( LB, TOKENS_FOLLOWING_LB_IN_whileCycle_679 )

        tree_for_LB63 = @adaptor.create_with_payload( __LB63__ )
        @adaptor.add_child( root_0, tree_for_LB63 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_whileCycle_681 )
        condition64 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition64.tree )
        __RB65__ = match( RB, TOKENS_FOLLOWING_RB_IN_whileCycle_683 )

        tree_for_RB65 = @adaptor.create_with_payload( __RB65__ )
        @adaptor.add_child( root_0, tree_for_RB65 )

        __LCB66__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_whileCycle_685 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_whileCycle_688 )
        block67 = block
        @state.following.pop
        @adaptor.add_child( root_0, block67.tree )
        __RCB68__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_whileCycle_690 )
        # --> action
        return_value.result = [WhileTree.new(( condition64.nil? ? nil : condition64.result ),( block67.nil? ? nil : block67.list )),tree_for_WHILE62]
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
    # 164:1: doCycle returns [result] : DO LCB block RCB WHILE LB condition RB ;
    # 
    def doCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = DoCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __DO69__ = nil
      __LCB70__ = nil
      __RCB72__ = nil
      __WHILE73__ = nil
      __LB74__ = nil
      __RB76__ = nil
      block71 = nil
      condition75 = nil

      tree_for_DO69 = nil
      tree_for_LCB70 = nil
      tree_for_RCB72 = nil
      tree_for_WHILE73 = nil
      tree_for_LB74 = nil
      tree_for_RB76 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 165:4: DO LCB block RCB WHILE LB condition RB
        __DO69__ = match( DO, TOKENS_FOLLOWING_DO_IN_doCycle_712 )

        tree_for_DO69 = @adaptor.create_with_payload( __DO69__ )
        @adaptor.add_child( root_0, tree_for_DO69 )

        __LCB70__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_doCycle_714 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_doCycle_717 )
        block71 = block
        @state.following.pop
        @adaptor.add_child( root_0, block71.tree )
        __RCB72__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_doCycle_719 )
        __WHILE73__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_doCycle_722 )

        tree_for_WHILE73 = @adaptor.create_with_payload( __WHILE73__ )
        @adaptor.add_child( root_0, tree_for_WHILE73 )

        __LB74__ = match( LB, TOKENS_FOLLOWING_LB_IN_doCycle_724 )

        tree_for_LB74 = @adaptor.create_with_payload( __LB74__ )
        @adaptor.add_child( root_0, tree_for_LB74 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_doCycle_726 )
        condition75 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition75.tree )
        __RB76__ = match( RB, TOKENS_FOLLOWING_RB_IN_doCycle_728 )

        tree_for_RB76 = @adaptor.create_with_payload( __RB76__ )
        @adaptor.add_child( root_0, tree_for_RB76 )

        # --> action
        return_value.result = [DoTree.new(( condition75.nil? ? nil : condition75.result ),( block71.nil? ? nil : block71.list )),tree_for_DO69]
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
    # 169:1: forCycle returns [result] : FOR LB as1= assignment ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) condition ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) as2= assignment RB LCB block RCB ;
    # 
    def forCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = ForCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __FOR77__ = nil
      __LB78__ = nil
      __COMMENT79__ = nil
      char_literal80 = nil
      char_literal81 = nil
      __SEMICOLON82__ = nil
      __COMMENT84__ = nil
      char_literal85 = nil
      char_literal86 = nil
      __SEMICOLON87__ = nil
      __RB88__ = nil
      __LCB89__ = nil
      __RCB91__ = nil
      as1 = nil
      as2 = nil
      condition83 = nil
      block90 = nil

      tree_for_FOR77 = nil
      tree_for_LB78 = nil
      tree_for_COMMENT79 = nil
      tree_for_char_literal80 = nil
      tree_for_char_literal81 = nil
      tree_for_SEMICOLON82 = nil
      tree_for_COMMENT84 = nil
      tree_for_char_literal85 = nil
      tree_for_char_literal86 = nil
      tree_for_SEMICOLON87 = nil
      tree_for_RB88 = nil
      tree_for_LCB89 = nil
      tree_for_RCB91 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 170:4: FOR LB as1= assignment ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) condition ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) as2= assignment RB LCB block RCB
        __FOR77__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_forCycle_749 )

        tree_for_FOR77 = @adaptor.create_with_payload( __FOR77__ )
        @adaptor.add_child( root_0, tree_for_FOR77 )

        __LB78__ = match( LB, TOKENS_FOLLOWING_LB_IN_forCycle_751 )

        tree_for_LB78 = @adaptor.create_with_payload( __LB78__ )
        @adaptor.add_child( root_0, tree_for_LB78 )

        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_755 )
        as1 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as1.tree )
        # at line 170:26: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == COMMENT || look_17_0.between?( T__65, T__66 ) )
          alt_17 = 1
        elsif ( look_17_0 == SEMICOLON )
          alt_17 = 2
        else
          raise NoViableAlternative( "", 17, 0 )
        end
        case alt_17
        when 1
          # at line 170:27: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 170:27: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 170:29: ( COMMENT )? ( '\\r' )? '\\n'
          # at line 170:36: ( COMMENT )?
          alt_15 = 2
          look_15_0 = @input.peek( 1 )

          if ( look_15_0 == COMMENT )
            alt_15 = 1
          end
          case alt_15
          when 1
            # at line 170:36: COMMENT
            __COMMENT79__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_forCycle_760 )

          end
          # at line 170:43: ( '\\r' )?
          alt_16 = 2
          look_16_0 = @input.peek( 1 )

          if ( look_16_0 == T__65 )
            alt_16 = 1
          end
          case alt_16
          when 1
            # at line 170:43: '\\r'
            char_literal80 = match( T__65, TOKENS_FOLLOWING_T__65_IN_forCycle_764 )

          end
          char_literal81 = match( T__66, TOKENS_FOLLOWING_T__66_IN_forCycle_768 )


        when 2
          # at line 170:55: SEMICOLON
          __SEMICOLON82__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_774 )

        end
        @state.following.push( TOKENS_FOLLOWING_condition_IN_forCycle_779 )
        condition83 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition83.tree )
        # at line 170:78: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
        alt_20 = 2
        look_20_0 = @input.peek( 1 )

        if ( look_20_0 == COMMENT || look_20_0.between?( T__65, T__66 ) )
          alt_20 = 1
        elsif ( look_20_0 == SEMICOLON )
          alt_20 = 2
        else
          raise NoViableAlternative( "", 20, 0 )
        end
        case alt_20
        when 1
          # at line 170:79: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 170:79: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 170:81: ( COMMENT )? ( '\\r' )? '\\n'
          # at line 170:88: ( COMMENT )?
          alt_18 = 2
          look_18_0 = @input.peek( 1 )

          if ( look_18_0 == COMMENT )
            alt_18 = 1
          end
          case alt_18
          when 1
            # at line 170:88: COMMENT
            __COMMENT84__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_forCycle_784 )

          end
          # at line 170:95: ( '\\r' )?
          alt_19 = 2
          look_19_0 = @input.peek( 1 )

          if ( look_19_0 == T__65 )
            alt_19 = 1
          end
          case alt_19
          when 1
            # at line 170:95: '\\r'
            char_literal85 = match( T__65, TOKENS_FOLLOWING_T__65_IN_forCycle_788 )

          end
          char_literal86 = match( T__66, TOKENS_FOLLOWING_T__66_IN_forCycle_792 )


        when 2
          # at line 170:107: SEMICOLON
          __SEMICOLON87__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_798 )

        end
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_805 )
        as2 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as2.tree )
        __RB88__ = match( RB, TOKENS_FOLLOWING_RB_IN_forCycle_807 )

        tree_for_RB88 = @adaptor.create_with_payload( __RB88__ )
        @adaptor.add_child( root_0, tree_for_RB88 )

        __LCB89__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_forCycle_809 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_forCycle_812 )
        block90 = block
        @state.following.pop
        @adaptor.add_child( root_0, block90.tree )
        __RCB91__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_forCycle_814 )
        # --> action
        return_value.result = [ForTree.new(( as1.nil? ? nil : as1.result ),( condition83.nil? ? nil : condition83.result ),( as2.nil? ? nil : as2.result ),( block90.nil? ? nil : block90.list )), tree_for_FOR77]
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
    # 174:1: func returns [result] : ( ID ( LB params RB )? LCB block RCB | MAIN LCB block RCB );
    # 
    def func
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = FuncReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID92__ = nil
      __LB93__ = nil
      __RB95__ = nil
      __LCB96__ = nil
      __RCB98__ = nil
      __MAIN99__ = nil
      __LCB100__ = nil
      __RCB102__ = nil
      params94 = nil
      block97 = nil
      block101 = nil

      tree_for_ID92 = nil
      tree_for_LB93 = nil
      tree_for_RB95 = nil
      tree_for_LCB96 = nil
      tree_for_RCB98 = nil
      tree_for_MAIN99 = nil
      tree_for_LCB100 = nil
      tree_for_RCB102 = nil

      begin
        # at line 175:2: ( ID ( LB params RB )? LCB block RCB | MAIN LCB block RCB )
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


          # at line 175:4: ID ( LB params RB )? LCB block RCB
          __ID92__ = match( ID, TOKENS_FOLLOWING_ID_IN_func_836 )

          tree_for_ID92 = @adaptor.create_with_payload( __ID92__ )
          @adaptor.add_child( root_0, tree_for_ID92 )

          # at line 175:7: ( LB params RB )?
          alt_21 = 2
          look_21_0 = @input.peek( 1 )

          if ( look_21_0 == LB )
            alt_21 = 1
          end
          case alt_21
          when 1
            # at line 175:8: LB params RB
            __LB93__ = match( LB, TOKENS_FOLLOWING_LB_IN_func_839 )
            @state.following.push( TOKENS_FOLLOWING_params_IN_func_842 )
            params94 = params
            @state.following.pop
            @adaptor.add_child( root_0, params94.tree )
            __RB95__ = match( RB, TOKENS_FOLLOWING_RB_IN_func_844 )

          end
          __LCB96__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_849 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_func_852 )
          block97 = block
          @state.following.pop
          @adaptor.add_child( root_0, block97.tree )
          __RCB98__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_854 )
          # --> action
          return_value.result = [FuncTree.new(__ID92__.text,( params94.nil? ? nil : params94.list ) == nil ? [] : ( params94.nil? ? nil : params94.list ),( block97.nil? ? nil : block97.list )),tree_for_ID92]
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 177:4: MAIN LCB block RCB
          __MAIN99__ = match( MAIN, TOKENS_FOLLOWING_MAIN_IN_func_864 )

          tree_for_MAIN99 = @adaptor.create_with_payload( __MAIN99__ )
          root_0 = @adaptor.become_root( tree_for_MAIN99, root_0 )

          __LCB100__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_867 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_func_870 )
          block101 = block
          @state.following.pop
          @adaptor.add_child( root_0, block101.tree )
          __RCB102__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_872 )
          # --> action
          return_value.result = [FuncTree.new("main",[],( block101.nil? ? nil : block101.list )),tree_for_MAIN99]
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
    # 181:1: params returns [list] : ( ID paramRest | );
    # 
    def params
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = ParamsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID103__ = nil
      paramRest104 = nil

      tree_for_ID103 = nil

      begin
        # at line 182:2: ( ID paramRest | )
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


          # at line 182:4: ID paramRest
          __ID103__ = match( ID, TOKENS_FOLLOWING_ID_IN_params_892 )

          tree_for_ID103 = @adaptor.create_with_payload( __ID103__ )
          @adaptor.add_child( root_0, tree_for_ID103 )

          @state.following.push( TOKENS_FOLLOWING_paramRest_IN_params_894 )
          paramRest104 = paramRest
          @state.following.pop
          @adaptor.add_child( root_0, paramRest104.tree )
          # --> action
          return_value.list = [__ID103__.text] + ( paramRest104.nil? ? nil : paramRest104.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 184:5: 
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
    # 187:1: paramRest returns [list] : ( COMMA params | );
    # 
    def paramRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ParamRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA105__ = nil
      params106 = nil

      tree_for_COMMA105 = nil

      begin
        # at line 188:2: ( COMMA params | )
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


          # at line 188:4: COMMA params
          __COMMA105__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_paramRest_919 )
          @state.following.push( TOKENS_FOLLOWING_params_IN_paramRest_922 )
          params106 = params
          @state.following.pop
          @adaptor.add_child( root_0, params106.tree )
          # --> action
          return_value.list = ( params106.nil? ? nil : params106.list )
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
        # trace_out( __method__, 22 )

      end
      
      return return_value
    end

    AloneCallReturnValue = define_return_scope :result

    # 
    # parser rule aloneCall
    # 
    # (in Giraffe.g)
    # 193:1: aloneCall returns [result] : fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )* ;
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
      __LB107__ = nil
      __RB108__ = nil
      __DOT109__ = nil
      __LB110__ = nil
      __RB111__ = nil
      args1 = nil
      args2 = nil

      tree_for_fun = nil
      tree_for_method = nil
      tree_for_LB107 = nil
      tree_for_RB108 = nil
      tree_for_DOT109 = nil
      tree_for_LB110 = nil
      tree_for_RB111 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 194:4: fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )*
        fun = match( ID, TOKENS_FOLLOWING_ID_IN_aloneCall_950 )

        tree_for_fun = @adaptor.create_with_payload( fun )
        root_0 = @adaptor.become_root( tree_for_fun, root_0 )

        __LB107__ = match( LB, TOKENS_FOLLOWING_LB_IN_aloneCall_953 )
        # at line 194:21: (args1= args )?
        alt_25 = 2
        look_25_0 = @input.peek( 1 )

        if ( look_25_0 == READ || look_25_0 == LB || look_25_0.between?( PLUS, INT ) || look_25_0 == ID || look_25_0.between?( OPENFILE, READNUMBER ) || look_25_0.between?( NULL, ALLOC ) || look_25_0 == STRING || look_25_0 == T__67 )
          alt_25 = 1
        end
        case alt_25
        when 1
          # at line 194:21: args1= args
          @state.following.push( TOKENS_FOLLOWING_args_IN_aloneCall_958 )
          args1 = args
          @state.following.pop
          @adaptor.add_child( root_0, args1.tree )

        end
        __RB108__ = match( RB, TOKENS_FOLLOWING_RB_IN_aloneCall_961 )
        # --> action
        return_value.result = [CallTree.new(fun.text,( args1.nil? ? nil : args1.list ),true),tree_for_fun]
        # <-- action
        # at line 196:3: ( DOT method= ID LB (args2= args )? RB )*
        while true # decision 27
          alt_27 = 2
          look_27_0 = @input.peek( 1 )

          if ( look_27_0 == DOT )
            alt_27 = 1

          end
          case alt_27
          when 1
            # at line 196:5: DOT method= ID LB (args2= args )? RB
            __DOT109__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_aloneCall_972 )

            tree_for_DOT109 = @adaptor.create_with_payload( __DOT109__ )
            @adaptor.add_child( root_0, tree_for_DOT109 )

            method = match( ID, TOKENS_FOLLOWING_ID_IN_aloneCall_976 )

            tree_for_method = @adaptor.create_with_payload( method )
            @adaptor.add_child( root_0, tree_for_method )

            __LB110__ = match( LB, TOKENS_FOLLOWING_LB_IN_aloneCall_978 )
            # at line 196:28: (args2= args )?
            alt_26 = 2
            look_26_0 = @input.peek( 1 )

            if ( look_26_0 == READ || look_26_0 == LB || look_26_0.between?( PLUS, INT ) || look_26_0 == ID || look_26_0.between?( OPENFILE, READNUMBER ) || look_26_0.between?( NULL, ALLOC ) || look_26_0 == STRING || look_26_0 == T__67 )
              alt_26 = 1
            end
            case alt_26
            when 1
              # at line 196:28: args2= args
              @state.following.push( TOKENS_FOLLOWING_args_IN_aloneCall_983 )
              args2 = args
              @state.following.pop
              @adaptor.add_child( root_0, args2.tree )

            end
            __RB111__ = match( RB, TOKENS_FOLLOWING_RB_IN_aloneCall_986 )
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
    # 199:1: call returns [result] : fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )* ;
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
      __LB112__ = nil
      __RB113__ = nil
      __DOT114__ = nil
      __LB115__ = nil
      __RB116__ = nil
      args1 = nil
      args2 = nil

      tree_for_fun = nil
      tree_for_method = nil
      tree_for_LB112 = nil
      tree_for_RB113 = nil
      tree_for_DOT114 = nil
      tree_for_LB115 = nil
      tree_for_RB116 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 200:4: fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )*
        fun = match( ID, TOKENS_FOLLOWING_ID_IN_call_1009 )

        tree_for_fun = @adaptor.create_with_payload( fun )
        root_0 = @adaptor.become_root( tree_for_fun, root_0 )

        __LB112__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_1012 )
        # at line 200:21: (args1= args )?
        alt_28 = 2
        look_28_0 = @input.peek( 1 )

        if ( look_28_0 == READ || look_28_0 == LB || look_28_0.between?( PLUS, INT ) || look_28_0 == ID || look_28_0.between?( OPENFILE, READNUMBER ) || look_28_0.between?( NULL, ALLOC ) || look_28_0 == STRING || look_28_0 == T__67 )
          alt_28 = 1
        end
        case alt_28
        when 1
          # at line 200:21: args1= args
          @state.following.push( TOKENS_FOLLOWING_args_IN_call_1017 )
          args1 = args
          @state.following.pop
          @adaptor.add_child( root_0, args1.tree )

        end
        __RB113__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_1020 )
        # --> action
        return_value.result = [CallTree.new(fun.text,( args1.nil? ? nil : args1.list ),false),tree_for_fun]
        # <-- action
        # at line 202:3: ( DOT method= ID LB (args2= args )? RB )*
        while true # decision 30
          alt_30 = 2
          look_30_0 = @input.peek( 1 )

          if ( look_30_0 == DOT )
            alt_30 = 1

          end
          case alt_30
          when 1
            # at line 202:5: DOT method= ID LB (args2= args )? RB
            __DOT114__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_call_1031 )

            tree_for_DOT114 = @adaptor.create_with_payload( __DOT114__ )
            @adaptor.add_child( root_0, tree_for_DOT114 )

            method = match( ID, TOKENS_FOLLOWING_ID_IN_call_1035 )

            tree_for_method = @adaptor.create_with_payload( method )
            @adaptor.add_child( root_0, tree_for_method )

            __LB115__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_1037 )
            # at line 202:28: (args2= args )?
            alt_29 = 2
            look_29_0 = @input.peek( 1 )

            if ( look_29_0 == READ || look_29_0 == LB || look_29_0.between?( PLUS, INT ) || look_29_0 == ID || look_29_0.between?( OPENFILE, READNUMBER ) || look_29_0.between?( NULL, ALLOC ) || look_29_0 == STRING || look_29_0 == T__67 )
              alt_29 = 1
            end
            case alt_29
            when 1
              # at line 202:28: args2= args
              @state.following.push( TOKENS_FOLLOWING_args_IN_call_1042 )
              args2 = args
              @state.following.pop
              @adaptor.add_child( root_0, args2.tree )

            end
            __RB116__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_1045 )
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
    # 205:1: args returns [list] : expression argsRest ;
    # 
    def args
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = ArgsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      expression117 = nil
      argsRest118 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 206:5: expression argsRest
        @state.following.push( TOKENS_FOLLOWING_expression_IN_args_1067 )
        expression117 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression117.tree )
        @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_1069 )
        argsRest118 = argsRest
        @state.following.pop
        @adaptor.add_child( root_0, argsRest118.tree )
        # --> action
        return_value.list = [( expression117.nil? ? nil : expression117.result )] + ( argsRest118.nil? ? nil : argsRest118.list )
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
    # 209:1: argsRest returns [list] : ( COMMA args | );
    # 
    def argsRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = ArgsRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA119__ = nil
      args120 = nil

      tree_for_COMMA119 = nil

      begin
        # at line 210:2: ( COMMA args | )
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


          # at line 210:4: COMMA args
          __COMMA119__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsRest_1088 )
          @state.following.push( TOKENS_FOLLOWING_args_IN_argsRest_1091 )
          args120 = args
          @state.following.pop
          @adaptor.add_child( root_0, args120.tree )
          # --> action
          return_value.list = ( args120.nil? ? nil : args120.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 212:4: 
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
    # 217:1: condition returns [result] : orOperand ( OR op= condition )? ;
    # 
    def condition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = ConditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OR122__ = nil
      op = nil
      orOperand121 = nil

      tree_for_OR122 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 218:4: orOperand ( OR op= condition )?
        @state.following.push( TOKENS_FOLLOWING_orOperand_IN_condition_1117 )
        orOperand121 = orOperand
        @state.following.pop
        @adaptor.add_child( root_0, orOperand121.tree )
        # --> action
        return_value.result = ( orOperand121.nil? ? nil : orOperand121.result )
        # <-- action
        # at line 219:3: ( OR op= condition )?
        alt_32 = 2
        look_32_0 = @input.peek( 1 )

        if ( look_32_0 == OR )
          alt_32 = 1
        end
        case alt_32
        when 1
          # at line 219:4: OR op= condition
          __OR122__ = match( OR, TOKENS_FOLLOWING_OR_IN_condition_1124 )

          tree_for_OR122 = @adaptor.create_with_payload( __OR122__ )
          root_0 = @adaptor.become_root( tree_for_OR122, root_0 )

          @state.following.push( TOKENS_FOLLOWING_condition_IN_condition_1129 )
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
    # 224:1: orOperand returns [result] : boolOperand ( AND op= orOperand )? ;
    # 
    def orOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = OrOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __AND124__ = nil
      op = nil
      boolOperand123 = nil

      tree_for_AND124 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 225:4: boolOperand ( AND op= orOperand )?
        @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_orOperand_1150 )
        boolOperand123 = boolOperand
        @state.following.pop
        @adaptor.add_child( root_0, boolOperand123.tree )
        # --> action
        return_value.result = ( boolOperand123.nil? ? nil : boolOperand123.result )
        # <-- action
        # at line 226:3: ( AND op= orOperand )?
        alt_33 = 2
        look_33_0 = @input.peek( 1 )

        if ( look_33_0 == AND )
          alt_33 = 1
        end
        case alt_33
        when 1
          # at line 226:4: AND op= orOperand
          __AND124__ = match( AND, TOKENS_FOLLOWING_AND_IN_orOperand_1157 )

          tree_for_AND124 = @adaptor.create_with_payload( __AND124__ )
          root_0 = @adaptor.become_root( tree_for_AND124, root_0 )

          @state.following.push( TOKENS_FOLLOWING_orOperand_IN_orOperand_1162 )
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
    # 229:1: boolOperand returns [result] : ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) );
    # 
    def boolOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = BoolOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NOT126__ = nil
      __LB127__ = nil
      __RB129__ = nil
      __EQ130__ = nil
      __NE131__ = nil
      __LT132__ = nil
      __GT133__ = nil
      __LE134__ = nil
      __GE135__ = nil
      op1 = nil
      op2 = nil
      bool125 = nil
      condition128 = nil

      tree_for_NOT126 = nil
      tree_for_LB127 = nil
      tree_for_RB129 = nil
      tree_for_EQ130 = nil
      tree_for_NE131 = nil
      tree_for_LT132 = nil
      tree_for_GT133 = nil
      tree_for_LE134 = nil
      tree_for_GE135 = nil

      begin
        # at line 230:2: ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) )
        alt_41 = 3
        case look_41 = @input.peek( 1 )
        when TRUE, FALSE then alt_41 = 1
        when NOT then alt_41 = 2
        when READ, LB, PLUS, MINUS, INT, ID, OPENFILE, SIZEOF, READNUMBER, NULL, ALLOC, STRING, T__67 then alt_41 = 3
        else
          raise NoViableAlternative( "", 41, 0 )
        end
        case alt_41
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 230:4: bool
          @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1181 )
          bool125 = bool
          @state.following.pop
          @adaptor.add_child( root_0, bool125.tree )
          # --> action
          return_value.result = ( bool125.nil? ? nil : bool125.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 231:4: NOT LB condition RB
          __NOT126__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_boolOperand_1188 )

          tree_for_NOT126 = @adaptor.create_with_payload( __NOT126__ )
          @adaptor.add_child( root_0, tree_for_NOT126 )

          __LB127__ = match( LB, TOKENS_FOLLOWING_LB_IN_boolOperand_1190 )
          @state.following.push( TOKENS_FOLLOWING_condition_IN_boolOperand_1193 )
          condition128 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition128.tree )
          __RB129__ = match( RB, TOKENS_FOLLOWING_RB_IN_boolOperand_1195 )
          # --> action
          return_value.result = !( condition128.nil? ? nil : condition128.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 232:4: op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1205 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # at line 232:19: ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
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
            # at line 232:20: EQ (op2= bool | op2= expression )
            __EQ130__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_boolOperand_1208 )

            tree_for_EQ130 = @adaptor.create_with_payload( __EQ130__ )
            root_0 = @adaptor.become_root( tree_for_EQ130, root_0 )

            # at line 232:24: (op2= bool | op2= expression )
            alt_34 = 2
            look_34_0 = @input.peek( 1 )

            if ( look_34_0.between?( TRUE, FALSE ) )
              alt_34 = 1
            elsif ( look_34_0 == READ || look_34_0 == LB || look_34_0.between?( PLUS, INT ) || look_34_0 == ID || look_34_0.between?( OPENFILE, READNUMBER ) || look_34_0.between?( NULL, ALLOC ) || look_34_0 == STRING || look_34_0 == T__67 )
              alt_34 = 2
            else
              raise NoViableAlternative( "", 34, 0 )
            end
            case alt_34
            when 1
              # at line 232:26: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1215 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 232:37: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1221 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:eq)),op2.tree]
            # <-- action

          when 2
            # at line 233:6: NE (op2= bool | op2= expression )
            __NE131__ = match( NE, TOKENS_FOLLOWING_NE_IN_boolOperand_1232 )

            tree_for_NE131 = @adaptor.create_with_payload( __NE131__ )
            root_0 = @adaptor.become_root( tree_for_NE131, root_0 )

            # at line 233:10: (op2= bool | op2= expression )
            alt_35 = 2
            look_35_0 = @input.peek( 1 )

            if ( look_35_0.between?( TRUE, FALSE ) )
              alt_35 = 1
            elsif ( look_35_0 == READ || look_35_0 == LB || look_35_0.between?( PLUS, INT ) || look_35_0 == ID || look_35_0.between?( OPENFILE, READNUMBER ) || look_35_0.between?( NULL, ALLOC ) || look_35_0 == STRING || look_35_0 == T__67 )
              alt_35 = 2
            else
              raise NoViableAlternative( "", 35, 0 )
            end
            case alt_35
            when 1
              # at line 233:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1239 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 233:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1245 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:ne)),op2.tree]
            # <-- action

          when 3
            # at line 234:6: LT (op2= bool | op2= expression )
            __LT132__ = match( LT, TOKENS_FOLLOWING_LT_IN_boolOperand_1256 )

            tree_for_LT132 = @adaptor.create_with_payload( __LT132__ )
            root_0 = @adaptor.become_root( tree_for_LT132, root_0 )

            # at line 234:10: (op2= bool | op2= expression )
            alt_36 = 2
            look_36_0 = @input.peek( 1 )

            if ( look_36_0.between?( TRUE, FALSE ) )
              alt_36 = 1
            elsif ( look_36_0 == READ || look_36_0 == LB || look_36_0.between?( PLUS, INT ) || look_36_0 == ID || look_36_0.between?( OPENFILE, READNUMBER ) || look_36_0.between?( NULL, ALLOC ) || look_36_0 == STRING || look_36_0 == T__67 )
              alt_36 = 2
            else
              raise NoViableAlternative( "", 36, 0 )
            end
            case alt_36
            when 1
              # at line 234:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1263 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 234:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1269 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:lt)),op2.tree]
            # <-- action

          when 4
            # at line 235:6: GT (op2= bool | op2= expression )
            __GT133__ = match( GT, TOKENS_FOLLOWING_GT_IN_boolOperand_1280 )

            tree_for_GT133 = @adaptor.create_with_payload( __GT133__ )
            root_0 = @adaptor.become_root( tree_for_GT133, root_0 )

            # at line 235:10: (op2= bool | op2= expression )
            alt_37 = 2
            look_37_0 = @input.peek( 1 )

            if ( look_37_0.between?( TRUE, FALSE ) )
              alt_37 = 1
            elsif ( look_37_0 == READ || look_37_0 == LB || look_37_0.between?( PLUS, INT ) || look_37_0 == ID || look_37_0.between?( OPENFILE, READNUMBER ) || look_37_0.between?( NULL, ALLOC ) || look_37_0 == STRING || look_37_0 == T__67 )
              alt_37 = 2
            else
              raise NoViableAlternative( "", 37, 0 )
            end
            case alt_37
            when 1
              # at line 235:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1287 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 235:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1293 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:gt)),op2.tree]
            # <-- action

          when 5
            # at line 236:6: LE (op2= bool | op2= expression )
            __LE134__ = match( LE, TOKENS_FOLLOWING_LE_IN_boolOperand_1304 )

            tree_for_LE134 = @adaptor.create_with_payload( __LE134__ )
            root_0 = @adaptor.become_root( tree_for_LE134, root_0 )

            # at line 236:10: (op2= bool | op2= expression )
            alt_38 = 2
            look_38_0 = @input.peek( 1 )

            if ( look_38_0.between?( TRUE, FALSE ) )
              alt_38 = 1
            elsif ( look_38_0 == READ || look_38_0 == LB || look_38_0.between?( PLUS, INT ) || look_38_0 == ID || look_38_0.between?( OPENFILE, READNUMBER ) || look_38_0.between?( NULL, ALLOC ) || look_38_0 == STRING || look_38_0 == T__67 )
              alt_38 = 2
            else
              raise NoViableAlternative( "", 38, 0 )
            end
            case alt_38
            when 1
              # at line 236:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1311 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 236:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1317 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:le)),op2.tree]
            # <-- action

          when 6
            # at line 237:6: GE (op2= bool | op2= expression )
            __GE135__ = match( GE, TOKENS_FOLLOWING_GE_IN_boolOperand_1328 )

            tree_for_GE135 = @adaptor.create_with_payload( __GE135__ )
            root_0 = @adaptor.become_root( tree_for_GE135, root_0 )

            # at line 237:10: (op2= bool | op2= expression )
            alt_39 = 2
            look_39_0 = @input.peek( 1 )

            if ( look_39_0.between?( TRUE, FALSE ) )
              alt_39 = 1
            elsif ( look_39_0 == READ || look_39_0 == LB || look_39_0.between?( PLUS, INT ) || look_39_0 == ID || look_39_0.between?( OPENFILE, READNUMBER ) || look_39_0.between?( NULL, ALLOC ) || look_39_0 == STRING || look_39_0 == T__67 )
              alt_39 = 2
            else
              raise NoViableAlternative( "", 39, 0 )
            end
            case alt_39
            when 1
              # at line 237:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1335 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 237:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1341 )
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
    # 242:1: expression returns [result] : addOperand ( PLUS op= expression | MINUS op= expression )? ;
    # 
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS137__ = nil
      __MINUS138__ = nil
      op = nil
      addOperand136 = nil

      tree_for_PLUS137 = nil
      tree_for_MINUS138 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 243:4: addOperand ( PLUS op= expression | MINUS op= expression )?
        @state.following.push( TOKENS_FOLLOWING_addOperand_IN_expression_1366 )
        addOperand136 = addOperand
        @state.following.pop
        @adaptor.add_child( root_0, addOperand136.tree )
        # --> action
        return_value.result = ( addOperand136.nil? ? nil : addOperand136.result )
        # <-- action
        # at line 244:3: ( PLUS op= expression | MINUS op= expression )?
        alt_42 = 3
        look_42_0 = @input.peek( 1 )

        if ( look_42_0 == PLUS )
          alt_42 = 1
        elsif ( look_42_0 == MINUS )
          alt_42 = 2
        end
        case alt_42
        when 1
          # at line 245:4: PLUS op= expression
          __PLUS137__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expression_1377 )

          tree_for_PLUS137 = @adaptor.create_with_payload( __PLUS137__ )
          root_0 = @adaptor.become_root( tree_for_PLUS137, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1382 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:add)),op.tree]
          # <-- action

        when 2
          # at line 246:5: MINUS op= expression
          __MINUS138__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expression_1390 )

          tree_for_MINUS138 = @adaptor.create_with_payload( __MINUS138__ )
          root_0 = @adaptor.become_root( tree_for_MINUS138, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1395 )
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
    # 250:1: addOperand returns [result] : mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )? ;
    # 
    def addOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = AddOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __MUL140__ = nil
      __DIV141__ = nil
      __MOD142__ = nil
      op = nil
      mulOperand139 = nil

      tree_for_MUL140 = nil
      tree_for_DIV141 = nil
      tree_for_MOD142 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 251:4: mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperand_1417 )
        mulOperand139 = mulOperand
        @state.following.pop
        @adaptor.add_child( root_0, mulOperand139.tree )
        # --> action
        return_value.result = ( mulOperand139.nil? ? nil : mulOperand139.result )
        # <-- action
        # at line 252:3: ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        alt_43 = 4
        case look_43 = @input.peek( 1 )
        when MUL then alt_43 = 1
        when DIV then alt_43 = 2
        when MOD then alt_43 = 3
        end
        case alt_43
        when 1
          # at line 253:4: MUL op= addOperand
          __MUL140__ = match( MUL, TOKENS_FOLLOWING_MUL_IN_addOperand_1428 )

          tree_for_MUL140 = @adaptor.create_with_payload( __MUL140__ )
          root_0 = @adaptor.become_root( tree_for_MUL140, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1433 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:mul)),op.tree]
          # <-- action

        when 2
          # at line 254:5: DIV op= addOperand
          __DIV141__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_addOperand_1441 )

          tree_for_DIV141 = @adaptor.create_with_payload( __DIV141__ )
          root_0 = @adaptor.become_root( tree_for_DIV141, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1446 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:div)),op.tree]
          # <-- action

        when 3
          # at line 255:5: MOD op= addOperand
          __MOD142__ = match( MOD, TOKENS_FOLLOWING_MOD_IN_addOperand_1454 )

          tree_for_MOD142 = @adaptor.create_with_payload( __MOD142__ )
          root_0 = @adaptor.become_root( tree_for_MOD142, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1459 )
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
    # 259:1: mulOperand returns [result] : ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest );
    # 
    def mulOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = MulOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS143__ = nil
      __MINUS145__ = nil
      mulOperandRest144 = nil
      mulOperandRest146 = nil
      mulOperandRest147 = nil

      tree_for_PLUS143 = nil
      tree_for_MINUS145 = nil

      begin
        # at line 260:2: ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest )
        alt_44 = 3
        case look_44 = @input.peek( 1 )
        when PLUS then alt_44 = 1
        when MINUS then alt_44 = 2
        when READ, LB, INT, ID, OPENFILE, SIZEOF, READNUMBER, NULL, ALLOC, STRING, T__67 then alt_44 = 3
        else
          raise NoViableAlternative( "", 44, 0 )
        end
        case alt_44
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 260:4: PLUS mulOperandRest
          __PLUS143__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_mulOperand_1481 )

          tree_for_PLUS143 = @adaptor.create_with_payload( __PLUS143__ )
          @adaptor.add_child( root_0, tree_for_PLUS143 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1483 )
          mulOperandRest144 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest144.tree )
          # --> action
          return_value.result = ( mulOperandRest144.nil? ? nil : mulOperandRest144.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 261:4: MINUS mulOperandRest
          __MINUS145__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_mulOperand_1490 )

          tree_for_MINUS145 = @adaptor.create_with_payload( __MINUS145__ )
          @adaptor.add_child( root_0, tree_for_MINUS145 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1492 )
          mulOperandRest146 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest146.tree )
          # --> action
          return_value.result = [UnaryOperatorTree.new(( mulOperandRest146.nil? ? nil : mulOperandRest146.result ),Operators.method(:neg)),mulOperandRest146.tree]
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 262:4: mulOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1499 )
          mulOperandRest147 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest147.tree )
          # --> action
          return_value.result = ( mulOperandRest147.nil? ? nil : mulOperandRest147.result )
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
    # 265:1: mulOperandRest returns [result] : arrayIndexTarget ( '[' expression ']' )* ;
    # 
    def mulOperandRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = MulOperandRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal149 = nil
      char_literal151 = nil
      arrayIndexTarget148 = nil
      expression150 = nil

      tree_for_char_literal149 = nil
      tree_for_char_literal151 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 266:4: arrayIndexTarget ( '[' expression ']' )*
        @state.following.push( TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1516 )
        arrayIndexTarget148 = arrayIndexTarget
        @state.following.pop
        @adaptor.add_child( root_0, arrayIndexTarget148.tree )
        # --> action
        return_value.result = ( arrayIndexTarget148.nil? ? nil : arrayIndexTarget148.result )
        # <-- action
        # at line 267:3: ( '[' expression ']' )*
        while true # decision 45
          alt_45 = 2
          look_45_0 = @input.peek( 1 )

          if ( look_45_0 == T__67 )
            alt_45 = 1

          end
          case alt_45
          when 1
            # at line 267:4: '[' expression ']'
            char_literal149 = match( T__67, TOKENS_FOLLOWING_T__67_IN_mulOperandRest_1524 )

            tree_for_char_literal149 = @adaptor.create_with_payload( char_literal149 )
            @adaptor.add_child( root_0, tree_for_char_literal149 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_mulOperandRest_1526 )
            expression150 = expression
            @state.following.pop
            @adaptor.add_child( root_0, expression150.tree )
            char_literal151 = match( T__68, TOKENS_FOLLOWING_T__68_IN_mulOperandRest_1528 )

            tree_for_char_literal151 = @adaptor.create_with_payload( char_literal151 )
            @adaptor.add_child( root_0, tree_for_char_literal151 )

            # --> action
             return_value.result = [IndexTree.new(return_value.result,( expression150.nil? ? nil : expression150.result )),expression150.tree] 
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
    # 270:1: closeFile returns [result] : CLOSEFILE LB expression RB ;
    # 
    def closeFile
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = CloseFileReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __CLOSEFILE152__ = nil
      __LB153__ = nil
      __RB155__ = nil
      expression154 = nil

      tree_for_CLOSEFILE152 = nil
      tree_for_LB153 = nil
      tree_for_RB155 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 271:4: CLOSEFILE LB expression RB
        __CLOSEFILE152__ = match( CLOSEFILE, TOKENS_FOLLOWING_CLOSEFILE_IN_closeFile_1549 )

        tree_for_CLOSEFILE152 = @adaptor.create_with_payload( __CLOSEFILE152__ )
        @adaptor.add_child( root_0, tree_for_CLOSEFILE152 )

        __LB153__ = match( LB, TOKENS_FOLLOWING_LB_IN_closeFile_1551 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_closeFile_1554 )
        expression154 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression154.tree )
        __RB155__ = match( RB, TOKENS_FOLLOWING_RB_IN_closeFile_1556 )
        # --> action
        return_value.result = [CloseFileTree.new(( expression154.nil? ? nil : expression154.result )),tree_for_CLOSEFILE152]
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
    # 274:1: openFile returns [result] : OPENFILE LB what= expression COMMA mode= expression RB ;
    # 
    def openFile
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = OpenFileReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENFILE156__ = nil
      __LB157__ = nil
      __COMMA158__ = nil
      __RB159__ = nil
      what = nil
      mode = nil

      tree_for_OPENFILE156 = nil
      tree_for_LB157 = nil
      tree_for_COMMA158 = nil
      tree_for_RB159 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 275:4: OPENFILE LB what= expression COMMA mode= expression RB
        __OPENFILE156__ = match( OPENFILE, TOKENS_FOLLOWING_OPENFILE_IN_openFile_1577 )

        tree_for_OPENFILE156 = @adaptor.create_with_payload( __OPENFILE156__ )
        @adaptor.add_child( root_0, tree_for_OPENFILE156 )

        __LB157__ = match( LB, TOKENS_FOLLOWING_LB_IN_openFile_1579 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_openFile_1584 )
        what = expression
        @state.following.pop
        @adaptor.add_child( root_0, what.tree )
        __COMMA158__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_openFile_1586 )

        tree_for_COMMA158 = @adaptor.create_with_payload( __COMMA158__ )
        @adaptor.add_child( root_0, tree_for_COMMA158 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_openFile_1590 )
        mode = expression
        @state.following.pop
        @adaptor.add_child( root_0, mode.tree )
        __RB159__ = match( RB, TOKENS_FOLLOWING_RB_IN_openFile_1592 )
        # --> action
        return_value.result = [OpenFileTree.new(( what.nil? ? nil : what.result ), ( mode.nil? ? nil : mode.result )),tree_for_OPENFILE156]
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

    SizeOfReturnValue = define_return_scope :result

    # 
    # parser rule sizeOf
    # 
    # (in Giraffe.g)
    # 278:1: sizeOf returns [result] : SIZEOF LB expression RB ;
    # 
    def sizeOf
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = SizeOfReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __SIZEOF160__ = nil
      __LB161__ = nil
      __RB163__ = nil
      expression162 = nil

      tree_for_SIZEOF160 = nil
      tree_for_LB161 = nil
      tree_for_RB163 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 279:4: SIZEOF LB expression RB
        __SIZEOF160__ = match( SIZEOF, TOKENS_FOLLOWING_SIZEOF_IN_sizeOf_1612 )

        tree_for_SIZEOF160 = @adaptor.create_with_payload( __SIZEOF160__ )
        @adaptor.add_child( root_0, tree_for_SIZEOF160 )

        __LB161__ = match( LB, TOKENS_FOLLOWING_LB_IN_sizeOf_1614 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_sizeOf_1617 )
        expression162 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression162.tree )
        __RB163__ = match( RB, TOKENS_FOLLOWING_RB_IN_sizeOf_1619 )
        # --> action
        return_value.result = [SizeofTree.new(( expression162.nil? ? nil : expression162.result )),tree_for_SIZEOF160]
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

    ReadNumberReturnValue = define_return_scope :result

    # 
    # parser rule readNumber
    # 
    # (in Giraffe.g)
    # 282:1: readNumber returns [result] : READNUMBER LB expression RB ;
    # 
    def readNumber
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = ReadNumberReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __READNUMBER164__ = nil
      __LB165__ = nil
      __RB167__ = nil
      expression166 = nil

      tree_for_READNUMBER164 = nil
      tree_for_LB165 = nil
      tree_for_RB167 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 283:4: READNUMBER LB expression RB
        __READNUMBER164__ = match( READNUMBER, TOKENS_FOLLOWING_READNUMBER_IN_readNumber_1640 )

        tree_for_READNUMBER164 = @adaptor.create_with_payload( __READNUMBER164__ )
        @adaptor.add_child( root_0, tree_for_READNUMBER164 )

        __LB165__ = match( LB, TOKENS_FOLLOWING_LB_IN_readNumber_1642 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_readNumber_1645 )
        expression166 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression166.tree )
        __RB167__ = match( RB, TOKENS_FOLLOWING_RB_IN_readNumber_1647 )
        # --> action
        return_value.result = [ReadNumberTree.new(( expression166.nil? ? nil : expression166.result )),tree_for_READNUMBER164]
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

    WriteFileReturnValue = define_return_scope :result

    # 
    # parser rule writeFile
    # 
    # (in Giraffe.g)
    # 286:1: writeFile returns [result] : WRITEFILE LB where= expression COMMA what= expression RB ;
    # 
    def writeFile
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = WriteFileReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WRITEFILE168__ = nil
      __LB169__ = nil
      __COMMA170__ = nil
      __RB171__ = nil
      where = nil
      what = nil

      tree_for_WRITEFILE168 = nil
      tree_for_LB169 = nil
      tree_for_COMMA170 = nil
      tree_for_RB171 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 287:4: WRITEFILE LB where= expression COMMA what= expression RB
        __WRITEFILE168__ = match( WRITEFILE, TOKENS_FOLLOWING_WRITEFILE_IN_writeFile_1668 )

        tree_for_WRITEFILE168 = @adaptor.create_with_payload( __WRITEFILE168__ )
        @adaptor.add_child( root_0, tree_for_WRITEFILE168 )

        __LB169__ = match( LB, TOKENS_FOLLOWING_LB_IN_writeFile_1670 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_writeFile_1675 )
        where = expression
        @state.following.pop
        @adaptor.add_child( root_0, where.tree )
        __COMMA170__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_writeFile_1677 )

        tree_for_COMMA170 = @adaptor.create_with_payload( __COMMA170__ )
        @adaptor.add_child( root_0, tree_for_COMMA170 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_writeFile_1681 )
        what = expression
        @state.following.pop
        @adaptor.add_child( root_0, what.tree )
        __RB171__ = match( RB, TOKENS_FOLLOWING_RB_IN_writeFile_1683 )
        # --> action
        return_value.result = [WriteFileTree.new(( where.nil? ? nil : where.result ), ( what.nil? ? nil : what.result )),tree_for_WRITEFILE168]
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

    ArrayIndexTargetReturnValue = define_return_scope :result

    # 
    # parser rule arrayIndexTarget
    # 
    # (in Giraffe.g)
    # 290:1: arrayIndexTarget returns [result] : ( ID | LB expression RB | INT | call | array | alloc | readInstruction | string | NULL | openFile | sizeOf | readNumber );
    # 
    def arrayIndexTarget
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = ArrayIndexTargetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID172__ = nil
      __LB173__ = nil
      __RB175__ = nil
      __INT176__ = nil
      __NULL182__ = nil
      expression174 = nil
      call177 = nil
      array178 = nil
      alloc179 = nil
      readInstruction180 = nil
      string181 = nil
      openFile183 = nil
      sizeOf184 = nil
      readNumber185 = nil

      tree_for_ID172 = nil
      tree_for_LB173 = nil
      tree_for_RB175 = nil
      tree_for_INT176 = nil
      tree_for_NULL182 = nil

      begin
        # at line 291:2: ( ID | LB expression RB | INT | call | array | alloc | readInstruction | string | NULL | openFile | sizeOf | readNumber )
        alt_46 = 12
        alt_46 = @dfa46.predict( @input )
        case alt_46
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 291:4: ID
          __ID172__ = match( ID, TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1706 )

          tree_for_ID172 = @adaptor.create_with_payload( __ID172__ )
          @adaptor.add_child( root_0, tree_for_ID172 )

          # --> action
          return_value.result = [VarTree.new(__ID172__.text),tree_for_ID172]
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 292:4: LB expression RB
          __LB173__ = match( LB, TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1713 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1716 )
          expression174 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression174.tree )
          __RB175__ = match( RB, TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1718 )
          # --> action
          return_value.result = ( expression174.nil? ? nil : expression174.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 293:4: INT
          __INT176__ = match( INT, TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1726 )

          tree_for_INT176 = @adaptor.create_with_payload( __INT176__ )
          @adaptor.add_child( root_0, tree_for_INT176 )

          # --> action
          return_value.result = [AtomTree.new(__INT176__.text.to_i),tree_for_INT176]
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 294:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1733 )
          call177 = call
          @state.following.pop
          @adaptor.add_child( root_0, call177.tree )
          # --> action
          return_value.result = ( call177.nil? ? nil : call177.result )
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 295:4: array
          @state.following.push( TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1740 )
          array178 = array
          @state.following.pop
          @adaptor.add_child( root_0, array178.tree )
          # --> action
          return_value.result = [ArrayTree.new(( array178.nil? ? nil : array178.result )),array178.tree]
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 296:4: alloc
          @state.following.push( TOKENS_FOLLOWING_alloc_IN_arrayIndexTarget_1747 )
          alloc179 = alloc
          @state.following.pop
          @adaptor.add_child( root_0, alloc179.tree )
          # --> action
          return_value.result = ( alloc179.nil? ? nil : alloc179.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 297:4: readInstruction
          @state.following.push( TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1754 )
          readInstruction180 = readInstruction
          @state.following.pop
          @adaptor.add_child( root_0, readInstruction180.tree )
          # --> action
          return_value.result = ( readInstruction180.nil? ? nil : readInstruction180.result )
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 298:4: string
          @state.following.push( TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1761 )
          string181 = string
          @state.following.pop
          @adaptor.add_child( root_0, string181.tree )
          # --> action
          return_value.result = [StringTree.new(( string181.nil? ? nil : string181.result )),string181.tree]
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 299:4: NULL
          __NULL182__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_arrayIndexTarget_1768 )

          tree_for_NULL182 = @adaptor.create_with_payload( __NULL182__ )
          @adaptor.add_child( root_0, tree_for_NULL182 )

          # --> action
          return_value.result = [NilTree.new,tree_for_NULL182]
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 300:4: openFile
          @state.following.push( TOKENS_FOLLOWING_openFile_IN_arrayIndexTarget_1775 )
          openFile183 = openFile
          @state.following.pop
          @adaptor.add_child( root_0, openFile183.tree )
          # --> action
          return_value.result = ( openFile183.nil? ? nil : openFile183.result )
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 301:4: sizeOf
          @state.following.push( TOKENS_FOLLOWING_sizeOf_IN_arrayIndexTarget_1782 )
          sizeOf184 = sizeOf
          @state.following.pop
          @adaptor.add_child( root_0, sizeOf184.tree )
          # --> action
          return_value.result = ( sizeOf184.nil? ? nil : sizeOf184.result )
          # <-- action

        when 12
          root_0 = @adaptor.create_flat_list


          # at line 302:4: readNumber
          @state.following.push( TOKENS_FOLLOWING_readNumber_IN_arrayIndexTarget_1789 )
          readNumber185 = readNumber
          @state.following.pop
          @adaptor.add_child( root_0, readNumber185.tree )
          # --> action
          return_value.result = ( readNumber185.nil? ? nil : readNumber185.result )
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
        # trace_out( __method__, 39 )

      end
      
      return return_value
    end

    ArrayReturnValue = define_return_scope :result

    # 
    # parser rule array
    # 
    # (in Giraffe.g)
    # 305:1: array returns [result] : '[' ( ( '\\n' )? ex1= expression ( COMMA ( '\\n' )? ex2= expression )* )? ( '\\n' )? ']' ;
    # 
    def array
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = ArrayReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal186 = nil
      char_literal187 = nil
      __COMMA188__ = nil
      char_literal189 = nil
      char_literal190 = nil
      char_literal191 = nil
      ex1 = nil
      ex2 = nil

      tree_for_char_literal186 = nil
      tree_for_char_literal187 = nil
      tree_for_COMMA188 = nil
      tree_for_char_literal189 = nil
      tree_for_char_literal190 = nil
      tree_for_char_literal191 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 306:4: '[' ( ( '\\n' )? ex1= expression ( COMMA ( '\\n' )? ex2= expression )* )? ( '\\n' )? ']'
        char_literal186 = match( T__67, TOKENS_FOLLOWING_T__67_IN_array_1806 )

        tree_for_char_literal186 = @adaptor.create_with_payload( char_literal186 )
        @adaptor.add_child( root_0, tree_for_char_literal186 )

        # --> action
        return_value.result = []
        # <-- action
        # at line 307:3: ( ( '\\n' )? ex1= expression ( COMMA ( '\\n' )? ex2= expression )* )?
        alt_50 = 2
        look_50_0 = @input.peek( 1 )

        if ( look_50_0 == T__66 )
          look_50_1 = @input.peek( 2 )

          if ( look_50_1 == READ || look_50_1 == LB || look_50_1.between?( PLUS, INT ) || look_50_1 == ID || look_50_1.between?( OPENFILE, READNUMBER ) || look_50_1.between?( NULL, ALLOC ) || look_50_1 == STRING || look_50_1 == T__67 )
            alt_50 = 1
          end
        elsif ( look_50_0 == READ || look_50_0 == LB || look_50_0.between?( PLUS, INT ) || look_50_0 == ID || look_50_0.between?( OPENFILE, READNUMBER ) || look_50_0.between?( NULL, ALLOC ) || look_50_0 == STRING || look_50_0 == T__67 )
          alt_50 = 1
        end
        case alt_50
        when 1
          # at line 307:4: ( '\\n' )? ex1= expression ( COMMA ( '\\n' )? ex2= expression )*
          # at line 307:4: ( '\\n' )?
          alt_47 = 2
          look_47_0 = @input.peek( 1 )

          if ( look_47_0 == T__66 )
            alt_47 = 1
          end
          case alt_47
          when 1
            # at line 307:4: '\\n'
            char_literal187 = match( T__66, TOKENS_FOLLOWING_T__66_IN_array_1813 )

            tree_for_char_literal187 = @adaptor.create_with_payload( char_literal187 )
            @adaptor.add_child( root_0, tree_for_char_literal187 )


          end
          @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1818 )
          ex1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, ex1.tree )
          # --> action
          return_value.result << ( ex1.nil? ? nil : ex1.result )
          # <-- action
          # at line 308:3: ( COMMA ( '\\n' )? ex2= expression )*
          while true # decision 49
            alt_49 = 2
            look_49_0 = @input.peek( 1 )

            if ( look_49_0 == COMMA )
              alt_49 = 1

            end
            case alt_49
            when 1
              # at line 308:4: COMMA ( '\\n' )? ex2= expression
              __COMMA188__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_array_1825 )

              tree_for_COMMA188 = @adaptor.create_with_payload( __COMMA188__ )
              @adaptor.add_child( root_0, tree_for_COMMA188 )

              # at line 308:10: ( '\\n' )?
              alt_48 = 2
              look_48_0 = @input.peek( 1 )

              if ( look_48_0 == T__66 )
                alt_48 = 1
              end
              case alt_48
              when 1
                # at line 308:10: '\\n'
                char_literal189 = match( T__66, TOKENS_FOLLOWING_T__66_IN_array_1827 )

                tree_for_char_literal189 = @adaptor.create_with_payload( char_literal189 )
                @adaptor.add_child( root_0, tree_for_char_literal189 )


              end
              @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1832 )
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
        # at line 309:3: ( '\\n' )?
        alt_51 = 2
        look_51_0 = @input.peek( 1 )

        if ( look_51_0 == T__66 )
          alt_51 = 1
        end
        case alt_51
        when 1
          # at line 309:3: '\\n'
          char_literal190 = match( T__66, TOKENS_FOLLOWING_T__66_IN_array_1843 )

          tree_for_char_literal190 = @adaptor.create_with_payload( char_literal190 )
          @adaptor.add_child( root_0, tree_for_char_literal190 )


        end
        char_literal191 = match( T__68, TOKENS_FOLLOWING_T__68_IN_array_1846 )

        tree_for_char_literal191 = @adaptor.create_with_payload( char_literal191 )
        @adaptor.add_child( root_0, tree_for_char_literal191 )

        # - - - - - - - rule clean up - - - - - - - -
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

    AllocReturnValue = define_return_scope :result

    # 
    # parser rule alloc
    # 
    # (in Giraffe.g)
    # 312:1: alloc returns [result] : ALLOC LB expression RB ;
    # 
    def alloc
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = AllocReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ALLOC192__ = nil
      __LB193__ = nil
      __RB195__ = nil
      expression194 = nil

      tree_for_ALLOC192 = nil
      tree_for_LB193 = nil
      tree_for_RB195 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 313:4: ALLOC LB expression RB
        __ALLOC192__ = match( ALLOC, TOKENS_FOLLOWING_ALLOC_IN_alloc_1862 )

        tree_for_ALLOC192 = @adaptor.create_with_payload( __ALLOC192__ )
        @adaptor.add_child( root_0, tree_for_ALLOC192 )

        __LB193__ = match( LB, TOKENS_FOLLOWING_LB_IN_alloc_1864 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_alloc_1867 )
        expression194 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression194.tree )
        __RB195__ = match( RB, TOKENS_FOLLOWING_RB_IN_alloc_1869 )
        # --> action
        return_value.result = [AllocTree.new(( expression194.nil? ? nil : expression194.result )),tree_for_ALLOC192]
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

    IndexedReturnValue = define_return_scope :result

    # 
    # parser rule indexed
    # 
    # (in Giraffe.g)
    # 318:1: indexed returns [result] : identified ( '[' expression ']' )* ;
    # 
    def indexed
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = IndexedReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal197 = nil
      char_literal199 = nil
      identified196 = nil
      expression198 = nil

      tree_for_char_literal197 = nil
      tree_for_char_literal199 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 319:4: identified ( '[' expression ']' )*
        @state.following.push( TOKENS_FOLLOWING_identified_IN_indexed_1892 )
        identified196 = identified
        @state.following.pop
        @adaptor.add_child( root_0, identified196.tree )
        # --> action
        return_value.result = ( identified196.nil? ? nil : identified196.result )
        # <-- action
        # at line 321:3: ( '[' expression ']' )*
        while true # decision 52
          alt_52 = 2
          look_52_0 = @input.peek( 1 )

          if ( look_52_0 == T__67 )
            alt_52 = 1

          end
          case alt_52
          when 1
            # at line 321:4: '[' expression ']'
            char_literal197 = match( T__67, TOKENS_FOLLOWING_T__67_IN_indexed_1902 )

            tree_for_char_literal197 = @adaptor.create_with_payload( char_literal197 )
            @adaptor.add_child( root_0, tree_for_char_literal197 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_indexed_1904 )
            expression198 = expression
            @state.following.pop
            @adaptor.add_child( root_0, expression198.tree )
            char_literal199 = match( T__68, TOKENS_FOLLOWING_T__68_IN_indexed_1906 )

            tree_for_char_literal199 = @adaptor.create_with_payload( char_literal199 )
            @adaptor.add_child( root_0, tree_for_char_literal199 )

            # --> action
            return_value.result = [IndexTree.new(return_value.result, ( expression198.nil? ? nil : expression198.result )),identified196.tree]
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
        # trace_out( __method__, 42 )

      end
      
      return return_value
    end

    IdentifiedReturnValue = define_return_scope :result

    # 
    # parser rule identified
    # 
    # (in Giraffe.g)
    # 326:1: identified returns [result] : ID ;
    # 
    def identified
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = IdentifiedReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID200__ = nil

      tree_for_ID200 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 327:4: ID
        __ID200__ = match( ID, TOKENS_FOLLOWING_ID_IN_identified_1927 )

        tree_for_ID200 = @adaptor.create_with_payload( __ID200__ )
        @adaptor.add_child( root_0, tree_for_ID200 )

        # --> action
        return_value.result = [VarTree.new(__ID200__.text),tree_for_ID200]
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
        # trace_out( __method__, 43 )

      end
      
      return return_value
    end

    AssignmentReturnValue = define_return_scope :result

    # 
    # parser rule assignment
    # 
    # (in Giraffe.g)
    # 330:1: assignment returns [result] : indexed ASSIGN expression ;
    # 
    def assignment
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = AssignmentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ASSIGN202__ = nil
      indexed201 = nil
      expression203 = nil

      tree_for_ASSIGN202 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 331:4: indexed ASSIGN expression
        @state.following.push( TOKENS_FOLLOWING_indexed_IN_assignment_1944 )
        indexed201 = indexed
        @state.following.pop
        @adaptor.add_child( root_0, indexed201.tree )
        __ASSIGN202__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1946 )

        tree_for_ASSIGN202 = @adaptor.create_with_payload( __ASSIGN202__ )
        root_0 = @adaptor.become_root( tree_for_ASSIGN202, root_0 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1949 )
        expression203 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression203.tree )
        # --> action
         return_value.result = [AssignTree.new(( indexed201.nil? ? nil : indexed201.result ),( expression203.nil? ? nil : expression203.result )),indexed201.tree] 
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

    BoolReturnValue = define_return_scope :result

    # 
    # parser rule bool
    # 
    # (in Giraffe.g)
    # 334:1: fragment bool returns [result] : ( TRUE | FALSE );
    # 
    def bool
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
      return_value = BoolReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __TRUE204__ = nil
      __FALSE205__ = nil

      tree_for_TRUE204 = nil
      tree_for_FALSE205 = nil

      begin
        # at line 336:2: ( TRUE | FALSE )
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


          # at line 336:4: TRUE
          __TRUE204__ = match( TRUE, TOKENS_FOLLOWING_TRUE_IN_bool_1970 )

          tree_for_TRUE204 = @adaptor.create_with_payload( __TRUE204__ )
          @adaptor.add_child( root_0, tree_for_TRUE204 )

          # --> action
          return_value.result = new AtomTree(1)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 337:5: FALSE
          __FALSE205__ = match( FALSE, TOKENS_FOLLOWING_FALSE_IN_bool_1978 )

          tree_for_FALSE205 = @adaptor.create_with_payload( __FALSE205__ )
          @adaptor.add_child( root_0, tree_for_FALSE205 )

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
        # trace_out( __method__, 45 )

      end
      
      return return_value
    end

    fragment :bool rescue nil

    StringReturnValue = define_return_scope :result

    # 
    # parser rule string
    # 
    # (in Giraffe.g)
    # 340:1: string returns [result] : STRING ;
    # 
    def string
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )
      return_value = StringReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __STRING206__ = nil

      tree_for_STRING206 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 341:4: STRING
        __STRING206__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_string_1999 )

        tree_for_STRING206 = @adaptor.create_with_payload( __STRING206__ )
        @adaptor.add_child( root_0, tree_for_STRING206 )

        # --> action
        return_value.result = __STRING206__.text[1..-2]
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
        # trace_out( __method__, 46 )

      end
      
      return return_value
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA10 < ANTLR3::DFA
      EOT = unpack( 15, -1 )
      EOF = unpack( 15, -1 )
      MIN = unpack( 1, 4, 1, 10, 13, -1 )
      MAX = unpack( 1, 66, 1, 67, 13, -1 )
      ACCEPT = unpack( 2, -1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 
                       1, 9, 1, 11, 1, 12, 1, 13, 1, 10, 1, 1 )
      SPECIAL = unpack( 15, -1 )
      TRANSITION = [
        unpack( 2, 12, 1, -1, 1, 9, 1, 7, 1, 8, 5, -1, 1, 6, 1, -1, 1, 3, 
                1, -1, 1, 12, 3, -1, 1, 4, 1, 5, 1, 2, 1, 1, 14, -1, 1, 
                10, 3, -1, 1, 11, 19, -1, 2, 12 ),
        unpack( 1, 13, 37, -1, 1, 14, 18, -1, 1, 14 ),
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
      
      @decision = 10
      

      def description
        <<-'__dfa_description__'.strip!
          99:1: instruction returns [result] : ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | returnInstruction | exitInstruction | breakInstruction | aloneCall | closeFile | writeFile | );
        __dfa_description__
      end
    end
    class DFA46 < ANTLR3::DFA
      EOT = unpack( 14, -1 )
      EOF = unpack( 14, -1 )
      MIN = unpack( 1, 6, 1, 4, 12, -1 )
      MAX = unpack( 1, 67, 1, 68, 12, -1 )
      ACCEPT = unpack( 2, -1, 1, 2, 1, 3, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 
                       1, 10, 1, 11, 1, 12, 1, 4, 1, 1 )
      SPECIAL = unpack( 14, -1 )
      TRANSITION = [
        unpack( 1, 6, 3, -1, 1, 2, 3, -1, 1, 3, 11, -1, 1, 1, 15, -1, 1, 
                9, 1, 10, 1, 11, 1, -1, 1, 8, 1, 5, 3, -1, 1, 7, 15, -1, 
                1, 4 ),
        unpack( 2, 13, 4, -1, 1, 12, 3, 13, 2, -1, 1, 13, 1, -1, 2, 13, 
                 9, -1, 2, 13, 1, -1, 9, 13, 24, -1, 4, 13 ),
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
      
      @decision = 46
      

      def description
        <<-'__dfa_description__'.strip!
          290:1: arrayIndexTarget returns [result] : ( ID | LB expression RB | INT | call | array | alloc | readInstruction | string | NULL | openFile | sizeOf | readNumber );
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
    TOKENS_FOLLOWING_funcdef_IN_functions_98 = Set[ 4, 5, 65, 66 ]
    TOKENS_FOLLOWING_functionsRest_IN_functions_106 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_functionsRest_132 = Set[ 65, 66 ]
    TOKENS_FOLLOWING_T__65_IN_functionsRest_136 = Set[ 66 ]
    TOKENS_FOLLOWING_T__66_IN_functionsRest_140 = Set[ 4, 5, 26, 27, 65, 66 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_functionsRest_146 = Set[ 4, 5, 26, 27, 65, 66 ]
    TOKENS_FOLLOWING_functions_IN_functionsRest_153 = Set[ 1 ]
    TOKENS_FOLLOWING_instruction_IN_block_187 = Set[ 4, 5, 65, 66 ]
    TOKENS_FOLLOWING_instructionRest_IN_block_197 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_instructionRest_223 = Set[ 65, 66 ]
    TOKENS_FOLLOWING_T__65_IN_instructionRest_227 = Set[ 66 ]
    TOKENS_FOLLOWING_T__66_IN_instructionRest_231 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 45, 65, 66 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_237 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 45, 65, 66 ]
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
    TOKENS_FOLLOWING_writeFile_IN_instruction_351 = Set[ 1 ]
    TOKENS_FOLLOWING_READ_IN_readInstruction_374 = Set[ 1 ]
    TOKENS_FOLLOWING_BREAK_IN_breakInstruction_391 = Set[ 1 ]
    TOKENS_FOLLOWING_RETURN_IN_returnInstruction_408 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_expression_IN_returnInstruction_411 = Set[ 1 ]
    TOKENS_FOLLOWING_EXIT_IN_exitInstruction_428 = Set[ 1, 10, 12, 13, 14 ]
    TOKENS_FOLLOWING_LB_IN_exitInstruction_433 = Set[ 12, 13, 14 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_438 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_exitInstruction_440 = Set[ 1 ]
    TOKENS_FOLLOWING_statusCode_IN_exitInstruction_453 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_statusCode_478 = Set[ 14 ]
    TOKENS_FOLLOWING_MINUS_IN_statusCode_482 = Set[ 14 ]
    TOKENS_FOLLOWING_INT_IN_statusCode_488 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINT_IN_printInstruction_509 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_printInstruction_512 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_printText_IN_printInstruction_515 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_printInstruction_517 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_printText_542 = Set[ 1, 16 ]
    TOKENS_FOLLOWING_COMMA_IN_printText_549 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_printText_IN_printText_553 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_ifInstruction_577 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_ifInstruction_580 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 46, 47, 49, 50, 51, 67 ]
    TOKENS_FOLLOWING_condition_IN_ifInstruction_583 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_ifInstruction_585 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_ifInstruction_588 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 45, 65, 66 ]
    TOKENS_FOLLOWING_block_IN_ifInstruction_591 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_ifInstruction_593 = Set[ 20, 21, 22 ]
    TOKENS_FOLLOWING_ifRest_IN_ifInstruction_596 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_ifRest_615 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_617 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 45, 65, 66 ]
    TOKENS_FOLLOWING_block_IN_ifRest_620 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_622 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_ifRest_630 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 46, 47, 49, 50, 51, 67 ]
    TOKENS_FOLLOWING_condition_IN_ifRest_638 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_640 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 45, 65, 66 ]
    TOKENS_FOLLOWING_block_IN_ifRest_643 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_645 = Set[ 20, 21, 22 ]
    TOKENS_FOLLOWING_ifRest_IN_ifRest_650 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_whileCycle_677 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_whileCycle_679 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 46, 47, 49, 50, 51, 67 ]
    TOKENS_FOLLOWING_condition_IN_whileCycle_681 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_whileCycle_683 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_whileCycle_685 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 45, 65, 66 ]
    TOKENS_FOLLOWING_block_IN_whileCycle_688 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_whileCycle_690 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_doCycle_712 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_doCycle_714 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 45, 65, 66 ]
    TOKENS_FOLLOWING_block_IN_doCycle_717 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_doCycle_719 = Set[ 23 ]
    TOKENS_FOLLOWING_WHILE_IN_doCycle_722 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_doCycle_724 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 46, 47, 49, 50, 51, 67 ]
    TOKENS_FOLLOWING_condition_IN_doCycle_726 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_doCycle_728 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_forCycle_749 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_forCycle_751 = Set[ 26 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_755 = Set[ 4, 5, 65, 66 ]
    TOKENS_FOLLOWING_COMMENT_IN_forCycle_760 = Set[ 65, 66 ]
    TOKENS_FOLLOWING_T__65_IN_forCycle_764 = Set[ 66 ]
    TOKENS_FOLLOWING_T__66_IN_forCycle_768 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 46, 47, 49, 50, 51, 67 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_774 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 46, 47, 49, 50, 51, 67 ]
    TOKENS_FOLLOWING_condition_IN_forCycle_779 = Set[ 4, 5, 65, 66 ]
    TOKENS_FOLLOWING_COMMENT_IN_forCycle_784 = Set[ 65, 66 ]
    TOKENS_FOLLOWING_T__65_IN_forCycle_788 = Set[ 66 ]
    TOKENS_FOLLOWING_T__66_IN_forCycle_792 = Set[ 26 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_798 = Set[ 26 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_805 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_forCycle_807 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_forCycle_809 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 45, 65, 66 ]
    TOKENS_FOLLOWING_block_IN_forCycle_812 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_forCycle_814 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_func_836 = Set[ 10, 18 ]
    TOKENS_FOLLOWING_LB_IN_func_839 = Set[ 11, 26 ]
    TOKENS_FOLLOWING_params_IN_func_842 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_func_844 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_func_849 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 45, 65, 66 ]
    TOKENS_FOLLOWING_block_IN_func_852 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_func_854 = Set[ 1 ]
    TOKENS_FOLLOWING_MAIN_IN_func_864 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_func_867 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 41, 45, 65, 66 ]
    TOKENS_FOLLOWING_block_IN_func_870 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_func_872 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_params_892 = Set[ 16 ]
    TOKENS_FOLLOWING_paramRest_IN_params_894 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_paramRest_919 = Set[ 26 ]
    TOKENS_FOLLOWING_params_IN_paramRest_922 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_aloneCall_950 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_aloneCall_953 = Set[ 6, 10, 11, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_args_IN_aloneCall_958 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_aloneCall_961 = Set[ 1, 28 ]
    TOKENS_FOLLOWING_DOT_IN_aloneCall_972 = Set[ 26 ]
    TOKENS_FOLLOWING_ID_IN_aloneCall_976 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_aloneCall_978 = Set[ 6, 10, 11, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_args_IN_aloneCall_983 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_aloneCall_986 = Set[ 1, 28 ]
    TOKENS_FOLLOWING_ID_IN_call_1009 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_call_1012 = Set[ 6, 10, 11, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_args_IN_call_1017 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_call_1020 = Set[ 1, 28 ]
    TOKENS_FOLLOWING_DOT_IN_call_1031 = Set[ 26 ]
    TOKENS_FOLLOWING_ID_IN_call_1035 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_call_1037 = Set[ 6, 10, 11, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_args_IN_call_1042 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_call_1045 = Set[ 1, 28 ]
    TOKENS_FOLLOWING_expression_IN_args_1067 = Set[ 16 ]
    TOKENS_FOLLOWING_argsRest_IN_args_1069 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsRest_1088 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_args_IN_argsRest_1091 = Set[ 1 ]
    TOKENS_FOLLOWING_orOperand_IN_condition_1117 = Set[ 1, 29 ]
    TOKENS_FOLLOWING_OR_IN_condition_1124 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 46, 47, 49, 50, 51, 67 ]
    TOKENS_FOLLOWING_condition_IN_condition_1129 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperand_IN_orOperand_1150 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_AND_IN_orOperand_1157 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 46, 47, 49, 50, 51, 67 ]
    TOKENS_FOLLOWING_orOperand_IN_orOperand_1162 = Set[ 1 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1181 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_boolOperand_1188 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_boolOperand_1190 = Set[ 6, 10, 12, 13, 14, 26, 31, 42, 43, 44, 46, 47, 49, 50, 51, 67 ]
    TOKENS_FOLLOWING_condition_IN_boolOperand_1193 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_boolOperand_1195 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1205 = Set[ 32, 33, 34, 35, 36, 37 ]
    TOKENS_FOLLOWING_EQ_IN_boolOperand_1208 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 49, 50, 51, 67 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1215 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1221 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_boolOperand_1232 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 49, 50, 51, 67 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1239 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1245 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_boolOperand_1256 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 49, 50, 51, 67 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1263 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1269 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_boolOperand_1280 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 49, 50, 51, 67 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1287 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1293 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_boolOperand_1304 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 49, 50, 51, 67 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1311 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1317 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_boolOperand_1328 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 49, 50, 51, 67 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1335 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1341 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperand_IN_expression_1366 = Set[ 1, 12, 13 ]
    TOKENS_FOLLOWING_PLUS_IN_expression_1377 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_expression_IN_expression_1382 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expression_1390 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_expression_IN_expression_1395 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperand_1417 = Set[ 1, 38, 39, 40 ]
    TOKENS_FOLLOWING_MUL_IN_addOperand_1428 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1433 = Set[ 1 ]
    TOKENS_FOLLOWING_DIV_IN_addOperand_1441 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1446 = Set[ 1 ]
    TOKENS_FOLLOWING_MOD_IN_addOperand_1454 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1459 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_mulOperand_1481 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1483 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_mulOperand_1490 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1492 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1499 = Set[ 1 ]
    TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1516 = Set[ 1, 67 ]
    TOKENS_FOLLOWING_T__67_IN_mulOperandRest_1524 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_expression_IN_mulOperandRest_1526 = Set[ 68 ]
    TOKENS_FOLLOWING_T__68_IN_mulOperandRest_1528 = Set[ 1, 67 ]
    TOKENS_FOLLOWING_CLOSEFILE_IN_closeFile_1549 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_closeFile_1551 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_expression_IN_closeFile_1554 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_closeFile_1556 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENFILE_IN_openFile_1577 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_openFile_1579 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_expression_IN_openFile_1584 = Set[ 16 ]
    TOKENS_FOLLOWING_COMMA_IN_openFile_1586 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_expression_IN_openFile_1590 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_openFile_1592 = Set[ 1 ]
    TOKENS_FOLLOWING_SIZEOF_IN_sizeOf_1612 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_sizeOf_1614 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_expression_IN_sizeOf_1617 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_sizeOf_1619 = Set[ 1 ]
    TOKENS_FOLLOWING_READNUMBER_IN_readNumber_1640 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_readNumber_1642 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_expression_IN_readNumber_1645 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_readNumber_1647 = Set[ 1 ]
    TOKENS_FOLLOWING_WRITEFILE_IN_writeFile_1668 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_writeFile_1670 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_expression_IN_writeFile_1675 = Set[ 16 ]
    TOKENS_FOLLOWING_COMMA_IN_writeFile_1677 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_expression_IN_writeFile_1681 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_writeFile_1683 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1706 = Set[ 1 ]
    TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1713 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1716 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1718 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1726 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1733 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1740 = Set[ 1 ]
    TOKENS_FOLLOWING_alloc_IN_arrayIndexTarget_1747 = Set[ 1 ]
    TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1754 = Set[ 1 ]
    TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1761 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_arrayIndexTarget_1768 = Set[ 1 ]
    TOKENS_FOLLOWING_openFile_IN_arrayIndexTarget_1775 = Set[ 1 ]
    TOKENS_FOLLOWING_sizeOf_IN_arrayIndexTarget_1782 = Set[ 1 ]
    TOKENS_FOLLOWING_readNumber_IN_arrayIndexTarget_1789 = Set[ 1 ]
    TOKENS_FOLLOWING_T__67_IN_array_1806 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 66, 67, 68 ]
    TOKENS_FOLLOWING_T__66_IN_array_1813 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_expression_IN_array_1818 = Set[ 16, 66, 68 ]
    TOKENS_FOLLOWING_COMMA_IN_array_1825 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 66, 67 ]
    TOKENS_FOLLOWING_T__66_IN_array_1827 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_expression_IN_array_1832 = Set[ 16, 66, 68 ]
    TOKENS_FOLLOWING_T__66_IN_array_1843 = Set[ 68 ]
    TOKENS_FOLLOWING_T__68_IN_array_1846 = Set[ 1 ]
    TOKENS_FOLLOWING_ALLOC_IN_alloc_1862 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_alloc_1864 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_expression_IN_alloc_1867 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_alloc_1869 = Set[ 1 ]
    TOKENS_FOLLOWING_identified_IN_indexed_1892 = Set[ 1, 67 ]
    TOKENS_FOLLOWING_T__67_IN_indexed_1902 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_expression_IN_indexed_1904 = Set[ 68 ]
    TOKENS_FOLLOWING_T__68_IN_indexed_1906 = Set[ 1, 67 ]
    TOKENS_FOLLOWING_ID_IN_identified_1927 = Set[ 1 ]
    TOKENS_FOLLOWING_indexed_IN_assignment_1944 = Set[ 48 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1946 = Set[ 6, 10, 12, 13, 14, 26, 42, 43, 44, 46, 47, 51, 67 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1949 = Set[ 1 ]
    TOKENS_FOLLOWING_TRUE_IN_bool_1970 = Set[ 1 ]
    TOKENS_FOLLOWING_FALSE_IN_bool_1978 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_string_1999 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end


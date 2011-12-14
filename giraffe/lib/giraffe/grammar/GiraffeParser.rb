#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-12-13 22:44:47
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
require './lib/giraffe/tree/returnTree.rb'
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
    define_tokens( :T__68 => 68, :T__66 => 66, :EXPONENT => 58, :T__67 => 67, 
                   :MAIN => 25, :LT => 30, :T__65 => 65, :RB => 13, :WHILE => 21, 
                   :MOD => 37, :OPENFILE => 39, :OCTAL_ESC => 52, :READNUMBER => 41, 
                   :DO => 22, :FOR => 23, :FLOAT => 59, :NOT => 34, :RCB => 17, 
                   :ID => 24, :AND => 27, :EOF => -1, :BREAK => 56, :IF => 15, 
                   :QUOTE => 61, :ESC_SEQ => 49, :CONTINUE => 57, :QM => 64, 
                   :COMMA => 14, :LCB => 16, :PRINTLN => 54, :RETURN => 7, 
                   :PLUS => 8, :EQ => 28, :DOT => 62, :COMMENT => 4, :NE => 29, 
                   :EXIT => 55, :GE => 33, :UNICODE_ESC => 51, :NULL => 43, 
                   :ELSE => 18, :HEX_DIGIT => 50, :INT => 10, :SEMICOLON => 5, 
                   :MINUS => 9, :TRUE => 46, :MUL => 35, :PRINT => 11, :PRINTL => 53, 
                   :ELSEIF => 19, :COLON => 63, :ELIF => 20, :WS => 60, 
                   :WRITEFILE => 42, :READ => 6, :OR => 26, :ASSIGN => 45, 
                   :SIZEOF => 40, :ALLOC => 44, :GT => 31, :LB => 12, :CLOSEFILE => 38, 
                   :DIV => 36, :FALSE => 47, :LE => 32, :STRING => 48 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "COMMENT", "SEMICOLON", "READ", "RETURN", "PLUS", "MINUS", 
                    "INT", "PRINT", "LB", "RB", "COMMA", "IF", "LCB", "RCB", 
                    "ELSE", "ELSEIF", "ELIF", "WHILE", "DO", "FOR", "ID", 
                    "MAIN", "OR", "AND", "EQ", "NE", "LT", "GT", "LE", "GE", 
                    "NOT", "MUL", "DIV", "MOD", "CLOSEFILE", "OPENFILE", 
                    "SIZEOF", "READNUMBER", "WRITEFILE", "NULL", "ALLOC", 
                    "ASSIGN", "TRUE", "FALSE", "STRING", "ESC_SEQ", "HEX_DIGIT", 
                    "UNICODE_ESC", "OCTAL_ESC", "PRINTL", "PRINTLN", "EXIT", 
                    "BREAK", "CONTINUE", "EXPONENT", "FLOAT", "WS", "QUOTE", 
                    "DOT", "COLON", "QM", "'\\r'", "'\\n'", "'['", "']'" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = Giraffe
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :program, :funcdef, :functions, :functionsRest, :block, 
                     :instructionRest, :instruction, :readInstruction, :returnInstruction, 
                     :statusCode, :printInstruction, :printText, :ifInstruction, 
                     :ifRest, :whileCycle, :doCycle, :forCycle, :func, :params, 
                     :paramRest, :aloneCall, :callVar, :args, :argsRest, 
                     :expression, :orOperand, :andOperand, :compareOperand, 
                     :addOperand, :mulOperand, :mulOperandRest, :closeFile, 
                     :openFile, :sizeOf, :readNumber, :writeFile, :writeFileA, 
                     :arrayIndexTarget, :subexpression, :array, :alloc, 
                     :indexed, :identified, :assignment, :bool, :string ].freeze


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
    # 57:1: program returns [result] : functions ;
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


        # at line 58:4: functions
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
    # 61:1: funcdef returns [result] : ( func | );
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
        # at line 62:2: ( func | )
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


          # at line 62:4: func
          @state.following.push( TOKENS_FOLLOWING_func_IN_funcdef_70 )
          func2 = func
          @state.following.pop
          @adaptor.add_child( root_0, func2.tree )
          # --> action
          return_value.result = ( func2.nil? ? nil : func2.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 63:4: 
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
    # 66:1: functions returns [list] : funcdef functionsRest ;
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


        # at line 67:4: funcdef functionsRest
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
    # 74:1: functionsRest returns [list] : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) functions | );
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
        # at line 75:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) functions | )
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


          # at line 75:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) functions
          # at line 75:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
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
            # at line 75:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 75:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 75:8: ( COMMENT )? ( '\\r' )? '\\n'
            # at line 75:15: ( COMMENT )?
            alt_2 = 2
            look_2_0 = @input.peek( 1 )

            if ( look_2_0 == COMMENT )
              alt_2 = 1
            end
            case alt_2
            when 1
              # at line 75:15: COMMENT
              __COMMENT5__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_functionsRest_132 )

            end
            # at line 75:22: ( '\\r' )?
            alt_3 = 2
            look_3_0 = @input.peek( 1 )

            if ( look_3_0 == T__65 )
              alt_3 = 1
            end
            case alt_3
            when 1
              # at line 75:22: '\\r'
              char_literal6 = match( T__65, TOKENS_FOLLOWING_T__65_IN_functionsRest_136 )

            end
            char_literal7 = match( T__66, TOKENS_FOLLOWING_T__66_IN_functionsRest_140 )


          when 2
            # at line 75:34: SEMICOLON
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


          # at line 78:4: 
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
    # 81:1: block returns [list] : instruction instructionRest ;
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


        # at line 82:4: instruction instructionRest
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
    # 89:1: instructionRest returns [list] : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | );
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
        # at line 90:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | )
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


          # at line 90:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block
          # at line 90:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
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
            # at line 90:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 90:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 90:8: ( COMMENT )? ( '\\r' )? '\\n'
            # at line 90:15: ( COMMENT )?
            alt_6 = 2
            look_6_0 = @input.peek( 1 )

            if ( look_6_0 == COMMENT )
              alt_6 = 1
            end
            case alt_6
            when 1
              # at line 90:15: COMMENT
              __COMMENT12__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_instructionRest_223 )

            end
            # at line 90:22: ( '\\r' )?
            alt_7 = 2
            look_7_0 = @input.peek( 1 )

            if ( look_7_0 == T__65 )
              alt_7 = 1
            end
            case alt_7
            when 1
              # at line 90:22: '\\r'
              char_literal13 = match( T__65, TOKENS_FOLLOWING_T__65_IN_instructionRest_227 )

            end
            char_literal14 = match( T__66, TOKENS_FOLLOWING_T__66_IN_instructionRest_231 )


          when 2
            # at line 90:34: SEMICOLON
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


          # at line 93:4: 
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
    # 96:1: instruction returns [result] : ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | returnInstruction | aloneCall | closeFile | writeFileA | );
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
      aloneCall24 = nil
      closeFile25 = nil
      writeFileA26 = nil


      begin
        # at line 97:2: ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | returnInstruction | aloneCall | closeFile | writeFileA | )
        alt_10 = 11
        alt_10 = @dfa10.predict( @input )
        case alt_10
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 97:4: assignment
          @state.following.push( TOKENS_FOLLOWING_assignment_IN_instruction_273 )
          assignment17 = assignment
          @state.following.pop
          @adaptor.add_child( root_0, assignment17.tree )
          # --> action
          return_value.result = ( assignment17.nil? ? nil : assignment17.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 98:4: forCycle
          @state.following.push( TOKENS_FOLLOWING_forCycle_IN_instruction_280 )
          forCycle18 = forCycle
          @state.following.pop
          @adaptor.add_child( root_0, forCycle18.tree )
          # --> action
          return_value.result = ( forCycle18.nil? ? nil : forCycle18.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 99:4: ifInstruction
          @state.following.push( TOKENS_FOLLOWING_ifInstruction_IN_instruction_287 )
          ifInstruction19 = ifInstruction
          @state.following.pop
          @adaptor.add_child( root_0, ifInstruction19.tree )
          # --> action
          return_value.result = ( ifInstruction19.nil? ? nil : ifInstruction19.result )
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 100:4: whileCycle
          @state.following.push( TOKENS_FOLLOWING_whileCycle_IN_instruction_294 )
          whileCycle20 = whileCycle
          @state.following.pop
          @adaptor.add_child( root_0, whileCycle20.tree )
          # --> action
          return_value.result = ( whileCycle20.nil? ? nil : whileCycle20.result )
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 101:4: doCycle
          @state.following.push( TOKENS_FOLLOWING_doCycle_IN_instruction_301 )
          doCycle21 = doCycle
          @state.following.pop
          @adaptor.add_child( root_0, doCycle21.tree )
          # --> action
          return_value.result = ( doCycle21.nil? ? nil : doCycle21.result )
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 102:4: printInstruction
          @state.following.push( TOKENS_FOLLOWING_printInstruction_IN_instruction_308 )
          printInstruction22 = printInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printInstruction22.tree )
          # --> action
          return_value.result = ( printInstruction22.nil? ? nil : printInstruction22.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 103:4: returnInstruction
          @state.following.push( TOKENS_FOLLOWING_returnInstruction_IN_instruction_315 )
          returnInstruction23 = returnInstruction
          @state.following.pop
          @adaptor.add_child( root_0, returnInstruction23.tree )
          # --> action
          return_value.result = ( returnInstruction23.nil? ? nil : returnInstruction23.result )
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 104:4: aloneCall
          @state.following.push( TOKENS_FOLLOWING_aloneCall_IN_instruction_323 )
          aloneCall24 = aloneCall
          @state.following.pop
          @adaptor.add_child( root_0, aloneCall24.tree )
          # --> action
          return_value.result = ( aloneCall24.nil? ? nil : aloneCall24.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 105:4: closeFile
          @state.following.push( TOKENS_FOLLOWING_closeFile_IN_instruction_330 )
          closeFile25 = closeFile
          @state.following.pop
          @adaptor.add_child( root_0, closeFile25.tree )
          # --> action
          return_value.result = ( closeFile25.nil? ? nil : closeFile25.result )
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 106:4: writeFileA
          @state.following.push( TOKENS_FOLLOWING_writeFileA_IN_instruction_337 )
          writeFileA26 = writeFileA
          @state.following.pop
          @adaptor.add_child( root_0, writeFileA26.tree )
          # --> action
          return_value.result = ( writeFileA26.nil? ? nil : writeFileA26.result )
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 107:4: 
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
    # 110:1: readInstruction returns [result] : READ ;
    # 
    def readInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      return_value = ReadInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __READ27__ = nil

      tree_for_READ27 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 111:4: READ
        __READ27__ = match( READ, TOKENS_FOLLOWING_READ_IN_readInstruction_360 )

        tree_for_READ27 = @adaptor.create_with_payload( __READ27__ )
        @adaptor.add_child( root_0, tree_for_READ27 )

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

    ReturnInstructionReturnValue = define_return_scope :result

    # 
    # parser rule returnInstruction
    # 
    # (in Giraffe.g)
    # 114:1: returnInstruction returns [result] : RETURN expression ;
    # 
    def returnInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = ReturnInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __RETURN28__ = nil
      expression29 = nil

      tree_for_RETURN28 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 115:4: RETURN expression
        __RETURN28__ = match( RETURN, TOKENS_FOLLOWING_RETURN_IN_returnInstruction_377 )

        tree_for_RETURN28 = @adaptor.create_with_payload( __RETURN28__ )
        root_0 = @adaptor.become_root( tree_for_RETURN28, root_0 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_returnInstruction_380 )
        expression29 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression29.tree )
        # --> action
        return_value.result = [ReturnTree.new(( expression29.nil? ? nil : expression29.result )),tree_for_RETURN28]
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

    StatusCodeReturnValue = define_return_scope :result

    # 
    # parser rule statusCode
    # 
    # (in Giraffe.g)
    # 118:1: statusCode returns [result] : ( PLUS | MINUS )? INT ;
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


        # at line 119:4: ( PLUS | MINUS )? INT
        # --> action
        sign = ""
        # <-- action
        # at line 120:3: ( PLUS | MINUS )?
        alt_11 = 3
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == PLUS )
          alt_11 = 1
        elsif ( look_11_0 == MINUS )
          alt_11 = 2
        end
        case alt_11
        when 1
          # at line 120:4: PLUS
          __PLUS30__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_statusCode_402 )

          tree_for_PLUS30 = @adaptor.create_with_payload( __PLUS30__ )
          @adaptor.add_child( root_0, tree_for_PLUS30 )


        when 2
          # at line 120:11: MINUS
          __MINUS31__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_statusCode_406 )

          tree_for_MINUS31 = @adaptor.create_with_payload( __MINUS31__ )
          @adaptor.add_child( root_0, tree_for_MINUS31 )

          # --> action
          sign = __MINUS31__.text
          # <-- action

        end
        __INT32__ = match( INT, TOKENS_FOLLOWING_INT_IN_statusCode_412 )

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
    # 124:1: printInstruction returns [result] : PRINT LB printText RB ;
    # 
    def printInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = PrintInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PRINT33__ = nil
      __LB34__ = nil
      __RB36__ = nil
      printText35 = nil

      tree_for_PRINT33 = nil
      tree_for_LB34 = nil
      tree_for_RB36 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 125:5: PRINT LB printText RB
        __PRINT33__ = match( PRINT, TOKENS_FOLLOWING_PRINT_IN_printInstruction_433 )

        tree_for_PRINT33 = @adaptor.create_with_payload( __PRINT33__ )
        root_0 = @adaptor.become_root( tree_for_PRINT33, root_0 )

        __LB34__ = match( LB, TOKENS_FOLLOWING_LB_IN_printInstruction_436 )
        @state.following.push( TOKENS_FOLLOWING_printText_IN_printInstruction_439 )
        printText35 = printText
        @state.following.pop
        @adaptor.add_child( root_0, printText35.tree )
        __RB36__ = match( RB, TOKENS_FOLLOWING_RB_IN_printInstruction_441 )
        # --> action
        return_value.result = [PrintTree.new(( printText35.nil? ? nil : printText35.list )),tree_for_PRINT33]
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
    # 128:1: printText returns [list] : expression ( COMMA rest= printText )? ;
    # 
    def printText
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
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


        # at line 129:4: expression ( COMMA rest= printText )?
        @state.following.push( TOKENS_FOLLOWING_expression_IN_printText_466 )
        expression37 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression37.tree )
        # --> action
        return_value.list = [( expression37.nil? ? nil : expression37.result )]
        # <-- action
        # at line 130:3: ( COMMA rest= printText )?
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == COMMA )
          alt_12 = 1
        end
        case alt_12
        when 1
          # at line 130:4: COMMA rest= printText
          __COMMA38__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_printText_473 )

          tree_for_COMMA38 = @adaptor.create_with_payload( __COMMA38__ )
          @adaptor.add_child( root_0, tree_for_COMMA38 )

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
    # 133:1: ifInstruction returns [result] : IF LB expression RB LCB block RCB ifRest ;
    # 
    def ifInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = IfInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __IF39__ = nil
      __LB40__ = nil
      __RB42__ = nil
      __LCB43__ = nil
      __RCB45__ = nil
      expression41 = nil
      block44 = nil
      ifRest46 = nil

      tree_for_IF39 = nil
      tree_for_LB40 = nil
      tree_for_RB42 = nil
      tree_for_LCB43 = nil
      tree_for_RCB45 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 134:4: IF LB expression RB LCB block RCB ifRest
        __IF39__ = match( IF, TOKENS_FOLLOWING_IF_IN_ifInstruction_501 )

        tree_for_IF39 = @adaptor.create_with_payload( __IF39__ )
        root_0 = @adaptor.become_root( tree_for_IF39, root_0 )

        __LB40__ = match( LB, TOKENS_FOLLOWING_LB_IN_ifInstruction_504 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_ifInstruction_507 )
        expression41 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression41.tree )
        __RB42__ = match( RB, TOKENS_FOLLOWING_RB_IN_ifInstruction_509 )
        __LCB43__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifInstruction_512 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_ifInstruction_515 )
        block44 = block
        @state.following.pop
        @adaptor.add_child( root_0, block44.tree )
        __RCB45__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifInstruction_517 )
        @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifInstruction_520 )
        ifRest46 = ifRest
        @state.following.pop
        @adaptor.add_child( root_0, ifRest46.tree )
        # --> action
        return_value.result = [IfTree.new(( expression41.nil? ? nil : expression41.result ),( block44.nil? ? nil : block44.list ),( ifRest46.nil? ? nil : ifRest46.result )),tree_for_IF39]
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
    # 138:1: ifRest returns [result] : ( ELSE LCB block RCB | ( ELSEIF | ELIF ) expression LCB block RCB op= ifRest | );
    # 
    def ifRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = IfRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ELSE47__ = nil
      __LCB48__ = nil
      __RCB50__ = nil
      set51 = nil
      __LCB53__ = nil
      __RCB55__ = nil
      op = nil
      block49 = nil
      expression52 = nil
      block54 = nil

      tree_for_ELSE47 = nil
      tree_for_LCB48 = nil
      tree_for_RCB50 = nil
      tree_for_set51 = nil
      tree_for_LCB53 = nil
      tree_for_RCB55 = nil

      begin
        # at line 139:2: ( ELSE LCB block RCB | ( ELSEIF | ELIF ) expression LCB block RCB op= ifRest | )
        alt_13 = 3
        case look_13 = @input.peek( 1 )
        when ELSE then alt_13 = 1
        when ELSEIF, ELIF then alt_13 = 2
        when COMMENT, SEMICOLON, RCB, T__65, T__66 then alt_13 = 3
        else
          raise NoViableAlternative( "", 13, 0 )
        end
        case alt_13
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 139:4: ELSE LCB block RCB
          __ELSE47__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_ifRest_539 )

          tree_for_ELSE47 = @adaptor.create_with_payload( __ELSE47__ )
          @adaptor.add_child( root_0, tree_for_ELSE47 )

          __LCB48__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_541 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_544 )
          block49 = block
          @state.following.pop
          @adaptor.add_child( root_0, block49.tree )
          __RCB50__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_546 )
          # --> action
          return_value.result = ( block49.nil? ? nil : block49.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 140:4: ( ELSEIF | ELIF ) expression LCB block RCB op= ifRest
          set51 = @input.look
          if @input.peek( 1 ).between?( ELSEIF, ELIF )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set51 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          @state.following.push( TOKENS_FOLLOWING_expression_IN_ifRest_562 )
          expression52 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression52.tree )
          __LCB53__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_564 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_567 )
          block54 = block
          @state.following.pop
          @adaptor.add_child( root_0, block54.tree )
          __RCB55__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_569 )
          @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifRest_574 )
          op = ifRest
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = IfTree.new(( expression52.nil? ? nil : expression52.result ),( block54.nil? ? nil : block54.list ),( op.nil? ? nil : op.result ))
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 142:4: 
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
    # 145:1: whileCycle returns [result] : WHILE LB expression RB LCB block RCB ;
    # 
    def whileCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = WhileCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WHILE56__ = nil
      __LB57__ = nil
      __RB59__ = nil
      __LCB60__ = nil
      __RCB62__ = nil
      expression58 = nil
      block61 = nil

      tree_for_WHILE56 = nil
      tree_for_LB57 = nil
      tree_for_RB59 = nil
      tree_for_LCB60 = nil
      tree_for_RCB62 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 146:5: WHILE LB expression RB LCB block RCB
        __WHILE56__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_whileCycle_601 )

        tree_for_WHILE56 = @adaptor.create_with_payload( __WHILE56__ )
        @adaptor.add_child( root_0, tree_for_WHILE56 )

        __LB57__ = match( LB, TOKENS_FOLLOWING_LB_IN_whileCycle_603 )

        tree_for_LB57 = @adaptor.create_with_payload( __LB57__ )
        @adaptor.add_child( root_0, tree_for_LB57 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_whileCycle_605 )
        expression58 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression58.tree )
        __RB59__ = match( RB, TOKENS_FOLLOWING_RB_IN_whileCycle_607 )

        tree_for_RB59 = @adaptor.create_with_payload( __RB59__ )
        @adaptor.add_child( root_0, tree_for_RB59 )

        __LCB60__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_whileCycle_609 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_whileCycle_612 )
        block61 = block
        @state.following.pop
        @adaptor.add_child( root_0, block61.tree )
        __RCB62__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_whileCycle_614 )
        # --> action
        return_value.result = [WhileTree.new(( expression58.nil? ? nil : expression58.result ),( block61.nil? ? nil : block61.list )),tree_for_WHILE56]
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
    # 150:1: doCycle returns [result] : DO LCB block RCB WHILE LB expression RB ;
    # 
    def doCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = DoCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __DO63__ = nil
      __LCB64__ = nil
      __RCB66__ = nil
      __WHILE67__ = nil
      __LB68__ = nil
      __RB70__ = nil
      block65 = nil
      expression69 = nil

      tree_for_DO63 = nil
      tree_for_LCB64 = nil
      tree_for_RCB66 = nil
      tree_for_WHILE67 = nil
      tree_for_LB68 = nil
      tree_for_RB70 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 151:4: DO LCB block RCB WHILE LB expression RB
        __DO63__ = match( DO, TOKENS_FOLLOWING_DO_IN_doCycle_636 )

        tree_for_DO63 = @adaptor.create_with_payload( __DO63__ )
        @adaptor.add_child( root_0, tree_for_DO63 )

        __LCB64__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_doCycle_638 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_doCycle_641 )
        block65 = block
        @state.following.pop
        @adaptor.add_child( root_0, block65.tree )
        __RCB66__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_doCycle_643 )
        __WHILE67__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_doCycle_646 )

        tree_for_WHILE67 = @adaptor.create_with_payload( __WHILE67__ )
        @adaptor.add_child( root_0, tree_for_WHILE67 )

        __LB68__ = match( LB, TOKENS_FOLLOWING_LB_IN_doCycle_648 )

        tree_for_LB68 = @adaptor.create_with_payload( __LB68__ )
        @adaptor.add_child( root_0, tree_for_LB68 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_doCycle_650 )
        expression69 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression69.tree )
        __RB70__ = match( RB, TOKENS_FOLLOWING_RB_IN_doCycle_652 )

        tree_for_RB70 = @adaptor.create_with_payload( __RB70__ )
        @adaptor.add_child( root_0, tree_for_RB70 )

        # --> action
        return_value.result = [DoTree.new(( expression69.nil? ? nil : expression69.result ),( block65.nil? ? nil : block65.list )),tree_for_DO63]
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
    # 155:1: forCycle returns [result] : FOR LB as1= assignment ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) expression ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) as2= assignment RB LCB block RCB ;
    # 
    def forCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = ForCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __FOR71__ = nil
      __LB72__ = nil
      __COMMENT73__ = nil
      char_literal74 = nil
      char_literal75 = nil
      __SEMICOLON76__ = nil
      __COMMENT78__ = nil
      char_literal79 = nil
      char_literal80 = nil
      __SEMICOLON81__ = nil
      __RB82__ = nil
      __LCB83__ = nil
      __RCB85__ = nil
      as1 = nil
      as2 = nil
      expression77 = nil
      block84 = nil

      tree_for_FOR71 = nil
      tree_for_LB72 = nil
      tree_for_COMMENT73 = nil
      tree_for_char_literal74 = nil
      tree_for_char_literal75 = nil
      tree_for_SEMICOLON76 = nil
      tree_for_COMMENT78 = nil
      tree_for_char_literal79 = nil
      tree_for_char_literal80 = nil
      tree_for_SEMICOLON81 = nil
      tree_for_RB82 = nil
      tree_for_LCB83 = nil
      tree_for_RCB85 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 156:4: FOR LB as1= assignment ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) expression ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) as2= assignment RB LCB block RCB
        __FOR71__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_forCycle_673 )

        tree_for_FOR71 = @adaptor.create_with_payload( __FOR71__ )
        @adaptor.add_child( root_0, tree_for_FOR71 )

        __LB72__ = match( LB, TOKENS_FOLLOWING_LB_IN_forCycle_675 )

        tree_for_LB72 = @adaptor.create_with_payload( __LB72__ )
        @adaptor.add_child( root_0, tree_for_LB72 )

        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_679 )
        as1 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as1.tree )
        # at line 156:26: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == COMMENT || look_16_0.between?( T__65, T__66 ) )
          alt_16 = 1
        elsif ( look_16_0 == SEMICOLON )
          alt_16 = 2
        else
          raise NoViableAlternative( "", 16, 0 )
        end
        case alt_16
        when 1
          # at line 156:27: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 156:27: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 156:29: ( COMMENT )? ( '\\r' )? '\\n'
          # at line 156:36: ( COMMENT )?
          alt_14 = 2
          look_14_0 = @input.peek( 1 )

          if ( look_14_0 == COMMENT )
            alt_14 = 1
          end
          case alt_14
          when 1
            # at line 156:36: COMMENT
            __COMMENT73__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_forCycle_684 )

          end
          # at line 156:43: ( '\\r' )?
          alt_15 = 2
          look_15_0 = @input.peek( 1 )

          if ( look_15_0 == T__65 )
            alt_15 = 1
          end
          case alt_15
          when 1
            # at line 156:43: '\\r'
            char_literal74 = match( T__65, TOKENS_FOLLOWING_T__65_IN_forCycle_688 )

          end
          char_literal75 = match( T__66, TOKENS_FOLLOWING_T__66_IN_forCycle_692 )


        when 2
          # at line 156:55: SEMICOLON
          __SEMICOLON76__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_698 )

        end
        @state.following.push( TOKENS_FOLLOWING_expression_IN_forCycle_703 )
        expression77 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression77.tree )
        # at line 156:79: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
        alt_19 = 2
        look_19_0 = @input.peek( 1 )

        if ( look_19_0 == COMMENT || look_19_0.between?( T__65, T__66 ) )
          alt_19 = 1
        elsif ( look_19_0 == SEMICOLON )
          alt_19 = 2
        else
          raise NoViableAlternative( "", 19, 0 )
        end
        case alt_19
        when 1
          # at line 156:80: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 156:80: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 156:82: ( COMMENT )? ( '\\r' )? '\\n'
          # at line 156:89: ( COMMENT )?
          alt_17 = 2
          look_17_0 = @input.peek( 1 )

          if ( look_17_0 == COMMENT )
            alt_17 = 1
          end
          case alt_17
          when 1
            # at line 156:89: COMMENT
            __COMMENT78__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_forCycle_708 )

          end
          # at line 156:96: ( '\\r' )?
          alt_18 = 2
          look_18_0 = @input.peek( 1 )

          if ( look_18_0 == T__65 )
            alt_18 = 1
          end
          case alt_18
          when 1
            # at line 156:96: '\\r'
            char_literal79 = match( T__65, TOKENS_FOLLOWING_T__65_IN_forCycle_712 )

          end
          char_literal80 = match( T__66, TOKENS_FOLLOWING_T__66_IN_forCycle_716 )


        when 2
          # at line 156:108: SEMICOLON
          __SEMICOLON81__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_722 )

        end
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_729 )
        as2 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as2.tree )
        __RB82__ = match( RB, TOKENS_FOLLOWING_RB_IN_forCycle_731 )

        tree_for_RB82 = @adaptor.create_with_payload( __RB82__ )
        @adaptor.add_child( root_0, tree_for_RB82 )

        __LCB83__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_forCycle_733 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_forCycle_736 )
        block84 = block
        @state.following.pop
        @adaptor.add_child( root_0, block84.tree )
        __RCB85__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_forCycle_738 )
        # --> action
        return_value.result = [ForTree.new(( as1.nil? ? nil : as1.result ),( expression77.nil? ? nil : expression77.result ),( as2.nil? ? nil : as2.result ),( block84.nil? ? nil : block84.list )), tree_for_FOR71]
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
    # 160:1: func returns [result] : ( ID ( LB params RB )? LCB block RCB | MAIN LCB block RCB );
    # 
    def func
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = FuncReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID86__ = nil
      __LB87__ = nil
      __RB89__ = nil
      __LCB90__ = nil
      __RCB92__ = nil
      __MAIN93__ = nil
      __LCB94__ = nil
      __RCB96__ = nil
      params88 = nil
      block91 = nil
      block95 = nil

      tree_for_ID86 = nil
      tree_for_LB87 = nil
      tree_for_RB89 = nil
      tree_for_LCB90 = nil
      tree_for_RCB92 = nil
      tree_for_MAIN93 = nil
      tree_for_LCB94 = nil
      tree_for_RCB96 = nil

      begin
        # at line 161:2: ( ID ( LB params RB )? LCB block RCB | MAIN LCB block RCB )
        alt_21 = 2
        look_21_0 = @input.peek( 1 )

        if ( look_21_0 == ID )
          alt_21 = 1
        elsif ( look_21_0 == MAIN )
          alt_21 = 2
        else
          raise NoViableAlternative( "", 21, 0 )
        end
        case alt_21
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 161:4: ID ( LB params RB )? LCB block RCB
          __ID86__ = match( ID, TOKENS_FOLLOWING_ID_IN_func_760 )

          tree_for_ID86 = @adaptor.create_with_payload( __ID86__ )
          @adaptor.add_child( root_0, tree_for_ID86 )

          # at line 161:7: ( LB params RB )?
          alt_20 = 2
          look_20_0 = @input.peek( 1 )

          if ( look_20_0 == LB )
            alt_20 = 1
          end
          case alt_20
          when 1
            # at line 161:8: LB params RB
            __LB87__ = match( LB, TOKENS_FOLLOWING_LB_IN_func_763 )
            @state.following.push( TOKENS_FOLLOWING_params_IN_func_766 )
            params88 = params
            @state.following.pop
            @adaptor.add_child( root_0, params88.tree )
            __RB89__ = match( RB, TOKENS_FOLLOWING_RB_IN_func_768 )

          end
          __LCB90__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_773 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_func_776 )
          block91 = block
          @state.following.pop
          @adaptor.add_child( root_0, block91.tree )
          __RCB92__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_778 )
          # --> action
          return_value.result = [FuncTree.new(__ID86__.text,( params88.nil? ? nil : params88.list ) == nil ? [] : ( params88.nil? ? nil : params88.list ),( block91.nil? ? nil : block91.list )),tree_for_ID86]
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 163:4: MAIN LCB block RCB
          __MAIN93__ = match( MAIN, TOKENS_FOLLOWING_MAIN_IN_func_788 )

          tree_for_MAIN93 = @adaptor.create_with_payload( __MAIN93__ )
          root_0 = @adaptor.become_root( tree_for_MAIN93, root_0 )

          __LCB94__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_791 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_func_794 )
          block95 = block
          @state.following.pop
          @adaptor.add_child( root_0, block95.tree )
          __RCB96__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_796 )
          # --> action
          return_value.result = [FuncTree.new("main",[],( block95.nil? ? nil : block95.list )),tree_for_MAIN93]
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

    ParamsReturnValue = define_return_scope :list

    # 
    # parser rule params
    # 
    # (in Giraffe.g)
    # 167:1: params returns [list] : ( ID paramRest | );
    # 
    def params
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = ParamsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID97__ = nil
      paramRest98 = nil

      tree_for_ID97 = nil

      begin
        # at line 168:2: ( ID paramRest | )
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == ID )
          alt_22 = 1
        elsif ( look_22_0 == RB )
          alt_22 = 2
        else
          raise NoViableAlternative( "", 22, 0 )
        end
        case alt_22
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 168:4: ID paramRest
          __ID97__ = match( ID, TOKENS_FOLLOWING_ID_IN_params_816 )

          tree_for_ID97 = @adaptor.create_with_payload( __ID97__ )
          @adaptor.add_child( root_0, tree_for_ID97 )

          @state.following.push( TOKENS_FOLLOWING_paramRest_IN_params_818 )
          paramRest98 = paramRest
          @state.following.pop
          @adaptor.add_child( root_0, paramRest98.tree )
          # --> action
          return_value.list = [__ID97__.text] + ( paramRest98.nil? ? nil : paramRest98.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 170:5: 
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
        # trace_out( __method__, 19 )

      end
      
      return return_value
    end

    ParamRestReturnValue = define_return_scope :list

    # 
    # parser rule paramRest
    # 
    # (in Giraffe.g)
    # 173:1: paramRest returns [list] : ( COMMA params | );
    # 
    def paramRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = ParamRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA99__ = nil
      params100 = nil

      tree_for_COMMA99 = nil

      begin
        # at line 174:2: ( COMMA params | )
        alt_23 = 2
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == COMMA )
          alt_23 = 1
        elsif ( look_23_0 == RB )
          alt_23 = 2
        else
          raise NoViableAlternative( "", 23, 0 )
        end
        case alt_23
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 174:4: COMMA params
          __COMMA99__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_paramRest_843 )
          @state.following.push( TOKENS_FOLLOWING_params_IN_paramRest_846 )
          params100 = params
          @state.following.pop
          @adaptor.add_child( root_0, params100.tree )
          # --> action
          return_value.list = ( params100.nil? ? nil : params100.list )
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
        # trace_out( __method__, 20 )

      end
      
      return return_value
    end

    AloneCallReturnValue = define_return_scope :result

    # 
    # parser rule aloneCall
    # 
    # (in Giraffe.g)
    # 179:1: aloneCall returns [result] : fun= ID LB (args1= args )? RB ;
    # 
    def aloneCall
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = AloneCallReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      fun = nil
      __LB101__ = nil
      __RB102__ = nil
      args1 = nil

      tree_for_fun = nil
      tree_for_LB101 = nil
      tree_for_RB102 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 180:4: fun= ID LB (args1= args )? RB
        fun = match( ID, TOKENS_FOLLOWING_ID_IN_aloneCall_874 )

        tree_for_fun = @adaptor.create_with_payload( fun )
        root_0 = @adaptor.become_root( tree_for_fun, root_0 )

        __LB101__ = match( LB, TOKENS_FOLLOWING_LB_IN_aloneCall_877 )
        # at line 180:21: (args1= args )?
        alt_24 = 2
        look_24_0 = @input.peek( 1 )

        if ( look_24_0 == READ || look_24_0.between?( PLUS, INT ) || look_24_0 == LB || look_24_0 == ID || look_24_0 == NOT || look_24_0.between?( OPENFILE, ALLOC ) || look_24_0 == STRING || look_24_0 == T__67 )
          alt_24 = 1
        end
        case alt_24
        when 1
          # at line 180:21: args1= args
          @state.following.push( TOKENS_FOLLOWING_args_IN_aloneCall_882 )
          args1 = args
          @state.following.pop
          @adaptor.add_child( root_0, args1.tree )

        end
        __RB102__ = match( RB, TOKENS_FOLLOWING_RB_IN_aloneCall_885 )
        # --> action
        return_value.result = [CallTree.new(fun.text,( args1.nil? ? nil : args1.list ),true),tree_for_fun]
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

    CallVarReturnValue = define_return_scope :result

    # 
    # parser rule callVar
    # 
    # (in Giraffe.g)
    # 184:1: callVar returns [result] : ID ( LB (args1= args )? RB )? ;
    # 
    def callVar
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = CallVarReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID103__ = nil
      __LB104__ = nil
      __RB105__ = nil
      args1 = nil

      tree_for_ID103 = nil
      tree_for_LB104 = nil
      tree_for_RB105 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 185:4: ID ( LB (args1= args )? RB )?
        __ID103__ = match( ID, TOKENS_FOLLOWING_ID_IN_callVar_905 )

        tree_for_ID103 = @adaptor.create_with_payload( __ID103__ )
        @adaptor.add_child( root_0, tree_for_ID103 )

        # --> action
        return_value.result = [VarTree.new(__ID103__.text),tree_for_ID103]
        # <-- action
        # at line 186:3: ( LB (args1= args )? RB )?
        alt_26 = 2
        look_26_0 = @input.peek( 1 )

        if ( look_26_0 == LB )
          alt_26 = 1
        end
        case alt_26
        when 1
          # at line 187:3: LB (args1= args )? RB
          __LB104__ = match( LB, TOKENS_FOLLOWING_LB_IN_callVar_916 )

          tree_for_LB104 = @adaptor.create_with_payload( __LB104__ )
          @adaptor.add_child( root_0, tree_for_LB104 )

          # at line 187:11: (args1= args )?
          alt_25 = 2
          look_25_0 = @input.peek( 1 )

          if ( look_25_0 == READ || look_25_0.between?( PLUS, INT ) || look_25_0 == LB || look_25_0 == ID || look_25_0 == NOT || look_25_0.between?( OPENFILE, ALLOC ) || look_25_0 == STRING || look_25_0 == T__67 )
            alt_25 = 1
          end
          case alt_25
          when 1
            # at line 187:11: args1= args
            @state.following.push( TOKENS_FOLLOWING_args_IN_callVar_920 )
            args1 = args
            @state.following.pop
            @adaptor.add_child( root_0, args1.tree )

          end
          __RB105__ = match( RB, TOKENS_FOLLOWING_RB_IN_callVar_923 )

          tree_for_RB105 = @adaptor.create_with_payload( __RB105__ )
          @adaptor.add_child( root_0, tree_for_RB105 )

          # --> action
          return_value.result = [CallTree.new(__ID103__.text,( args1.nil? ? nil : args1.list ),false),tree_for_ID103]
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

    ArgsReturnValue = define_return_scope :list

    # 
    # parser rule args
    # 
    # (in Giraffe.g)
    # 192:1: args returns [list] : expression argsRest ;
    # 
    def args
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ArgsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      expression106 = nil
      argsRest107 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 193:5: expression argsRest
        @state.following.push( TOKENS_FOLLOWING_expression_IN_args_950 )
        expression106 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression106.tree )
        @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_952 )
        argsRest107 = argsRest
        @state.following.pop
        @adaptor.add_child( root_0, argsRest107.tree )
        # --> action
        return_value.list = [( expression106.nil? ? nil : expression106.result )] + ( argsRest107.nil? ? nil : argsRest107.list )
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
    # 196:1: argsRest returns [list] : ( COMMA args | );
    # 
    def argsRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = ArgsRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA108__ = nil
      args109 = nil

      tree_for_COMMA108 = nil

      begin
        # at line 197:2: ( COMMA args | )
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


          # at line 197:4: COMMA args
          __COMMA108__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsRest_971 )
          @state.following.push( TOKENS_FOLLOWING_args_IN_argsRest_974 )
          args109 = args
          @state.following.pop
          @adaptor.add_child( root_0, args109.tree )
          # --> action
          return_value.list = ( args109.nil? ? nil : args109.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 199:4: 
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

    ExpressionReturnValue = define_return_scope :result

    # 
    # parser rule expression
    # 
    # (in Giraffe.g)
    # 204:1: expression returns [result] : op1= orOperand ( OR op2= expression )? ;
    # 
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OR110__ = nil
      op1 = nil
      op2 = nil

      tree_for_OR110 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 205:4: op1= orOperand ( OR op2= expression )?
        @state.following.push( TOKENS_FOLLOWING_orOperand_IN_expression_1002 )
        op1 = orOperand
        @state.following.pop
        @adaptor.add_child( root_0, op1.tree )
        # --> action
        return_value.result = ( op1.nil? ? nil : op1.result )
        # <-- action
        # at line 206:3: ( OR op2= expression )?
        alt_28 = 2
        look_28_0 = @input.peek( 1 )

        if ( look_28_0 == OR )
          alt_28 = 1
        end
        case alt_28
        when 1
          # at line 206:4: OR op2= expression
          __OR110__ = match( OR, TOKENS_FOLLOWING_OR_IN_expression_1009 )

          tree_for_OR110 = @adaptor.create_with_payload( __OR110__ )
          root_0 = @adaptor.become_root( tree_for_OR110, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1014 )
          op2 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op2.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op2.nil? ? nil : op2.result ),Operators.method(:or)),op2.tree]
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
    # 211:1: orOperand returns [result] : op1= andOperand ( AND op2= orOperand )? ;
    # 
    def orOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = OrOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __AND111__ = nil
      op1 = nil
      op2 = nil

      tree_for_AND111 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 212:4: op1= andOperand ( AND op2= orOperand )?
        @state.following.push( TOKENS_FOLLOWING_andOperand_IN_orOperand_1037 )
        op1 = andOperand
        @state.following.pop
        @adaptor.add_child( root_0, op1.tree )
        # --> action
        return_value.result = ( op1.nil? ? nil : op1.result )
        # <-- action
        # at line 213:3: ( AND op2= orOperand )?
        alt_29 = 2
        look_29_0 = @input.peek( 1 )

        if ( look_29_0 == AND )
          alt_29 = 1
        end
        case alt_29
        when 1
          # at line 213:4: AND op2= orOperand
          __AND111__ = match( AND, TOKENS_FOLLOWING_AND_IN_orOperand_1044 )

          tree_for_AND111 = @adaptor.create_with_payload( __AND111__ )
          root_0 = @adaptor.become_root( tree_for_AND111, root_0 )

          @state.following.push( TOKENS_FOLLOWING_orOperand_IN_orOperand_1049 )
          op2 = orOperand
          @state.following.pop
          @adaptor.add_child( root_0, op2.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op2.nil? ? nil : op2.result ),Operators.method(:and)),op2.tree] 
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

    AndOperandReturnValue = define_return_scope :result

    # 
    # parser rule andOperand
    # 
    # (in Giraffe.g)
    # 216:1: andOperand returns [result] : (op1= compareOperand ( EQ op2= andOperand | NE op2= andOperand | LT op2= andOperand | GT op2= andOperand | LE op2= andOperand | GE op2= andOperand )? | NOT LB op1= expression RB );
    # 
    def andOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = AndOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __EQ112__ = nil
      __NE113__ = nil
      __LT114__ = nil
      __GT115__ = nil
      __LE116__ = nil
      __GE117__ = nil
      __NOT118__ = nil
      __LB119__ = nil
      __RB120__ = nil
      op1 = nil
      op2 = nil

      tree_for_EQ112 = nil
      tree_for_NE113 = nil
      tree_for_LT114 = nil
      tree_for_GT115 = nil
      tree_for_LE116 = nil
      tree_for_GE117 = nil
      tree_for_NOT118 = nil
      tree_for_LB119 = nil
      tree_for_RB120 = nil

      begin
        # at line 217:2: (op1= compareOperand ( EQ op2= andOperand | NE op2= andOperand | LT op2= andOperand | GT op2= andOperand | LE op2= andOperand | GE op2= andOperand )? | NOT LB op1= expression RB )
        alt_31 = 2
        look_31_0 = @input.peek( 1 )

        if ( look_31_0 == READ || look_31_0.between?( PLUS, INT ) || look_31_0 == LB || look_31_0 == ID || look_31_0.between?( OPENFILE, ALLOC ) || look_31_0 == STRING || look_31_0 == T__67 )
          alt_31 = 1
        elsif ( look_31_0 == NOT )
          alt_31 = 2
        else
          raise NoViableAlternative( "", 31, 0 )
        end
        case alt_31
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 217:4: op1= compareOperand ( EQ op2= andOperand | NE op2= andOperand | LT op2= andOperand | GT op2= andOperand | LE op2= andOperand | GE op2= andOperand )?
          @state.following.push( TOKENS_FOLLOWING_compareOperand_IN_andOperand_1070 )
          op1 = compareOperand
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # --> action
          return_value.result = ( op1.nil? ? nil : op1.result )
          # <-- action
          # at line 218:3: ( EQ op2= andOperand | NE op2= andOperand | LT op2= andOperand | GT op2= andOperand | LE op2= andOperand | GE op2= andOperand )?
          alt_30 = 7
          case look_30 = @input.peek( 1 )
          when EQ then alt_30 = 1
          when NE then alt_30 = 2
          when LT then alt_30 = 3
          when GT then alt_30 = 4
          when LE then alt_30 = 5
          when GE then alt_30 = 6
          end
          case alt_30
          when 1
            # at line 218:5: EQ op2= andOperand
            __EQ112__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_andOperand_1080 )

            tree_for_EQ112 = @adaptor.create_with_payload( __EQ112__ )
            root_0 = @adaptor.become_root( tree_for_EQ112, root_0 )

            @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_1085 )
            op2 = andOperand
            @state.following.pop
            @adaptor.add_child( root_0, op2.tree )
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:eq)),op2.tree]
            # <-- action

          when 2
            # at line 219:5: NE op2= andOperand
            __NE113__ = match( NE, TOKENS_FOLLOWING_NE_IN_andOperand_1094 )

            tree_for_NE113 = @adaptor.create_with_payload( __NE113__ )
            root_0 = @adaptor.become_root( tree_for_NE113, root_0 )

            @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_1099 )
            op2 = andOperand
            @state.following.pop
            @adaptor.add_child( root_0, op2.tree )
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:ne)),op2.tree]
            # <-- action

          when 3
            # at line 220:5: LT op2= andOperand
            __LT114__ = match( LT, TOKENS_FOLLOWING_LT_IN_andOperand_1108 )

            tree_for_LT114 = @adaptor.create_with_payload( __LT114__ )
            root_0 = @adaptor.become_root( tree_for_LT114, root_0 )

            @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_1113 )
            op2 = andOperand
            @state.following.pop
            @adaptor.add_child( root_0, op2.tree )
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:lt)),op2.tree]
            # <-- action

          when 4
            # at line 221:5: GT op2= andOperand
            __GT115__ = match( GT, TOKENS_FOLLOWING_GT_IN_andOperand_1122 )

            tree_for_GT115 = @adaptor.create_with_payload( __GT115__ )
            root_0 = @adaptor.become_root( tree_for_GT115, root_0 )

            @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_1127 )
            op2 = andOperand
            @state.following.pop
            @adaptor.add_child( root_0, op2.tree )
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:gt)),op2.tree]
            # <-- action

          when 5
            # at line 222:5: LE op2= andOperand
            __LE116__ = match( LE, TOKENS_FOLLOWING_LE_IN_andOperand_1136 )

            tree_for_LE116 = @adaptor.create_with_payload( __LE116__ )
            root_0 = @adaptor.become_root( tree_for_LE116, root_0 )

            @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_1141 )
            op2 = andOperand
            @state.following.pop
            @adaptor.add_child( root_0, op2.tree )
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:le)),op2.tree]
            # <-- action

          when 6
            # at line 223:5: GE op2= andOperand
            __GE117__ = match( GE, TOKENS_FOLLOWING_GE_IN_andOperand_1150 )

            tree_for_GE117 = @adaptor.create_with_payload( __GE117__ )
            root_0 = @adaptor.become_root( tree_for_GE117, root_0 )

            @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_1155 )
            op2 = andOperand
            @state.following.pop
            @adaptor.add_child( root_0, op2.tree )
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:ge)),op2.tree]
            # <-- action

          end

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 225:4: NOT LB op1= expression RB
          __NOT118__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_andOperand_1170 )

          tree_for_NOT118 = @adaptor.create_with_payload( __NOT118__ )
          root_0 = @adaptor.become_root( tree_for_NOT118, root_0 )

          __LB119__ = match( LB, TOKENS_FOLLOWING_LB_IN_andOperand_1173 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_andOperand_1178 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          __RB120__ = match( RB, TOKENS_FOLLOWING_RB_IN_andOperand_1180 )
          # --> action
          return_value.result = [UnaryOperatorTree.new(( op1.nil? ? nil : op1.result ),Operators.method(:not)),op1.tree]
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
        # trace_out( __method__, 27 )

      end
      
      return return_value
    end

    CompareOperandReturnValue = define_return_scope :result

    # 
    # parser rule compareOperand
    # 
    # (in Giraffe.g)
    # 229:1: compareOperand returns [result] : op1= addOperand ( PLUS op2= compareOperand | MINUS op2= compareOperand )? ;
    # 
    def compareOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = CompareOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS121__ = nil
      __MINUS122__ = nil
      op1 = nil
      op2 = nil

      tree_for_PLUS121 = nil
      tree_for_MINUS122 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 230:4: op1= addOperand ( PLUS op2= compareOperand | MINUS op2= compareOperand )?
        @state.following.push( TOKENS_FOLLOWING_addOperand_IN_compareOperand_1203 )
        op1 = addOperand
        @state.following.pop
        @adaptor.add_child( root_0, op1.tree )
        # --> action
        return_value.result = ( op1.nil? ? nil : op1.result )
        # <-- action
        # at line 231:3: ( PLUS op2= compareOperand | MINUS op2= compareOperand )?
        alt_32 = 3
        look_32_0 = @input.peek( 1 )

        if ( look_32_0 == PLUS )
          alt_32 = 1
        elsif ( look_32_0 == MINUS )
          alt_32 = 2
        end
        case alt_32
        when 1
          # at line 231:5: PLUS op2= compareOperand
          __PLUS121__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_compareOperand_1211 )

          tree_for_PLUS121 = @adaptor.create_with_payload( __PLUS121__ )
          root_0 = @adaptor.become_root( tree_for_PLUS121, root_0 )

          @state.following.push( TOKENS_FOLLOWING_compareOperand_IN_compareOperand_1216 )
          op2 = compareOperand
          @state.following.pop
          @adaptor.add_child( root_0, op2.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op2.nil? ? nil : op2.result ),Operators.method(:add)),op2.tree]
          # <-- action

        when 2
          # at line 232:5: MINUS op2= compareOperand
          __MINUS122__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_compareOperand_1224 )

          tree_for_MINUS122 = @adaptor.create_with_payload( __MINUS122__ )
          root_0 = @adaptor.become_root( tree_for_MINUS122, root_0 )

          @state.following.push( TOKENS_FOLLOWING_compareOperand_IN_compareOperand_1229 )
          op2 = compareOperand
          @state.following.pop
          @adaptor.add_child( root_0, op2.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op2.nil? ? nil : op2.result ),Operators.method(:sub)),op2.tree]
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
    # 236:1: addOperand returns [result] : op1= mulOperand ( MUL op2= addOperand | DIV op2= addOperand | MOD op2= addOperand )? ;
    # 
    def addOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = AddOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __MUL123__ = nil
      __DIV124__ = nil
      __MOD125__ = nil
      op1 = nil
      op2 = nil

      tree_for_MUL123 = nil
      tree_for_DIV124 = nil
      tree_for_MOD125 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 237:4: op1= mulOperand ( MUL op2= addOperand | DIV op2= addOperand | MOD op2= addOperand )?
        @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperand_1253 )
        op1 = mulOperand
        @state.following.pop
        @adaptor.add_child( root_0, op1.tree )
        # --> action
        return_value.result = ( op1.nil? ? nil : op1.result )
        # <-- action
        # at line 238:3: ( MUL op2= addOperand | DIV op2= addOperand | MOD op2= addOperand )?
        alt_33 = 4
        case look_33 = @input.peek( 1 )
        when MUL then alt_33 = 1
        when DIV then alt_33 = 2
        when MOD then alt_33 = 3
        end
        case alt_33
        when 1
          # at line 238:5: MUL op2= addOperand
          __MUL123__ = match( MUL, TOKENS_FOLLOWING_MUL_IN_addOperand_1261 )

          tree_for_MUL123 = @adaptor.create_with_payload( __MUL123__ )
          root_0 = @adaptor.become_root( tree_for_MUL123, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1266 )
          op2 = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op2.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op2.nil? ? nil : op2.result ),Operators.method(:mul)),op2.tree]
          # <-- action

        when 2
          # at line 239:5: DIV op2= addOperand
          __DIV124__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_addOperand_1274 )

          tree_for_DIV124 = @adaptor.create_with_payload( __DIV124__ )
          root_0 = @adaptor.become_root( tree_for_DIV124, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1279 )
          op2 = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op2.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op2.nil? ? nil : op2.result ),Operators.method(:div)),op2.tree]
          # <-- action

        when 3
          # at line 240:5: MOD op2= addOperand
          __MOD125__ = match( MOD, TOKENS_FOLLOWING_MOD_IN_addOperand_1287 )

          tree_for_MOD125 = @adaptor.create_with_payload( __MOD125__ )
          root_0 = @adaptor.become_root( tree_for_MOD125, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1292 )
          op2 = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op2.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op2.nil? ? nil : op2.result ),Operators.method(:mod)),op2.tree]
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
    # 244:1: mulOperand returns [result] : ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest );
    # 
    def mulOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )
      return_value = MulOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS126__ = nil
      __MINUS128__ = nil
      mulOperandRest127 = nil
      mulOperandRest129 = nil
      mulOperandRest130 = nil

      tree_for_PLUS126 = nil
      tree_for_MINUS128 = nil

      begin
        # at line 245:2: ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest )
        alt_34 = 3
        case look_34 = @input.peek( 1 )
        when PLUS then alt_34 = 1
        when MINUS then alt_34 = 2
        when READ, INT, LB, ID, OPENFILE, SIZEOF, READNUMBER, WRITEFILE, NULL, ALLOC, STRING, T__67 then alt_34 = 3
        else
          raise NoViableAlternative( "", 34, 0 )
        end
        case alt_34
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 245:4: PLUS mulOperandRest
          __PLUS126__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_mulOperand_1314 )

          tree_for_PLUS126 = @adaptor.create_with_payload( __PLUS126__ )
          @adaptor.add_child( root_0, tree_for_PLUS126 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1316 )
          mulOperandRest127 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest127.tree )
          # --> action
          return_value.result = ( mulOperandRest127.nil? ? nil : mulOperandRest127.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 246:4: MINUS mulOperandRest
          __MINUS128__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_mulOperand_1323 )

          tree_for_MINUS128 = @adaptor.create_with_payload( __MINUS128__ )
          @adaptor.add_child( root_0, tree_for_MINUS128 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1325 )
          mulOperandRest129 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest129.tree )
          # --> action
          return_value.result = [UnaryOperatorTree.new(( mulOperandRest129.nil? ? nil : mulOperandRest129.result ),Operators.method(:neg)),mulOperandRest129.tree]
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 247:4: mulOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1332 )
          mulOperandRest130 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest130.tree )
          # --> action
          return_value.result = ( mulOperandRest130.nil? ? nil : mulOperandRest130.result )
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
    # 250:1: mulOperandRest returns [result] : arrayIndexTarget ( '[' expression ']' )* ;
    # 
    def mulOperandRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )
      return_value = MulOperandRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal132 = nil
      char_literal134 = nil
      arrayIndexTarget131 = nil
      expression133 = nil

      tree_for_char_literal132 = nil
      tree_for_char_literal134 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 251:4: arrayIndexTarget ( '[' expression ']' )*
        @state.following.push( TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1349 )
        arrayIndexTarget131 = arrayIndexTarget
        @state.following.pop
        @adaptor.add_child( root_0, arrayIndexTarget131.tree )
        # --> action
        return_value.result = ( arrayIndexTarget131.nil? ? nil : arrayIndexTarget131.result )
        # <-- action
        # at line 252:3: ( '[' expression ']' )*
        while true # decision 35
          alt_35 = 2
          look_35_0 = @input.peek( 1 )

          if ( look_35_0 == T__67 )
            alt_35 = 1

          end
          case alt_35
          when 1
            # at line 252:4: '[' expression ']'
            char_literal132 = match( T__67, TOKENS_FOLLOWING_T__67_IN_mulOperandRest_1357 )

            tree_for_char_literal132 = @adaptor.create_with_payload( char_literal132 )
            @adaptor.add_child( root_0, tree_for_char_literal132 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_mulOperandRest_1359 )
            expression133 = expression
            @state.following.pop
            @adaptor.add_child( root_0, expression133.tree )
            char_literal134 = match( T__68, TOKENS_FOLLOWING_T__68_IN_mulOperandRest_1361 )

            tree_for_char_literal134 = @adaptor.create_with_payload( char_literal134 )
            @adaptor.add_child( root_0, tree_for_char_literal134 )

            # --> action
             return_value.result = [IndexTree.new(return_value.result,( expression133.nil? ? nil : expression133.result )),expression133.tree] 
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
        # trace_out( __method__, 31 )

      end
      
      return return_value
    end

    CloseFileReturnValue = define_return_scope :result

    # 
    # parser rule closeFile
    # 
    # (in Giraffe.g)
    # 255:1: closeFile returns [result] : CLOSEFILE LB expression RB ;
    # 
    def closeFile
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )
      return_value = CloseFileReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __CLOSEFILE135__ = nil
      __LB136__ = nil
      __RB138__ = nil
      expression137 = nil

      tree_for_CLOSEFILE135 = nil
      tree_for_LB136 = nil
      tree_for_RB138 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 256:4: CLOSEFILE LB expression RB
        __CLOSEFILE135__ = match( CLOSEFILE, TOKENS_FOLLOWING_CLOSEFILE_IN_closeFile_1382 )

        tree_for_CLOSEFILE135 = @adaptor.create_with_payload( __CLOSEFILE135__ )
        @adaptor.add_child( root_0, tree_for_CLOSEFILE135 )

        __LB136__ = match( LB, TOKENS_FOLLOWING_LB_IN_closeFile_1384 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_closeFile_1387 )
        expression137 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression137.tree )
        __RB138__ = match( RB, TOKENS_FOLLOWING_RB_IN_closeFile_1389 )
        # --> action
        return_value.result = [CloseFileTree.new(( expression137.nil? ? nil : expression137.result )),tree_for_CLOSEFILE135]
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

    OpenFileReturnValue = define_return_scope :result

    # 
    # parser rule openFile
    # 
    # (in Giraffe.g)
    # 259:1: openFile returns [result] : OPENFILE LB what= expression COMMA mode= expression RB ;
    # 
    def openFile
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )
      return_value = OpenFileReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OPENFILE139__ = nil
      __LB140__ = nil
      __COMMA141__ = nil
      __RB142__ = nil
      what = nil
      mode = nil

      tree_for_OPENFILE139 = nil
      tree_for_LB140 = nil
      tree_for_COMMA141 = nil
      tree_for_RB142 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 260:4: OPENFILE LB what= expression COMMA mode= expression RB
        __OPENFILE139__ = match( OPENFILE, TOKENS_FOLLOWING_OPENFILE_IN_openFile_1410 )

        tree_for_OPENFILE139 = @adaptor.create_with_payload( __OPENFILE139__ )
        @adaptor.add_child( root_0, tree_for_OPENFILE139 )

        __LB140__ = match( LB, TOKENS_FOLLOWING_LB_IN_openFile_1412 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_openFile_1417 )
        what = expression
        @state.following.pop
        @adaptor.add_child( root_0, what.tree )
        __COMMA141__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_openFile_1419 )

        tree_for_COMMA141 = @adaptor.create_with_payload( __COMMA141__ )
        @adaptor.add_child( root_0, tree_for_COMMA141 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_openFile_1423 )
        mode = expression
        @state.following.pop
        @adaptor.add_child( root_0, mode.tree )
        __RB142__ = match( RB, TOKENS_FOLLOWING_RB_IN_openFile_1425 )
        # --> action
        return_value.result = [OpenFileTree.new(( what.nil? ? nil : what.result ), ( mode.nil? ? nil : mode.result )),tree_for_OPENFILE139]
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

    SizeOfReturnValue = define_return_scope :result

    # 
    # parser rule sizeOf
    # 
    # (in Giraffe.g)
    # 263:1: sizeOf returns [result] : SIZEOF LB expression RB ;
    # 
    def sizeOf
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )
      return_value = SizeOfReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __SIZEOF143__ = nil
      __LB144__ = nil
      __RB146__ = nil
      expression145 = nil

      tree_for_SIZEOF143 = nil
      tree_for_LB144 = nil
      tree_for_RB146 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 264:4: SIZEOF LB expression RB
        __SIZEOF143__ = match( SIZEOF, TOKENS_FOLLOWING_SIZEOF_IN_sizeOf_1445 )

        tree_for_SIZEOF143 = @adaptor.create_with_payload( __SIZEOF143__ )
        @adaptor.add_child( root_0, tree_for_SIZEOF143 )

        __LB144__ = match( LB, TOKENS_FOLLOWING_LB_IN_sizeOf_1447 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_sizeOf_1450 )
        expression145 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression145.tree )
        __RB146__ = match( RB, TOKENS_FOLLOWING_RB_IN_sizeOf_1452 )
        # --> action
        return_value.result = [SizeofTree.new(( expression145.nil? ? nil : expression145.result )),tree_for_SIZEOF143]
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

    ReadNumberReturnValue = define_return_scope :result

    # 
    # parser rule readNumber
    # 
    # (in Giraffe.g)
    # 267:1: readNumber returns [result] : READNUMBER LB expression RB ;
    # 
    def readNumber
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = ReadNumberReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __READNUMBER147__ = nil
      __LB148__ = nil
      __RB150__ = nil
      expression149 = nil

      tree_for_READNUMBER147 = nil
      tree_for_LB148 = nil
      tree_for_RB150 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 268:4: READNUMBER LB expression RB
        __READNUMBER147__ = match( READNUMBER, TOKENS_FOLLOWING_READNUMBER_IN_readNumber_1473 )

        tree_for_READNUMBER147 = @adaptor.create_with_payload( __READNUMBER147__ )
        @adaptor.add_child( root_0, tree_for_READNUMBER147 )

        __LB148__ = match( LB, TOKENS_FOLLOWING_LB_IN_readNumber_1475 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_readNumber_1478 )
        expression149 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression149.tree )
        __RB150__ = match( RB, TOKENS_FOLLOWING_RB_IN_readNumber_1480 )
        # --> action
        return_value.result = [ReadNumberTree.new(( expression149.nil? ? nil : expression149.result )),tree_for_READNUMBER147]
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

    WriteFileReturnValue = define_return_scope :result

    # 
    # parser rule writeFile
    # 
    # (in Giraffe.g)
    # 271:1: writeFile returns [result] : WRITEFILE LB where= expression COMMA what= expression RB ;
    # 
    def writeFile
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )
      return_value = WriteFileReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WRITEFILE151__ = nil
      __LB152__ = nil
      __COMMA153__ = nil
      __RB154__ = nil
      where = nil
      what = nil

      tree_for_WRITEFILE151 = nil
      tree_for_LB152 = nil
      tree_for_COMMA153 = nil
      tree_for_RB154 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 272:4: WRITEFILE LB where= expression COMMA what= expression RB
        __WRITEFILE151__ = match( WRITEFILE, TOKENS_FOLLOWING_WRITEFILE_IN_writeFile_1501 )

        tree_for_WRITEFILE151 = @adaptor.create_with_payload( __WRITEFILE151__ )
        @adaptor.add_child( root_0, tree_for_WRITEFILE151 )

        __LB152__ = match( LB, TOKENS_FOLLOWING_LB_IN_writeFile_1503 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_writeFile_1508 )
        where = expression
        @state.following.pop
        @adaptor.add_child( root_0, where.tree )
        __COMMA153__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_writeFile_1510 )

        tree_for_COMMA153 = @adaptor.create_with_payload( __COMMA153__ )
        @adaptor.add_child( root_0, tree_for_COMMA153 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_writeFile_1514 )
        what = expression
        @state.following.pop
        @adaptor.add_child( root_0, what.tree )
        __RB154__ = match( RB, TOKENS_FOLLOWING_RB_IN_writeFile_1516 )
        # --> action
        return_value.result = [WriteFileTree.new(( where.nil? ? nil : where.result ), ( what.nil? ? nil : what.result ), false),tree_for_WRITEFILE151]
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

    WriteFileAReturnValue = define_return_scope :result

    # 
    # parser rule writeFileA
    # 
    # (in Giraffe.g)
    # 275:1: writeFileA returns [result] : WRITEFILE LB where= expression COMMA what= expression RB ;
    # 
    def writeFileA
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = WriteFileAReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WRITEFILE155__ = nil
      __LB156__ = nil
      __COMMA157__ = nil
      __RB158__ = nil
      where = nil
      what = nil

      tree_for_WRITEFILE155 = nil
      tree_for_LB156 = nil
      tree_for_COMMA157 = nil
      tree_for_RB158 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 276:4: WRITEFILE LB where= expression COMMA what= expression RB
        __WRITEFILE155__ = match( WRITEFILE, TOKENS_FOLLOWING_WRITEFILE_IN_writeFileA_1539 )

        tree_for_WRITEFILE155 = @adaptor.create_with_payload( __WRITEFILE155__ )
        @adaptor.add_child( root_0, tree_for_WRITEFILE155 )

        __LB156__ = match( LB, TOKENS_FOLLOWING_LB_IN_writeFileA_1541 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_writeFileA_1546 )
        where = expression
        @state.following.pop
        @adaptor.add_child( root_0, where.tree )
        __COMMA157__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_writeFileA_1548 )

        tree_for_COMMA157 = @adaptor.create_with_payload( __COMMA157__ )
        @adaptor.add_child( root_0, tree_for_COMMA157 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_writeFileA_1552 )
        what = expression
        @state.following.pop
        @adaptor.add_child( root_0, what.tree )
        __RB158__ = match( RB, TOKENS_FOLLOWING_RB_IN_writeFileA_1554 )
        # --> action
        return_value.result = [WriteFileTree.new(( where.nil? ? nil : where.result ), ( what.nil? ? nil : what.result ), true),tree_for_WRITEFILE155]
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

    ArrayIndexTargetReturnValue = define_return_scope :result

    # 
    # parser rule arrayIndexTarget
    # 
    # (in Giraffe.g)
    # 279:1: arrayIndexTarget returns [result] : ( subexpression | INT | callVar | array | alloc | readInstruction | string | NULL | openFile | sizeOf | readNumber | writeFile );
    # 
    def arrayIndexTarget
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = ArrayIndexTargetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __INT160__ = nil
      __NULL166__ = nil
      subexpression159 = nil
      callVar161 = nil
      array162 = nil
      alloc163 = nil
      readInstruction164 = nil
      string165 = nil
      openFile167 = nil
      sizeOf168 = nil
      readNumber169 = nil
      writeFile170 = nil

      tree_for_INT160 = nil
      tree_for_NULL166 = nil

      begin
        # at line 280:2: ( subexpression | INT | callVar | array | alloc | readInstruction | string | NULL | openFile | sizeOf | readNumber | writeFile )
        alt_36 = 12
        case look_36 = @input.peek( 1 )
        when LB then alt_36 = 1
        when INT then alt_36 = 2
        when ID then alt_36 = 3
        when T__67 then alt_36 = 4
        when ALLOC then alt_36 = 5
        when READ then alt_36 = 6
        when STRING then alt_36 = 7
        when NULL then alt_36 = 8
        when OPENFILE then alt_36 = 9
        when SIZEOF then alt_36 = 10
        when READNUMBER then alt_36 = 11
        when WRITEFILE then alt_36 = 12
        else
          raise NoViableAlternative( "", 36, 0 )
        end
        case alt_36
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 280:4: subexpression
          @state.following.push( TOKENS_FOLLOWING_subexpression_IN_arrayIndexTarget_1575 )
          subexpression159 = subexpression
          @state.following.pop
          @adaptor.add_child( root_0, subexpression159.tree )
          # --> action
          return_value.result = ( subexpression159.nil? ? nil : subexpression159.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 281:4: INT
          __INT160__ = match( INT, TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1582 )

          tree_for_INT160 = @adaptor.create_with_payload( __INT160__ )
          @adaptor.add_child( root_0, tree_for_INT160 )

          # --> action
          return_value.result = [AtomTree.new(__INT160__.text.to_i),tree_for_INT160]
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 282:4: callVar
          @state.following.push( TOKENS_FOLLOWING_callVar_IN_arrayIndexTarget_1589 )
          callVar161 = callVar
          @state.following.pop
          @adaptor.add_child( root_0, callVar161.tree )
          # --> action
          return_value.result = ( callVar161.nil? ? nil : callVar161.result )
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 283:4: array
          @state.following.push( TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1596 )
          array162 = array
          @state.following.pop
          @adaptor.add_child( root_0, array162.tree )
          # --> action
          return_value.result = [ArrayTree.new(( array162.nil? ? nil : array162.result )),array162.tree]
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 284:4: alloc
          @state.following.push( TOKENS_FOLLOWING_alloc_IN_arrayIndexTarget_1603 )
          alloc163 = alloc
          @state.following.pop
          @adaptor.add_child( root_0, alloc163.tree )
          # --> action
          return_value.result = ( alloc163.nil? ? nil : alloc163.result )
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 285:4: readInstruction
          @state.following.push( TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1610 )
          readInstruction164 = readInstruction
          @state.following.pop
          @adaptor.add_child( root_0, readInstruction164.tree )
          # --> action
          return_value.result = ( readInstruction164.nil? ? nil : readInstruction164.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 286:4: string
          @state.following.push( TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1617 )
          string165 = string
          @state.following.pop
          @adaptor.add_child( root_0, string165.tree )
          # --> action
          return_value.result = [StringTree.new(( string165.nil? ? nil : string165.result )),string165.tree]
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 287:4: NULL
          __NULL166__ = match( NULL, TOKENS_FOLLOWING_NULL_IN_arrayIndexTarget_1624 )

          tree_for_NULL166 = @adaptor.create_with_payload( __NULL166__ )
          @adaptor.add_child( root_0, tree_for_NULL166 )

          # --> action
          return_value.result = [NilTree.new,tree_for_NULL166]
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 288:4: openFile
          @state.following.push( TOKENS_FOLLOWING_openFile_IN_arrayIndexTarget_1631 )
          openFile167 = openFile
          @state.following.pop
          @adaptor.add_child( root_0, openFile167.tree )
          # --> action
          return_value.result = ( openFile167.nil? ? nil : openFile167.result )
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 289:4: sizeOf
          @state.following.push( TOKENS_FOLLOWING_sizeOf_IN_arrayIndexTarget_1638 )
          sizeOf168 = sizeOf
          @state.following.pop
          @adaptor.add_child( root_0, sizeOf168.tree )
          # --> action
          return_value.result = ( sizeOf168.nil? ? nil : sizeOf168.result )
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 290:4: readNumber
          @state.following.push( TOKENS_FOLLOWING_readNumber_IN_arrayIndexTarget_1645 )
          readNumber169 = readNumber
          @state.following.pop
          @adaptor.add_child( root_0, readNumber169.tree )
          # --> action
          return_value.result = ( readNumber169.nil? ? nil : readNumber169.result )
          # <-- action

        when 12
          root_0 = @adaptor.create_flat_list


          # at line 291:4: writeFile
          @state.following.push( TOKENS_FOLLOWING_writeFile_IN_arrayIndexTarget_1652 )
          writeFile170 = writeFile
          @state.following.pop
          @adaptor.add_child( root_0, writeFile170.tree )
          # --> action
          return_value.result = ( writeFile170.nil? ? nil : writeFile170.result )
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

    SubexpressionReturnValue = define_return_scope :result

    # 
    # parser rule subexpression
    # 
    # (in Giraffe.g)
    # 294:1: subexpression returns [result] : LB expression RB ;
    # 
    def subexpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = SubexpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __LB171__ = nil
      __RB173__ = nil
      expression172 = nil

      tree_for_LB171 = nil
      tree_for_RB173 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 295:4: LB expression RB
        __LB171__ = match( LB, TOKENS_FOLLOWING_LB_IN_subexpression_1669 )

        tree_for_LB171 = @adaptor.create_with_payload( __LB171__ )
        @adaptor.add_child( root_0, tree_for_LB171 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_subexpression_1671 )
        expression172 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression172.tree )
        __RB173__ = match( RB, TOKENS_FOLLOWING_RB_IN_subexpression_1673 )

        tree_for_RB173 = @adaptor.create_with_payload( __RB173__ )
        @adaptor.add_child( root_0, tree_for_RB173 )

        # --> action
        return_value.result = ( expression172.nil? ? nil : expression172.result )
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

    ArrayReturnValue = define_return_scope :result

    # 
    # parser rule array
    # 
    # (in Giraffe.g)
    # 298:1: array returns [result] : '[' ( ( '\\n' )? ex1= expression ( COMMA ( '\\n' )? ex2= expression )* )? ( '\\n' )? ']' ;
    # 
    def array
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = ArrayReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal174 = nil
      char_literal175 = nil
      __COMMA176__ = nil
      char_literal177 = nil
      char_literal178 = nil
      char_literal179 = nil
      ex1 = nil
      ex2 = nil

      tree_for_char_literal174 = nil
      tree_for_char_literal175 = nil
      tree_for_COMMA176 = nil
      tree_for_char_literal177 = nil
      tree_for_char_literal178 = nil
      tree_for_char_literal179 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 299:4: '[' ( ( '\\n' )? ex1= expression ( COMMA ( '\\n' )? ex2= expression )* )? ( '\\n' )? ']'
        char_literal174 = match( T__67, TOKENS_FOLLOWING_T__67_IN_array_1690 )

        tree_for_char_literal174 = @adaptor.create_with_payload( char_literal174 )
        @adaptor.add_child( root_0, tree_for_char_literal174 )

        # --> action
        return_value.result = []
        # <-- action
        # at line 300:3: ( ( '\\n' )? ex1= expression ( COMMA ( '\\n' )? ex2= expression )* )?
        alt_40 = 2
        look_40_0 = @input.peek( 1 )

        if ( look_40_0 == T__66 )
          look_40_1 = @input.peek( 2 )

          if ( look_40_1 == READ || look_40_1.between?( PLUS, INT ) || look_40_1 == LB || look_40_1 == ID || look_40_1 == NOT || look_40_1.between?( OPENFILE, ALLOC ) || look_40_1 == STRING || look_40_1 == T__67 )
            alt_40 = 1
          end
        elsif ( look_40_0 == READ || look_40_0.between?( PLUS, INT ) || look_40_0 == LB || look_40_0 == ID || look_40_0 == NOT || look_40_0.between?( OPENFILE, ALLOC ) || look_40_0 == STRING || look_40_0 == T__67 )
          alt_40 = 1
        end
        case alt_40
        when 1
          # at line 300:4: ( '\\n' )? ex1= expression ( COMMA ( '\\n' )? ex2= expression )*
          # at line 300:4: ( '\\n' )?
          alt_37 = 2
          look_37_0 = @input.peek( 1 )

          if ( look_37_0 == T__66 )
            alt_37 = 1
          end
          case alt_37
          when 1
            # at line 300:4: '\\n'
            char_literal175 = match( T__66, TOKENS_FOLLOWING_T__66_IN_array_1697 )

            tree_for_char_literal175 = @adaptor.create_with_payload( char_literal175 )
            @adaptor.add_child( root_0, tree_for_char_literal175 )


          end
          @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1702 )
          ex1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, ex1.tree )
          # --> action
          return_value.result << ( ex1.nil? ? nil : ex1.result )
          # <-- action
          # at line 301:3: ( COMMA ( '\\n' )? ex2= expression )*
          while true # decision 39
            alt_39 = 2
            look_39_0 = @input.peek( 1 )

            if ( look_39_0 == COMMA )
              alt_39 = 1

            end
            case alt_39
            when 1
              # at line 301:4: COMMA ( '\\n' )? ex2= expression
              __COMMA176__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_array_1709 )

              tree_for_COMMA176 = @adaptor.create_with_payload( __COMMA176__ )
              @adaptor.add_child( root_0, tree_for_COMMA176 )

              # at line 301:10: ( '\\n' )?
              alt_38 = 2
              look_38_0 = @input.peek( 1 )

              if ( look_38_0 == T__66 )
                alt_38 = 1
              end
              case alt_38
              when 1
                # at line 301:10: '\\n'
                char_literal177 = match( T__66, TOKENS_FOLLOWING_T__66_IN_array_1711 )

                tree_for_char_literal177 = @adaptor.create_with_payload( char_literal177 )
                @adaptor.add_child( root_0, tree_for_char_literal177 )


              end
              @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1716 )
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
        # at line 302:3: ( '\\n' )?
        alt_41 = 2
        look_41_0 = @input.peek( 1 )

        if ( look_41_0 == T__66 )
          alt_41 = 1
        end
        case alt_41
        when 1
          # at line 302:3: '\\n'
          char_literal178 = match( T__66, TOKENS_FOLLOWING_T__66_IN_array_1727 )

          tree_for_char_literal178 = @adaptor.create_with_payload( char_literal178 )
          @adaptor.add_child( root_0, tree_for_char_literal178 )


        end
        char_literal179 = match( T__68, TOKENS_FOLLOWING_T__68_IN_array_1730 )

        tree_for_char_literal179 = @adaptor.create_with_payload( char_literal179 )
        @adaptor.add_child( root_0, tree_for_char_literal179 )

        # - - - - - - - rule clean up - - - - - - - -
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
    # 305:1: alloc returns [result] : ALLOC LB expression RB ;
    # 
    def alloc
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = AllocReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ALLOC180__ = nil
      __LB181__ = nil
      __RB183__ = nil
      expression182 = nil

      tree_for_ALLOC180 = nil
      tree_for_LB181 = nil
      tree_for_RB183 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 306:4: ALLOC LB expression RB
        __ALLOC180__ = match( ALLOC, TOKENS_FOLLOWING_ALLOC_IN_alloc_1746 )

        tree_for_ALLOC180 = @adaptor.create_with_payload( __ALLOC180__ )
        @adaptor.add_child( root_0, tree_for_ALLOC180 )

        __LB181__ = match( LB, TOKENS_FOLLOWING_LB_IN_alloc_1748 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_alloc_1751 )
        expression182 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression182.tree )
        __RB183__ = match( RB, TOKENS_FOLLOWING_RB_IN_alloc_1753 )
        # --> action
        return_value.result = [AllocTree.new(( expression182.nil? ? nil : expression182.result )),tree_for_ALLOC180]
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
    # 311:1: indexed returns [result] : identified ( '[' expression ']' )* ;
    # 
    def indexed
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )
      return_value = IndexedReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal185 = nil
      char_literal187 = nil
      identified184 = nil
      expression186 = nil

      tree_for_char_literal185 = nil
      tree_for_char_literal187 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 312:4: identified ( '[' expression ']' )*
        @state.following.push( TOKENS_FOLLOWING_identified_IN_indexed_1776 )
        identified184 = identified
        @state.following.pop
        @adaptor.add_child( root_0, identified184.tree )
        # --> action
        return_value.result = ( identified184.nil? ? nil : identified184.result )
        # <-- action
        # at line 314:3: ( '[' expression ']' )*
        while true # decision 42
          alt_42 = 2
          look_42_0 = @input.peek( 1 )

          if ( look_42_0 == T__67 )
            alt_42 = 1

          end
          case alt_42
          when 1
            # at line 314:4: '[' expression ']'
            char_literal185 = match( T__67, TOKENS_FOLLOWING_T__67_IN_indexed_1786 )

            tree_for_char_literal185 = @adaptor.create_with_payload( char_literal185 )
            @adaptor.add_child( root_0, tree_for_char_literal185 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_indexed_1788 )
            expression186 = expression
            @state.following.pop
            @adaptor.add_child( root_0, expression186.tree )
            char_literal187 = match( T__68, TOKENS_FOLLOWING_T__68_IN_indexed_1790 )

            tree_for_char_literal187 = @adaptor.create_with_payload( char_literal187 )
            @adaptor.add_child( root_0, tree_for_char_literal187 )

            # --> action
            return_value.result = [IndexTree.new(return_value.result, ( expression186.nil? ? nil : expression186.result )),identified184.tree]
            # <-- action

          else
            break # out of loop for decision 42
          end
        end # loop for decision 42
        # - - - - - - - rule clean up - - - - - - - -
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
    # 319:1: identified returns [result] : ID ;
    # 
    def identified
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )
      return_value = IdentifiedReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID188__ = nil

      tree_for_ID188 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 320:4: ID
        __ID188__ = match( ID, TOKENS_FOLLOWING_ID_IN_identified_1811 )

        tree_for_ID188 = @adaptor.create_with_payload( __ID188__ )
        @adaptor.add_child( root_0, tree_for_ID188 )

        # --> action
        return_value.result = [VarTree.new(__ID188__.text),tree_for_ID188]
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
    # 323:1: assignment returns [result] : indexed ASSIGN expression ;
    # 
    def assignment
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )
      return_value = AssignmentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ASSIGN190__ = nil
      indexed189 = nil
      expression191 = nil

      tree_for_ASSIGN190 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 324:4: indexed ASSIGN expression
        @state.following.push( TOKENS_FOLLOWING_indexed_IN_assignment_1828 )
        indexed189 = indexed
        @state.following.pop
        @adaptor.add_child( root_0, indexed189.tree )
        __ASSIGN190__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1830 )

        tree_for_ASSIGN190 = @adaptor.create_with_payload( __ASSIGN190__ )
        root_0 = @adaptor.become_root( tree_for_ASSIGN190, root_0 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1833 )
        expression191 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression191.tree )
        # --> action
         return_value.result = [AssignTree.new(( indexed189.nil? ? nil : indexed189.result ),( expression191.nil? ? nil : expression191.result )),indexed189.tree] 
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
    # 327:1: fragment bool returns [result] : ( TRUE | FALSE );
    # 
    def bool
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )
      return_value = BoolReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __TRUE192__ = nil
      __FALSE193__ = nil

      tree_for_TRUE192 = nil
      tree_for_FALSE193 = nil

      begin
        # at line 329:2: ( TRUE | FALSE )
        alt_43 = 2
        look_43_0 = @input.peek( 1 )

        if ( look_43_0 == TRUE )
          alt_43 = 1
        elsif ( look_43_0 == FALSE )
          alt_43 = 2
        else
          raise NoViableAlternative( "", 43, 0 )
        end
        case alt_43
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 329:4: TRUE
          __TRUE192__ = match( TRUE, TOKENS_FOLLOWING_TRUE_IN_bool_1854 )

          tree_for_TRUE192 = @adaptor.create_with_payload( __TRUE192__ )
          @adaptor.add_child( root_0, tree_for_TRUE192 )

          # --> action
          return_value.result = new AtomTree(1)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 330:5: FALSE
          __FALSE193__ = match( FALSE, TOKENS_FOLLOWING_FALSE_IN_bool_1862 )

          tree_for_FALSE193 = @adaptor.create_with_payload( __FALSE193__ )
          @adaptor.add_child( root_0, tree_for_FALSE193 )

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
    # 333:1: string returns [result] : STRING ;
    # 
    def string
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )
      return_value = StringReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __STRING194__ = nil

      tree_for_STRING194 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 334:4: STRING
        __STRING194__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_string_1883 )

        tree_for_STRING194 = @adaptor.create_with_payload( __STRING194__ )
        @adaptor.add_child( root_0, tree_for_STRING194 )

        # --> action
        return_value.result = __STRING194__.text[1..-2]
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
      EOT = unpack( 13, -1 )
      EOF = unpack( 13, -1 )
      MIN = unpack( 1, 4, 1, 12, 11, -1 )
      MAX = unpack( 1, 66, 1, 67, 11, -1 )
      ACCEPT = unpack( 2, -1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 9, 
                       1, 10, 1, 11, 1, 8, 1, 1 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 2, 10, 1, -1, 1, 7, 3, -1, 1, 6, 3, -1, 1, 3, 1, -1, 1, 
                10, 3, -1, 1, 4, 1, 5, 1, 2, 1, 1, 13, -1, 1, 8, 3, -1, 
                1, 9, 22, -1, 2, 10 ),
        unpack( 1, 11, 32, -1, 1, 12, 21, -1, 1, 12 ),
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
          96:1: instruction returns [result] : ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | returnInstruction | aloneCall | closeFile | writeFileA | );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa10 = DFA10.new( self, 10 )

    end
    TOKENS_FOLLOWING_functions_IN_program_52 = Set[ 1 ]
    TOKENS_FOLLOWING_func_IN_funcdef_70 = Set[ 1 ]
    TOKENS_FOLLOWING_funcdef_IN_functions_98 = Set[ 4, 5, 65, 66 ]
    TOKENS_FOLLOWING_functionsRest_IN_functions_106 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_functionsRest_132 = Set[ 65, 66 ]
    TOKENS_FOLLOWING_T__65_IN_functionsRest_136 = Set[ 66 ]
    TOKENS_FOLLOWING_T__66_IN_functionsRest_140 = Set[ 4, 5, 24, 25, 65, 66 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_functionsRest_146 = Set[ 4, 5, 24, 25, 65, 66 ]
    TOKENS_FOLLOWING_functions_IN_functionsRest_153 = Set[ 1 ]
    TOKENS_FOLLOWING_instruction_IN_block_187 = Set[ 4, 5, 65, 66 ]
    TOKENS_FOLLOWING_instructionRest_IN_block_197 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_instructionRest_223 = Set[ 65, 66 ]
    TOKENS_FOLLOWING_T__65_IN_instructionRest_227 = Set[ 66 ]
    TOKENS_FOLLOWING_T__66_IN_instructionRest_231 = Set[ 4, 5, 7, 11, 15, 21, 22, 23, 24, 38, 42, 65, 66 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_237 = Set[ 4, 5, 7, 11, 15, 21, 22, 23, 24, 38, 42, 65, 66 ]
    TOKENS_FOLLOWING_block_IN_instructionRest_244 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_IN_instruction_273 = Set[ 1 ]
    TOKENS_FOLLOWING_forCycle_IN_instruction_280 = Set[ 1 ]
    TOKENS_FOLLOWING_ifInstruction_IN_instruction_287 = Set[ 1 ]
    TOKENS_FOLLOWING_whileCycle_IN_instruction_294 = Set[ 1 ]
    TOKENS_FOLLOWING_doCycle_IN_instruction_301 = Set[ 1 ]
    TOKENS_FOLLOWING_printInstruction_IN_instruction_308 = Set[ 1 ]
    TOKENS_FOLLOWING_returnInstruction_IN_instruction_315 = Set[ 1 ]
    TOKENS_FOLLOWING_aloneCall_IN_instruction_323 = Set[ 1 ]
    TOKENS_FOLLOWING_closeFile_IN_instruction_330 = Set[ 1 ]
    TOKENS_FOLLOWING_writeFileA_IN_instruction_337 = Set[ 1 ]
    TOKENS_FOLLOWING_READ_IN_readInstruction_360 = Set[ 1 ]
    TOKENS_FOLLOWING_RETURN_IN_returnInstruction_377 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_returnInstruction_380 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_statusCode_402 = Set[ 10 ]
    TOKENS_FOLLOWING_MINUS_IN_statusCode_406 = Set[ 10 ]
    TOKENS_FOLLOWING_INT_IN_statusCode_412 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINT_IN_printInstruction_433 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_printInstruction_436 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_printText_IN_printInstruction_439 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_printInstruction_441 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_printText_466 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_COMMA_IN_printText_473 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_printText_IN_printText_477 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_ifInstruction_501 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_ifInstruction_504 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_ifInstruction_507 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_ifInstruction_509 = Set[ 16 ]
    TOKENS_FOLLOWING_LCB_IN_ifInstruction_512 = Set[ 4, 5, 7, 11, 15, 21, 22, 23, 24, 38, 42, 65, 66 ]
    TOKENS_FOLLOWING_block_IN_ifInstruction_515 = Set[ 17 ]
    TOKENS_FOLLOWING_RCB_IN_ifInstruction_517 = Set[ 18, 19, 20 ]
    TOKENS_FOLLOWING_ifRest_IN_ifInstruction_520 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_ifRest_539 = Set[ 16 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_541 = Set[ 4, 5, 7, 11, 15, 21, 22, 23, 24, 38, 42, 65, 66 ]
    TOKENS_FOLLOWING_block_IN_ifRest_544 = Set[ 17 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_546 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_ifRest_554 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_ifRest_562 = Set[ 16 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_564 = Set[ 4, 5, 7, 11, 15, 21, 22, 23, 24, 38, 42, 65, 66 ]
    TOKENS_FOLLOWING_block_IN_ifRest_567 = Set[ 17 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_569 = Set[ 18, 19, 20 ]
    TOKENS_FOLLOWING_ifRest_IN_ifRest_574 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_whileCycle_601 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_whileCycle_603 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_whileCycle_605 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_whileCycle_607 = Set[ 16 ]
    TOKENS_FOLLOWING_LCB_IN_whileCycle_609 = Set[ 4, 5, 7, 11, 15, 21, 22, 23, 24, 38, 42, 65, 66 ]
    TOKENS_FOLLOWING_block_IN_whileCycle_612 = Set[ 17 ]
    TOKENS_FOLLOWING_RCB_IN_whileCycle_614 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_doCycle_636 = Set[ 16 ]
    TOKENS_FOLLOWING_LCB_IN_doCycle_638 = Set[ 4, 5, 7, 11, 15, 21, 22, 23, 24, 38, 42, 65, 66 ]
    TOKENS_FOLLOWING_block_IN_doCycle_641 = Set[ 17 ]
    TOKENS_FOLLOWING_RCB_IN_doCycle_643 = Set[ 21 ]
    TOKENS_FOLLOWING_WHILE_IN_doCycle_646 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_doCycle_648 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_doCycle_650 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_doCycle_652 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_forCycle_673 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_forCycle_675 = Set[ 24 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_679 = Set[ 4, 5, 65, 66 ]
    TOKENS_FOLLOWING_COMMENT_IN_forCycle_684 = Set[ 65, 66 ]
    TOKENS_FOLLOWING_T__65_IN_forCycle_688 = Set[ 66 ]
    TOKENS_FOLLOWING_T__66_IN_forCycle_692 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_698 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_forCycle_703 = Set[ 4, 5, 65, 66 ]
    TOKENS_FOLLOWING_COMMENT_IN_forCycle_708 = Set[ 65, 66 ]
    TOKENS_FOLLOWING_T__65_IN_forCycle_712 = Set[ 66 ]
    TOKENS_FOLLOWING_T__66_IN_forCycle_716 = Set[ 24 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_722 = Set[ 24 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_729 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_forCycle_731 = Set[ 16 ]
    TOKENS_FOLLOWING_LCB_IN_forCycle_733 = Set[ 4, 5, 7, 11, 15, 21, 22, 23, 24, 38, 42, 65, 66 ]
    TOKENS_FOLLOWING_block_IN_forCycle_736 = Set[ 17 ]
    TOKENS_FOLLOWING_RCB_IN_forCycle_738 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_func_760 = Set[ 12, 16 ]
    TOKENS_FOLLOWING_LB_IN_func_763 = Set[ 13, 24 ]
    TOKENS_FOLLOWING_params_IN_func_766 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_func_768 = Set[ 16 ]
    TOKENS_FOLLOWING_LCB_IN_func_773 = Set[ 4, 5, 7, 11, 15, 21, 22, 23, 24, 38, 42, 65, 66 ]
    TOKENS_FOLLOWING_block_IN_func_776 = Set[ 17 ]
    TOKENS_FOLLOWING_RCB_IN_func_778 = Set[ 1 ]
    TOKENS_FOLLOWING_MAIN_IN_func_788 = Set[ 16 ]
    TOKENS_FOLLOWING_LCB_IN_func_791 = Set[ 4, 5, 7, 11, 15, 21, 22, 23, 24, 38, 42, 65, 66 ]
    TOKENS_FOLLOWING_block_IN_func_794 = Set[ 17 ]
    TOKENS_FOLLOWING_RCB_IN_func_796 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_params_816 = Set[ 14 ]
    TOKENS_FOLLOWING_paramRest_IN_params_818 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_paramRest_843 = Set[ 24 ]
    TOKENS_FOLLOWING_params_IN_paramRest_846 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_aloneCall_874 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_aloneCall_877 = Set[ 6, 8, 9, 10, 12, 13, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_args_IN_aloneCall_882 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_aloneCall_885 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_callVar_905 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_LB_IN_callVar_916 = Set[ 6, 8, 9, 10, 12, 13, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_args_IN_callVar_920 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_callVar_923 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_args_950 = Set[ 14 ]
    TOKENS_FOLLOWING_argsRest_IN_args_952 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsRest_971 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_args_IN_argsRest_974 = Set[ 1 ]
    TOKENS_FOLLOWING_orOperand_IN_expression_1002 = Set[ 1, 26 ]
    TOKENS_FOLLOWING_OR_IN_expression_1009 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_expression_1014 = Set[ 1 ]
    TOKENS_FOLLOWING_andOperand_IN_orOperand_1037 = Set[ 1, 27 ]
    TOKENS_FOLLOWING_AND_IN_orOperand_1044 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_orOperand_IN_orOperand_1049 = Set[ 1 ]
    TOKENS_FOLLOWING_compareOperand_IN_andOperand_1070 = Set[ 1, 28, 29, 30, 31, 32, 33 ]
    TOKENS_FOLLOWING_EQ_IN_andOperand_1080 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_1085 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_andOperand_1094 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_1099 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_andOperand_1108 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_1113 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_andOperand_1122 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_1127 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_andOperand_1136 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_1141 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_andOperand_1150 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_1155 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_andOperand_1170 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_andOperand_1173 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_andOperand_1178 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_andOperand_1180 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperand_IN_compareOperand_1203 = Set[ 1, 8, 9 ]
    TOKENS_FOLLOWING_PLUS_IN_compareOperand_1211 = Set[ 6, 8, 9, 10, 12, 24, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_compareOperand_IN_compareOperand_1216 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_compareOperand_1224 = Set[ 6, 8, 9, 10, 12, 24, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_compareOperand_IN_compareOperand_1229 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperand_1253 = Set[ 1, 35, 36, 37 ]
    TOKENS_FOLLOWING_MUL_IN_addOperand_1261 = Set[ 6, 8, 9, 10, 12, 24, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1266 = Set[ 1 ]
    TOKENS_FOLLOWING_DIV_IN_addOperand_1274 = Set[ 6, 8, 9, 10, 12, 24, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1279 = Set[ 1 ]
    TOKENS_FOLLOWING_MOD_IN_addOperand_1287 = Set[ 6, 8, 9, 10, 12, 24, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1292 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_mulOperand_1314 = Set[ 6, 8, 9, 10, 12, 24, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1316 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_mulOperand_1323 = Set[ 6, 8, 9, 10, 12, 24, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1325 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1332 = Set[ 1 ]
    TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1349 = Set[ 1, 67 ]
    TOKENS_FOLLOWING_T__67_IN_mulOperandRest_1357 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_mulOperandRest_1359 = Set[ 68 ]
    TOKENS_FOLLOWING_T__68_IN_mulOperandRest_1361 = Set[ 1, 67 ]
    TOKENS_FOLLOWING_CLOSEFILE_IN_closeFile_1382 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_closeFile_1384 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_closeFile_1387 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_closeFile_1389 = Set[ 1 ]
    TOKENS_FOLLOWING_OPENFILE_IN_openFile_1410 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_openFile_1412 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_openFile_1417 = Set[ 14 ]
    TOKENS_FOLLOWING_COMMA_IN_openFile_1419 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_openFile_1423 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_openFile_1425 = Set[ 1 ]
    TOKENS_FOLLOWING_SIZEOF_IN_sizeOf_1445 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_sizeOf_1447 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_sizeOf_1450 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_sizeOf_1452 = Set[ 1 ]
    TOKENS_FOLLOWING_READNUMBER_IN_readNumber_1473 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_readNumber_1475 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_readNumber_1478 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_readNumber_1480 = Set[ 1 ]
    TOKENS_FOLLOWING_WRITEFILE_IN_writeFile_1501 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_writeFile_1503 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_writeFile_1508 = Set[ 14 ]
    TOKENS_FOLLOWING_COMMA_IN_writeFile_1510 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_writeFile_1514 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_writeFile_1516 = Set[ 1 ]
    TOKENS_FOLLOWING_WRITEFILE_IN_writeFileA_1539 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_writeFileA_1541 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_writeFileA_1546 = Set[ 14 ]
    TOKENS_FOLLOWING_COMMA_IN_writeFileA_1548 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_writeFileA_1552 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_writeFileA_1554 = Set[ 1 ]
    TOKENS_FOLLOWING_subexpression_IN_arrayIndexTarget_1575 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1582 = Set[ 1 ]
    TOKENS_FOLLOWING_callVar_IN_arrayIndexTarget_1589 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1596 = Set[ 1 ]
    TOKENS_FOLLOWING_alloc_IN_arrayIndexTarget_1603 = Set[ 1 ]
    TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1610 = Set[ 1 ]
    TOKENS_FOLLOWING_string_IN_arrayIndexTarget_1617 = Set[ 1 ]
    TOKENS_FOLLOWING_NULL_IN_arrayIndexTarget_1624 = Set[ 1 ]
    TOKENS_FOLLOWING_openFile_IN_arrayIndexTarget_1631 = Set[ 1 ]
    TOKENS_FOLLOWING_sizeOf_IN_arrayIndexTarget_1638 = Set[ 1 ]
    TOKENS_FOLLOWING_readNumber_IN_arrayIndexTarget_1645 = Set[ 1 ]
    TOKENS_FOLLOWING_writeFile_IN_arrayIndexTarget_1652 = Set[ 1 ]
    TOKENS_FOLLOWING_LB_IN_subexpression_1669 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_subexpression_1671 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_subexpression_1673 = Set[ 1 ]
    TOKENS_FOLLOWING_T__67_IN_array_1690 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 66, 67, 68 ]
    TOKENS_FOLLOWING_T__66_IN_array_1697 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_array_1702 = Set[ 14, 66, 68 ]
    TOKENS_FOLLOWING_COMMA_IN_array_1709 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 66, 67 ]
    TOKENS_FOLLOWING_T__66_IN_array_1711 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_array_1716 = Set[ 14, 66, 68 ]
    TOKENS_FOLLOWING_T__66_IN_array_1727 = Set[ 68 ]
    TOKENS_FOLLOWING_T__68_IN_array_1730 = Set[ 1 ]
    TOKENS_FOLLOWING_ALLOC_IN_alloc_1746 = Set[ 12 ]
    TOKENS_FOLLOWING_LB_IN_alloc_1748 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_alloc_1751 = Set[ 13 ]
    TOKENS_FOLLOWING_RB_IN_alloc_1753 = Set[ 1 ]
    TOKENS_FOLLOWING_identified_IN_indexed_1776 = Set[ 1, 67 ]
    TOKENS_FOLLOWING_T__67_IN_indexed_1786 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_indexed_1788 = Set[ 68 ]
    TOKENS_FOLLOWING_T__68_IN_indexed_1790 = Set[ 1, 67 ]
    TOKENS_FOLLOWING_ID_IN_identified_1811 = Set[ 1 ]
    TOKENS_FOLLOWING_indexed_IN_assignment_1828 = Set[ 45 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1830 = Set[ 6, 8, 9, 10, 12, 24, 34, 39, 40, 41, 42, 43, 44, 48, 67 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1833 = Set[ 1 ]
    TOKENS_FOLLOWING_TRUE_IN_bool_1854 = Set[ 1 ]
    TOKENS_FOLLOWING_FALSE_IN_bool_1862 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_string_1883 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end


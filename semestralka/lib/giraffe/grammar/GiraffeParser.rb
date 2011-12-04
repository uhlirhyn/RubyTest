#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-12-04 19:31:28
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
require './lib/giraffe/tree/declareTree.rb'
require './lib/giraffe/operators.rb'

# - - - - - - end action @parser::header - - - - - - -


module Giraffe
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :EXPONENT => 49, :MAIN => 27, :LT => 36, :RB => 11, :WHILE => 23, 
                   :MOD => 42, :DO => 24, :FOR => 25, :FLOAT => 50, :NOT => 33, 
                   :RCB => 19, :ID => 26, :AND => 32, :EOF => -1, :BREAK => 7, 
                   :IF => 17, :T__55 => 55, :T__56 => 56, :QUOTE => 52, 
                   :T__57 => 57, :T__58 => 58, :CONTINUE => 48, :QM => 54, 
                   :COMMA => 16, :LCB => 18, :ATYPE => 29, :PRINTLN => 47, 
                   :RETURN => 8, :PLUS => 12, :EQ => 34, :COMMENT => 4, 
                   :DOT => 30, :NE => 35, :EXIT => 9, :GE => 39, :ELSE => 20, 
                   :INT => 14, :SEMICOLON => 5, :MINUS => 13, :TRUE => 44, 
                   :MUL => 40, :PRINT => 15, :PRINTL => 46, :ELSEIF => 21, 
                   :COLON => 53, :ELIF => 22, :WS => 51, :READ => 6, :ITYPE => 28, 
                   :OR => 31, :ASSIGN => 43, :GT => 37, :LB => 10, :DIV => 41, 
                   :FALSE => 45, :LE => 38 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "COMMENT", "SEMICOLON", "READ", "BREAK", "RETURN", "EXIT", 
                    "LB", "RB", "PLUS", "MINUS", "INT", "PRINT", "COMMA", 
                    "IF", "LCB", "RCB", "ELSE", "ELSEIF", "ELIF", "WHILE", 
                    "DO", "FOR", "ID", "MAIN", "ITYPE", "ATYPE", "DOT", 
                    "OR", "AND", "NOT", "EQ", "NE", "LT", "GT", "LE", "GE", 
                    "MUL", "DIV", "MOD", "ASSIGN", "TRUE", "FALSE", "PRINTL", 
                    "PRINTLN", "CONTINUE", "EXPONENT", "FLOAT", "WS", "QUOTE", 
                    "COLON", "QM", "'\\r'", "'\\n'", "'['", "']'" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = Giraffe
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :program, :funcdef, :functions, :functionsRest, :block, 
                     :instructionRest, :instruction, :readInstruction, :breakInstruction, 
                     :returnInstruction, :exitInstruction, :statusCode, 
                     :printInstruction, :printText, :ifInstruction, :ifRest, 
                     :whileCycle, :doCycle, :forCycle, :func, :type, :params, 
                     :paramRest, :aloneCall, :call, :args, :argsRest, :condition, 
                     :orOperand, :boolOperand, :expression, :addOperand, 
                     :mulOperand, :mulOperandRest, :arrayIndexTarget, :array, 
                     :indexed, :identified, :declaration, :assignment, :bool ].freeze


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
    # 40:1: program returns [result] : functions ;
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


        # at line 41:4: functions
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
    # 44:1: funcdef returns [result] : ( func | );
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
        # at line 45:2: ( func | )
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0.between?( MAIN, ATYPE ) )
          alt_1 = 1
        elsif ( look_1_0 == EOF || look_1_0.between?( COMMENT, SEMICOLON ) || look_1_0.between?( T__55, T__56 ) )
          alt_1 = 2
        else
          raise NoViableAlternative( "", 1, 0 )
        end
        case alt_1
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 45:4: func
          @state.following.push( TOKENS_FOLLOWING_func_IN_funcdef_70 )
          func2 = func
          @state.following.pop
          @adaptor.add_child( root_0, func2.tree )
          # --> action
          return_value.result = ( func2.nil? ? nil : func2.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 46:4: 
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
    # 49:1: functions returns [list] : funcdef functionsRest ;
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


        # at line 50:4: funcdef functionsRest
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
    # 57:1: functionsRest returns [list] : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) functions | );
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
        # at line 58:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) functions | )
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0.between?( COMMENT, SEMICOLON ) || look_5_0.between?( T__55, T__56 ) )
          alt_5 = 1
        elsif ( look_5_0 == EOF )
          alt_5 = 2
        else
          raise NoViableAlternative( "", 5, 0 )
        end
        case alt_5
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 58:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) functions
          # at line 58:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
          alt_4 = 2
          look_4_0 = @input.peek( 1 )

          if ( look_4_0 == COMMENT || look_4_0.between?( T__55, T__56 ) )
            alt_4 = 1
          elsif ( look_4_0 == SEMICOLON )
            alt_4 = 2
          else
            raise NoViableAlternative( "", 4, 0 )
          end
          case alt_4
          when 1
            # at line 58:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 58:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 58:8: ( COMMENT )? ( '\\r' )? '\\n'
            # at line 58:15: ( COMMENT )?
            alt_2 = 2
            look_2_0 = @input.peek( 1 )

            if ( look_2_0 == COMMENT )
              alt_2 = 1
            end
            case alt_2
            when 1
              # at line 58:15: COMMENT
              __COMMENT5__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_functionsRest_132 )

            end
            # at line 58:22: ( '\\r' )?
            alt_3 = 2
            look_3_0 = @input.peek( 1 )

            if ( look_3_0 == T__55 )
              alt_3 = 1
            end
            case alt_3
            when 1
              # at line 58:22: '\\r'
              char_literal6 = match( T__55, TOKENS_FOLLOWING_T__55_IN_functionsRest_136 )

            end
            char_literal7 = match( T__56, TOKENS_FOLLOWING_T__56_IN_functionsRest_140 )


          when 2
            # at line 58:34: SEMICOLON
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


          # at line 61:4: 
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
    # 64:1: block returns [list] : instruction instructionRest ;
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


        # at line 65:4: instruction instructionRest
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
    # 72:1: instructionRest returns [list] : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | );
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
        # at line 73:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | )
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0.between?( COMMENT, SEMICOLON ) || look_9_0.between?( T__55, T__56 ) )
          alt_9 = 1
        elsif ( look_9_0 == RCB )
          alt_9 = 2
        else
          raise NoViableAlternative( "", 9, 0 )
        end
        case alt_9
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 73:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block
          # at line 73:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0 == COMMENT || look_8_0.between?( T__55, T__56 ) )
            alt_8 = 1
          elsif ( look_8_0 == SEMICOLON )
            alt_8 = 2
          else
            raise NoViableAlternative( "", 8, 0 )
          end
          case alt_8
          when 1
            # at line 73:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 73:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 73:8: ( COMMENT )? ( '\\r' )? '\\n'
            # at line 73:15: ( COMMENT )?
            alt_6 = 2
            look_6_0 = @input.peek( 1 )

            if ( look_6_0 == COMMENT )
              alt_6 = 1
            end
            case alt_6
            when 1
              # at line 73:15: COMMENT
              __COMMENT12__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_instructionRest_223 )

            end
            # at line 73:22: ( '\\r' )?
            alt_7 = 2
            look_7_0 = @input.peek( 1 )

            if ( look_7_0 == T__55 )
              alt_7 = 1
            end
            case alt_7
            when 1
              # at line 73:22: '\\r'
              char_literal13 = match( T__55, TOKENS_FOLLOWING_T__55_IN_instructionRest_227 )

            end
            char_literal14 = match( T__56, TOKENS_FOLLOWING_T__56_IN_instructionRest_231 )


          when 2
            # at line 73:34: SEMICOLON
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


          # at line 76:4: 
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
    # 79:1: instruction returns [result] : ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | returnInstruction | exitInstruction | breakInstruction | aloneCall | declaration | );
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
      declaration27 = nil


      begin
        # at line 80:2: ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | returnInstruction | exitInstruction | breakInstruction | aloneCall | declaration | )
        alt_10 = 12
        alt_10 = @dfa10.predict( @input )
        case alt_10
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 80:4: assignment
          @state.following.push( TOKENS_FOLLOWING_assignment_IN_instruction_273 )
          assignment17 = assignment
          @state.following.pop
          @adaptor.add_child( root_0, assignment17.tree )
          # --> action
          return_value.result = ( assignment17.nil? ? nil : assignment17.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 81:4: forCycle
          @state.following.push( TOKENS_FOLLOWING_forCycle_IN_instruction_280 )
          forCycle18 = forCycle
          @state.following.pop
          @adaptor.add_child( root_0, forCycle18.tree )
          # --> action
          return_value.result = ( forCycle18.nil? ? nil : forCycle18.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 82:4: ifInstruction
          @state.following.push( TOKENS_FOLLOWING_ifInstruction_IN_instruction_287 )
          ifInstruction19 = ifInstruction
          @state.following.pop
          @adaptor.add_child( root_0, ifInstruction19.tree )
          # --> action
          return_value.result = ( ifInstruction19.nil? ? nil : ifInstruction19.result )
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 83:4: whileCycle
          @state.following.push( TOKENS_FOLLOWING_whileCycle_IN_instruction_294 )
          whileCycle20 = whileCycle
          @state.following.pop
          @adaptor.add_child( root_0, whileCycle20.tree )
          # --> action
          return_value.result = ( whileCycle20.nil? ? nil : whileCycle20.result )
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 84:4: doCycle
          @state.following.push( TOKENS_FOLLOWING_doCycle_IN_instruction_301 )
          doCycle21 = doCycle
          @state.following.pop
          @adaptor.add_child( root_0, doCycle21.tree )
          # --> action
          return_value.result = ( doCycle21.nil? ? nil : doCycle21.result )
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 85:4: printInstruction
          @state.following.push( TOKENS_FOLLOWING_printInstruction_IN_instruction_308 )
          printInstruction22 = printInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printInstruction22.tree )
          # --> action
          return_value.result = ( printInstruction22.nil? ? nil : printInstruction22.result )
          # <-- action

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 86:4: returnInstruction
          @state.following.push( TOKENS_FOLLOWING_returnInstruction_IN_instruction_315 )
          returnInstruction23 = returnInstruction
          @state.following.pop
          @adaptor.add_child( root_0, returnInstruction23.tree )
          # --> action
          return_value.result = ( returnInstruction23.nil? ? nil : returnInstruction23.result )
          # <-- action

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 87:4: exitInstruction
          @state.following.push( TOKENS_FOLLOWING_exitInstruction_IN_instruction_323 )
          exitInstruction24 = exitInstruction
          @state.following.pop
          @adaptor.add_child( root_0, exitInstruction24.tree )
          # --> action
          return_value.result = ( exitInstruction24.nil? ? nil : exitInstruction24.result )
          # <-- action

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 88:4: breakInstruction
          @state.following.push( TOKENS_FOLLOWING_breakInstruction_IN_instruction_330 )
          breakInstruction25 = breakInstruction
          @state.following.pop
          @adaptor.add_child( root_0, breakInstruction25.tree )
          # --> action
          return_value.result = ( breakInstruction25.nil? ? nil : breakInstruction25.result )
          # <-- action

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 89:4: aloneCall
          @state.following.push( TOKENS_FOLLOWING_aloneCall_IN_instruction_337 )
          aloneCall26 = aloneCall
          @state.following.pop
          @adaptor.add_child( root_0, aloneCall26.tree )
          # --> action
          return_value.result = ( aloneCall26.nil? ? nil : aloneCall26.result )
          # <-- action

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 90:4: declaration
          @state.following.push( TOKENS_FOLLOWING_declaration_IN_instruction_344 )
          declaration27 = declaration
          @state.following.pop
          @adaptor.add_child( root_0, declaration27.tree )
          # --> action
          return_value.result = ( declaration27.nil? ? nil : declaration27.result )
          # <-- action

        when 12
          root_0 = @adaptor.create_flat_list


          # at line 91:4: 
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
    # 94:1: readInstruction returns [result] : READ ;
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


        # at line 95:4: READ
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
    # 98:1: breakInstruction returns [result] : BREAK ;
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


        # at line 99:4: BREAK
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
    # 102:1: returnInstruction returns [result] : RETURN expression ;
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


        # at line 103:4: RETURN expression
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
    # 106:1: exitInstruction returns [result] : EXIT ( LB alt1= statusCode RB | alt2= statusCode )? ;
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


        # at line 107:4: EXIT ( LB alt1= statusCode RB | alt2= statusCode )?
        __EXIT32__ = match( EXIT, TOKENS_FOLLOWING_EXIT_IN_exitInstruction_421 )

        tree_for_EXIT32 = @adaptor.create_with_payload( __EXIT32__ )
        root_0 = @adaptor.become_root( tree_for_EXIT32, root_0 )

        # at line 107:11: ( LB alt1= statusCode RB | alt2= statusCode )?
        alt_11 = 3
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == LB )
          alt_11 = 1
        elsif ( look_11_0.between?( PLUS, INT ) )
          alt_11 = 2
        end
        case alt_11
        when 1
          # at line 107:12: LB alt1= statusCode RB
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
          # at line 108:6: alt2= statusCode
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
    # 111:1: statusCode returns [result] : ( PLUS | MINUS )? INT ;
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


        # at line 112:4: ( PLUS | MINUS )? INT
        # --> action
        sign = ""
        # <-- action
        # at line 113:3: ( PLUS | MINUS )?
        alt_12 = 3
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == PLUS )
          alt_12 = 1
        elsif ( look_12_0 == MINUS )
          alt_12 = 2
        end
        case alt_12
        when 1
          # at line 113:4: PLUS
          __PLUS35__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_statusCode_471 )

          tree_for_PLUS35 = @adaptor.create_with_payload( __PLUS35__ )
          @adaptor.add_child( root_0, tree_for_PLUS35 )


        when 2
          # at line 113:11: MINUS
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
    # 117:1: printInstruction returns [result] : PRINT LB printText RB ;
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


        # at line 118:5: PRINT LB printText RB
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
    # 121:1: printText returns [list] : expression ( COMMA rest= printText )? ;
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


        # at line 122:4: expression ( COMMA rest= printText )?
        @state.following.push( TOKENS_FOLLOWING_expression_IN_printText_535 )
        expression42 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression42.tree )
        # --> action
        return_value.list = [( expression42.nil? ? nil : expression42.result )]
        # <-- action
        # at line 123:3: ( COMMA rest= printText )?
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == COMMA )
          alt_13 = 1
        end
        case alt_13
        when 1
          # at line 123:4: COMMA rest= printText
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
    # 126:1: ifInstruction returns [result] : IF condition LCB block RCB ifRest ;
    # 
    def ifInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
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


        # at line 127:4: IF condition LCB block RCB ifRest
        __IF44__ = match( IF, TOKENS_FOLLOWING_IF_IN_ifInstruction_570 )

        tree_for_IF44 = @adaptor.create_with_payload( __IF44__ )
        root_0 = @adaptor.become_root( tree_for_IF44, root_0 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_ifInstruction_573 )
        condition45 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition45.tree )
        __LCB46__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifInstruction_575 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_ifInstruction_578 )
        block47 = block
        @state.following.pop
        @adaptor.add_child( root_0, block47.tree )
        __RCB48__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifInstruction_580 )
        @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifInstruction_583 )
        ifRest49 = ifRest
        @state.following.pop
        @adaptor.add_child( root_0, ifRest49.tree )
        # --> action
        return_value.result = [IfTree.new(( condition45.nil? ? nil : condition45.result ),( block47.nil? ? nil : block47.list ),( ifRest49.nil? ? nil : ifRest49.result )),tree_for_IF44]
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
    # 131:1: ifRest returns [result] : ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | );
    # 
    def ifRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
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
        # at line 132:2: ( ELSE LCB block RCB | ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest | )
        alt_14 = 3
        case look_14 = @input.peek( 1 )
        when ELSE then alt_14 = 1
        when ELSEIF, ELIF then alt_14 = 2
        when COMMENT, SEMICOLON, RCB, T__55, T__56 then alt_14 = 3
        else
          raise NoViableAlternative( "", 14, 0 )
        end
        case alt_14
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 132:4: ELSE LCB block RCB
          __ELSE50__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_ifRest_602 )

          tree_for_ELSE50 = @adaptor.create_with_payload( __ELSE50__ )
          @adaptor.add_child( root_0, tree_for_ELSE50 )

          __LCB51__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_604 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_607 )
          block52 = block
          @state.following.pop
          @adaptor.add_child( root_0, block52.tree )
          __RCB53__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_609 )
          # --> action
          return_value.result = ( block52.nil? ? nil : block52.list )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 133:4: ( ELSEIF | ELIF ) condition LCB block RCB op= ifRest
          set54 = @input.look
          if @input.peek( 1 ).between?( ELSEIF, ELIF )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set54 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          @state.following.push( TOKENS_FOLLOWING_condition_IN_ifRest_625 )
          condition55 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition55.tree )
          __LCB56__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_ifRest_627 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_ifRest_630 )
          block57 = block
          @state.following.pop
          @adaptor.add_child( root_0, block57.tree )
          __RCB58__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_ifRest_632 )
          @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifRest_637 )
          op = ifRest
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = IfTree.new(( condition55.nil? ? nil : condition55.result ),( block57.nil? ? nil : block57.list ),( op.nil? ? nil : op.result ))
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 135:4: 
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
    # 138:1: whileCycle returns [result] : WHILE condition LCB block RCB ;
    # 
    def whileCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
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


        # at line 139:5: WHILE condition LCB block RCB
        __WHILE59__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_whileCycle_664 )

        tree_for_WHILE59 = @adaptor.create_with_payload( __WHILE59__ )
        @adaptor.add_child( root_0, tree_for_WHILE59 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_whileCycle_666 )
        condition60 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition60.tree )
        __LCB61__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_whileCycle_668 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_whileCycle_671 )
        block62 = block
        @state.following.pop
        @adaptor.add_child( root_0, block62.tree )
        __RCB63__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_whileCycle_673 )
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
        # trace_out( __method__, 17 )

      end
      
      return return_value
    end

    DoCycleReturnValue = define_return_scope :result

    # 
    # parser rule doCycle
    # 
    # (in Giraffe.g)
    # 143:1: doCycle returns [result] : DO LCB block RCB WHILE condition ;
    # 
    def doCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
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


        # at line 144:4: DO LCB block RCB WHILE condition
        __DO64__ = match( DO, TOKENS_FOLLOWING_DO_IN_doCycle_695 )

        tree_for_DO64 = @adaptor.create_with_payload( __DO64__ )
        @adaptor.add_child( root_0, tree_for_DO64 )

        __LCB65__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_doCycle_697 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_doCycle_700 )
        block66 = block
        @state.following.pop
        @adaptor.add_child( root_0, block66.tree )
        __RCB67__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_doCycle_702 )
        __WHILE68__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_doCycle_705 )

        tree_for_WHILE68 = @adaptor.create_with_payload( __WHILE68__ )
        @adaptor.add_child( root_0, tree_for_WHILE68 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_doCycle_707 )
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
        # trace_out( __method__, 18 )

      end
      
      return return_value
    end

    ForCycleReturnValue = define_return_scope :result

    # 
    # parser rule forCycle
    # 
    # (in Giraffe.g)
    # 148:1: forCycle returns [result] : FOR as1= assignment ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) condition ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) as2= assignment LCB block RCB ;
    # 
    def forCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
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


        # at line 149:4: FOR as1= assignment ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) condition ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) as2= assignment LCB block RCB
        __FOR70__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_forCycle_728 )

        tree_for_FOR70 = @adaptor.create_with_payload( __FOR70__ )
        @adaptor.add_child( root_0, tree_for_FOR70 )

        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_732 )
        as1 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as1.tree )
        # at line 149:23: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == COMMENT || look_17_0.between?( T__55, T__56 ) )
          alt_17 = 1
        elsif ( look_17_0 == SEMICOLON )
          alt_17 = 2
        else
          raise NoViableAlternative( "", 17, 0 )
        end
        case alt_17
        when 1
          # at line 149:24: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 149:24: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 149:26: ( COMMENT )? ( '\\r' )? '\\n'
          # at line 149:33: ( COMMENT )?
          alt_15 = 2
          look_15_0 = @input.peek( 1 )

          if ( look_15_0 == COMMENT )
            alt_15 = 1
          end
          case alt_15
          when 1
            # at line 149:33: COMMENT
            __COMMENT71__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_forCycle_737 )

          end
          # at line 149:40: ( '\\r' )?
          alt_16 = 2
          look_16_0 = @input.peek( 1 )

          if ( look_16_0 == T__55 )
            alt_16 = 1
          end
          case alt_16
          when 1
            # at line 149:40: '\\r'
            char_literal72 = match( T__55, TOKENS_FOLLOWING_T__55_IN_forCycle_741 )

          end
          char_literal73 = match( T__56, TOKENS_FOLLOWING_T__56_IN_forCycle_745 )


        when 2
          # at line 149:52: SEMICOLON
          __SEMICOLON74__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_751 )

        end
        @state.following.push( TOKENS_FOLLOWING_condition_IN_forCycle_756 )
        condition75 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition75.tree )
        # at line 149:75: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
        alt_20 = 2
        look_20_0 = @input.peek( 1 )

        if ( look_20_0 == COMMENT || look_20_0.between?( T__55, T__56 ) )
          alt_20 = 1
        elsif ( look_20_0 == SEMICOLON )
          alt_20 = 2
        else
          raise NoViableAlternative( "", 20, 0 )
        end
        case alt_20
        when 1
          # at line 149:76: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 149:76: ( ( COMMENT )? ( '\\r' )? '\\n' )
          # at line 149:78: ( COMMENT )? ( '\\r' )? '\\n'
          # at line 149:85: ( COMMENT )?
          alt_18 = 2
          look_18_0 = @input.peek( 1 )

          if ( look_18_0 == COMMENT )
            alt_18 = 1
          end
          case alt_18
          when 1
            # at line 149:85: COMMENT
            __COMMENT76__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_forCycle_761 )

          end
          # at line 149:92: ( '\\r' )?
          alt_19 = 2
          look_19_0 = @input.peek( 1 )

          if ( look_19_0 == T__55 )
            alt_19 = 1
          end
          case alt_19
          when 1
            # at line 149:92: '\\r'
            char_literal77 = match( T__55, TOKENS_FOLLOWING_T__55_IN_forCycle_765 )

          end
          char_literal78 = match( T__56, TOKENS_FOLLOWING_T__56_IN_forCycle_769 )


        when 2
          # at line 149:104: SEMICOLON
          __SEMICOLON79__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_775 )

        end
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_782 )
        as2 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, as2.tree )
        __LCB80__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_forCycle_784 )
        @state.following.push( TOKENS_FOLLOWING_block_IN_forCycle_787 )
        block81 = block
        @state.following.pop
        @adaptor.add_child( root_0, block81.tree )
        __RCB82__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_forCycle_789 )
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
        # trace_out( __method__, 19 )

      end
      
      return return_value
    end

    FuncReturnValue = define_return_scope :result

    # 
    # parser rule func
    # 
    # (in Giraffe.g)
    # 153:1: func returns [result] : ( type ID ( LB params RB )? LCB block RCB | MAIN LCB block RCB );
    # 
    def func
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = FuncReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID84__ = nil
      __LB85__ = nil
      __RB87__ = nil
      __LCB88__ = nil
      __RCB90__ = nil
      __MAIN91__ = nil
      __LCB92__ = nil
      __RCB94__ = nil
      type83 = nil
      params86 = nil
      block89 = nil
      block93 = nil

      tree_for_ID84 = nil
      tree_for_LB85 = nil
      tree_for_RB87 = nil
      tree_for_LCB88 = nil
      tree_for_RCB90 = nil
      tree_for_MAIN91 = nil
      tree_for_LCB92 = nil
      tree_for_RCB94 = nil

      begin
        # at line 154:2: ( type ID ( LB params RB )? LCB block RCB | MAIN LCB block RCB )
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0.between?( ITYPE, ATYPE ) )
          alt_22 = 1
        elsif ( look_22_0 == MAIN )
          alt_22 = 2
        else
          raise NoViableAlternative( "", 22, 0 )
        end
        case alt_22
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 154:4: type ID ( LB params RB )? LCB block RCB
          @state.following.push( TOKENS_FOLLOWING_type_IN_func_811 )
          type83 = type
          @state.following.pop
          @adaptor.add_child( root_0, type83.tree )
          __ID84__ = match( ID, TOKENS_FOLLOWING_ID_IN_func_813 )

          tree_for_ID84 = @adaptor.create_with_payload( __ID84__ )
          @adaptor.add_child( root_0, tree_for_ID84 )

          # at line 154:12: ( LB params RB )?
          alt_21 = 2
          look_21_0 = @input.peek( 1 )

          if ( look_21_0 == LB )
            alt_21 = 1
          end
          case alt_21
          when 1
            # at line 154:13: LB params RB
            __LB85__ = match( LB, TOKENS_FOLLOWING_LB_IN_func_816 )
            @state.following.push( TOKENS_FOLLOWING_params_IN_func_819 )
            params86 = params
            @state.following.pop
            @adaptor.add_child( root_0, params86.tree )
            __RB87__ = match( RB, TOKENS_FOLLOWING_RB_IN_func_821 )

          end
          __LCB88__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_826 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_func_829 )
          block89 = block
          @state.following.pop
          @adaptor.add_child( root_0, block89.tree )
          __RCB90__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_831 )
          # --> action
          return_value.result = [FuncTree.new(__ID84__.text,( params86.nil? ? nil : params86.list ) == nil ? [] : ( params86.nil? ? nil : params86.list ),( block89.nil? ? nil : block89.list ),( type83.nil? ? nil : type83.result )),type83.tree]
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 156:4: MAIN LCB block RCB
          __MAIN91__ = match( MAIN, TOKENS_FOLLOWING_MAIN_IN_func_841 )

          tree_for_MAIN91 = @adaptor.create_with_payload( __MAIN91__ )
          root_0 = @adaptor.become_root( tree_for_MAIN91, root_0 )

          __LCB92__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_func_844 )
          @state.following.push( TOKENS_FOLLOWING_block_IN_func_847 )
          block93 = block
          @state.following.pop
          @adaptor.add_child( root_0, block93.tree )
          __RCB94__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_func_849 )
          # --> action
          return_value.result = [FuncTree.new("main",[],( block93.nil? ? nil : block93.list ),:number),tree_for_MAIN91]
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

    TypeReturnValue = define_return_scope :result

    # 
    # parser rule type
    # 
    # (in Giraffe.g)
    # 160:1: type returns [result] : ( ITYPE | ATYPE );
    # 
    def type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = TypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ITYPE95__ = nil
      __ATYPE96__ = nil

      tree_for_ITYPE95 = nil
      tree_for_ATYPE96 = nil

      begin
        # at line 161:2: ( ITYPE | ATYPE )
        alt_23 = 2
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == ITYPE )
          alt_23 = 1
        elsif ( look_23_0 == ATYPE )
          alt_23 = 2
        else
          raise NoViableAlternative( "", 23, 0 )
        end
        case alt_23
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 161:4: ITYPE
          __ITYPE95__ = match( ITYPE, TOKENS_FOLLOWING_ITYPE_IN_type_869 )

          tree_for_ITYPE95 = @adaptor.create_with_payload( __ITYPE95__ )
          @adaptor.add_child( root_0, tree_for_ITYPE95 )

          # --> action
          return_value.result = :number
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 162:4: ATYPE
          __ATYPE96__ = match( ATYPE, TOKENS_FOLLOWING_ATYPE_IN_type_876 )

          tree_for_ATYPE96 = @adaptor.create_with_payload( __ATYPE96__ )
          @adaptor.add_child( root_0, tree_for_ATYPE96 )

          # --> action
          return_value.result = :array
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

    ParamsReturnValue = define_return_scope :list

    # 
    # parser rule params
    # 
    # (in Giraffe.g)
    # 165:1: params returns [list] : ( type ID paramRest | );
    # 
    def params
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = ParamsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID98__ = nil
      type97 = nil
      paramRest99 = nil

      tree_for_ID98 = nil

      begin
        # at line 166:2: ( type ID paramRest | )
        alt_24 = 2
        look_24_0 = @input.peek( 1 )

        if ( look_24_0.between?( ITYPE, ATYPE ) )
          alt_24 = 1
        elsif ( look_24_0 == RB )
          alt_24 = 2
        else
          raise NoViableAlternative( "", 24, 0 )
        end
        case alt_24
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 166:4: type ID paramRest
          @state.following.push( TOKENS_FOLLOWING_type_IN_params_893 )
          type97 = type
          @state.following.pop
          @adaptor.add_child( root_0, type97.tree )
          __ID98__ = match( ID, TOKENS_FOLLOWING_ID_IN_params_895 )

          tree_for_ID98 = @adaptor.create_with_payload( __ID98__ )
          @adaptor.add_child( root_0, tree_for_ID98 )

          @state.following.push( TOKENS_FOLLOWING_paramRest_IN_params_897 )
          paramRest99 = paramRest
          @state.following.pop
          @adaptor.add_child( root_0, paramRest99.tree )
          # --> action
          return_value.list = [[__ID98__.text,( type97.nil? ? nil : type97.result )]] + ( paramRest99.nil? ? nil : paramRest99.list )
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
      __COMMA100__ = nil
      params101 = nil

      tree_for_COMMA100 = nil

      begin
        # at line 172:2: ( COMMA params | )
        alt_25 = 2
        look_25_0 = @input.peek( 1 )

        if ( look_25_0 == COMMA )
          alt_25 = 1
        elsif ( look_25_0 == RB )
          alt_25 = 2
        else
          raise NoViableAlternative( "", 25, 0 )
        end
        case alt_25
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 172:4: COMMA params
          __COMMA100__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_paramRest_922 )
          @state.following.push( TOKENS_FOLLOWING_params_IN_paramRest_925 )
          params101 = params
          @state.following.pop
          @adaptor.add_child( root_0, params101.tree )
          # --> action
          return_value.list = ( params101.nil? ? nil : params101.list )
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

    AloneCallReturnValue = define_return_scope :result

    # 
    # parser rule aloneCall
    # 
    # (in Giraffe.g)
    # 177:1: aloneCall returns [result] : fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )* ;
    # 
    def aloneCall
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = AloneCallReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      fun = nil
      method = nil
      __LB102__ = nil
      __RB103__ = nil
      __DOT104__ = nil
      __LB105__ = nil
      __RB106__ = nil
      args1 = nil
      args2 = nil

      tree_for_fun = nil
      tree_for_method = nil
      tree_for_LB102 = nil
      tree_for_RB103 = nil
      tree_for_DOT104 = nil
      tree_for_LB105 = nil
      tree_for_RB106 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 178:4: fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )*
        fun = match( ID, TOKENS_FOLLOWING_ID_IN_aloneCall_953 )

        tree_for_fun = @adaptor.create_with_payload( fun )
        root_0 = @adaptor.become_root( tree_for_fun, root_0 )

        __LB102__ = match( LB, TOKENS_FOLLOWING_LB_IN_aloneCall_956 )
        # at line 178:21: (args1= args )?
        alt_26 = 2
        look_26_0 = @input.peek( 1 )

        if ( look_26_0 == READ || look_26_0 == LB || look_26_0.between?( PLUS, INT ) || look_26_0 == ID || look_26_0 == T__57 )
          alt_26 = 1
        end
        case alt_26
        when 1
          # at line 178:21: args1= args
          @state.following.push( TOKENS_FOLLOWING_args_IN_aloneCall_961 )
          args1 = args
          @state.following.pop
          @adaptor.add_child( root_0, args1.tree )

        end
        __RB103__ = match( RB, TOKENS_FOLLOWING_RB_IN_aloneCall_964 )
        # --> action
        return_value.result = [CallTree.new(fun.text,( args1.nil? ? nil : args1.list ),true),tree_for_fun]
        # <-- action
        # at line 180:3: ( DOT method= ID LB (args2= args )? RB )*
        while true # decision 28
          alt_28 = 2
          look_28_0 = @input.peek( 1 )

          if ( look_28_0 == DOT )
            alt_28 = 1

          end
          case alt_28
          when 1
            # at line 180:5: DOT method= ID LB (args2= args )? RB
            __DOT104__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_aloneCall_975 )

            tree_for_DOT104 = @adaptor.create_with_payload( __DOT104__ )
            @adaptor.add_child( root_0, tree_for_DOT104 )

            method = match( ID, TOKENS_FOLLOWING_ID_IN_aloneCall_979 )

            tree_for_method = @adaptor.create_with_payload( method )
            @adaptor.add_child( root_0, tree_for_method )

            __LB105__ = match( LB, TOKENS_FOLLOWING_LB_IN_aloneCall_981 )
            # at line 180:28: (args2= args )?
            alt_27 = 2
            look_27_0 = @input.peek( 1 )

            if ( look_27_0 == READ || look_27_0 == LB || look_27_0.between?( PLUS, INT ) || look_27_0 == ID || look_27_0 == T__57 )
              alt_27 = 1
            end
            case alt_27
            when 1
              # at line 180:28: args2= args
              @state.following.push( TOKENS_FOLLOWING_args_IN_aloneCall_986 )
              args2 = args
              @state.following.pop
              @adaptor.add_child( root_0, args2.tree )

            end
            __RB106__ = match( RB, TOKENS_FOLLOWING_RB_IN_aloneCall_989 )
            # --> action
            return_value.result = [MethodCallTree.new(return_value.result,method.text,( args2.nil? ? nil : args2.list )),tree_for_method]
            # <-- action

          else
            break # out of loop for decision 28
          end
        end # loop for decision 28
        # - - - - - - - rule clean up - - - - - - - -
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

    CallReturnValue = define_return_scope :result

    # 
    # parser rule call
    # 
    # (in Giraffe.g)
    # 183:1: call returns [result] : fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )* ;
    # 
    def call
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = CallReturnValue.new

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


        # at line 184:4: fun= ID LB (args1= args )? RB ( DOT method= ID LB (args2= args )? RB )*
        fun = match( ID, TOKENS_FOLLOWING_ID_IN_call_1012 )

        tree_for_fun = @adaptor.create_with_payload( fun )
        root_0 = @adaptor.become_root( tree_for_fun, root_0 )

        __LB107__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_1015 )
        # at line 184:21: (args1= args )?
        alt_29 = 2
        look_29_0 = @input.peek( 1 )

        if ( look_29_0 == READ || look_29_0 == LB || look_29_0.between?( PLUS, INT ) || look_29_0 == ID || look_29_0 == T__57 )
          alt_29 = 1
        end
        case alt_29
        when 1
          # at line 184:21: args1= args
          @state.following.push( TOKENS_FOLLOWING_args_IN_call_1020 )
          args1 = args
          @state.following.pop
          @adaptor.add_child( root_0, args1.tree )

        end
        __RB108__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_1023 )
        # --> action
        return_value.result = [CallTree.new(fun.text,( args1.nil? ? nil : args1.list ),false),tree_for_fun]
        # <-- action
        # at line 186:3: ( DOT method= ID LB (args2= args )? RB )*
        while true # decision 31
          alt_31 = 2
          look_31_0 = @input.peek( 1 )

          if ( look_31_0 == DOT )
            alt_31 = 1

          end
          case alt_31
          when 1
            # at line 186:5: DOT method= ID LB (args2= args )? RB
            __DOT109__ = match( DOT, TOKENS_FOLLOWING_DOT_IN_call_1034 )

            tree_for_DOT109 = @adaptor.create_with_payload( __DOT109__ )
            @adaptor.add_child( root_0, tree_for_DOT109 )

            method = match( ID, TOKENS_FOLLOWING_ID_IN_call_1038 )

            tree_for_method = @adaptor.create_with_payload( method )
            @adaptor.add_child( root_0, tree_for_method )

            __LB110__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_1040 )
            # at line 186:28: (args2= args )?
            alt_30 = 2
            look_30_0 = @input.peek( 1 )

            if ( look_30_0 == READ || look_30_0 == LB || look_30_0.between?( PLUS, INT ) || look_30_0 == ID || look_30_0 == T__57 )
              alt_30 = 1
            end
            case alt_30
            when 1
              # at line 186:28: args2= args
              @state.following.push( TOKENS_FOLLOWING_args_IN_call_1045 )
              args2 = args
              @state.following.pop
              @adaptor.add_child( root_0, args2.tree )

            end
            __RB111__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_1048 )
            # --> action
            return_value.result = [MethodCallTree.new(return_value.result,method.text,( args2.nil? ? nil : args2.list )),tree_for_method]
            # <-- action

          else
            break # out of loop for decision 31
          end
        end # loop for decision 31
        # - - - - - - - rule clean up - - - - - - - -
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

    ArgsReturnValue = define_return_scope :list

    # 
    # parser rule args
    # 
    # (in Giraffe.g)
    # 189:1: args returns [list] : expression argsRest ;
    # 
    def args
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = ArgsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      expression112 = nil
      argsRest113 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 190:5: expression argsRest
        @state.following.push( TOKENS_FOLLOWING_expression_IN_args_1070 )
        expression112 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression112.tree )
        @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_1072 )
        argsRest113 = argsRest
        @state.following.pop
        @adaptor.add_child( root_0, argsRest113.tree )
        # --> action
        return_value.list = [( expression112.nil? ? nil : expression112.result )] + ( argsRest113.nil? ? nil : argsRest113.list )
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
        # trace_out( __method__, 26 )

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
      # trace_in( __method__, 27 )
      return_value = ArgsRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA114__ = nil
      args115 = nil

      tree_for_COMMA114 = nil

      begin
        # at line 194:2: ( COMMA args | )
        alt_32 = 2
        look_32_0 = @input.peek( 1 )

        if ( look_32_0 == COMMA )
          alt_32 = 1
        elsif ( look_32_0 == RB )
          alt_32 = 2
        else
          raise NoViableAlternative( "", 32, 0 )
        end
        case alt_32
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 194:4: COMMA args
          __COMMA114__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsRest_1091 )
          @state.following.push( TOKENS_FOLLOWING_args_IN_argsRest_1094 )
          args115 = args
          @state.following.pop
          @adaptor.add_child( root_0, args115.tree )
          # --> action
          return_value.list = ( args115.nil? ? nil : args115.list )
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
        # trace_out( __method__, 27 )

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
      # trace_in( __method__, 28 )
      return_value = ConditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OR117__ = nil
      op = nil
      orOperand116 = nil

      tree_for_OR117 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 202:4: orOperand ( OR op= condition )?
        @state.following.push( TOKENS_FOLLOWING_orOperand_IN_condition_1120 )
        orOperand116 = orOperand
        @state.following.pop
        @adaptor.add_child( root_0, orOperand116.tree )
        # --> action
        return_value.result = ( orOperand116.nil? ? nil : orOperand116.result )
        # <-- action
        # at line 203:3: ( OR op= condition )?
        alt_33 = 2
        look_33_0 = @input.peek( 1 )

        if ( look_33_0 == OR )
          alt_33 = 1
        end
        case alt_33
        when 1
          # at line 203:4: OR op= condition
          __OR117__ = match( OR, TOKENS_FOLLOWING_OR_IN_condition_1127 )

          tree_for_OR117 = @adaptor.create_with_payload( __OR117__ )
          root_0 = @adaptor.become_root( tree_for_OR117, root_0 )

          @state.following.push( TOKENS_FOLLOWING_condition_IN_condition_1132 )
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
        # trace_out( __method__, 28 )

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
      # trace_in( __method__, 29 )
      return_value = OrOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __AND119__ = nil
      op = nil
      boolOperand118 = nil

      tree_for_AND119 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 209:4: boolOperand ( AND op= orOperand )?
        @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_orOperand_1153 )
        boolOperand118 = boolOperand
        @state.following.pop
        @adaptor.add_child( root_0, boolOperand118.tree )
        # --> action
        return_value.result = ( boolOperand118.nil? ? nil : boolOperand118.result )
        # <-- action
        # at line 210:3: ( AND op= orOperand )?
        alt_34 = 2
        look_34_0 = @input.peek( 1 )

        if ( look_34_0 == AND )
          alt_34 = 1
        end
        case alt_34
        when 1
          # at line 210:4: AND op= orOperand
          __AND119__ = match( AND, TOKENS_FOLLOWING_AND_IN_orOperand_1160 )

          tree_for_AND119 = @adaptor.create_with_payload( __AND119__ )
          root_0 = @adaptor.become_root( tree_for_AND119, root_0 )

          @state.following.push( TOKENS_FOLLOWING_orOperand_IN_orOperand_1165 )
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
        # trace_out( __method__, 29 )

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
      # trace_in( __method__, 30 )
      return_value = BoolOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NOT121__ = nil
      __LB122__ = nil
      __RB124__ = nil
      __EQ125__ = nil
      __NE126__ = nil
      __LT127__ = nil
      __GT128__ = nil
      __LE129__ = nil
      __GE130__ = nil
      op1 = nil
      op2 = nil
      bool120 = nil
      condition123 = nil

      tree_for_NOT121 = nil
      tree_for_LB122 = nil
      tree_for_RB124 = nil
      tree_for_EQ125 = nil
      tree_for_NE126 = nil
      tree_for_LT127 = nil
      tree_for_GT128 = nil
      tree_for_LE129 = nil
      tree_for_GE130 = nil

      begin
        # at line 214:2: ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) )
        alt_42 = 3
        case look_42 = @input.peek( 1 )
        when TRUE, FALSE then alt_42 = 1
        when NOT then alt_42 = 2
        when READ, LB, PLUS, MINUS, INT, ID, T__57 then alt_42 = 3
        else
          raise NoViableAlternative( "", 42, 0 )
        end
        case alt_42
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 214:4: bool
          @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1184 )
          bool120 = bool
          @state.following.pop
          @adaptor.add_child( root_0, bool120.tree )
          # --> action
          return_value.result = ( bool120.nil? ? nil : bool120.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 215:4: NOT LB condition RB
          __NOT121__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_boolOperand_1191 )

          tree_for_NOT121 = @adaptor.create_with_payload( __NOT121__ )
          @adaptor.add_child( root_0, tree_for_NOT121 )

          __LB122__ = match( LB, TOKENS_FOLLOWING_LB_IN_boolOperand_1193 )
          @state.following.push( TOKENS_FOLLOWING_condition_IN_boolOperand_1196 )
          condition123 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition123.tree )
          __RB124__ = match( RB, TOKENS_FOLLOWING_RB_IN_boolOperand_1198 )
          # --> action
          return_value.result = !( condition123.nil? ? nil : condition123.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 216:4: op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1208 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # at line 216:19: ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          alt_41 = 6
          case look_41 = @input.peek( 1 )
          when EQ then alt_41 = 1
          when NE then alt_41 = 2
          when LT then alt_41 = 3
          when GT then alt_41 = 4
          when LE then alt_41 = 5
          when GE then alt_41 = 6
          else
            raise NoViableAlternative( "", 41, 0 )
          end
          case alt_41
          when 1
            # at line 216:20: EQ (op2= bool | op2= expression )
            __EQ125__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_boolOperand_1211 )

            tree_for_EQ125 = @adaptor.create_with_payload( __EQ125__ )
            root_0 = @adaptor.become_root( tree_for_EQ125, root_0 )

            # at line 216:24: (op2= bool | op2= expression )
            alt_35 = 2
            look_35_0 = @input.peek( 1 )

            if ( look_35_0.between?( TRUE, FALSE ) )
              alt_35 = 1
            elsif ( look_35_0 == READ || look_35_0 == LB || look_35_0.between?( PLUS, INT ) || look_35_0 == ID || look_35_0 == T__57 )
              alt_35 = 2
            else
              raise NoViableAlternative( "", 35, 0 )
            end
            case alt_35
            when 1
              # at line 216:26: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1218 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 216:37: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1224 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:eq)),op2.tree]
            # <-- action

          when 2
            # at line 217:6: NE (op2= bool | op2= expression )
            __NE126__ = match( NE, TOKENS_FOLLOWING_NE_IN_boolOperand_1235 )

            tree_for_NE126 = @adaptor.create_with_payload( __NE126__ )
            root_0 = @adaptor.become_root( tree_for_NE126, root_0 )

            # at line 217:10: (op2= bool | op2= expression )
            alt_36 = 2
            look_36_0 = @input.peek( 1 )

            if ( look_36_0.between?( TRUE, FALSE ) )
              alt_36 = 1
            elsif ( look_36_0 == READ || look_36_0 == LB || look_36_0.between?( PLUS, INT ) || look_36_0 == ID || look_36_0 == T__57 )
              alt_36 = 2
            else
              raise NoViableAlternative( "", 36, 0 )
            end
            case alt_36
            when 1
              # at line 217:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1242 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 217:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1248 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:ne)),op2.tree]
            # <-- action

          when 3
            # at line 218:6: LT (op2= bool | op2= expression )
            __LT127__ = match( LT, TOKENS_FOLLOWING_LT_IN_boolOperand_1259 )

            tree_for_LT127 = @adaptor.create_with_payload( __LT127__ )
            root_0 = @adaptor.become_root( tree_for_LT127, root_0 )

            # at line 218:10: (op2= bool | op2= expression )
            alt_37 = 2
            look_37_0 = @input.peek( 1 )

            if ( look_37_0.between?( TRUE, FALSE ) )
              alt_37 = 1
            elsif ( look_37_0 == READ || look_37_0 == LB || look_37_0.between?( PLUS, INT ) || look_37_0 == ID || look_37_0 == T__57 )
              alt_37 = 2
            else
              raise NoViableAlternative( "", 37, 0 )
            end
            case alt_37
            when 1
              # at line 218:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1266 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 218:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1272 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:lt)),op2.tree]
            # <-- action

          when 4
            # at line 219:6: GT (op2= bool | op2= expression )
            __GT128__ = match( GT, TOKENS_FOLLOWING_GT_IN_boolOperand_1283 )

            tree_for_GT128 = @adaptor.create_with_payload( __GT128__ )
            root_0 = @adaptor.become_root( tree_for_GT128, root_0 )

            # at line 219:10: (op2= bool | op2= expression )
            alt_38 = 2
            look_38_0 = @input.peek( 1 )

            if ( look_38_0.between?( TRUE, FALSE ) )
              alt_38 = 1
            elsif ( look_38_0 == READ || look_38_0 == LB || look_38_0.between?( PLUS, INT ) || look_38_0 == ID || look_38_0 == T__57 )
              alt_38 = 2
            else
              raise NoViableAlternative( "", 38, 0 )
            end
            case alt_38
            when 1
              # at line 219:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1290 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 219:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1296 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:gt)),op2.tree]
            # <-- action

          when 5
            # at line 220:6: LE (op2= bool | op2= expression )
            __LE129__ = match( LE, TOKENS_FOLLOWING_LE_IN_boolOperand_1307 )

            tree_for_LE129 = @adaptor.create_with_payload( __LE129__ )
            root_0 = @adaptor.become_root( tree_for_LE129, root_0 )

            # at line 220:10: (op2= bool | op2= expression )
            alt_39 = 2
            look_39_0 = @input.peek( 1 )

            if ( look_39_0.between?( TRUE, FALSE ) )
              alt_39 = 1
            elsif ( look_39_0 == READ || look_39_0 == LB || look_39_0.between?( PLUS, INT ) || look_39_0 == ID || look_39_0 == T__57 )
              alt_39 = 2
            else
              raise NoViableAlternative( "", 39, 0 )
            end
            case alt_39
            when 1
              # at line 220:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1314 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 220:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1320 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            end
            # --> action
            return_value.result = [BinaryOperatorTree.new(( op1.nil? ? nil : op1.result ),( op2.nil? ? nil : op2.result ),Operators.method(:le)),op2.tree]
            # <-- action

          when 6
            # at line 221:6: GE (op2= bool | op2= expression )
            __GE130__ = match( GE, TOKENS_FOLLOWING_GE_IN_boolOperand_1331 )

            tree_for_GE130 = @adaptor.create_with_payload( __GE130__ )
            root_0 = @adaptor.become_root( tree_for_GE130, root_0 )

            # at line 221:10: (op2= bool | op2= expression )
            alt_40 = 2
            look_40_0 = @input.peek( 1 )

            if ( look_40_0.between?( TRUE, FALSE ) )
              alt_40 = 1
            elsif ( look_40_0 == READ || look_40_0 == LB || look_40_0.between?( PLUS, INT ) || look_40_0 == ID || look_40_0 == T__57 )
              alt_40 = 2
            else
              raise NoViableAlternative( "", 40, 0 )
            end
            case alt_40
            when 1
              # at line 221:12: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_1338 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )

            when 2
              # at line 221:23: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_1344 )
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
        # trace_out( __method__, 30 )

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
      # trace_in( __method__, 31 )
      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS132__ = nil
      __MINUS133__ = nil
      op = nil
      addOperand131 = nil

      tree_for_PLUS132 = nil
      tree_for_MINUS133 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 227:4: addOperand ( PLUS op= expression | MINUS op= expression )?
        @state.following.push( TOKENS_FOLLOWING_addOperand_IN_expression_1369 )
        addOperand131 = addOperand
        @state.following.pop
        @adaptor.add_child( root_0, addOperand131.tree )
        # --> action
        return_value.result = ( addOperand131.nil? ? nil : addOperand131.result )
        # <-- action
        # at line 228:3: ( PLUS op= expression | MINUS op= expression )?
        alt_43 = 3
        look_43_0 = @input.peek( 1 )

        if ( look_43_0 == PLUS )
          alt_43 = 1
        elsif ( look_43_0 == MINUS )
          alt_43 = 2
        end
        case alt_43
        when 1
          # at line 229:4: PLUS op= expression
          __PLUS132__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expression_1380 )

          tree_for_PLUS132 = @adaptor.create_with_payload( __PLUS132__ )
          root_0 = @adaptor.become_root( tree_for_PLUS132, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1385 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:add)),op.tree]
          # <-- action

        when 2
          # at line 230:5: MINUS op= expression
          __MINUS133__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expression_1393 )

          tree_for_MINUS133 = @adaptor.create_with_payload( __MINUS133__ )
          root_0 = @adaptor.become_root( tree_for_MINUS133, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_1398 )
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
        # trace_out( __method__, 31 )

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
      # trace_in( __method__, 32 )
      return_value = AddOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __MUL135__ = nil
      __DIV136__ = nil
      __MOD137__ = nil
      op = nil
      mulOperand134 = nil

      tree_for_MUL135 = nil
      tree_for_DIV136 = nil
      tree_for_MOD137 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 235:4: mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperand_1420 )
        mulOperand134 = mulOperand
        @state.following.pop
        @adaptor.add_child( root_0, mulOperand134.tree )
        # --> action
        return_value.result = ( mulOperand134.nil? ? nil : mulOperand134.result )
        # <-- action
        # at line 236:3: ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        alt_44 = 4
        case look_44 = @input.peek( 1 )
        when MUL then alt_44 = 1
        when DIV then alt_44 = 2
        when MOD then alt_44 = 3
        end
        case alt_44
        when 1
          # at line 237:4: MUL op= addOperand
          __MUL135__ = match( MUL, TOKENS_FOLLOWING_MUL_IN_addOperand_1431 )

          tree_for_MUL135 = @adaptor.create_with_payload( __MUL135__ )
          root_0 = @adaptor.become_root( tree_for_MUL135, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1436 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:mul)),op.tree]
          # <-- action

        when 2
          # at line 238:5: DIV op= addOperand
          __DIV136__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_addOperand_1444 )

          tree_for_DIV136 = @adaptor.create_with_payload( __DIV136__ )
          root_0 = @adaptor.become_root( tree_for_DIV136, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1449 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = [BinaryOperatorTree.new(return_value.result,( op.nil? ? nil : op.result ),Operators.method(:div)),op.tree]
          # <-- action

        when 3
          # at line 239:5: MOD op= addOperand
          __MOD137__ = match( MOD, TOKENS_FOLLOWING_MOD_IN_addOperand_1457 )

          tree_for_MOD137 = @adaptor.create_with_payload( __MOD137__ )
          root_0 = @adaptor.become_root( tree_for_MOD137, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1462 )
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
        # trace_out( __method__, 32 )

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
      # trace_in( __method__, 33 )
      return_value = MulOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS138__ = nil
      __MINUS140__ = nil
      mulOperandRest139 = nil
      mulOperandRest141 = nil
      mulOperandRest142 = nil

      tree_for_PLUS138 = nil
      tree_for_MINUS140 = nil

      begin
        # at line 244:2: ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest )
        alt_45 = 3
        case look_45 = @input.peek( 1 )
        when PLUS then alt_45 = 1
        when MINUS then alt_45 = 2
        when READ, LB, INT, ID, T__57 then alt_45 = 3
        else
          raise NoViableAlternative( "", 45, 0 )
        end
        case alt_45
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 244:4: PLUS mulOperandRest
          __PLUS138__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_mulOperand_1484 )

          tree_for_PLUS138 = @adaptor.create_with_payload( __PLUS138__ )
          @adaptor.add_child( root_0, tree_for_PLUS138 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1486 )
          mulOperandRest139 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest139.tree )
          # --> action
          return_value.result = ( mulOperandRest139.nil? ? nil : mulOperandRest139.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 245:4: MINUS mulOperandRest
          __MINUS140__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_mulOperand_1493 )

          tree_for_MINUS140 = @adaptor.create_with_payload( __MINUS140__ )
          @adaptor.add_child( root_0, tree_for_MINUS140 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1495 )
          mulOperandRest141 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest141.tree )
          # --> action
          return_value.result = [UnaryOperatorTree.new(( mulOperandRest141.nil? ? nil : mulOperandRest141.result ),Operators.method(:neg)),mulOperandRest141.tree]
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 246:4: mulOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1502 )
          mulOperandRest142 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest142.tree )
          # --> action
          return_value.result = ( mulOperandRest142.nil? ? nil : mulOperandRest142.result )
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
        # trace_out( __method__, 33 )

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
      # trace_in( __method__, 34 )
      return_value = MulOperandRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal144 = nil
      char_literal146 = nil
      arrayIndexTarget143 = nil
      expression145 = nil

      tree_for_char_literal144 = nil
      tree_for_char_literal146 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 250:4: arrayIndexTarget ( '[' expression ']' )*
        @state.following.push( TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1519 )
        arrayIndexTarget143 = arrayIndexTarget
        @state.following.pop
        @adaptor.add_child( root_0, arrayIndexTarget143.tree )
        # --> action
        return_value.result = ( arrayIndexTarget143.nil? ? nil : arrayIndexTarget143.result )
        # <-- action
        # at line 251:3: ( '[' expression ']' )*
        while true # decision 46
          alt_46 = 2
          look_46_0 = @input.peek( 1 )

          if ( look_46_0 == T__57 )
            alt_46 = 1

          end
          case alt_46
          when 1
            # at line 251:4: '[' expression ']'
            char_literal144 = match( T__57, TOKENS_FOLLOWING_T__57_IN_mulOperandRest_1527 )

            tree_for_char_literal144 = @adaptor.create_with_payload( char_literal144 )
            @adaptor.add_child( root_0, tree_for_char_literal144 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_mulOperandRest_1529 )
            expression145 = expression
            @state.following.pop
            @adaptor.add_child( root_0, expression145.tree )
            char_literal146 = match( T__58, TOKENS_FOLLOWING_T__58_IN_mulOperandRest_1531 )

            tree_for_char_literal146 = @adaptor.create_with_payload( char_literal146 )
            @adaptor.add_child( root_0, tree_for_char_literal146 )

            # --> action
             return_value.result = [IndexTree.new(return_value.result,( expression145.nil? ? nil : expression145.result )),expression145.tree] 
            # <-- action

          else
            break # out of loop for decision 46
          end
        end # loop for decision 46
        # - - - - - - - rule clean up - - - - - - - -
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

    ArrayIndexTargetReturnValue = define_return_scope :result

    # 
    # parser rule arrayIndexTarget
    # 
    # (in Giraffe.g)
    # 254:1: arrayIndexTarget returns [result] : ( ID | LB expression RB | INT | call | array | readInstruction );
    # 
    def arrayIndexTarget
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )
      return_value = ArrayIndexTargetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID147__ = nil
      __LB148__ = nil
      __RB150__ = nil
      __INT151__ = nil
      expression149 = nil
      call152 = nil
      array153 = nil
      readInstruction154 = nil

      tree_for_ID147 = nil
      tree_for_LB148 = nil
      tree_for_RB150 = nil
      tree_for_INT151 = nil

      begin
        # at line 255:2: ( ID | LB expression RB | INT | call | array | readInstruction )
        alt_47 = 6
        case look_47 = @input.peek( 1 )
        when ID then look_47_1 = @input.peek( 2 )

        if ( look_47_1 == LB )
          alt_47 = 4
        elsif ( look_47_1.between?( COMMENT, SEMICOLON ) || look_47_1.between?( RB, MINUS ) || look_47_1 == COMMA || look_47_1.between?( LCB, RCB ) || look_47_1.between?( OR, AND ) || look_47_1.between?( EQ, MOD ) || look_47_1.between?( T__55, T__58 ) )
          alt_47 = 1
        else
          raise NoViableAlternative( "", 47, 1 )
        end
        when LB then alt_47 = 2
        when INT then alt_47 = 3
        when T__57 then alt_47 = 5
        when READ then alt_47 = 6
        else
          raise NoViableAlternative( "", 47, 0 )
        end
        case alt_47
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 255:4: ID
          __ID147__ = match( ID, TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1553 )

          tree_for_ID147 = @adaptor.create_with_payload( __ID147__ )
          @adaptor.add_child( root_0, tree_for_ID147 )

          # --> action
          return_value.result = [VarTree.new(__ID147__.text),tree_for_ID147]
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 256:4: LB expression RB
          __LB148__ = match( LB, TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1560 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1563 )
          expression149 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression149.tree )
          __RB150__ = match( RB, TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1565 )
          # --> action
          return_value.result = ( expression149.nil? ? nil : expression149.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 257:4: INT
          __INT151__ = match( INT, TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1573 )

          tree_for_INT151 = @adaptor.create_with_payload( __INT151__ )
          @adaptor.add_child( root_0, tree_for_INT151 )

          # --> action
          return_value.result = [AtomTree.new(__INT151__.text.to_i),tree_for_INT151]
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 258:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1580 )
          call152 = call
          @state.following.pop
          @adaptor.add_child( root_0, call152.tree )
          # --> action
          return_value.result = ( call152.nil? ? nil : call152.result )
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 259:4: array
          @state.following.push( TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1587 )
          array153 = array
          @state.following.pop
          @adaptor.add_child( root_0, array153.tree )
          # --> action
          return_value.result = [ArrayTree.new(( array153.nil? ? nil : array153.result )),array153.tree]
          # <-- action

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 260:4: readInstruction
          @state.following.push( TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1594 )
          readInstruction154 = readInstruction
          @state.following.pop
          @adaptor.add_child( root_0, readInstruction154.tree )
          # --> action
          return_value.result = ( readInstruction154.nil? ? nil : readInstruction154.result )
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

    ArrayReturnValue = define_return_scope :result

    # 
    # parser rule array
    # 
    # (in Giraffe.g)
    # 263:1: array returns [result] : '[' (ex1= expression ( COMMA ex2= expression )* )? ']' ;
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


        # at line 264:4: '[' (ex1= expression ( COMMA ex2= expression )* )? ']'
        char_literal155 = match( T__57, TOKENS_FOLLOWING_T__57_IN_array_1611 )

        tree_for_char_literal155 = @adaptor.create_with_payload( char_literal155 )
        @adaptor.add_child( root_0, tree_for_char_literal155 )

        # --> action
        return_value.result = []
        # <-- action
        # at line 265:3: (ex1= expression ( COMMA ex2= expression )* )?
        alt_49 = 2
        look_49_0 = @input.peek( 1 )

        if ( look_49_0 == READ || look_49_0 == LB || look_49_0.between?( PLUS, INT ) || look_49_0 == ID || look_49_0 == T__57 )
          alt_49 = 1
        end
        case alt_49
        when 1
          # at line 265:4: ex1= expression ( COMMA ex2= expression )*
          @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1620 )
          ex1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, ex1.tree )
          # --> action
          return_value.result << ( ex1.nil? ? nil : ex1.result )
          # <-- action
          # at line 266:3: ( COMMA ex2= expression )*
          while true # decision 48
            alt_48 = 2
            look_48_0 = @input.peek( 1 )

            if ( look_48_0 == COMMA )
              alt_48 = 1

            end
            case alt_48
            when 1
              # at line 266:4: COMMA ex2= expression
              __COMMA156__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_array_1627 )

              tree_for_COMMA156 = @adaptor.create_with_payload( __COMMA156__ )
              @adaptor.add_child( root_0, tree_for_COMMA156 )

              @state.following.push( TOKENS_FOLLOWING_expression_IN_array_1631 )
              ex2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, ex2.tree )
              # --> action
              return_value.result << ( ex2.nil? ? nil : ex2.result )
              # <-- action

            else
              break # out of loop for decision 48
            end
          end # loop for decision 48

        end
        char_literal157 = match( T__58, TOKENS_FOLLOWING_T__58_IN_array_1642 )

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

    IndexedReturnValue = define_return_scope :result

    # 
    # parser rule indexed
    # 
    # (in Giraffe.g)
    # 272:1: indexed returns [result] : identified ( '[' expression ']' )* ;
    # 
    def indexed
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )
      return_value = IndexedReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      char_literal159 = nil
      char_literal161 = nil
      identified158 = nil
      expression160 = nil

      tree_for_char_literal159 = nil
      tree_for_char_literal161 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 273:4: identified ( '[' expression ']' )*
        @state.following.push( TOKENS_FOLLOWING_identified_IN_indexed_1659 )
        identified158 = identified
        @state.following.pop
        @adaptor.add_child( root_0, identified158.tree )
        # --> action
        return_value.result = ( identified158.nil? ? nil : identified158.result )
        # <-- action
        # at line 275:3: ( '[' expression ']' )*
        while true # decision 50
          alt_50 = 2
          look_50_0 = @input.peek( 1 )

          if ( look_50_0 == T__57 )
            alt_50 = 1

          end
          case alt_50
          when 1
            # at line 275:4: '[' expression ']'
            char_literal159 = match( T__57, TOKENS_FOLLOWING_T__57_IN_indexed_1669 )

            tree_for_char_literal159 = @adaptor.create_with_payload( char_literal159 )
            @adaptor.add_child( root_0, tree_for_char_literal159 )

            @state.following.push( TOKENS_FOLLOWING_expression_IN_indexed_1671 )
            expression160 = expression
            @state.following.pop
            @adaptor.add_child( root_0, expression160.tree )
            char_literal161 = match( T__58, TOKENS_FOLLOWING_T__58_IN_indexed_1673 )

            tree_for_char_literal161 = @adaptor.create_with_payload( char_literal161 )
            @adaptor.add_child( root_0, tree_for_char_literal161 )

            # --> action
            return_value.result = [IndexTree.new(return_value.result, ( expression160.nil? ? nil : expression160.result )),identified158.tree]
            # <-- action

          else
            break # out of loop for decision 50
          end
        end # loop for decision 50
        # - - - - - - - rule clean up - - - - - - - -
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

    IdentifiedReturnValue = define_return_scope :result

    # 
    # parser rule identified
    # 
    # (in Giraffe.g)
    # 280:1: identified returns [result] : ID ;
    # 
    def identified
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )
      return_value = IdentifiedReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID162__ = nil

      tree_for_ID162 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 281:4: ID
        __ID162__ = match( ID, TOKENS_FOLLOWING_ID_IN_identified_1694 )

        tree_for_ID162 = @adaptor.create_with_payload( __ID162__ )
        @adaptor.add_child( root_0, tree_for_ID162 )

        # --> action
        return_value.result = [VarTree.new(__ID162__.text),tree_for_ID162]
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

    DeclarationReturnValue = define_return_scope :result

    # 
    # parser rule declaration
    # 
    # (in Giraffe.g)
    # 284:1: declaration returns [result] : type ID ;
    # 
    def declaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )
      return_value = DeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID164__ = nil
      type163 = nil

      tree_for_ID164 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 285:4: type ID
        @state.following.push( TOKENS_FOLLOWING_type_IN_declaration_1711 )
        type163 = type
        @state.following.pop
        @adaptor.add_child( root_0, type163.tree )
        __ID164__ = match( ID, TOKENS_FOLLOWING_ID_IN_declaration_1713 )

        tree_for_ID164 = @adaptor.create_with_payload( __ID164__ )
        @adaptor.add_child( root_0, tree_for_ID164 )

        # --> action
        return_value.result = [DeclareTree.new(__ID164__.text,( type163.nil? ? nil : type163.result )),type163.tree]
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

    AssignmentReturnValue = define_return_scope :result

    # 
    # parser rule assignment
    # 
    # (in Giraffe.g)
    # 288:1: assignment returns [result] : indexed ASSIGN expression ;
    # 
    def assignment
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )
      return_value = AssignmentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ASSIGN166__ = nil
      indexed165 = nil
      expression167 = nil

      tree_for_ASSIGN166 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 289:4: indexed ASSIGN expression
        @state.following.push( TOKENS_FOLLOWING_indexed_IN_assignment_1730 )
        indexed165 = indexed
        @state.following.pop
        @adaptor.add_child( root_0, indexed165.tree )
        __ASSIGN166__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1732 )

        tree_for_ASSIGN166 = @adaptor.create_with_payload( __ASSIGN166__ )
        root_0 = @adaptor.become_root( tree_for_ASSIGN166, root_0 )

        @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_1735 )
        expression167 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression167.tree )
        # --> action
         return_value.result = [AssignTree.new(( indexed165.nil? ? nil : indexed165.result ),( expression167.nil? ? nil : expression167.result )),indexed165.tree] 
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

    BoolReturnValue = define_return_scope :result

    # 
    # parser rule bool
    # 
    # (in Giraffe.g)
    # 292:1: fragment bool returns [result] : ( TRUE | FALSE );
    # 
    def bool
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )
      return_value = BoolReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __TRUE168__ = nil
      __FALSE169__ = nil

      tree_for_TRUE168 = nil
      tree_for_FALSE169 = nil

      begin
        # at line 294:2: ( TRUE | FALSE )
        alt_51 = 2
        look_51_0 = @input.peek( 1 )

        if ( look_51_0 == TRUE )
          alt_51 = 1
        elsif ( look_51_0 == FALSE )
          alt_51 = 2
        else
          raise NoViableAlternative( "", 51, 0 )
        end
        case alt_51
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 294:4: TRUE
          __TRUE168__ = match( TRUE, TOKENS_FOLLOWING_TRUE_IN_bool_1756 )

          tree_for_TRUE168 = @adaptor.create_with_payload( __TRUE168__ )
          @adaptor.add_child( root_0, tree_for_TRUE168 )

          # --> action
          return_value.result = new AtomTree(1)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 295:5: FALSE
          __FALSE169__ = match( FALSE, TOKENS_FOLLOWING_FALSE_IN_bool_1764 )

          tree_for_FALSE169 = @adaptor.create_with_payload( __FALSE169__ )
          @adaptor.add_child( root_0, tree_for_FALSE169 )

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
        # trace_out( __method__, 41 )

      end
      
      return return_value
    end

    fragment :bool rescue nil



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA10 < ANTLR3::DFA
      EOT = unpack( 14, -1 )
      EOF = unpack( 14, -1 )
      MIN = unpack( 1, 4, 1, 10, 12, -1 )
      MAX = unpack( 1, 56, 1, 57, 12, -1 )
      ACCEPT = unpack( 2, -1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 
                       1, 9, 1, 11, 1, 12, 1, 10, 1, 1 )
      SPECIAL = unpack( 14, -1 )
      TRANSITION = [
        unpack( 2, 11, 1, -1, 1, 9, 1, 7, 1, 8, 5, -1, 1, 6, 1, -1, 1, 3, 
                1, -1, 1, 11, 3, -1, 1, 4, 1, 5, 1, 2, 1, 1, 1, -1, 2, 10, 
                25, -1, 2, 11 ),
        unpack( 1, 12, 32, -1, 1, 13, 13, -1, 1, 13 ),
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
          79:1: instruction returns [result] : ( assignment | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | returnInstruction | exitInstruction | breakInstruction | aloneCall | declaration | );
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
    TOKENS_FOLLOWING_funcdef_IN_functions_98 = Set[ 4, 5, 55, 56 ]
    TOKENS_FOLLOWING_functionsRest_IN_functions_106 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_functionsRest_132 = Set[ 55, 56 ]
    TOKENS_FOLLOWING_T__55_IN_functionsRest_136 = Set[ 56 ]
    TOKENS_FOLLOWING_T__56_IN_functionsRest_140 = Set[ 4, 5, 27, 28, 29, 55, 56 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_functionsRest_146 = Set[ 4, 5, 27, 28, 29, 55, 56 ]
    TOKENS_FOLLOWING_functions_IN_functionsRest_153 = Set[ 1 ]
    TOKENS_FOLLOWING_instruction_IN_block_187 = Set[ 4, 5, 55, 56 ]
    TOKENS_FOLLOWING_instructionRest_IN_block_197 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_instructionRest_223 = Set[ 55, 56 ]
    TOKENS_FOLLOWING_T__55_IN_instructionRest_227 = Set[ 56 ]
    TOKENS_FOLLOWING_T__56_IN_instructionRest_231 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 28, 29, 55, 56 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_237 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 28, 29, 55, 56 ]
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
    TOKENS_FOLLOWING_declaration_IN_instruction_344 = Set[ 1 ]
    TOKENS_FOLLOWING_READ_IN_readInstruction_367 = Set[ 1 ]
    TOKENS_FOLLOWING_BREAK_IN_breakInstruction_384 = Set[ 1 ]
    TOKENS_FOLLOWING_RETURN_IN_returnInstruction_401 = Set[ 6, 10, 12, 13, 14, 26, 57 ]
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
    TOKENS_FOLLOWING_LB_IN_printInstruction_505 = Set[ 6, 10, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_printText_IN_printInstruction_508 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_printInstruction_510 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_printText_535 = Set[ 1, 16 ]
    TOKENS_FOLLOWING_COMMA_IN_printText_542 = Set[ 6, 10, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_printText_IN_printText_546 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_ifInstruction_570 = Set[ 6, 10, 12, 13, 14, 26, 33, 44, 45, 57 ]
    TOKENS_FOLLOWING_condition_IN_ifInstruction_573 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_ifInstruction_575 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 28, 29, 55, 56 ]
    TOKENS_FOLLOWING_block_IN_ifInstruction_578 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_ifInstruction_580 = Set[ 20, 21, 22 ]
    TOKENS_FOLLOWING_ifRest_IN_ifInstruction_583 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_ifRest_602 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_604 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 28, 29, 55, 56 ]
    TOKENS_FOLLOWING_block_IN_ifRest_607 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_609 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_ifRest_617 = Set[ 6, 10, 12, 13, 14, 26, 33, 44, 45, 57 ]
    TOKENS_FOLLOWING_condition_IN_ifRest_625 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_ifRest_627 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 28, 29, 55, 56 ]
    TOKENS_FOLLOWING_block_IN_ifRest_630 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_ifRest_632 = Set[ 20, 21, 22 ]
    TOKENS_FOLLOWING_ifRest_IN_ifRest_637 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_whileCycle_664 = Set[ 6, 10, 12, 13, 14, 26, 33, 44, 45, 57 ]
    TOKENS_FOLLOWING_condition_IN_whileCycle_666 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_whileCycle_668 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 28, 29, 55, 56 ]
    TOKENS_FOLLOWING_block_IN_whileCycle_671 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_whileCycle_673 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_doCycle_695 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_doCycle_697 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 28, 29, 55, 56 ]
    TOKENS_FOLLOWING_block_IN_doCycle_700 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_doCycle_702 = Set[ 23 ]
    TOKENS_FOLLOWING_WHILE_IN_doCycle_705 = Set[ 6, 10, 12, 13, 14, 26, 33, 44, 45, 57 ]
    TOKENS_FOLLOWING_condition_IN_doCycle_707 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_forCycle_728 = Set[ 26 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_732 = Set[ 4, 5, 55, 56 ]
    TOKENS_FOLLOWING_COMMENT_IN_forCycle_737 = Set[ 55, 56 ]
    TOKENS_FOLLOWING_T__55_IN_forCycle_741 = Set[ 56 ]
    TOKENS_FOLLOWING_T__56_IN_forCycle_745 = Set[ 6, 10, 12, 13, 14, 26, 33, 44, 45, 57 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_751 = Set[ 6, 10, 12, 13, 14, 26, 33, 44, 45, 57 ]
    TOKENS_FOLLOWING_condition_IN_forCycle_756 = Set[ 4, 5, 55, 56 ]
    TOKENS_FOLLOWING_COMMENT_IN_forCycle_761 = Set[ 55, 56 ]
    TOKENS_FOLLOWING_T__55_IN_forCycle_765 = Set[ 56 ]
    TOKENS_FOLLOWING_T__56_IN_forCycle_769 = Set[ 26 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_forCycle_775 = Set[ 26 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_782 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_forCycle_784 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 28, 29, 55, 56 ]
    TOKENS_FOLLOWING_block_IN_forCycle_787 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_forCycle_789 = Set[ 1 ]
    TOKENS_FOLLOWING_type_IN_func_811 = Set[ 26 ]
    TOKENS_FOLLOWING_ID_IN_func_813 = Set[ 10, 18 ]
    TOKENS_FOLLOWING_LB_IN_func_816 = Set[ 11, 28, 29 ]
    TOKENS_FOLLOWING_params_IN_func_819 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_func_821 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_func_826 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 28, 29, 55, 56 ]
    TOKENS_FOLLOWING_block_IN_func_829 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_func_831 = Set[ 1 ]
    TOKENS_FOLLOWING_MAIN_IN_func_841 = Set[ 18 ]
    TOKENS_FOLLOWING_LCB_IN_func_844 = Set[ 4, 5, 7, 8, 9, 15, 17, 23, 24, 25, 26, 28, 29, 55, 56 ]
    TOKENS_FOLLOWING_block_IN_func_847 = Set[ 19 ]
    TOKENS_FOLLOWING_RCB_IN_func_849 = Set[ 1 ]
    TOKENS_FOLLOWING_ITYPE_IN_type_869 = Set[ 1 ]
    TOKENS_FOLLOWING_ATYPE_IN_type_876 = Set[ 1 ]
    TOKENS_FOLLOWING_type_IN_params_893 = Set[ 26 ]
    TOKENS_FOLLOWING_ID_IN_params_895 = Set[ 16 ]
    TOKENS_FOLLOWING_paramRest_IN_params_897 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_paramRest_922 = Set[ 28, 29 ]
    TOKENS_FOLLOWING_params_IN_paramRest_925 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_aloneCall_953 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_aloneCall_956 = Set[ 6, 10, 11, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_args_IN_aloneCall_961 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_aloneCall_964 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_DOT_IN_aloneCall_975 = Set[ 26 ]
    TOKENS_FOLLOWING_ID_IN_aloneCall_979 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_aloneCall_981 = Set[ 6, 10, 11, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_args_IN_aloneCall_986 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_aloneCall_989 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_ID_IN_call_1012 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_call_1015 = Set[ 6, 10, 11, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_args_IN_call_1020 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_call_1023 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_DOT_IN_call_1034 = Set[ 26 ]
    TOKENS_FOLLOWING_ID_IN_call_1038 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_call_1040 = Set[ 6, 10, 11, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_args_IN_call_1045 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_call_1048 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_expression_IN_args_1070 = Set[ 16 ]
    TOKENS_FOLLOWING_argsRest_IN_args_1072 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsRest_1091 = Set[ 6, 10, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_args_IN_argsRest_1094 = Set[ 1 ]
    TOKENS_FOLLOWING_orOperand_IN_condition_1120 = Set[ 1, 31 ]
    TOKENS_FOLLOWING_OR_IN_condition_1127 = Set[ 6, 10, 12, 13, 14, 26, 33, 44, 45, 57 ]
    TOKENS_FOLLOWING_condition_IN_condition_1132 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperand_IN_orOperand_1153 = Set[ 1, 32 ]
    TOKENS_FOLLOWING_AND_IN_orOperand_1160 = Set[ 6, 10, 12, 13, 14, 26, 33, 44, 45, 57 ]
    TOKENS_FOLLOWING_orOperand_IN_orOperand_1165 = Set[ 1 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1184 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_boolOperand_1191 = Set[ 10 ]
    TOKENS_FOLLOWING_LB_IN_boolOperand_1193 = Set[ 6, 10, 12, 13, 14, 26, 33, 44, 45, 57 ]
    TOKENS_FOLLOWING_condition_IN_boolOperand_1196 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_boolOperand_1198 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1208 = Set[ 34, 35, 36, 37, 38, 39 ]
    TOKENS_FOLLOWING_EQ_IN_boolOperand_1211 = Set[ 6, 10, 12, 13, 14, 26, 44, 45, 57 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1218 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1224 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_boolOperand_1235 = Set[ 6, 10, 12, 13, 14, 26, 44, 45, 57 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1242 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1248 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_boolOperand_1259 = Set[ 6, 10, 12, 13, 14, 26, 44, 45, 57 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1266 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1272 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_boolOperand_1283 = Set[ 6, 10, 12, 13, 14, 26, 44, 45, 57 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1290 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1296 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_boolOperand_1307 = Set[ 6, 10, 12, 13, 14, 26, 44, 45, 57 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1314 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1320 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_boolOperand_1331 = Set[ 6, 10, 12, 13, 14, 26, 44, 45, 57 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_1338 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_1344 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperand_IN_expression_1369 = Set[ 1, 12, 13 ]
    TOKENS_FOLLOWING_PLUS_IN_expression_1380 = Set[ 6, 10, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_expression_IN_expression_1385 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expression_1393 = Set[ 6, 10, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_expression_IN_expression_1398 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperand_1420 = Set[ 1, 40, 41, 42 ]
    TOKENS_FOLLOWING_MUL_IN_addOperand_1431 = Set[ 6, 10, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1436 = Set[ 1 ]
    TOKENS_FOLLOWING_DIV_IN_addOperand_1444 = Set[ 6, 10, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1449 = Set[ 1 ]
    TOKENS_FOLLOWING_MOD_IN_addOperand_1457 = Set[ 6, 10, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1462 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_mulOperand_1484 = Set[ 6, 10, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1486 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_mulOperand_1493 = Set[ 6, 10, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1495 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1502 = Set[ 1 ]
    TOKENS_FOLLOWING_arrayIndexTarget_IN_mulOperandRest_1519 = Set[ 1, 57 ]
    TOKENS_FOLLOWING_T__57_IN_mulOperandRest_1527 = Set[ 6, 10, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_expression_IN_mulOperandRest_1529 = Set[ 58 ]
    TOKENS_FOLLOWING_T__58_IN_mulOperandRest_1531 = Set[ 1, 57 ]
    TOKENS_FOLLOWING_ID_IN_arrayIndexTarget_1553 = Set[ 1 ]
    TOKENS_FOLLOWING_LB_IN_arrayIndexTarget_1560 = Set[ 6, 10, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_expression_IN_arrayIndexTarget_1563 = Set[ 11 ]
    TOKENS_FOLLOWING_RB_IN_arrayIndexTarget_1565 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_arrayIndexTarget_1573 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_arrayIndexTarget_1580 = Set[ 1 ]
    TOKENS_FOLLOWING_array_IN_arrayIndexTarget_1587 = Set[ 1 ]
    TOKENS_FOLLOWING_readInstruction_IN_arrayIndexTarget_1594 = Set[ 1 ]
    TOKENS_FOLLOWING_T__57_IN_array_1611 = Set[ 6, 10, 12, 13, 14, 26, 57, 58 ]
    TOKENS_FOLLOWING_expression_IN_array_1620 = Set[ 16, 58 ]
    TOKENS_FOLLOWING_COMMA_IN_array_1627 = Set[ 6, 10, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_expression_IN_array_1631 = Set[ 16, 58 ]
    TOKENS_FOLLOWING_T__58_IN_array_1642 = Set[ 1 ]
    TOKENS_FOLLOWING_identified_IN_indexed_1659 = Set[ 1, 57 ]
    TOKENS_FOLLOWING_T__57_IN_indexed_1669 = Set[ 6, 10, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_expression_IN_indexed_1671 = Set[ 58 ]
    TOKENS_FOLLOWING_T__58_IN_indexed_1673 = Set[ 1, 57 ]
    TOKENS_FOLLOWING_ID_IN_identified_1694 = Set[ 1 ]
    TOKENS_FOLLOWING_type_IN_declaration_1711 = Set[ 26 ]
    TOKENS_FOLLOWING_ID_IN_declaration_1713 = Set[ 1 ]
    TOKENS_FOLLOWING_indexed_IN_assignment_1730 = Set[ 43 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1732 = Set[ 6, 10, 12, 13, 14, 26, 57 ]
    TOKENS_FOLLOWING_expression_IN_assignment_1735 = Set[ 1 ]
    TOKENS_FOLLOWING_TRUE_IN_bool_1756 = Set[ 1 ]
    TOKENS_FOLLOWING_FALSE_IN_bool_1764 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end


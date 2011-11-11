#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-11-11 02:35:24
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


require './lib/giraffe/env.rb'

# - - - - - - end action @parser::header - - - - - - -


module Giraffe
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :EXPONENT => 42, :LT => 28, :WHILE => 18, :RB => 23, 
                   :MOD => 37, :OCTAL_ESC => 47, :CHAR => 38, :DO => 19, 
                   :FOR => 20, :FLOAT => 11, :NOT => 32, :ID => 9, :RCB => 5, 
                   :AND => 25, :EOF => -1, :IF => 14, :ESC_SEQ => 44, :LCB => 4, 
                   :COMMA => 21, :PLUS => 33, :EQ => 26, :COMMENT => 6, 
                   :T__50 => 50, :NE => 27, :GE => 31, :T__49 => 49, :UNICODE_ESC => 46, 
                   :ELSE => 15, :HEX_DIGIT => 45, :INT => 10, :SEMICOLON => 7, 
                   :MINUS => 34, :MUL => 35, :TRUE => 40, :PRINT => 8, :ELSEIF => 16, 
                   :PRINTL => 13, :COLON => 48, :ELIF => 17, :WS => 43, 
                   :OR => 24, :ASSIGN => 39, :GT => 29, :LB => 22, :DIV => 36, 
                   :FALSE => 41, :LE => 30, :STRING => 12 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "LCB", "RCB", "COMMENT", "SEMICOLON", "PRINT", "ID", 
                    "INT", "FLOAT", "STRING", "PRINTL", "IF", "ELSE", "ELSEIF", 
                    "ELIF", "WHILE", "DO", "FOR", "COMMA", "LB", "RB", "OR", 
                    "AND", "EQ", "NE", "LT", "GT", "LE", "GE", "NOT", "PLUS", 
                    "MINUS", "MUL", "DIV", "MOD", "CHAR", "ASSIGN", "TRUE", 
                    "FALSE", "EXPONENT", "WS", "ESC_SEQ", "HEX_DIGIT", "UNICODE_ESC", 
                    "OCTAL_ESC", "COLON", "'\\r'", "'\\n'" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = Giraffe
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :program, :env, :block, :instructionRest, :instruction, 
                     :printInstruction, :printlInstruction, :ifInstruction, 
                     :ifRest, :whileCycle, :doCycle, :forCycle, :func, :params, 
                     :paramRest, :call, :args, :argsRest, :condition, :orOperand, 
                     :andOperand, :boolOperand, :expression, :addOperand, 
                     :mulOperand, :mulOperandRest, :value, :assignment, 
                     :bool ].freeze


    include TokenData

    begin
      generated_using( "Giraffe.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )


    end

    @@progEnv = Env.new

    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -
    ProgramReturnValue = define_return_scope 

    # 
    # parser rule program
    # 
    # (in Giraffe.g)
    # 17:1: program : block ;
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


        # at line 17:11: block
        @state.following.push( TOKENS_FOLLOWING_block_IN_program_44 )
        block1 = block
        @state.following.pop
        @adaptor.add_child( root_0, block1.tree )
        # - - - - - - - rule clean up - - - - - - - -
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
    # 19:1: env returns [result] : LCB block RCB ;
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


        # at line 20:4: LCB block RCB
        __LCB2__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_env_58 )
        # --> action
         @@progEnv.raise 
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_block_IN_env_66 )
        block3 = block
        @state.following.pop
        @adaptor.add_child( root_0, block3.tree )
        __RCB4__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_env_71 )
        # --> action
         @@progEnv.descend 
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

    BlockReturnValue = define_return_scope 

    # 
    # parser rule block
    # 
    # (in Giraffe.g)
    # 25:1: block : instruction instructionRest ;
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


        # at line 26:4: instruction instructionRest
        @state.following.push( TOKENS_FOLLOWING_instruction_IN_block_86 )
        instruction5 = instruction
        @state.following.pop
        @adaptor.add_child( root_0, instruction5.tree )
        @state.following.push( TOKENS_FOLLOWING_instructionRest_IN_block_88 )
        instructionRest6 = instructionRest
        @state.following.pop
        @adaptor.add_child( root_0, instructionRest6.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    InstructionRestReturnValue = define_return_scope 

    # 
    # parser rule instructionRest
    # 
    # (in Giraffe.g)
    # 28:1: instructionRest : ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | );
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
      block11 = nil

      tree_for_COMMENT7 = nil
      tree_for_char_literal8 = nil
      tree_for_char_literal9 = nil
      tree_for_SEMICOLON10 = nil

      begin
        # at line 29:2: ( ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block | )
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0.between?( COMMENT, SEMICOLON ) || look_4_0.between?( T__49, T__50 ) )
          alt_4 = 1
        elsif ( look_4_0 == EOF || look_4_0 == RCB )
          alt_4 = 2
        else
          raise NoViableAlternative( "", 4, 0 )
        end
        case alt_4
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 29:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON ) block
          # at line 29:5: ( ( ( COMMENT )? ( '\\r' )? '\\n' ) | SEMICOLON )
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0 == COMMENT || look_3_0.between?( T__49, T__50 ) )
            alt_3 = 1
          elsif ( look_3_0 == SEMICOLON )
            alt_3 = 2
          else
            raise NoViableAlternative( "", 3, 0 )
          end
          case alt_3
          when 1
            # at line 29:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 29:6: ( ( COMMENT )? ( '\\r' )? '\\n' )
            # at line 29:8: ( COMMENT )? ( '\\r' )? '\\n'
            # at line 29:15: ( COMMENT )?
            alt_1 = 2
            look_1_0 = @input.peek( 1 )

            if ( look_1_0 == COMMENT )
              alt_1 = 1
            end
            case alt_1
            when 1
              # at line 29:15: COMMENT
              __COMMENT7__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_instructionRest_101 )

            end
            # at line 29:22: ( '\\r' )?
            alt_2 = 2
            look_2_0 = @input.peek( 1 )

            if ( look_2_0 == T__49 )
              alt_2 = 1
            end
            case alt_2
            when 1
              # at line 29:22: '\\r'
              char_literal8 = match( T__49, TOKENS_FOLLOWING_T__49_IN_instructionRest_105 )

            end
            char_literal9 = match( T__50, TOKENS_FOLLOWING_T__50_IN_instructionRest_109 )


          when 2
            # at line 29:34: SEMICOLON
            __SEMICOLON10__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_115 )

          end
          @state.following.push( TOKENS_FOLLOWING_block_IN_instructionRest_119 )
          block11 = block
          @state.following.pop
          @adaptor.add_child( root_0, block11.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 30:4: 

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

    InstructionReturnValue = define_return_scope 

    # 
    # parser rule instruction
    # 
    # (in Giraffe.g)
    # 32:1: instruction : ( assignment | call | func | env | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | );
    # 
    def instruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      return_value = InstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      assignment12 = nil
      call13 = nil
      func14 = nil
      env15 = nil
      forCycle16 = nil
      ifInstruction17 = nil
      whileCycle18 = nil
      doCycle19 = nil
      printInstruction20 = nil
      printlInstruction21 = nil


      begin
        # at line 33:2: ( assignment | call | func | env | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | )
        alt_5 = 11
        alt_5 = @dfa5.predict( @input )
        case alt_5
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 33:4: assignment
          @state.following.push( TOKENS_FOLLOWING_assignment_IN_instruction_132 )
          assignment12 = assignment
          @state.following.pop
          @adaptor.add_child( root_0, assignment12.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 34:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_instruction_137 )
          call13 = call
          @state.following.pop
          @adaptor.add_child( root_0, call13.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 35:4: func
          @state.following.push( TOKENS_FOLLOWING_func_IN_instruction_142 )
          func14 = func
          @state.following.pop
          @adaptor.add_child( root_0, func14.tree )

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 36:4: env
          @state.following.push( TOKENS_FOLLOWING_env_IN_instruction_147 )
          env15 = env
          @state.following.pop
          @adaptor.add_child( root_0, env15.tree )

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 37:4: forCycle
          @state.following.push( TOKENS_FOLLOWING_forCycle_IN_instruction_152 )
          forCycle16 = forCycle
          @state.following.pop
          @adaptor.add_child( root_0, forCycle16.tree )

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 38:4: ifInstruction
          @state.following.push( TOKENS_FOLLOWING_ifInstruction_IN_instruction_157 )
          ifInstruction17 = ifInstruction
          @state.following.pop
          @adaptor.add_child( root_0, ifInstruction17.tree )

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 39:4: whileCycle
          @state.following.push( TOKENS_FOLLOWING_whileCycle_IN_instruction_162 )
          whileCycle18 = whileCycle
          @state.following.pop
          @adaptor.add_child( root_0, whileCycle18.tree )

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 40:4: doCycle
          @state.following.push( TOKENS_FOLLOWING_doCycle_IN_instruction_167 )
          doCycle19 = doCycle
          @state.following.pop
          @adaptor.add_child( root_0, doCycle19.tree )

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 41:4: printInstruction
          @state.following.push( TOKENS_FOLLOWING_printInstruction_IN_instruction_172 )
          printInstruction20 = printInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printInstruction20.tree )

        when 10
          root_0 = @adaptor.create_flat_list


          # at line 42:4: printlInstruction
          @state.following.push( TOKENS_FOLLOWING_printlInstruction_IN_instruction_177 )
          printlInstruction21 = printlInstruction
          @state.following.pop
          @adaptor.add_child( root_0, printlInstruction21.tree )

        when 11
          root_0 = @adaptor.create_flat_list


          # at line 43:4: 

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

    PrintInstructionReturnValue = define_return_scope 

    # 
    # parser rule printInstruction
    # 
    # (in Giraffe.g)
    # 45:1: printInstruction : PRINT ( ID | INT | FLOAT | STRING ) ;
    # 
    def printInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      return_value = PrintInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PRINT22__ = nil
      __ID23__ = nil
      __INT24__ = nil
      __FLOAT25__ = nil
      __STRING26__ = nil

      tree_for_PRINT22 = nil
      tree_for_ID23 = nil
      tree_for_INT24 = nil
      tree_for_FLOAT25 = nil
      tree_for_STRING26 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 46:5: PRINT ( ID | INT | FLOAT | STRING )
        __PRINT22__ = match( PRINT, TOKENS_FOLLOWING_PRINT_IN_printInstruction_191 )

        tree_for_PRINT22 = @adaptor.create_with_payload( __PRINT22__ )
        @adaptor.add_child( root_0, tree_for_PRINT22 )

        # at line 46:13: ( ID | INT | FLOAT | STRING )
        alt_6 = 4
        case look_6 = @input.peek( 1 )
        when ID then alt_6 = 1
        when INT then alt_6 = 2
        when FLOAT then alt_6 = 3
        when STRING then alt_6 = 4
        else
          raise NoViableAlternative( "", 6, 0 )
        end
        case alt_6
        when 1
          # at line 46:15: ID
          __ID23__ = match( ID, TOKENS_FOLLOWING_ID_IN_printInstruction_197 )

          tree_for_ID23 = @adaptor.create_with_payload( __ID23__ )
          @adaptor.add_child( root_0, tree_for_ID23 )

          # --> action
          print __ID23__.text
          # <-- action

        when 2
          # at line 47:7: INT
          __INT24__ = match( INT, TOKENS_FOLLOWING_INT_IN_printInstruction_207 )

          tree_for_INT24 = @adaptor.create_with_payload( __INT24__ )
          @adaptor.add_child( root_0, tree_for_INT24 )

          # --> action
          print __INT24__.text
          # <-- action

        when 3
          # at line 48:7: FLOAT
          __FLOAT25__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_printInstruction_217 )

          tree_for_FLOAT25 = @adaptor.create_with_payload( __FLOAT25__ )
          @adaptor.add_child( root_0, tree_for_FLOAT25 )

          # --> action
          print __FLOAT25__.text
          # <-- action

        when 4
          # at line 49:7: STRING
          __STRING26__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_printInstruction_227 )

          tree_for_STRING26 = @adaptor.create_with_payload( __STRING26__ )
          @adaptor.add_child( root_0, tree_for_STRING26 )

          # --> action
          print __STRING26__.text
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
        # trace_out( __method__, 6 )

      end
      
      return return_value
    end

    PrintlInstructionReturnValue = define_return_scope 

    # 
    # parser rule printlInstruction
    # 
    # (in Giraffe.g)
    # 53:1: printlInstruction : PRINTL ( ID | INT | FLOAT | STRING ) ;
    # 
    def printlInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )
      return_value = PrintlInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PRINTL27__ = nil
      __ID28__ = nil
      __INT29__ = nil
      __FLOAT30__ = nil
      __STRING31__ = nil

      tree_for_PRINTL27 = nil
      tree_for_ID28 = nil
      tree_for_INT29 = nil
      tree_for_FLOAT30 = nil
      tree_for_STRING31 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 54:5: PRINTL ( ID | INT | FLOAT | STRING )
        __PRINTL27__ = match( PRINTL, TOKENS_FOLLOWING_PRINTL_IN_printlInstruction_251 )

        tree_for_PRINTL27 = @adaptor.create_with_payload( __PRINTL27__ )
        @adaptor.add_child( root_0, tree_for_PRINTL27 )

        # at line 54:13: ( ID | INT | FLOAT | STRING )
        alt_7 = 4
        case look_7 = @input.peek( 1 )
        when ID then alt_7 = 1
        when INT then alt_7 = 2
        when FLOAT then alt_7 = 3
        when STRING then alt_7 = 4
        else
          raise NoViableAlternative( "", 7, 0 )
        end
        case alt_7
        when 1
          # at line 54:15: ID
          __ID28__ = match( ID, TOKENS_FOLLOWING_ID_IN_printlInstruction_256 )

          tree_for_ID28 = @adaptor.create_with_payload( __ID28__ )
          @adaptor.add_child( root_0, tree_for_ID28 )

          # --> action
          puts __ID28__.text
          # <-- action

        when 2
          # at line 55:7: INT
          __INT29__ = match( INT, TOKENS_FOLLOWING_INT_IN_printlInstruction_266 )

          tree_for_INT29 = @adaptor.create_with_payload( __INT29__ )
          @adaptor.add_child( root_0, tree_for_INT29 )

          # --> action
          puts __INT29__.text
          # <-- action

        when 3
          # at line 56:7: FLOAT
          __FLOAT30__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_printlInstruction_276 )

          tree_for_FLOAT30 = @adaptor.create_with_payload( __FLOAT30__ )
          @adaptor.add_child( root_0, tree_for_FLOAT30 )

          # --> action
          puts __FLOAT30__.text
          # <-- action

        when 4
          # at line 57:7: STRING
          __STRING31__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_printlInstruction_286 )

          tree_for_STRING31 = @adaptor.create_with_payload( __STRING31__ )
          @adaptor.add_child( root_0, tree_for_STRING31 )

          # --> action
          puts __STRING31__.text
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
        # trace_out( __method__, 7 )

      end
      
      return return_value
    end

    IfInstructionReturnValue = define_return_scope 

    # 
    # parser rule ifInstruction
    # 
    # (in Giraffe.g)
    # 61:1: ifInstruction : IF condition env ifRest ;
    # 
    def ifInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      return_value = IfInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __IF32__ = nil
      condition33 = nil
      env34 = nil
      ifRest35 = nil

      tree_for_IF32 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 62:4: IF condition env ifRest
        __IF32__ = match( IF, TOKENS_FOLLOWING_IF_IN_ifInstruction_309 )

        tree_for_IF32 = @adaptor.create_with_payload( __IF32__ )
        root_0 = @adaptor.become_root( tree_for_IF32, root_0 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_ifInstruction_312 )
        condition33 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition33.tree )
        @state.following.push( TOKENS_FOLLOWING_env_IN_ifInstruction_314 )
        env34 = env
        @state.following.pop
        @adaptor.add_child( root_0, env34.tree )
        @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifInstruction_316 )
        ifRest35 = ifRest
        @state.following.pop
        @adaptor.add_child( root_0, ifRest35.tree )
        # --> action
         
        		puts "Condition: #{( condition33.nil? ? nil : condition33.result )}"
        		if ( condition33.nil? ? nil : condition33.result )
        			( env34.nil? ? nil : env34.result ) # vraci objekt, ktery se da "spustit", takze je zachovana funkcionalita cyklu apod.
        		else 
        			( ifRest35.nil? ? nil : ifRest35.result )
        		end
        		
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

    IfRestReturnValue = define_return_scope :result

    # 
    # parser rule ifRest
    # 
    # (in Giraffe.g)
    # 73:1: ifRest returns [result] : ( ELSE env | ( ELSEIF | ELIF ) condition env | );
    # 
    def ifRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = IfRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ELSE36__ = nil
      set38 = nil
      env37 = nil
      condition39 = nil
      env40 = nil

      tree_for_ELSE36 = nil
      tree_for_set38 = nil

      begin
        # at line 74:2: ( ELSE env | ( ELSEIF | ELIF ) condition env | )
        alt_8 = 3
        case look_8 = @input.peek( 1 )
        when ELSE then alt_8 = 1
        when ELSEIF, ELIF then alt_8 = 2
        when EOF, RCB, COMMENT, SEMICOLON, T__49, T__50 then alt_8 = 3
        else
          raise NoViableAlternative( "", 8, 0 )
        end
        case alt_8
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 74:4: ELSE env
          __ELSE36__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_ifRest_336 )

          tree_for_ELSE36 = @adaptor.create_with_payload( __ELSE36__ )
          @adaptor.add_child( root_0, tree_for_ELSE36 )

          @state.following.push( TOKENS_FOLLOWING_env_IN_ifRest_338 )
          env37 = env
          @state.following.pop
          @adaptor.add_child( root_0, env37.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 75:4: ( ELSEIF | ELIF ) condition env
          set38 = @input.look
          if @input.peek( 1 ).between?( ELSEIF, ELIF )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set38 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          @state.following.push( TOKENS_FOLLOWING_condition_IN_ifRest_351 )
          condition39 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition39.tree )
          @state.following.push( TOKENS_FOLLOWING_env_IN_ifRest_353 )
          env40 = env
          @state.following.pop
          @adaptor.add_child( root_0, env40.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 76:4: 

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
        # trace_out( __method__, 9 )

      end
      
      return return_value
    end

    WhileCycleReturnValue = define_return_scope 

    # 
    # parser rule whileCycle
    # 
    # (in Giraffe.g)
    # 78:1: whileCycle : WHILE condition env ;
    # 
    def whileCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = WhileCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WHILE41__ = nil
      condition42 = nil
      env43 = nil

      tree_for_WHILE41 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 79:5: WHILE condition env
        __WHILE41__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_whileCycle_367 )

        tree_for_WHILE41 = @adaptor.create_with_payload( __WHILE41__ )
        @adaptor.add_child( root_0, tree_for_WHILE41 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_whileCycle_369 )
        condition42 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition42.tree )
        @state.following.push( TOKENS_FOLLOWING_env_IN_whileCycle_371 )
        env43 = env
        @state.following.pop
        @adaptor.add_child( root_0, env43.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    DoCycleReturnValue = define_return_scope 

    # 
    # parser rule doCycle
    # 
    # (in Giraffe.g)
    # 81:1: doCycle : DO env WHILE condition ;
    # 
    def doCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = DoCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __DO44__ = nil
      __WHILE46__ = nil
      env45 = nil
      condition47 = nil

      tree_for_DO44 = nil
      tree_for_WHILE46 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 81:11: DO env WHILE condition
        __DO44__ = match( DO, TOKENS_FOLLOWING_DO_IN_doCycle_379 )

        tree_for_DO44 = @adaptor.create_with_payload( __DO44__ )
        @adaptor.add_child( root_0, tree_for_DO44 )

        @state.following.push( TOKENS_FOLLOWING_env_IN_doCycle_381 )
        env45 = env
        @state.following.pop
        @adaptor.add_child( root_0, env45.tree )
        __WHILE46__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_doCycle_383 )

        tree_for_WHILE46 = @adaptor.create_with_payload( __WHILE46__ )
        @adaptor.add_child( root_0, tree_for_WHILE46 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_doCycle_385 )
        condition47 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition47.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    ForCycleReturnValue = define_return_scope 

    # 
    # parser rule forCycle
    # 
    # (in Giraffe.g)
    # 83:1: forCycle : FOR assignment COMMA condition COMMA assignment env ;
    # 
    def forCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = ForCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __FOR48__ = nil
      __COMMA50__ = nil
      __COMMA52__ = nil
      assignment49 = nil
      condition51 = nil
      assignment53 = nil
      env54 = nil

      tree_for_FOR48 = nil
      tree_for_COMMA50 = nil
      tree_for_COMMA52 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 84:4: FOR assignment COMMA condition COMMA assignment env
        __FOR48__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_forCycle_394 )

        tree_for_FOR48 = @adaptor.create_with_payload( __FOR48__ )
        @adaptor.add_child( root_0, tree_for_FOR48 )

        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_396 )
        assignment49 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, assignment49.tree )
        __COMMA50__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_forCycle_398 )
        @state.following.push( TOKENS_FOLLOWING_condition_IN_forCycle_401 )
        condition51 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition51.tree )
        __COMMA52__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_forCycle_403 )
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_406 )
        assignment53 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, assignment53.tree )
        @state.following.push( TOKENS_FOLLOWING_env_IN_forCycle_408 )
        env54 = env
        @state.following.pop
        @adaptor.add_child( root_0, env54.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    FuncReturnValue = define_return_scope 

    # 
    # parser rule func
    # 
    # (in Giraffe.g)
    # 86:1: func : ID ( params )? env ;
    # 
    def func
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = FuncReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID55__ = nil
      params56 = nil
      env57 = nil

      tree_for_ID55 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 86:9: ID ( params )? env
        __ID55__ = match( ID, TOKENS_FOLLOWING_ID_IN_func_418 )

        tree_for_ID55 = @adaptor.create_with_payload( __ID55__ )
        root_0 = @adaptor.become_root( tree_for_ID55, root_0 )

        # at line 86:13: ( params )?
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == ID )
          alt_9 = 1
        end
        case alt_9
        when 1
          # at line 86:13: params
          @state.following.push( TOKENS_FOLLOWING_params_IN_func_421 )
          params56 = params
          @state.following.pop
          @adaptor.add_child( root_0, params56.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_env_IN_func_424 )
        env57 = env
        @state.following.pop
        @adaptor.add_child( root_0, env57.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    ParamsReturnValue = define_return_scope 

    # 
    # parser rule params
    # 
    # (in Giraffe.g)
    # 88:1: params : ID paramRest ;
    # 
    def params
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = ParamsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID58__ = nil
      paramRest59 = nil

      tree_for_ID58 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 88:10: ID paramRest
        __ID58__ = match( ID, TOKENS_FOLLOWING_ID_IN_params_432 )

        tree_for_ID58 = @adaptor.create_with_payload( __ID58__ )
        @adaptor.add_child( root_0, tree_for_ID58 )

        @state.following.push( TOKENS_FOLLOWING_paramRest_IN_params_434 )
        paramRest59 = paramRest
        @state.following.pop
        @adaptor.add_child( root_0, paramRest59.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    ParamRestReturnValue = define_return_scope 

    # 
    # parser rule paramRest
    # 
    # (in Giraffe.g)
    # 90:1: paramRest : ( COMMA params | );
    # 
    def paramRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = ParamRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA60__ = nil
      params61 = nil

      tree_for_COMMA60 = nil

      begin
        # at line 91:2: ( COMMA params | )
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


          # at line 91:4: COMMA params
          __COMMA60__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_paramRest_443 )
          @state.following.push( TOKENS_FOLLOWING_params_IN_paramRest_446 )
          params61 = params
          @state.following.pop
          @adaptor.add_child( root_0, params61.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 92:4: 

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

    CallReturnValue = define_return_scope 

    # 
    # parser rule call
    # 
    # (in Giraffe.g)
    # 94:1: call : ID LB ( args )? RB ;
    # 
    def call
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = CallReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID62__ = nil
      __LB63__ = nil
      __RB65__ = nil
      args64 = nil

      tree_for_ID62 = nil
      tree_for_LB63 = nil
      tree_for_RB65 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 95:4: ID LB ( args )? RB
        __ID62__ = match( ID, TOKENS_FOLLOWING_ID_IN_call_461 )

        tree_for_ID62 = @adaptor.create_with_payload( __ID62__ )
        root_0 = @adaptor.become_root( tree_for_ID62, root_0 )

        __LB63__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_464 )
        # at line 95:12: ( args )?
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0.between?( ID, FLOAT ) || look_11_0 == LB || look_11_0.between?( PLUS, MINUS ) )
          alt_11 = 1
        end
        case alt_11
        when 1
          # at line 95:12: args
          @state.following.push( TOKENS_FOLLOWING_args_IN_call_467 )
          args64 = args
          @state.following.pop
          @adaptor.add_child( root_0, args64.tree )

        end
        __RB65__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_470 )
        # - - - - - - - rule clean up - - - - - - - -
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

    ArgsReturnValue = define_return_scope 

    # 
    # parser rule args
    # 
    # (in Giraffe.g)
    # 97:1: args : expression argsRest ;
    # 
    def args
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = ArgsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      expression66 = nil
      argsRest67 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 98:4: expression argsRest
        @state.following.push( TOKENS_FOLLOWING_expression_IN_args_482 )
        expression66 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression66.tree )
        @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_484 )
        argsRest67 = argsRest
        @state.following.pop
        @adaptor.add_child( root_0, argsRest67.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    ArgsRestReturnValue = define_return_scope 

    # 
    # parser rule argsRest
    # 
    # (in Giraffe.g)
    # 100:1: argsRest : ( COMMA args | );
    # 
    def argsRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = ArgsRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA68__ = nil
      args69 = nil

      tree_for_COMMA68 = nil

      begin
        # at line 101:2: ( COMMA args | )
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


          # at line 101:4: COMMA args
          __COMMA68__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsRest_495 )
          @state.following.push( TOKENS_FOLLOWING_args_IN_argsRest_498 )
          args69 = args
          @state.following.pop
          @adaptor.add_child( root_0, args69.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 102:4: 

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

    ConditionReturnValue = define_return_scope :result

    # 
    # parser rule condition
    # 
    # (in Giraffe.g)
    # 106:1: condition returns [result] : orOperand ( OR op= condition )? ;
    # 
    def condition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = ConditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OR71__ = nil
      op = nil
      orOperand70 = nil

      tree_for_OR71 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 107:4: orOperand ( OR op= condition )?
        @state.following.push( TOKENS_FOLLOWING_orOperand_IN_condition_517 )
        orOperand70 = orOperand
        @state.following.pop
        @adaptor.add_child( root_0, orOperand70.tree )
        # --> action
        return_value.result = ( orOperand70.nil? ? nil : orOperand70.result )
        # <-- action
        # at line 108:3: ( OR op= condition )?
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == OR )
          alt_13 = 1
        end
        case alt_13
        when 1
          # at line 108:4: OR op= condition
          __OR71__ = match( OR, TOKENS_FOLLOWING_OR_IN_condition_524 )

          tree_for_OR71 = @adaptor.create_with_payload( __OR71__ )
          root_0 = @adaptor.become_root( tree_for_OR71, root_0 )

          @state.following.push( TOKENS_FOLLOWING_condition_IN_condition_529 )
          op = condition
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result || ( op.nil? ? nil : op.result )
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
        # trace_out( __method__, 19 )

      end
      
      return return_value
    end

    OrOperandReturnValue = define_return_scope :result

    # 
    # parser rule orOperand
    # 
    # (in Giraffe.g)
    # 113:1: orOperand returns [result] : boolOperand ( AND op= orOperand )? ;
    # 
    def orOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = OrOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __AND73__ = nil
      op = nil
      boolOperand72 = nil

      tree_for_AND73 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 114:4: boolOperand ( AND op= orOperand )?
        @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_orOperand_550 )
        boolOperand72 = boolOperand
        @state.following.pop
        @adaptor.add_child( root_0, boolOperand72.tree )
        # --> action
        return_value.result = ( boolOperand72.nil? ? nil : boolOperand72.result )
        # <-- action
        # at line 115:3: ( AND op= orOperand )?
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == AND )
          alt_14 = 1
        end
        case alt_14
        when 1
          # at line 115:4: AND op= orOperand
          __AND73__ = match( AND, TOKENS_FOLLOWING_AND_IN_orOperand_557 )

          tree_for_AND73 = @adaptor.create_with_payload( __AND73__ )
          root_0 = @adaptor.become_root( tree_for_AND73, root_0 )

          @state.following.push( TOKENS_FOLLOWING_orOperand_IN_orOperand_562 )
          op = orOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result && ( op.nil? ? nil : op.result )
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
        # trace_out( __method__, 20 )

      end
      
      return return_value
    end

    AndOperandReturnValue = define_return_scope :result

    # 
    # parser rule andOperand
    # 
    # (in Giraffe.g)
    # 118:1: andOperand returns [result] : boolOperand ( EQ op= andOperand | NE op= andOperand | LT op= andOperand | GT op= andOperand | LE op= andOperand | GE op= andOperand )? ;
    # 
    def andOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = AndOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __EQ75__ = nil
      __NE76__ = nil
      __LT77__ = nil
      __GT78__ = nil
      __LE79__ = nil
      __GE80__ = nil
      op = nil
      boolOperand74 = nil

      tree_for_EQ75 = nil
      tree_for_NE76 = nil
      tree_for_LT77 = nil
      tree_for_GT78 = nil
      tree_for_LE79 = nil
      tree_for_GE80 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 119:4: boolOperand ( EQ op= andOperand | NE op= andOperand | LT op= andOperand | GT op= andOperand | LE op= andOperand | GE op= andOperand )?
        @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_andOperand_581 )
        boolOperand74 = boolOperand
        @state.following.pop
        @adaptor.add_child( root_0, boolOperand74.tree )
        # --> action
        return_value.result = ( boolOperand74.nil? ? nil : boolOperand74.result )
        # <-- action
        # at line 119:48: ( EQ op= andOperand | NE op= andOperand | LT op= andOperand | GT op= andOperand | LE op= andOperand | GE op= andOperand )?
        alt_15 = 7
        case look_15 = @input.peek( 1 )
        when EQ then alt_15 = 1
        when NE then alt_15 = 2
        when LT then alt_15 = 3
        when GT then alt_15 = 4
        when LE then alt_15 = 5
        when GE then alt_15 = 6
        end
        case alt_15
        when 1
          # at line 120:4: EQ op= andOperand
          __EQ75__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_andOperand_590 )

          tree_for_EQ75 = @adaptor.create_with_payload( __EQ75__ )
          root_0 = @adaptor.become_root( tree_for_EQ75, root_0 )

          @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_595 )
          op = andOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result == ( op.nil? ? nil : op.result )
          # <-- action

        when 2
          # at line 121:6: NE op= andOperand
          __NE76__ = match( NE, TOKENS_FOLLOWING_NE_IN_andOperand_604 )

          tree_for_NE76 = @adaptor.create_with_payload( __NE76__ )
          root_0 = @adaptor.become_root( tree_for_NE76, root_0 )

          @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_609 )
          op = andOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result != ( op.nil? ? nil : op.result )
          # <-- action

        when 3
          # at line 122:6: LT op= andOperand
          __LT77__ = match( LT, TOKENS_FOLLOWING_LT_IN_andOperand_618 )

          tree_for_LT77 = @adaptor.create_with_payload( __LT77__ )
          root_0 = @adaptor.become_root( tree_for_LT77, root_0 )

          @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_623 )
          op = andOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result < ( op.nil? ? nil : op.result )
          # <-- action

        when 4
          # at line 123:6: GT op= andOperand
          __GT78__ = match( GT, TOKENS_FOLLOWING_GT_IN_andOperand_632 )

          tree_for_GT78 = @adaptor.create_with_payload( __GT78__ )
          root_0 = @adaptor.become_root( tree_for_GT78, root_0 )

          @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_637 )
          op = andOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result > ( op.nil? ? nil : op.result )
          # <-- action

        when 5
          # at line 124:6: LE op= andOperand
          __LE79__ = match( LE, TOKENS_FOLLOWING_LE_IN_andOperand_646 )

          tree_for_LE79 = @adaptor.create_with_payload( __LE79__ )
          root_0 = @adaptor.become_root( tree_for_LE79, root_0 )

          @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_651 )
          op = andOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result <= ( op.nil? ? nil : op.result )
          # <-- action

        when 6
          # at line 125:6: GE op= andOperand
          __GE80__ = match( GE, TOKENS_FOLLOWING_GE_IN_andOperand_660 )

          tree_for_GE80 = @adaptor.create_with_payload( __GE80__ )
          root_0 = @adaptor.become_root( tree_for_GE80, root_0 )

          @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_665 )
          op = andOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result >= ( op.nil? ? nil : op.result )
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
        # trace_out( __method__, 21 )

      end
      
      return return_value
    end

    BoolOperandReturnValue = define_return_scope :result

    # 
    # parser rule boolOperand
    # 
    # (in Giraffe.g)
    # 129:1: boolOperand returns [result] : ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) );
    # 
    def boolOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = BoolOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NOT82__ = nil
      __LB83__ = nil
      __RB85__ = nil
      __EQ86__ = nil
      __NE87__ = nil
      __LT88__ = nil
      __GT89__ = nil
      __LE90__ = nil
      __GE91__ = nil
      op1 = nil
      op2 = nil
      bool81 = nil
      condition84 = nil

      tree_for_NOT82 = nil
      tree_for_LB83 = nil
      tree_for_RB85 = nil
      tree_for_EQ86 = nil
      tree_for_NE87 = nil
      tree_for_LT88 = nil
      tree_for_GT89 = nil
      tree_for_LE90 = nil
      tree_for_GE91 = nil

      begin
        # at line 130:2: ( bool | NOT LB condition RB | op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) ) )
        alt_23 = 3
        case look_23 = @input.peek( 1 )
        when TRUE, FALSE then alt_23 = 1
        when NOT then alt_23 = 2
        when ID, INT, FLOAT, LB, PLUS, MINUS then alt_23 = 3
        else
          raise NoViableAlternative( "", 23, 0 )
        end
        case alt_23
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 130:4: bool
          @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_692 )
          bool81 = bool
          @state.following.pop
          @adaptor.add_child( root_0, bool81.tree )
          # --> action
          return_value.result = ( bool81.nil? ? nil : bool81.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 131:4: NOT LB condition RB
          __NOT82__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_boolOperand_699 )

          tree_for_NOT82 = @adaptor.create_with_payload( __NOT82__ )
          @adaptor.add_child( root_0, tree_for_NOT82 )

          __LB83__ = match( LB, TOKENS_FOLLOWING_LB_IN_boolOperand_701 )
          @state.following.push( TOKENS_FOLLOWING_condition_IN_boolOperand_704 )
          condition84 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition84.tree )
          __RB85__ = match( RB, TOKENS_FOLLOWING_RB_IN_boolOperand_706 )
          # --> action
          return_value.result = !( condition84.nil? ? nil : condition84.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 132:4: op1= expression ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_716 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # at line 132:19: ( EQ (op2= bool | op2= expression ) | NE (op2= bool | op2= expression ) | LT (op2= bool | op2= expression ) | GT (op2= bool | op2= expression ) | LE (op2= bool | op2= expression ) | GE (op2= bool | op2= expression ) )
          alt_22 = 6
          case look_22 = @input.peek( 1 )
          when EQ then alt_22 = 1
          when NE then alt_22 = 2
          when LT then alt_22 = 3
          when GT then alt_22 = 4
          when LE then alt_22 = 5
          when GE then alt_22 = 6
          else
            raise NoViableAlternative( "", 22, 0 )
          end
          case alt_22
          when 1
            # at line 133:4: EQ (op2= bool | op2= expression )
            __EQ86__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_boolOperand_723 )

            tree_for_EQ86 = @adaptor.create_with_payload( __EQ86__ )
            root_0 = @adaptor.become_root( tree_for_EQ86, root_0 )

            # at line 133:8: (op2= bool | op2= expression )
            alt_16 = 2
            look_16_0 = @input.peek( 1 )

            if ( look_16_0.between?( TRUE, FALSE ) )
              alt_16 = 1
            elsif ( look_16_0.between?( ID, FLOAT ) || look_16_0 == LB || look_16_0.between?( PLUS, MINUS ) )
              alt_16 = 2
            else
              raise NoViableAlternative( "", 16, 0 )
            end
            case alt_16
            when 1
              # at line 133:10: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_730 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )
              # --> action
              return_value.result = ( op1.nil? ? nil : op1.result ) == ( op2.nil? ? nil : op2.result )
              # <-- action

            when 2
              # at line 134:7: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_742 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )
              # --> action
              return_value.result = ( op1.nil? ? nil : op1.result ) == ( op2.nil? ? nil : op2.result )
              # <-- action

            end

          when 2
            # at line 136:4: NE (op2= bool | op2= expression )
            __NE87__ = match( NE, TOKENS_FOLLOWING_NE_IN_boolOperand_756 )

            tree_for_NE87 = @adaptor.create_with_payload( __NE87__ )
            root_0 = @adaptor.become_root( tree_for_NE87, root_0 )

            # at line 136:8: (op2= bool | op2= expression )
            alt_17 = 2
            look_17_0 = @input.peek( 1 )

            if ( look_17_0.between?( TRUE, FALSE ) )
              alt_17 = 1
            elsif ( look_17_0.between?( ID, FLOAT ) || look_17_0 == LB || look_17_0.between?( PLUS, MINUS ) )
              alt_17 = 2
            else
              raise NoViableAlternative( "", 17, 0 )
            end
            case alt_17
            when 1
              # at line 136:10: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_763 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )
              # --> action
              return_value.result = ( op1.nil? ? nil : op1.result ) != ( op2.nil? ? nil : op2.result )
              # <-- action

            when 2
              # at line 137:8: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_776 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )
              # --> action
              return_value.result = ( op1.nil? ? nil : op1.result ) != ( op2.nil? ? nil : op2.result )
              # <-- action

            end

          when 3
            # at line 139:4: LT (op2= bool | op2= expression )
            __LT88__ = match( LT, TOKENS_FOLLOWING_LT_IN_boolOperand_790 )

            tree_for_LT88 = @adaptor.create_with_payload( __LT88__ )
            root_0 = @adaptor.become_root( tree_for_LT88, root_0 )

            # at line 139:8: (op2= bool | op2= expression )
            alt_18 = 2
            look_18_0 = @input.peek( 1 )

            if ( look_18_0.between?( TRUE, FALSE ) )
              alt_18 = 1
            elsif ( look_18_0.between?( ID, FLOAT ) || look_18_0 == LB || look_18_0.between?( PLUS, MINUS ) )
              alt_18 = 2
            else
              raise NoViableAlternative( "", 18, 0 )
            end
            case alt_18
            when 1
              # at line 139:10: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_797 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )
              # --> action
              return_value.result = ( op1.nil? ? nil : op1.result ) < ( op2.nil? ? nil : op2.result )
              # <-- action

            when 2
              # at line 140:7: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_809 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )
              # --> action
              return_value.result = ( op1.nil? ? nil : op1.result ) < ( op2.nil? ? nil : op2.result )
              # <-- action

            end

          when 4
            # at line 142:4: GT (op2= bool | op2= expression )
            __GT89__ = match( GT, TOKENS_FOLLOWING_GT_IN_boolOperand_823 )

            tree_for_GT89 = @adaptor.create_with_payload( __GT89__ )
            root_0 = @adaptor.become_root( tree_for_GT89, root_0 )

            # at line 142:8: (op2= bool | op2= expression )
            alt_19 = 2
            look_19_0 = @input.peek( 1 )

            if ( look_19_0.between?( TRUE, FALSE ) )
              alt_19 = 1
            elsif ( look_19_0.between?( ID, FLOAT ) || look_19_0 == LB || look_19_0.between?( PLUS, MINUS ) )
              alt_19 = 2
            else
              raise NoViableAlternative( "", 19, 0 )
            end
            case alt_19
            when 1
              # at line 142:10: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_830 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )
              # --> action
              return_value.result = ( op1.nil? ? nil : op1.result ) > ( op2.nil? ? nil : op2.result )
              # <-- action

            when 2
              # at line 143:8: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_843 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )
              # --> action
              return_value.result = ( op1.nil? ? nil : op1.result ) > ( op2.nil? ? nil : op2.result )
              # <-- action

            end

          when 5
            # at line 145:4: LE (op2= bool | op2= expression )
            __LE90__ = match( LE, TOKENS_FOLLOWING_LE_IN_boolOperand_857 )

            tree_for_LE90 = @adaptor.create_with_payload( __LE90__ )
            root_0 = @adaptor.become_root( tree_for_LE90, root_0 )

            # at line 145:8: (op2= bool | op2= expression )
            alt_20 = 2
            look_20_0 = @input.peek( 1 )

            if ( look_20_0.between?( TRUE, FALSE ) )
              alt_20 = 1
            elsif ( look_20_0.between?( ID, FLOAT ) || look_20_0 == LB || look_20_0.between?( PLUS, MINUS ) )
              alt_20 = 2
            else
              raise NoViableAlternative( "", 20, 0 )
            end
            case alt_20
            when 1
              # at line 145:10: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_864 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )
              # --> action
              return_value.result = ( op1.nil? ? nil : op1.result ) <= ( op2.nil? ? nil : op2.result )
              # <-- action

            when 2
              # at line 146:8: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_877 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )
              # --> action
              return_value.result = ( op1.nil? ? nil : op1.result ) <= ( op2.nil? ? nil : op2.result )
              # <-- action

            end

          when 6
            # at line 148:4: GE (op2= bool | op2= expression )
            __GE91__ = match( GE, TOKENS_FOLLOWING_GE_IN_boolOperand_891 )

            tree_for_GE91 = @adaptor.create_with_payload( __GE91__ )
            root_0 = @adaptor.become_root( tree_for_GE91, root_0 )

            # at line 148:8: (op2= bool | op2= expression )
            alt_21 = 2
            look_21_0 = @input.peek( 1 )

            if ( look_21_0.between?( TRUE, FALSE ) )
              alt_21 = 1
            elsif ( look_21_0.between?( ID, FLOAT ) || look_21_0 == LB || look_21_0.between?( PLUS, MINUS ) )
              alt_21 = 2
            else
              raise NoViableAlternative( "", 21, 0 )
            end
            case alt_21
            when 1
              # at line 148:10: op2= bool
              @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_898 )
              op2 = bool
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )
              # --> action
              return_value.result = ( op1.nil? ? nil : op1.result ) >= ( op2.nil? ? nil : op2.result )
              # <-- action

            when 2
              # at line 149:8: op2= expression
              @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_911 )
              op2 = expression
              @state.following.pop
              @adaptor.add_child( root_0, op2.tree )
              # --> action
              return_value.result = ( op1.nil? ? nil : op1.result ) >= ( op2.nil? ? nil : op2.result )
              # <-- action

            end

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
        # trace_out( __method__, 22 )

      end
      
      return return_value
    end

    ExpressionReturnValue = define_return_scope :result

    # 
    # parser rule expression
    # 
    # (in Giraffe.g)
    # 154:1: expression returns [result] : addOperand ( PLUS op= expression | MINUS op= expression )? ;
    # 
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS93__ = nil
      __MINUS94__ = nil
      op = nil
      addOperand92 = nil

      tree_for_PLUS93 = nil
      tree_for_MINUS94 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 155:4: addOperand ( PLUS op= expression | MINUS op= expression )?
        @state.following.push( TOKENS_FOLLOWING_addOperand_IN_expression_936 )
        addOperand92 = addOperand
        @state.following.pop
        @adaptor.add_child( root_0, addOperand92.tree )
        # --> action
        return_value.result = ( addOperand92.nil? ? nil : addOperand92.result )
        # <-- action
        # at line 156:3: ( PLUS op= expression | MINUS op= expression )?
        alt_24 = 3
        look_24_0 = @input.peek( 1 )

        if ( look_24_0 == PLUS )
          alt_24 = 1
        elsif ( look_24_0 == MINUS )
          alt_24 = 2
        end
        case alt_24
        when 1
          # at line 157:4: PLUS op= expression
          __PLUS93__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expression_947 )

          tree_for_PLUS93 = @adaptor.create_with_payload( __PLUS93__ )
          root_0 = @adaptor.become_root( tree_for_PLUS93, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_952 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result + ( op.nil? ? nil : op.result )
          # <-- action

        when 2
          # at line 158:5: MINUS op= expression
          __MINUS94__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expression_960 )

          tree_for_MINUS94 = @adaptor.create_with_payload( __MINUS94__ )
          root_0 = @adaptor.become_root( tree_for_MINUS94, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_965 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result - ( op.nil? ? nil : op.result )
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
        # trace_out( __method__, 23 )

      end
      
      return return_value
    end

    AddOperandReturnValue = define_return_scope :result

    # 
    # parser rule addOperand
    # 
    # (in Giraffe.g)
    # 162:1: addOperand returns [result] : mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )? ;
    # 
    def addOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = AddOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __MUL96__ = nil
      __DIV97__ = nil
      __MOD98__ = nil
      op = nil
      mulOperand95 = nil

      tree_for_MUL96 = nil
      tree_for_DIV97 = nil
      tree_for_MOD98 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 163:4: mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperand_987 )
        mulOperand95 = mulOperand
        @state.following.pop
        @adaptor.add_child( root_0, mulOperand95.tree )
        # --> action
        return_value.result = ( mulOperand95.nil? ? nil : mulOperand95.result )
        # <-- action
        # at line 164:3: ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        alt_25 = 4
        case look_25 = @input.peek( 1 )
        when MUL then alt_25 = 1
        when DIV then alt_25 = 2
        when MOD then alt_25 = 3
        end
        case alt_25
        when 1
          # at line 165:4: MUL op= addOperand
          __MUL96__ = match( MUL, TOKENS_FOLLOWING_MUL_IN_addOperand_998 )

          tree_for_MUL96 = @adaptor.create_with_payload( __MUL96__ )
          root_0 = @adaptor.become_root( tree_for_MUL96, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1003 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result * ( op.nil? ? nil : op.result )
          # <-- action

        when 2
          # at line 166:5: DIV op= addOperand
          __DIV97__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_addOperand_1011 )

          tree_for_DIV97 = @adaptor.create_with_payload( __DIV97__ )
          root_0 = @adaptor.become_root( tree_for_DIV97, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1016 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result / ( op.nil? ? nil : op.result )
          # <-- action

        when 3
          # at line 167:5: MOD op= addOperand
          __MOD98__ = match( MOD, TOKENS_FOLLOWING_MOD_IN_addOperand_1024 )

          tree_for_MOD98 = @adaptor.create_with_payload( __MOD98__ )
          root_0 = @adaptor.become_root( tree_for_MOD98, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_1029 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result % ( op.nil? ? nil : op.result )
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

    MulOperandReturnValue = define_return_scope :result

    # 
    # parser rule mulOperand
    # 
    # (in Giraffe.g)
    # 171:1: mulOperand returns [result] : ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest );
    # 
    def mulOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = MulOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS99__ = nil
      __MINUS101__ = nil
      mulOperandRest100 = nil
      mulOperandRest102 = nil
      mulOperandRest103 = nil

      tree_for_PLUS99 = nil
      tree_for_MINUS101 = nil

      begin
        # at line 172:2: ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest )
        alt_26 = 3
        case look_26 = @input.peek( 1 )
        when PLUS then alt_26 = 1
        when MINUS then alt_26 = 2
        when ID, INT, FLOAT, LB then alt_26 = 3
        else
          raise NoViableAlternative( "", 26, 0 )
        end
        case alt_26
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 172:4: PLUS mulOperandRest
          __PLUS99__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_mulOperand_1051 )

          tree_for_PLUS99 = @adaptor.create_with_payload( __PLUS99__ )
          @adaptor.add_child( root_0, tree_for_PLUS99 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1053 )
          mulOperandRest100 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest100.tree )
          # --> action
          return_value.result = ( mulOperandRest100.nil? ? nil : mulOperandRest100.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 173:4: MINUS mulOperandRest
          __MINUS101__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_mulOperand_1060 )

          tree_for_MINUS101 = @adaptor.create_with_payload( __MINUS101__ )
          @adaptor.add_child( root_0, tree_for_MINUS101 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1062 )
          mulOperandRest102 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest102.tree )
          # --> action
          return_value.result = -( mulOperandRest102.nil? ? nil : mulOperandRest102.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 174:4: mulOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1069 )
          mulOperandRest103 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest103.tree )
          # --> action
          return_value.result = ( mulOperandRest103.nil? ? nil : mulOperandRest103.result )
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
        # trace_out( __method__, 25 )

      end
      
      return return_value
    end

    MulOperandRestReturnValue = define_return_scope :result

    # 
    # parser rule mulOperandRest
    # 
    # (in Giraffe.g)
    # 177:1: mulOperandRest returns [result] : ( ID | LB expression RB | INT | FLOAT | call );
    # 
    def mulOperandRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = MulOperandRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID104__ = nil
      __LB105__ = nil
      __RB107__ = nil
      __INT108__ = nil
      __FLOAT109__ = nil
      expression106 = nil
      call110 = nil

      tree_for_ID104 = nil
      tree_for_LB105 = nil
      tree_for_RB107 = nil
      tree_for_INT108 = nil
      tree_for_FLOAT109 = nil

      begin
        # at line 178:2: ( ID | LB expression RB | INT | FLOAT | call )
        alt_27 = 5
        case look_27 = @input.peek( 1 )
        when ID then look_27_1 = @input.peek( 2 )

        if ( look_27_1 == LB )
          alt_27 = 5
        elsif ( look_27_1 == EOF || look_27_1.between?( LCB, SEMICOLON ) || look_27_1 == COMMA || look_27_1.between?( RB, GE ) || look_27_1.between?( PLUS, MOD ) || look_27_1.between?( T__49, T__50 ) )
          alt_27 = 1
        else
          raise NoViableAlternative( "", 27, 1 )
        end
        when LB then alt_27 = 2
        when INT then alt_27 = 3
        when FLOAT then alt_27 = 4
        else
          raise NoViableAlternative( "", 27, 0 )
        end
        case alt_27
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 178:4: ID
          __ID104__ = match( ID, TOKENS_FOLLOWING_ID_IN_mulOperandRest_1086 )

          tree_for_ID104 = @adaptor.create_with_payload( __ID104__ )
          @adaptor.add_child( root_0, tree_for_ID104 )

          # --> action
          return_value.result = @@progEnv.varLookup(__ID104__.text)
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 179:4: LB expression RB
          __LB105__ = match( LB, TOKENS_FOLLOWING_LB_IN_mulOperandRest_1093 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_mulOperandRest_1096 )
          expression106 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression106.tree )
          __RB107__ = match( RB, TOKENS_FOLLOWING_RB_IN_mulOperandRest_1098 )
          # --> action
          return_value.result = ( expression106.nil? ? nil : expression106.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 180:4: INT
          __INT108__ = match( INT, TOKENS_FOLLOWING_INT_IN_mulOperandRest_1106 )

          tree_for_INT108 = @adaptor.create_with_payload( __INT108__ )
          @adaptor.add_child( root_0, tree_for_INT108 )

          # --> action
          return_value.result = __INT108__.text.to_i
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 181:4: FLOAT
          __FLOAT109__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_mulOperandRest_1113 )

          tree_for_FLOAT109 = @adaptor.create_with_payload( __FLOAT109__ )
          @adaptor.add_child( root_0, tree_for_FLOAT109 )

          # --> action
          return_value.result = __FLOAT109__.text.to_f
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 182:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_mulOperandRest_1120 )
          call110 = call
          @state.following.pop
          @adaptor.add_child( root_0, call110.tree )
          # --> action
          puts "CALL-LOOKUP"
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

    ValueReturnValue = define_return_scope :result

    # 
    # parser rule value
    # 
    # (in Giraffe.g)
    # 184:1: value returns [result] : ( expression | STRING | CHAR );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __STRING112__ = nil
      __CHAR113__ = nil
      expression111 = nil

      tree_for_STRING112 = nil
      tree_for_CHAR113 = nil

      begin
        # at line 185:2: ( expression | STRING | CHAR )
        alt_28 = 3
        case look_28 = @input.peek( 1 )
        when ID, INT, FLOAT, LB, PLUS, MINUS then alt_28 = 1
        when STRING then alt_28 = 2
        when CHAR then alt_28 = 3
        else
          raise NoViableAlternative( "", 28, 0 )
        end
        case alt_28
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 185:5: expression
          @state.following.push( TOKENS_FOLLOWING_expression_IN_value_1136 )
          expression111 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression111.tree )
          # --> action
          return_value.result = ( expression111.nil? ? nil : expression111.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 186:4: STRING
          __STRING112__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_value_1143 )

          tree_for_STRING112 = @adaptor.create_with_payload( __STRING112__ )
          @adaptor.add_child( root_0, tree_for_STRING112 )

          # --> action
          return_value.result = __STRING112__.text
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 187:4: CHAR
          __CHAR113__ = match( CHAR, TOKENS_FOLLOWING_CHAR_IN_value_1150 )

          tree_for_CHAR113 = @adaptor.create_with_payload( __CHAR113__ )
          @adaptor.add_child( root_0, tree_for_CHAR113 )

          # --> action
          return_value.result = __CHAR113__.text
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

    AssignmentReturnValue = define_return_scope 

    # 
    # parser rule assignment
    # 
    # (in Giraffe.g)
    # 190:1: assignment : ID ASSIGN value ;
    # 
    def assignment
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )
      return_value = AssignmentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID114__ = nil
      __ASSIGN115__ = nil
      value116 = nil

      tree_for_ID114 = nil
      tree_for_ASSIGN115 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 191:4: ID ASSIGN value
        __ID114__ = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_1164 )

        tree_for_ID114 = @adaptor.create_with_payload( __ID114__ )
        @adaptor.add_child( root_0, tree_for_ID114 )

        __ASSIGN115__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_1166 )

        tree_for_ASSIGN115 = @adaptor.create_with_payload( __ASSIGN115__ )
        root_0 = @adaptor.become_root( tree_for_ASSIGN115, root_0 )

        @state.following.push( TOKENS_FOLLOWING_value_IN_assignment_1169 )
        value116 = value
        @state.following.pop
        @adaptor.add_child( root_0, value116.tree )
        # --> action
         @@progEnv.varSet(__ID114__.text,( value116.nil? ? nil : value116.result )) 
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
        # trace_out( __method__, 28 )

      end
      
      return return_value
    end

    BoolReturnValue = define_return_scope :result

    # 
    # parser rule bool
    # 
    # (in Giraffe.g)
    # 193:1: bool returns [result] : ( TRUE | FALSE );
    # 
    def bool
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )
      return_value = BoolReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __TRUE117__ = nil
      __FALSE118__ = nil

      tree_for_TRUE117 = nil
      tree_for_FALSE118 = nil

      begin
        # at line 194:2: ( TRUE | FALSE )
        alt_29 = 2
        look_29_0 = @input.peek( 1 )

        if ( look_29_0 == TRUE )
          alt_29 = 1
        elsif ( look_29_0 == FALSE )
          alt_29 = 2
        else
          raise NoViableAlternative( "", 29, 0 )
        end
        case alt_29
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 194:4: TRUE
          __TRUE117__ = match( TRUE, TOKENS_FOLLOWING_TRUE_IN_bool_1187 )

          tree_for_TRUE117 = @adaptor.create_with_payload( __TRUE117__ )
          @adaptor.add_child( root_0, tree_for_TRUE117 )

          # --> action
          return_value.result = true
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 195:5: FALSE
          __FALSE118__ = match( FALSE, TOKENS_FOLLOWING_FALSE_IN_bool_1195 )

          tree_for_FALSE118 = @adaptor.create_with_payload( __FALSE118__ )
          @adaptor.add_child( root_0, tree_for_FALSE118 )

          # --> action
          return_value.result = true
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



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA5 < ANTLR3::DFA
      EOT = unpack( 13, -1 )
      EOF = unpack( 1, 9, 12, -1 )
      MIN = unpack( 2, 4, 11, -1 )
      MAX = unpack( 1, 50, 1, 39, 11, -1 )
      ACCEPT = unpack( 2, -1, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 
                       1, 11, 1, 1, 1, 2, 1, 3 )
      SPECIAL = unpack( 13, -1 )
      TRANSITION = [
        unpack( 1, 2, 3, 9, 1, 7, 1, 1, 3, -1, 1, 8, 1, 4, 3, -1, 1, 5, 
                1, 6, 1, 3, 28, -1, 2, 9 ),
        unpack( 1, 12, 4, -1, 1, 12, 12, -1, 1, 11, 16, -1, 1, 10 ),
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
          32:1: instruction : ( assignment | call | func | env | forCycle | ifInstruction | whileCycle | doCycle | printInstruction | printlInstruction | );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa5 = DFA5.new( self, 5 )

    end
    TOKENS_FOLLOWING_block_IN_program_44 = Set[ 1 ]
    TOKENS_FOLLOWING_LCB_IN_env_58 = Set[ 4, 6, 7, 8, 9, 13, 14, 18, 19, 20, 49, 50 ]
    TOKENS_FOLLOWING_block_IN_env_66 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_env_71 = Set[ 1 ]
    TOKENS_FOLLOWING_instruction_IN_block_86 = Set[ 6, 7, 49, 50 ]
    TOKENS_FOLLOWING_instructionRest_IN_block_88 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_instructionRest_101 = Set[ 49, 50 ]
    TOKENS_FOLLOWING_T__49_IN_instructionRest_105 = Set[ 50 ]
    TOKENS_FOLLOWING_T__50_IN_instructionRest_109 = Set[ 4, 6, 7, 8, 9, 13, 14, 18, 19, 20, 49, 50 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_115 = Set[ 4, 6, 7, 8, 9, 13, 14, 18, 19, 20, 49, 50 ]
    TOKENS_FOLLOWING_block_IN_instructionRest_119 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_IN_instruction_132 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_instruction_137 = Set[ 1 ]
    TOKENS_FOLLOWING_func_IN_instruction_142 = Set[ 1 ]
    TOKENS_FOLLOWING_env_IN_instruction_147 = Set[ 1 ]
    TOKENS_FOLLOWING_forCycle_IN_instruction_152 = Set[ 1 ]
    TOKENS_FOLLOWING_ifInstruction_IN_instruction_157 = Set[ 1 ]
    TOKENS_FOLLOWING_whileCycle_IN_instruction_162 = Set[ 1 ]
    TOKENS_FOLLOWING_doCycle_IN_instruction_167 = Set[ 1 ]
    TOKENS_FOLLOWING_printInstruction_IN_instruction_172 = Set[ 1 ]
    TOKENS_FOLLOWING_printlInstruction_IN_instruction_177 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINT_IN_printInstruction_191 = Set[ 9, 10, 11, 12 ]
    TOKENS_FOLLOWING_ID_IN_printInstruction_197 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_printInstruction_207 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_printInstruction_217 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_printInstruction_227 = Set[ 1 ]
    TOKENS_FOLLOWING_PRINTL_IN_printlInstruction_251 = Set[ 9, 10, 11, 12 ]
    TOKENS_FOLLOWING_ID_IN_printlInstruction_256 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_printlInstruction_266 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_printlInstruction_276 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_printlInstruction_286 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_ifInstruction_309 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_ifInstruction_312 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_ifInstruction_314 = Set[ 15, 16, 17 ]
    TOKENS_FOLLOWING_ifRest_IN_ifInstruction_316 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_ifRest_336 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_ifRest_338 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_ifRest_343 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_ifRest_351 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_ifRest_353 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_whileCycle_367 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_whileCycle_369 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_whileCycle_371 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_doCycle_379 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_doCycle_381 = Set[ 18 ]
    TOKENS_FOLLOWING_WHILE_IN_doCycle_383 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_doCycle_385 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_forCycle_394 = Set[ 9 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_396 = Set[ 21 ]
    TOKENS_FOLLOWING_COMMA_IN_forCycle_398 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_forCycle_401 = Set[ 21 ]
    TOKENS_FOLLOWING_COMMA_IN_forCycle_403 = Set[ 9 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_406 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_forCycle_408 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_func_418 = Set[ 4, 9 ]
    TOKENS_FOLLOWING_params_IN_func_421 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_func_424 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_params_432 = Set[ 21 ]
    TOKENS_FOLLOWING_paramRest_IN_params_434 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_paramRest_443 = Set[ 9 ]
    TOKENS_FOLLOWING_params_IN_paramRest_446 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_call_461 = Set[ 22 ]
    TOKENS_FOLLOWING_LB_IN_call_464 = Set[ 9, 10, 11, 22, 23, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_args_IN_call_467 = Set[ 23 ]
    TOKENS_FOLLOWING_RB_IN_call_470 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_args_482 = Set[ 21 ]
    TOKENS_FOLLOWING_argsRest_IN_args_484 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsRest_495 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_args_IN_argsRest_498 = Set[ 1 ]
    TOKENS_FOLLOWING_orOperand_IN_condition_517 = Set[ 1, 24 ]
    TOKENS_FOLLOWING_OR_IN_condition_524 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_condition_529 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperand_IN_orOperand_550 = Set[ 1, 25 ]
    TOKENS_FOLLOWING_AND_IN_orOperand_557 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_orOperand_IN_orOperand_562 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperand_IN_andOperand_581 = Set[ 1, 26, 27, 28, 29, 30, 31 ]
    TOKENS_FOLLOWING_EQ_IN_andOperand_590 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_595 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_andOperand_604 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_609 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_andOperand_618 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_623 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_andOperand_632 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_637 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_andOperand_646 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_651 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_andOperand_660 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_665 = Set[ 1 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_692 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_boolOperand_699 = Set[ 22 ]
    TOKENS_FOLLOWING_LB_IN_boolOperand_701 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_condition_IN_boolOperand_704 = Set[ 23 ]
    TOKENS_FOLLOWING_RB_IN_boolOperand_706 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_716 = Set[ 26, 27, 28, 29, 30, 31 ]
    TOKENS_FOLLOWING_EQ_IN_boolOperand_723 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_730 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_742 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_boolOperand_756 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_763 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_776 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_boolOperand_790 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_797 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_809 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_boolOperand_823 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_830 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_843 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_boolOperand_857 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_864 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_877 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_boolOperand_891 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_898 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_911 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperand_IN_expression_936 = Set[ 1, 33, 34 ]
    TOKENS_FOLLOWING_PLUS_IN_expression_947 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_expression_IN_expression_952 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expression_960 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_expression_IN_expression_965 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperand_987 = Set[ 1, 35, 36, 37 ]
    TOKENS_FOLLOWING_MUL_IN_addOperand_998 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1003 = Set[ 1 ]
    TOKENS_FOLLOWING_DIV_IN_addOperand_1011 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1016 = Set[ 1 ]
    TOKENS_FOLLOWING_MOD_IN_addOperand_1024 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_1029 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_mulOperand_1051 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1053 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_mulOperand_1060 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1062 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_1069 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_mulOperandRest_1086 = Set[ 1 ]
    TOKENS_FOLLOWING_LB_IN_mulOperandRest_1093 = Set[ 9, 10, 11, 22, 32, 33, 34, 40, 41 ]
    TOKENS_FOLLOWING_expression_IN_mulOperandRest_1096 = Set[ 23 ]
    TOKENS_FOLLOWING_RB_IN_mulOperandRest_1098 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_mulOperandRest_1106 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_mulOperandRest_1113 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_mulOperandRest_1120 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_value_1136 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_value_1143 = Set[ 1 ]
    TOKENS_FOLLOWING_CHAR_IN_value_1150 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_1164 = Set[ 39 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_1166 = Set[ 9, 10, 11, 12, 22, 32, 33, 34, 38, 40, 41 ]
    TOKENS_FOLLOWING_value_IN_assignment_1169 = Set[ 1 ]
    TOKENS_FOLLOWING_TRUE_IN_bool_1187 = Set[ 1 ]
    TOKENS_FOLLOWING_FALSE_IN_bool_1195 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end


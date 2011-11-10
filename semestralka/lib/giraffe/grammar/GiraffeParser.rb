#!/usr/bin/env ruby
#
# Giraffe.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: Giraffe.g
# Generated at: 2011-11-11 00:53:01
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
    define_tokens( :LT => 23, :EXPONENT => 40, :WHILE => 12, :RB => 18, 
                   :MOD => 32, :OCTAL_ESC => 45, :CHAR => 36, :FOR => 14, 
                   :DO => 13, :FLOAT => 34, :NOT => 27, :ID => 16, :RCB => 5, 
                   :AND => 20, :EOF => -1, :IF => 8, :ESC_SEQ => 42, :COMMA => 15, 
                   :LCB => 4, :PLUS => 28, :EQ => 21, :COMMENT => 6, :NE => 22, 
                   :GE => 26, :T__47 => 47, :T__48 => 48, :UNICODE_ESC => 44, 
                   :ELSE => 9, :HEX_DIGIT => 43, :SEMICOLON => 7, :INT => 33, 
                   :MINUS => 29, :MUL => 30, :TRUE => 38, :ELSEIF => 10, 
                   :COLON => 46, :ELIF => 11, :WS => 41, :OR => 19, :ASSIGN => 37, 
                   :GT => 24, :LB => 17, :DIV => 31, :FALSE => 39, :LE => 25, 
                   :STRING => 35 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "LCB", "RCB", "COMMENT", "SEMICOLON", "IF", "ELSE", 
                    "ELSEIF", "ELIF", "WHILE", "DO", "FOR", "COMMA", "ID", 
                    "LB", "RB", "OR", "AND", "EQ", "NE", "LT", "GT", "LE", 
                    "GE", "NOT", "PLUS", "MINUS", "MUL", "DIV", "MOD", "INT", 
                    "FLOAT", "STRING", "CHAR", "ASSIGN", "TRUE", "FALSE", 
                    "EXPONENT", "WS", "ESC_SEQ", "HEX_DIGIT", "UNICODE_ESC", 
                    "OCTAL_ESC", "COLON", "'\\r'", "'\\n'" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = Giraffe
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :program, :env, :block, :instructionRest, :instruction, 
                     :ifInstruction, :ifRest, :whileCycle, :doCycle, :forCycle, 
                     :func, :params, :paramRest, :call, :args, :argsRest, 
                     :condition, :orOperand, :andOperand, :boolOperand, 
                     :expression, :addOperand, :mulOperand, :mulOperandRest, 
                     :value, :assignment, :bool ].freeze


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

    EnvReturnValue = define_return_scope 

    # 
    # parser rule env
    # 
    # (in Giraffe.g)
    # 19:1: env : LCB block RCB ;
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
        __LCB2__ = match( LCB, TOKENS_FOLLOWING_LCB_IN_env_54 )
        # --> action
         @@progEnv.raise 
        # <-- action
        @state.following.push( TOKENS_FOLLOWING_block_IN_env_62 )
        block3 = block
        @state.following.pop
        @adaptor.add_child( root_0, block3.tree )
        __RCB4__ = match( RCB, TOKENS_FOLLOWING_RCB_IN_env_67 )
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
        @state.following.push( TOKENS_FOLLOWING_instruction_IN_block_81 )
        instruction5 = instruction
        @state.following.pop
        @adaptor.add_child( root_0, instruction5.tree )
        @state.following.push( TOKENS_FOLLOWING_instructionRest_IN_block_83 )
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

        if ( look_4_0.between?( COMMENT, SEMICOLON ) || look_4_0.between?( T__47, T__48 ) )
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

          if ( look_3_0 == COMMENT || look_3_0.between?( T__47, T__48 ) )
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
              __COMMENT7__ = match( COMMENT, TOKENS_FOLLOWING_COMMENT_IN_instructionRest_96 )

            end
            # at line 29:22: ( '\\r' )?
            alt_2 = 2
            look_2_0 = @input.peek( 1 )

            if ( look_2_0 == T__47 )
              alt_2 = 1
            end
            case alt_2
            when 1
              # at line 29:22: '\\r'
              char_literal8 = match( T__47, TOKENS_FOLLOWING_T__47_IN_instructionRest_100 )

            end
            char_literal9 = match( T__48, TOKENS_FOLLOWING_T__48_IN_instructionRest_104 )


          when 2
            # at line 29:34: SEMICOLON
            __SEMICOLON10__ = match( SEMICOLON, TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_110 )

          end
          @state.following.push( TOKENS_FOLLOWING_block_IN_instructionRest_114 )
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
    # 32:1: instruction : ( assignment | call | func | env | forCycle | ifInstruction | whileCycle | doCycle | );
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


      begin
        # at line 33:2: ( assignment | call | func | env | forCycle | ifInstruction | whileCycle | doCycle | )
        alt_5 = 9
        alt_5 = @dfa5.predict( @input )
        case alt_5
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 33:4: assignment
          @state.following.push( TOKENS_FOLLOWING_assignment_IN_instruction_127 )
          assignment12 = assignment
          @state.following.pop
          @adaptor.add_child( root_0, assignment12.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 34:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_instruction_132 )
          call13 = call
          @state.following.pop
          @adaptor.add_child( root_0, call13.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 35:4: func
          @state.following.push( TOKENS_FOLLOWING_func_IN_instruction_137 )
          func14 = func
          @state.following.pop
          @adaptor.add_child( root_0, func14.tree )

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 36:4: env
          @state.following.push( TOKENS_FOLLOWING_env_IN_instruction_142 )
          env15 = env
          @state.following.pop
          @adaptor.add_child( root_0, env15.tree )

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 37:4: forCycle
          @state.following.push( TOKENS_FOLLOWING_forCycle_IN_instruction_147 )
          forCycle16 = forCycle
          @state.following.pop
          @adaptor.add_child( root_0, forCycle16.tree )

        when 6
          root_0 = @adaptor.create_flat_list


          # at line 38:4: ifInstruction
          @state.following.push( TOKENS_FOLLOWING_ifInstruction_IN_instruction_152 )
          ifInstruction17 = ifInstruction
          @state.following.pop
          @adaptor.add_child( root_0, ifInstruction17.tree )

        when 7
          root_0 = @adaptor.create_flat_list


          # at line 39:4: whileCycle
          @state.following.push( TOKENS_FOLLOWING_whileCycle_IN_instruction_157 )
          whileCycle18 = whileCycle
          @state.following.pop
          @adaptor.add_child( root_0, whileCycle18.tree )

        when 8
          root_0 = @adaptor.create_flat_list


          # at line 40:4: doCycle
          @state.following.push( TOKENS_FOLLOWING_doCycle_IN_instruction_162 )
          doCycle19 = doCycle
          @state.following.pop
          @adaptor.add_child( root_0, doCycle19.tree )

        when 9
          root_0 = @adaptor.create_flat_list


          # at line 41:4: 

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

    IfInstructionReturnValue = define_return_scope 

    # 
    # parser rule ifInstruction
    # 
    # (in Giraffe.g)
    # 43:1: ifInstruction : IF condition env ifRest ;
    # 
    def ifInstruction
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      return_value = IfInstructionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __IF20__ = nil
      condition21 = nil
      env22 = nil
      ifRest23 = nil

      tree_for_IF20 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 44:4: IF condition env ifRest
        __IF20__ = match( IF, TOKENS_FOLLOWING_IF_IN_ifInstruction_177 )

        tree_for_IF20 = @adaptor.create_with_payload( __IF20__ )
        root_0 = @adaptor.become_root( tree_for_IF20, root_0 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_ifInstruction_180 )
        condition21 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition21.tree )
        @state.following.push( TOKENS_FOLLOWING_env_IN_ifInstruction_182 )
        env22 = env
        @state.following.pop
        @adaptor.add_child( root_0, env22.tree )
        @state.following.push( TOKENS_FOLLOWING_ifRest_IN_ifInstruction_184 )
        ifRest23 = ifRest
        @state.following.pop
        @adaptor.add_child( root_0, ifRest23.tree )
        # --> action
         if ( condition21.nil? ? nil : condition21.result )
        			puts "alt\#1"
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
        # trace_out( __method__, 6 )

      end
      
      return return_value
    end

    IfRestReturnValue = define_return_scope 

    # 
    # parser rule ifRest
    # 
    # (in Giraffe.g)
    # 51:1: ifRest : ( ELSE env | ( ELSEIF | ELIF ) condition env | );
    # 
    def ifRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )
      return_value = IfRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ELSE24__ = nil
      set26 = nil
      env25 = nil
      condition27 = nil
      env28 = nil

      tree_for_ELSE24 = nil
      tree_for_set26 = nil

      begin
        # at line 51:8: ( ELSE env | ( ELSEIF | ELIF ) condition env | )
        alt_6 = 3
        case look_6 = @input.peek( 1 )
        when ELSE then alt_6 = 1
        when ELSEIF, ELIF then alt_6 = 2
        when EOF, RCB, COMMENT, SEMICOLON, T__47, T__48 then alt_6 = 3
        else
          raise NoViableAlternative( "", 6, 0 )
        end
        case alt_6
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 51:10: ELSE env
          __ELSE24__ = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_ifRest_199 )

          tree_for_ELSE24 = @adaptor.create_with_payload( __ELSE24__ )
          @adaptor.add_child( root_0, tree_for_ELSE24 )

          @state.following.push( TOKENS_FOLLOWING_env_IN_ifRest_201 )
          env25 = env
          @state.following.pop
          @adaptor.add_child( root_0, env25.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 52:4: ( ELSEIF | ELIF ) condition env
          set26 = @input.look
          if @input.peek( 1 ).between?( ELSEIF, ELIF )
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set26 ) )
            @state.error_recovery = false
          else
            mse = MismatchedSet( nil )
            raise mse
          end


          @state.following.push( TOKENS_FOLLOWING_condition_IN_ifRest_214 )
          condition27 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition27.tree )
          @state.following.push( TOKENS_FOLLOWING_env_IN_ifRest_216 )
          env28 = env
          @state.following.pop
          @adaptor.add_child( root_0, env28.tree )

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 53:4: 

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

    WhileCycleReturnValue = define_return_scope 

    # 
    # parser rule whileCycle
    # 
    # (in Giraffe.g)
    # 55:1: whileCycle : WHILE condition env ;
    # 
    def whileCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )
      return_value = WhileCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __WHILE29__ = nil
      condition30 = nil
      env31 = nil

      tree_for_WHILE29 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 56:5: WHILE condition env
        __WHILE29__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_whileCycle_230 )

        tree_for_WHILE29 = @adaptor.create_with_payload( __WHILE29__ )
        @adaptor.add_child( root_0, tree_for_WHILE29 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_whileCycle_232 )
        condition30 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition30.tree )
        @state.following.push( TOKENS_FOLLOWING_env_IN_whileCycle_234 )
        env31 = env
        @state.following.pop
        @adaptor.add_child( root_0, env31.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    DoCycleReturnValue = define_return_scope 

    # 
    # parser rule doCycle
    # 
    # (in Giraffe.g)
    # 58:1: doCycle : DO env WHILE condition ;
    # 
    def doCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )
      return_value = DoCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __DO32__ = nil
      __WHILE34__ = nil
      env33 = nil
      condition35 = nil

      tree_for_DO32 = nil
      tree_for_WHILE34 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 58:11: DO env WHILE condition
        __DO32__ = match( DO, TOKENS_FOLLOWING_DO_IN_doCycle_242 )

        tree_for_DO32 = @adaptor.create_with_payload( __DO32__ )
        @adaptor.add_child( root_0, tree_for_DO32 )

        @state.following.push( TOKENS_FOLLOWING_env_IN_doCycle_244 )
        env33 = env
        @state.following.pop
        @adaptor.add_child( root_0, env33.tree )
        __WHILE34__ = match( WHILE, TOKENS_FOLLOWING_WHILE_IN_doCycle_246 )

        tree_for_WHILE34 = @adaptor.create_with_payload( __WHILE34__ )
        @adaptor.add_child( root_0, tree_for_WHILE34 )

        @state.following.push( TOKENS_FOLLOWING_condition_IN_doCycle_248 )
        condition35 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition35.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    ForCycleReturnValue = define_return_scope 

    # 
    # parser rule forCycle
    # 
    # (in Giraffe.g)
    # 60:1: forCycle : FOR assignment COMMA condition COMMA assignment env ;
    # 
    def forCycle
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )
      return_value = ForCycleReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __FOR36__ = nil
      __COMMA38__ = nil
      __COMMA40__ = nil
      assignment37 = nil
      condition39 = nil
      assignment41 = nil
      env42 = nil

      tree_for_FOR36 = nil
      tree_for_COMMA38 = nil
      tree_for_COMMA40 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 61:4: FOR assignment COMMA condition COMMA assignment env
        __FOR36__ = match( FOR, TOKENS_FOLLOWING_FOR_IN_forCycle_257 )

        tree_for_FOR36 = @adaptor.create_with_payload( __FOR36__ )
        @adaptor.add_child( root_0, tree_for_FOR36 )

        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_259 )
        assignment37 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, assignment37.tree )
        __COMMA38__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_forCycle_261 )
        @state.following.push( TOKENS_FOLLOWING_condition_IN_forCycle_264 )
        condition39 = condition
        @state.following.pop
        @adaptor.add_child( root_0, condition39.tree )
        __COMMA40__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_forCycle_266 )
        @state.following.push( TOKENS_FOLLOWING_assignment_IN_forCycle_269 )
        assignment41 = assignment
        @state.following.pop
        @adaptor.add_child( root_0, assignment41.tree )
        @state.following.push( TOKENS_FOLLOWING_env_IN_forCycle_271 )
        env42 = env
        @state.following.pop
        @adaptor.add_child( root_0, env42.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    FuncReturnValue = define_return_scope 

    # 
    # parser rule func
    # 
    # (in Giraffe.g)
    # 63:1: func : ID ( params )? env ;
    # 
    def func
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )
      return_value = FuncReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID43__ = nil
      params44 = nil
      env45 = nil

      tree_for_ID43 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 63:9: ID ( params )? env
        __ID43__ = match( ID, TOKENS_FOLLOWING_ID_IN_func_281 )

        tree_for_ID43 = @adaptor.create_with_payload( __ID43__ )
        root_0 = @adaptor.become_root( tree_for_ID43, root_0 )

        # at line 63:13: ( params )?
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == ID )
          alt_7 = 1
        end
        case alt_7
        when 1
          # at line 63:13: params
          @state.following.push( TOKENS_FOLLOWING_params_IN_func_284 )
          params44 = params
          @state.following.pop
          @adaptor.add_child( root_0, params44.tree )

        end
        @state.following.push( TOKENS_FOLLOWING_env_IN_func_287 )
        env45 = env
        @state.following.pop
        @adaptor.add_child( root_0, env45.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    ParamsReturnValue = define_return_scope 

    # 
    # parser rule params
    # 
    # (in Giraffe.g)
    # 65:1: params : ID paramRest ;
    # 
    def params
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )
      return_value = ParamsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID46__ = nil
      paramRest47 = nil

      tree_for_ID46 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 65:10: ID paramRest
        __ID46__ = match( ID, TOKENS_FOLLOWING_ID_IN_params_295 )

        tree_for_ID46 = @adaptor.create_with_payload( __ID46__ )
        @adaptor.add_child( root_0, tree_for_ID46 )

        @state.following.push( TOKENS_FOLLOWING_paramRest_IN_params_297 )
        paramRest47 = paramRest
        @state.following.pop
        @adaptor.add_child( root_0, paramRest47.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    ParamRestReturnValue = define_return_scope 

    # 
    # parser rule paramRest
    # 
    # (in Giraffe.g)
    # 67:1: paramRest : ( COMMA params | );
    # 
    def paramRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )
      return_value = ParamRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA48__ = nil
      params49 = nil

      tree_for_COMMA48 = nil

      begin
        # at line 68:2: ( COMMA params | )
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == COMMA )
          alt_8 = 1
        elsif ( look_8_0 == LCB )
          alt_8 = 2
        else
          raise NoViableAlternative( "", 8, 0 )
        end
        case alt_8
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 68:4: COMMA params
          __COMMA48__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_paramRest_306 )
          @state.following.push( TOKENS_FOLLOWING_params_IN_paramRest_309 )
          params49 = params
          @state.following.pop
          @adaptor.add_child( root_0, params49.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 69:4: 

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
        # trace_out( __method__, 13 )

      end
      
      return return_value
    end

    CallReturnValue = define_return_scope 

    # 
    # parser rule call
    # 
    # (in Giraffe.g)
    # 71:1: call : ID LB ( args )? RB ;
    # 
    def call
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )
      return_value = CallReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID50__ = nil
      __LB51__ = nil
      __RB53__ = nil
      args52 = nil

      tree_for_ID50 = nil
      tree_for_LB51 = nil
      tree_for_RB53 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 72:4: ID LB ( args )? RB
        __ID50__ = match( ID, TOKENS_FOLLOWING_ID_IN_call_324 )

        tree_for_ID50 = @adaptor.create_with_payload( __ID50__ )
        root_0 = @adaptor.become_root( tree_for_ID50, root_0 )

        __LB51__ = match( LB, TOKENS_FOLLOWING_LB_IN_call_327 )
        # at line 72:12: ( args )?
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0.between?( ID, LB ) || look_9_0.between?( PLUS, MINUS ) || look_9_0.between?( INT, FLOAT ) )
          alt_9 = 1
        end
        case alt_9
        when 1
          # at line 72:12: args
          @state.following.push( TOKENS_FOLLOWING_args_IN_call_330 )
          args52 = args
          @state.following.pop
          @adaptor.add_child( root_0, args52.tree )

        end
        __RB53__ = match( RB, TOKENS_FOLLOWING_RB_IN_call_333 )
        # - - - - - - - rule clean up - - - - - - - -
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

    ArgsReturnValue = define_return_scope 

    # 
    # parser rule args
    # 
    # (in Giraffe.g)
    # 74:1: args : expression argsRest ;
    # 
    def args
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )
      return_value = ArgsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      expression54 = nil
      argsRest55 = nil


      begin
        root_0 = @adaptor.create_flat_list


        # at line 75:4: expression argsRest
        @state.following.push( TOKENS_FOLLOWING_expression_IN_args_345 )
        expression54 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression54.tree )
        @state.following.push( TOKENS_FOLLOWING_argsRest_IN_args_347 )
        argsRest55 = argsRest
        @state.following.pop
        @adaptor.add_child( root_0, argsRest55.tree )
        # - - - - - - - rule clean up - - - - - - - -
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

    ArgsRestReturnValue = define_return_scope 

    # 
    # parser rule argsRest
    # 
    # (in Giraffe.g)
    # 77:1: argsRest : ( COMMA args | );
    # 
    def argsRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )
      return_value = ArgsRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __COMMA56__ = nil
      args57 = nil

      tree_for_COMMA56 = nil

      begin
        # at line 78:2: ( COMMA args | )
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0 == COMMA )
          alt_10 = 1
        elsif ( look_10_0 == RB )
          alt_10 = 2
        else
          raise NoViableAlternative( "", 10, 0 )
        end
        case alt_10
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 78:4: COMMA args
          __COMMA56__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argsRest_358 )
          @state.following.push( TOKENS_FOLLOWING_args_IN_argsRest_361 )
          args57 = args
          @state.following.pop
          @adaptor.add_child( root_0, args57.tree )

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 79:4: 

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

    ConditionReturnValue = define_return_scope :result

    # 
    # parser rule condition
    # 
    # (in Giraffe.g)
    # 83:1: condition returns [result] : orOperand ( OR op= condition )? ;
    # 
    def condition
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )
      return_value = ConditionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __OR59__ = nil
      op = nil
      orOperand58 = nil

      tree_for_OR59 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 84:4: orOperand ( OR op= condition )?
        @state.following.push( TOKENS_FOLLOWING_orOperand_IN_condition_380 )
        orOperand58 = orOperand
        @state.following.pop
        @adaptor.add_child( root_0, orOperand58.tree )
        # --> action
        return_value.result = ( orOperand58.nil? ? nil : orOperand58.result )
        # <-- action
        # at line 85:3: ( OR op= condition )?
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == OR )
          alt_11 = 1
        end
        case alt_11
        when 1
          # at line 85:4: OR op= condition
          __OR59__ = match( OR, TOKENS_FOLLOWING_OR_IN_condition_387 )

          tree_for_OR59 = @adaptor.create_with_payload( __OR59__ )
          root_0 = @adaptor.become_root( tree_for_OR59, root_0 )

          @state.following.push( TOKENS_FOLLOWING_condition_IN_condition_392 )
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
        # trace_out( __method__, 17 )

      end
      
      return return_value
    end

    OrOperandReturnValue = define_return_scope :result

    # 
    # parser rule orOperand
    # 
    # (in Giraffe.g)
    # 90:1: orOperand returns [result] : andOperand ( AND op= orOperand )? ;
    # 
    def orOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )
      return_value = OrOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __AND61__ = nil
      op = nil
      andOperand60 = nil

      tree_for_AND61 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 91:4: andOperand ( AND op= orOperand )?
        @state.following.push( TOKENS_FOLLOWING_andOperand_IN_orOperand_413 )
        andOperand60 = andOperand
        @state.following.pop
        @adaptor.add_child( root_0, andOperand60.tree )
        # --> action
        return_value.result = ( andOperand60.nil? ? nil : andOperand60.result )
        # <-- action
        # at line 92:3: ( AND op= orOperand )?
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == AND )
          alt_12 = 1
        end
        case alt_12
        when 1
          # at line 92:4: AND op= orOperand
          __AND61__ = match( AND, TOKENS_FOLLOWING_AND_IN_orOperand_420 )

          tree_for_AND61 = @adaptor.create_with_payload( __AND61__ )
          root_0 = @adaptor.become_root( tree_for_AND61, root_0 )

          @state.following.push( TOKENS_FOLLOWING_orOperand_IN_orOperand_425 )
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
        # trace_out( __method__, 18 )

      end
      
      return return_value
    end

    AndOperandReturnValue = define_return_scope :result

    # 
    # parser rule andOperand
    # 
    # (in Giraffe.g)
    # 95:1: andOperand returns [result] : boolOperand ( EQ op= andOperand | NE op= andOperand | LT op= andOperand | GT op= andOperand | LE op= andOperand | GE op= andOperand )? ;
    # 
    def andOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )
      return_value = AndOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __EQ63__ = nil
      __NE64__ = nil
      __LT65__ = nil
      __GT66__ = nil
      __LE67__ = nil
      __GE68__ = nil
      op = nil
      boolOperand62 = nil

      tree_for_EQ63 = nil
      tree_for_NE64 = nil
      tree_for_LT65 = nil
      tree_for_GT66 = nil
      tree_for_LE67 = nil
      tree_for_GE68 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 96:4: boolOperand ( EQ op= andOperand | NE op= andOperand | LT op= andOperand | GT op= andOperand | LE op= andOperand | GE op= andOperand )?
        @state.following.push( TOKENS_FOLLOWING_boolOperand_IN_andOperand_444 )
        boolOperand62 = boolOperand
        @state.following.pop
        @adaptor.add_child( root_0, boolOperand62.tree )
        # --> action
        return_value.result = ( boolOperand62.nil? ? nil : boolOperand62.result )
        # <-- action
        # at line 96:48: ( EQ op= andOperand | NE op= andOperand | LT op= andOperand | GT op= andOperand | LE op= andOperand | GE op= andOperand )?
        alt_13 = 7
        case look_13 = @input.peek( 1 )
        when EQ then alt_13 = 1
        when NE then alt_13 = 2
        when LT then alt_13 = 3
        when GT then alt_13 = 4
        when LE then alt_13 = 5
        when GE then alt_13 = 6
        end
        case alt_13
        when 1
          # at line 97:4: EQ op= andOperand
          __EQ63__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_andOperand_453 )

          tree_for_EQ63 = @adaptor.create_with_payload( __EQ63__ )
          root_0 = @adaptor.become_root( tree_for_EQ63, root_0 )

          @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_458 )
          op = andOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result == ( op.nil? ? nil : op.result )
          # <-- action

        when 2
          # at line 98:6: NE op= andOperand
          __NE64__ = match( NE, TOKENS_FOLLOWING_NE_IN_andOperand_467 )

          tree_for_NE64 = @adaptor.create_with_payload( __NE64__ )
          root_0 = @adaptor.become_root( tree_for_NE64, root_0 )

          @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_472 )
          op = andOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result != ( op.nil? ? nil : op.result )
          # <-- action

        when 3
          # at line 99:6: LT op= andOperand
          __LT65__ = match( LT, TOKENS_FOLLOWING_LT_IN_andOperand_481 )

          tree_for_LT65 = @adaptor.create_with_payload( __LT65__ )
          root_0 = @adaptor.become_root( tree_for_LT65, root_0 )

          @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_486 )
          op = andOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result < ( op.nil? ? nil : op.result )
          # <-- action

        when 4
          # at line 100:6: GT op= andOperand
          __GT66__ = match( GT, TOKENS_FOLLOWING_GT_IN_andOperand_495 )

          tree_for_GT66 = @adaptor.create_with_payload( __GT66__ )
          root_0 = @adaptor.become_root( tree_for_GT66, root_0 )

          @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_500 )
          op = andOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result > ( op.nil? ? nil : op.result )
          # <-- action

        when 5
          # at line 101:6: LE op= andOperand
          __LE67__ = match( LE, TOKENS_FOLLOWING_LE_IN_andOperand_509 )

          tree_for_LE67 = @adaptor.create_with_payload( __LE67__ )
          root_0 = @adaptor.become_root( tree_for_LE67, root_0 )

          @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_514 )
          op = andOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result <= ( op.nil? ? nil : op.result )
          # <-- action

        when 6
          # at line 102:6: GE op= andOperand
          __GE68__ = match( GE, TOKENS_FOLLOWING_GE_IN_andOperand_523 )

          tree_for_GE68 = @adaptor.create_with_payload( __GE68__ )
          root_0 = @adaptor.become_root( tree_for_GE68, root_0 )

          @state.following.push( TOKENS_FOLLOWING_andOperand_IN_andOperand_528 )
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
        # trace_out( __method__, 19 )

      end
      
      return return_value
    end

    BoolOperandReturnValue = define_return_scope :result

    # 
    # parser rule boolOperand
    # 
    # (in Giraffe.g)
    # 106:1: boolOperand returns [result] : ( bool | NOT LB condition RB | op1= expression ( EQ ( bool | op2= expression ) ) );
    # 
    def boolOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )
      return_value = BoolOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __NOT70__ = nil
      __LB71__ = nil
      __RB73__ = nil
      __EQ74__ = nil
      op1 = nil
      op2 = nil
      bool69 = nil
      condition72 = nil
      bool75 = nil

      tree_for_NOT70 = nil
      tree_for_LB71 = nil
      tree_for_RB73 = nil
      tree_for_EQ74 = nil

      begin
        # at line 107:2: ( bool | NOT LB condition RB | op1= expression ( EQ ( bool | op2= expression ) ) )
        alt_15 = 3
        case look_15 = @input.peek( 1 )
        when TRUE, FALSE then alt_15 = 1
        when NOT then alt_15 = 2
        when ID, LB, PLUS, MINUS, INT, FLOAT then alt_15 = 3
        else
          raise NoViableAlternative( "", 15, 0 )
        end
        case alt_15
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 107:4: bool
          @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_551 )
          bool69 = bool
          @state.following.pop
          @adaptor.add_child( root_0, bool69.tree )
          # --> action
          return_value.result = ( bool69.nil? ? nil : bool69.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 108:4: NOT LB condition RB
          __NOT70__ = match( NOT, TOKENS_FOLLOWING_NOT_IN_boolOperand_558 )

          tree_for_NOT70 = @adaptor.create_with_payload( __NOT70__ )
          @adaptor.add_child( root_0, tree_for_NOT70 )

          __LB71__ = match( LB, TOKENS_FOLLOWING_LB_IN_boolOperand_560 )
          @state.following.push( TOKENS_FOLLOWING_condition_IN_boolOperand_563 )
          condition72 = condition
          @state.following.pop
          @adaptor.add_child( root_0, condition72.tree )
          __RB73__ = match( RB, TOKENS_FOLLOWING_RB_IN_boolOperand_565 )
          # --> action
          return_value.result = !( condition72.nil? ? nil : condition72.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 109:4: op1= expression ( EQ ( bool | op2= expression ) )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_575 )
          op1 = expression
          @state.following.pop
          @adaptor.add_child( root_0, op1.tree )
          # at line 109:19: ( EQ ( bool | op2= expression ) )
          # at line 110:4: EQ ( bool | op2= expression )
          __EQ74__ = match( EQ, TOKENS_FOLLOWING_EQ_IN_boolOperand_582 )

          tree_for_EQ74 = @adaptor.create_with_payload( __EQ74__ )
          root_0 = @adaptor.become_root( tree_for_EQ74, root_0 )

          # at line 110:8: ( bool | op2= expression )
          alt_14 = 2
          look_14_0 = @input.peek( 1 )

          if ( look_14_0.between?( TRUE, FALSE ) )
            alt_14 = 1
          elsif ( look_14_0.between?( ID, LB ) || look_14_0.between?( PLUS, MINUS ) || look_14_0.between?( INT, FLOAT ) )
            alt_14 = 2
          else
            raise NoViableAlternative( "", 14, 0 )
          end
          case alt_14
          when 1
            # at line 111:5: bool
            @state.following.push( TOKENS_FOLLOWING_bool_IN_boolOperand_591 )
            bool75 = bool
            @state.following.pop
            @adaptor.add_child( root_0, bool75.tree )
            # --> action
            return_value.result = ( op1.nil? ? nil : op1.result ) == ( bool75.nil? ? nil : bool75.result )
            # <-- action

          when 2
            # at line 112:7: op2= expression
            @state.following.push( TOKENS_FOLLOWING_expression_IN_boolOperand_603 )
            op2 = expression
            @state.following.pop
            @adaptor.add_child( root_0, op2.tree )
            # --> action
            return_value.result = ( op1.nil? ? nil : op1.result ) == ( op2.nil? ? nil : op2.result )
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
        # trace_out( __method__, 20 )

      end
      
      return return_value
    end

    ExpressionReturnValue = define_return_scope :result

    # 
    # parser rule expression
    # 
    # (in Giraffe.g)
    # 117:1: expression returns [result] : addOperand ( PLUS op= expression | MINUS op= expression )? ;
    # 
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )
      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS77__ = nil
      __MINUS78__ = nil
      op = nil
      addOperand76 = nil

      tree_for_PLUS77 = nil
      tree_for_MINUS78 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 118:4: addOperand ( PLUS op= expression | MINUS op= expression )?
        @state.following.push( TOKENS_FOLLOWING_addOperand_IN_expression_628 )
        addOperand76 = addOperand
        @state.following.pop
        @adaptor.add_child( root_0, addOperand76.tree )
        # --> action
        return_value.result = ( addOperand76.nil? ? nil : addOperand76.result )
        # <-- action
        # at line 119:3: ( PLUS op= expression | MINUS op= expression )?
        alt_16 = 3
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == PLUS )
          alt_16 = 1
        elsif ( look_16_0 == MINUS )
          alt_16 = 2
        end
        case alt_16
        when 1
          # at line 120:4: PLUS op= expression
          __PLUS77__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expression_639 )

          tree_for_PLUS77 = @adaptor.create_with_payload( __PLUS77__ )
          root_0 = @adaptor.become_root( tree_for_PLUS77, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_644 )
          op = expression
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result + ( op.nil? ? nil : op.result )
          # <-- action

        when 2
          # at line 121:5: MINUS op= expression
          __MINUS78__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expression_652 )

          tree_for_MINUS78 = @adaptor.create_with_payload( __MINUS78__ )
          root_0 = @adaptor.become_root( tree_for_MINUS78, root_0 )

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_657 )
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
        # trace_out( __method__, 21 )

      end
      
      return return_value
    end

    AddOperandReturnValue = define_return_scope :result

    # 
    # parser rule addOperand
    # 
    # (in Giraffe.g)
    # 125:1: addOperand returns [result] : mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )? ;
    # 
    def addOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )
      return_value = AddOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __MUL80__ = nil
      __DIV81__ = nil
      __MOD82__ = nil
      op = nil
      mulOperand79 = nil

      tree_for_MUL80 = nil
      tree_for_DIV81 = nil
      tree_for_MOD82 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 126:4: mulOperand ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        @state.following.push( TOKENS_FOLLOWING_mulOperand_IN_addOperand_679 )
        mulOperand79 = mulOperand
        @state.following.pop
        @adaptor.add_child( root_0, mulOperand79.tree )
        # --> action
        return_value.result = ( mulOperand79.nil? ? nil : mulOperand79.result )
        # <-- action
        # at line 127:3: ( MUL op= addOperand | DIV op= addOperand | MOD op= addOperand )?
        alt_17 = 4
        case look_17 = @input.peek( 1 )
        when MUL then alt_17 = 1
        when DIV then alt_17 = 2
        when MOD then alt_17 = 3
        end
        case alt_17
        when 1
          # at line 128:4: MUL op= addOperand
          __MUL80__ = match( MUL, TOKENS_FOLLOWING_MUL_IN_addOperand_690 )

          tree_for_MUL80 = @adaptor.create_with_payload( __MUL80__ )
          root_0 = @adaptor.become_root( tree_for_MUL80, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_695 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result * ( op.nil? ? nil : op.result )
          # <-- action

        when 2
          # at line 129:5: DIV op= addOperand
          __DIV81__ = match( DIV, TOKENS_FOLLOWING_DIV_IN_addOperand_703 )

          tree_for_DIV81 = @adaptor.create_with_payload( __DIV81__ )
          root_0 = @adaptor.become_root( tree_for_DIV81, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_708 )
          op = addOperand
          @state.following.pop
          @adaptor.add_child( root_0, op.tree )
          # --> action
          return_value.result = return_value.result / ( op.nil? ? nil : op.result )
          # <-- action

        when 3
          # at line 130:5: MOD op= addOperand
          __MOD82__ = match( MOD, TOKENS_FOLLOWING_MOD_IN_addOperand_716 )

          tree_for_MOD82 = @adaptor.create_with_payload( __MOD82__ )
          root_0 = @adaptor.become_root( tree_for_MOD82, root_0 )

          @state.following.push( TOKENS_FOLLOWING_addOperand_IN_addOperand_721 )
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
        # trace_out( __method__, 22 )

      end
      
      return return_value
    end

    MulOperandReturnValue = define_return_scope :result

    # 
    # parser rule mulOperand
    # 
    # (in Giraffe.g)
    # 134:1: mulOperand returns [result] : ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest );
    # 
    def mulOperand
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )
      return_value = MulOperandReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __PLUS83__ = nil
      __MINUS85__ = nil
      mulOperandRest84 = nil
      mulOperandRest86 = nil
      mulOperandRest87 = nil

      tree_for_PLUS83 = nil
      tree_for_MINUS85 = nil

      begin
        # at line 135:2: ( PLUS mulOperandRest | MINUS mulOperandRest | mulOperandRest )
        alt_18 = 3
        case look_18 = @input.peek( 1 )
        when PLUS then alt_18 = 1
        when MINUS then alt_18 = 2
        when ID, LB, INT, FLOAT then alt_18 = 3
        else
          raise NoViableAlternative( "", 18, 0 )
        end
        case alt_18
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 135:4: PLUS mulOperandRest
          __PLUS83__ = match( PLUS, TOKENS_FOLLOWING_PLUS_IN_mulOperand_743 )

          tree_for_PLUS83 = @adaptor.create_with_payload( __PLUS83__ )
          @adaptor.add_child( root_0, tree_for_PLUS83 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_745 )
          mulOperandRest84 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest84.tree )
          # --> action
          return_value.result = ( mulOperandRest84.nil? ? nil : mulOperandRest84.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 136:4: MINUS mulOperandRest
          __MINUS85__ = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_mulOperand_752 )

          tree_for_MINUS85 = @adaptor.create_with_payload( __MINUS85__ )
          @adaptor.add_child( root_0, tree_for_MINUS85 )

          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_754 )
          mulOperandRest86 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest86.tree )
          # --> action
          return_value.result = -( mulOperandRest86.nil? ? nil : mulOperandRest86.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 137:4: mulOperandRest
          @state.following.push( TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_761 )
          mulOperandRest87 = mulOperandRest
          @state.following.pop
          @adaptor.add_child( root_0, mulOperandRest87.tree )
          # --> action
          return_value.result = ( mulOperandRest87.nil? ? nil : mulOperandRest87.result )
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

    MulOperandRestReturnValue = define_return_scope :result

    # 
    # parser rule mulOperandRest
    # 
    # (in Giraffe.g)
    # 140:1: mulOperandRest returns [result] : ( ID | LB expression RB | INT | FLOAT | call );
    # 
    def mulOperandRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )
      return_value = MulOperandRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID88__ = nil
      __LB89__ = nil
      __RB91__ = nil
      __INT92__ = nil
      __FLOAT93__ = nil
      expression90 = nil
      call94 = nil

      tree_for_ID88 = nil
      tree_for_LB89 = nil
      tree_for_RB91 = nil
      tree_for_INT92 = nil
      tree_for_FLOAT93 = nil

      begin
        # at line 141:2: ( ID | LB expression RB | INT | FLOAT | call )
        alt_19 = 5
        case look_19 = @input.peek( 1 )
        when ID then look_19_1 = @input.peek( 2 )

        if ( look_19_1 == LB )
          alt_19 = 5
        elsif ( look_19_1 == EOF || look_19_1.between?( LCB, SEMICOLON ) || look_19_1 == COMMA || look_19_1.between?( RB, GE ) || look_19_1.between?( PLUS, MOD ) || look_19_1.between?( T__47, T__48 ) )
          alt_19 = 1
        else
          raise NoViableAlternative( "", 19, 1 )
        end
        when LB then alt_19 = 2
        when INT then alt_19 = 3
        when FLOAT then alt_19 = 4
        else
          raise NoViableAlternative( "", 19, 0 )
        end
        case alt_19
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 141:4: ID
          __ID88__ = match( ID, TOKENS_FOLLOWING_ID_IN_mulOperandRest_778 )

          tree_for_ID88 = @adaptor.create_with_payload( __ID88__ )
          @adaptor.add_child( root_0, tree_for_ID88 )

          # --> action
          puts "VAR-LOOKUP"
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 142:4: LB expression RB
          __LB89__ = match( LB, TOKENS_FOLLOWING_LB_IN_mulOperandRest_785 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_mulOperandRest_788 )
          expression90 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression90.tree )
          __RB91__ = match( RB, TOKENS_FOLLOWING_RB_IN_mulOperandRest_790 )
          # --> action
          return_value.result = ( expression90.nil? ? nil : expression90.result )
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 143:4: INT
          __INT92__ = match( INT, TOKENS_FOLLOWING_INT_IN_mulOperandRest_798 )

          tree_for_INT92 = @adaptor.create_with_payload( __INT92__ )
          @adaptor.add_child( root_0, tree_for_INT92 )

          # --> action
          return_value.result = __INT92__.text.to_i
          # <-- action

        when 4
          root_0 = @adaptor.create_flat_list


          # at line 144:4: FLOAT
          __FLOAT93__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_mulOperandRest_805 )

          tree_for_FLOAT93 = @adaptor.create_with_payload( __FLOAT93__ )
          @adaptor.add_child( root_0, tree_for_FLOAT93 )

          # --> action
          return_value.result = __FLOAT93__.text.to_f
          # <-- action

        when 5
          root_0 = @adaptor.create_flat_list


          # at line 145:4: call
          @state.following.push( TOKENS_FOLLOWING_call_IN_mulOperandRest_812 )
          call94 = call
          @state.following.pop
          @adaptor.add_child( root_0, call94.tree )
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
        # trace_out( __method__, 24 )

      end
      
      return return_value
    end

    ValueReturnValue = define_return_scope :result

    # 
    # parser rule value
    # 
    # (in Giraffe.g)
    # 147:1: value returns [result] : ( expression | STRING | CHAR );
    # 
    def value
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )
      return_value = ValueReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __STRING96__ = nil
      __CHAR97__ = nil
      expression95 = nil

      tree_for_STRING96 = nil
      tree_for_CHAR97 = nil

      begin
        # at line 148:2: ( expression | STRING | CHAR )
        alt_20 = 3
        case look_20 = @input.peek( 1 )
        when ID, LB, PLUS, MINUS, INT, FLOAT then alt_20 = 1
        when STRING then alt_20 = 2
        when CHAR then alt_20 = 3
        else
          raise NoViableAlternative( "", 20, 0 )
        end
        case alt_20
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 148:5: expression
          @state.following.push( TOKENS_FOLLOWING_expression_IN_value_828 )
          expression95 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression95.tree )
          # --> action
          return_value.result = ( expression95.nil? ? nil : expression95.result )
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 149:4: STRING
          __STRING96__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_value_835 )

          tree_for_STRING96 = @adaptor.create_with_payload( __STRING96__ )
          @adaptor.add_child( root_0, tree_for_STRING96 )

          # --> action
          return_value.result = __STRING96__.text
          # <-- action

        when 3
          root_0 = @adaptor.create_flat_list


          # at line 150:4: CHAR
          __CHAR97__ = match( CHAR, TOKENS_FOLLOWING_CHAR_IN_value_842 )

          tree_for_CHAR97 = @adaptor.create_with_payload( __CHAR97__ )
          @adaptor.add_child( root_0, tree_for_CHAR97 )

          # --> action
          return_value.result = __CHAR97__.text
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

    AssignmentReturnValue = define_return_scope 

    # 
    # parser rule assignment
    # 
    # (in Giraffe.g)
    # 153:1: assignment : ID ASSIGN value ;
    # 
    def assignment
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )
      return_value = AssignmentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __ID98__ = nil
      __ASSIGN99__ = nil
      value100 = nil

      tree_for_ID98 = nil
      tree_for_ASSIGN99 = nil

      begin
        root_0 = @adaptor.create_flat_list


        # at line 154:4: ID ASSIGN value
        __ID98__ = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_856 )

        tree_for_ID98 = @adaptor.create_with_payload( __ID98__ )
        @adaptor.add_child( root_0, tree_for_ID98 )

        __ASSIGN99__ = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_assignment_858 )

        tree_for_ASSIGN99 = @adaptor.create_with_payload( __ASSIGN99__ )
        root_0 = @adaptor.become_root( tree_for_ASSIGN99, root_0 )

        @state.following.push( TOKENS_FOLLOWING_value_IN_assignment_861 )
        value100 = value
        @state.following.pop
        @adaptor.add_child( root_0, value100.tree )
        # --> action
         @@progEnv.varSet(__ID98__.text,( value100.nil? ? nil : value100.result )) 
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

    BoolReturnValue = define_return_scope :result

    # 
    # parser rule bool
    # 
    # (in Giraffe.g)
    # 156:1: bool returns [result] : ( TRUE | FALSE );
    # 
    def bool
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )
      return_value = BoolReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look

      root_0 = nil
      __TRUE101__ = nil
      __FALSE102__ = nil

      tree_for_TRUE101 = nil
      tree_for_FALSE102 = nil

      begin
        # at line 157:2: ( TRUE | FALSE )
        alt_21 = 2
        look_21_0 = @input.peek( 1 )

        if ( look_21_0 == TRUE )
          alt_21 = 1
        elsif ( look_21_0 == FALSE )
          alt_21 = 2
        else
          raise NoViableAlternative( "", 21, 0 )
        end
        case alt_21
        when 1
          root_0 = @adaptor.create_flat_list


          # at line 157:4: TRUE
          __TRUE101__ = match( TRUE, TOKENS_FOLLOWING_TRUE_IN_bool_879 )

          tree_for_TRUE101 = @adaptor.create_with_payload( __TRUE101__ )
          @adaptor.add_child( root_0, tree_for_TRUE101 )

          # --> action
          return_value.result = true
          # <-- action

        when 2
          root_0 = @adaptor.create_flat_list


          # at line 158:5: FALSE
          __FALSE102__ = match( FALSE, TOKENS_FOLLOWING_FALSE_IN_bool_887 )

          tree_for_FALSE102 = @adaptor.create_with_payload( __FALSE102__ )
          @adaptor.add_child( root_0, tree_for_FALSE102 )

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
        # trace_out( __method__, 27 )

      end
      
      return return_value
    end



    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA5 < ANTLR3::DFA
      EOT = unpack( 11, -1 )
      EOF = unpack( 1, 7, 10, -1 )
      MIN = unpack( 2, 4, 9, -1 )
      MAX = unpack( 1, 48, 1, 37, 9, -1 )
      ACCEPT = unpack( 2, -1, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 1, 1, 
                       1, 2, 1, 3 )
      SPECIAL = unpack( 11, -1 )
      TRANSITION = [
        unpack( 1, 2, 3, 7, 1, 4, 3, -1, 1, 5, 1, 6, 1, 3, 1, -1, 1, 1, 
                30, -1, 2, 7 ),
        unpack( 1, 10, 11, -1, 1, 10, 1, 9, 19, -1, 1, 8 ),
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
          32:1: instruction : ( assignment | call | func | env | forCycle | ifInstruction | whileCycle | doCycle | );
        __dfa_description__
      end
    end


    private

    def initialize_dfas
      super rescue nil
      @dfa5 = DFA5.new( self, 5 )

    end
    TOKENS_FOLLOWING_block_IN_program_44 = Set[ 1 ]
    TOKENS_FOLLOWING_LCB_IN_env_54 = Set[ 4, 6, 7, 8, 12, 13, 14, 16, 47, 48 ]
    TOKENS_FOLLOWING_block_IN_env_62 = Set[ 5 ]
    TOKENS_FOLLOWING_RCB_IN_env_67 = Set[ 1 ]
    TOKENS_FOLLOWING_instruction_IN_block_81 = Set[ 6, 7, 47, 48 ]
    TOKENS_FOLLOWING_instructionRest_IN_block_83 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMENT_IN_instructionRest_96 = Set[ 47, 48 ]
    TOKENS_FOLLOWING_T__47_IN_instructionRest_100 = Set[ 48 ]
    TOKENS_FOLLOWING_T__48_IN_instructionRest_104 = Set[ 4, 6, 7, 8, 12, 13, 14, 16, 47, 48 ]
    TOKENS_FOLLOWING_SEMICOLON_IN_instructionRest_110 = Set[ 4, 6, 7, 8, 12, 13, 14, 16, 47, 48 ]
    TOKENS_FOLLOWING_block_IN_instructionRest_114 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_IN_instruction_127 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_instruction_132 = Set[ 1 ]
    TOKENS_FOLLOWING_func_IN_instruction_137 = Set[ 1 ]
    TOKENS_FOLLOWING_env_IN_instruction_142 = Set[ 1 ]
    TOKENS_FOLLOWING_forCycle_IN_instruction_147 = Set[ 1 ]
    TOKENS_FOLLOWING_ifInstruction_IN_instruction_152 = Set[ 1 ]
    TOKENS_FOLLOWING_whileCycle_IN_instruction_157 = Set[ 1 ]
    TOKENS_FOLLOWING_doCycle_IN_instruction_162 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_ifInstruction_177 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_condition_IN_ifInstruction_180 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_ifInstruction_182 = Set[ 9, 10, 11 ]
    TOKENS_FOLLOWING_ifRest_IN_ifInstruction_184 = Set[ 1 ]
    TOKENS_FOLLOWING_ELSE_IN_ifRest_199 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_ifRest_201 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_ifRest_206 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_condition_IN_ifRest_214 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_ifRest_216 = Set[ 1 ]
    TOKENS_FOLLOWING_WHILE_IN_whileCycle_230 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_condition_IN_whileCycle_232 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_whileCycle_234 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_doCycle_242 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_doCycle_244 = Set[ 12 ]
    TOKENS_FOLLOWING_WHILE_IN_doCycle_246 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_condition_IN_doCycle_248 = Set[ 1 ]
    TOKENS_FOLLOWING_FOR_IN_forCycle_257 = Set[ 16 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_259 = Set[ 15 ]
    TOKENS_FOLLOWING_COMMA_IN_forCycle_261 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_condition_IN_forCycle_264 = Set[ 15 ]
    TOKENS_FOLLOWING_COMMA_IN_forCycle_266 = Set[ 16 ]
    TOKENS_FOLLOWING_assignment_IN_forCycle_269 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_forCycle_271 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_func_281 = Set[ 4, 16 ]
    TOKENS_FOLLOWING_params_IN_func_284 = Set[ 4 ]
    TOKENS_FOLLOWING_env_IN_func_287 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_params_295 = Set[ 15 ]
    TOKENS_FOLLOWING_paramRest_IN_params_297 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_paramRest_306 = Set[ 16 ]
    TOKENS_FOLLOWING_params_IN_paramRest_309 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_call_324 = Set[ 17 ]
    TOKENS_FOLLOWING_LB_IN_call_327 = Set[ 16, 17, 18, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_args_IN_call_330 = Set[ 18 ]
    TOKENS_FOLLOWING_RB_IN_call_333 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_args_345 = Set[ 15 ]
    TOKENS_FOLLOWING_argsRest_IN_args_347 = Set[ 1 ]
    TOKENS_FOLLOWING_COMMA_IN_argsRest_358 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_args_IN_argsRest_361 = Set[ 1 ]
    TOKENS_FOLLOWING_orOperand_IN_condition_380 = Set[ 1, 19 ]
    TOKENS_FOLLOWING_OR_IN_condition_387 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_condition_IN_condition_392 = Set[ 1 ]
    TOKENS_FOLLOWING_andOperand_IN_orOperand_413 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_AND_IN_orOperand_420 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_orOperand_IN_orOperand_425 = Set[ 1 ]
    TOKENS_FOLLOWING_boolOperand_IN_andOperand_444 = Set[ 1, 21, 22, 23, 24, 25, 26 ]
    TOKENS_FOLLOWING_EQ_IN_andOperand_453 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_458 = Set[ 1 ]
    TOKENS_FOLLOWING_NE_IN_andOperand_467 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_472 = Set[ 1 ]
    TOKENS_FOLLOWING_LT_IN_andOperand_481 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_486 = Set[ 1 ]
    TOKENS_FOLLOWING_GT_IN_andOperand_495 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_500 = Set[ 1 ]
    TOKENS_FOLLOWING_LE_IN_andOperand_509 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_514 = Set[ 1 ]
    TOKENS_FOLLOWING_GE_IN_andOperand_523 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_andOperand_IN_andOperand_528 = Set[ 1 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_551 = Set[ 1 ]
    TOKENS_FOLLOWING_NOT_IN_boolOperand_558 = Set[ 17 ]
    TOKENS_FOLLOWING_LB_IN_boolOperand_560 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_condition_IN_boolOperand_563 = Set[ 18 ]
    TOKENS_FOLLOWING_RB_IN_boolOperand_565 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_575 = Set[ 21 ]
    TOKENS_FOLLOWING_EQ_IN_boolOperand_582 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_bool_IN_boolOperand_591 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_boolOperand_603 = Set[ 1 ]
    TOKENS_FOLLOWING_addOperand_IN_expression_628 = Set[ 1, 28, 29 ]
    TOKENS_FOLLOWING_PLUS_IN_expression_639 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_expression_IN_expression_644 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_expression_652 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_expression_IN_expression_657 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperand_IN_addOperand_679 = Set[ 1, 30, 31, 32 ]
    TOKENS_FOLLOWING_MUL_IN_addOperand_690 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_695 = Set[ 1 ]
    TOKENS_FOLLOWING_DIV_IN_addOperand_703 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_708 = Set[ 1 ]
    TOKENS_FOLLOWING_MOD_IN_addOperand_716 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_addOperand_IN_addOperand_721 = Set[ 1 ]
    TOKENS_FOLLOWING_PLUS_IN_mulOperand_743 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_745 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_mulOperand_752 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_754 = Set[ 1 ]
    TOKENS_FOLLOWING_mulOperandRest_IN_mulOperand_761 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_mulOperandRest_778 = Set[ 1 ]
    TOKENS_FOLLOWING_LB_IN_mulOperandRest_785 = Set[ 16, 17, 27, 28, 29, 33, 34, 38, 39 ]
    TOKENS_FOLLOWING_expression_IN_mulOperandRest_788 = Set[ 18 ]
    TOKENS_FOLLOWING_RB_IN_mulOperandRest_790 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_mulOperandRest_798 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_mulOperandRest_805 = Set[ 1 ]
    TOKENS_FOLLOWING_call_IN_mulOperandRest_812 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_value_828 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_value_835 = Set[ 1 ]
    TOKENS_FOLLOWING_CHAR_IN_value_842 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_856 = Set[ 37 ]
    TOKENS_FOLLOWING_ASSIGN_IN_assignment_858 = Set[ 16, 17, 27, 28, 29, 33, 34, 35, 36, 38, 39 ]
    TOKENS_FOLLOWING_value_IN_assignment_861 = Set[ 1 ]
    TOKENS_FOLLOWING_TRUE_IN_bool_879 = Set[ 1 ]
    TOKENS_FOLLOWING_FALSE_IN_bool_887 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end


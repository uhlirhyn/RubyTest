// $ANTLR 3.4 /home/gatt/fit/RUN/semestralka/giraffe.g 2011-11-06 16:21:12

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

import org.antlr.runtime.debug.*;
import java.io.IOException;
@SuppressWarnings({"all", "warnings", "unchecked"})
public class giraffeParser extends DebugParser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "CHAR", "COMMENT", "DIV", "ESC_SEQ", "EXPONENT", "FLOAT", "HEX_DIGIT", "ID", "INT", "MINUS", "MULT", "OCTAL_ESC", "OPER", "PLUS", "STRING", "UNICODE_ESC", "WS", "'('", "')'", "','", "';'", "'='", "'\\n'", "'\\r'", "'{'", "'}'"
    };

    public static final int EOF=-1;
    public static final int T__21=21;
    public static final int T__22=22;
    public static final int T__23=23;
    public static final int T__24=24;
    public static final int T__25=25;
    public static final int T__26=26;
    public static final int T__27=27;
    public static final int T__28=28;
    public static final int T__29=29;
    public static final int CHAR=4;
    public static final int COMMENT=5;
    public static final int DIV=6;
    public static final int ESC_SEQ=7;
    public static final int EXPONENT=8;
    public static final int FLOAT=9;
    public static final int HEX_DIGIT=10;
    public static final int ID=11;
    public static final int INT=12;
    public static final int MINUS=13;
    public static final int MULT=14;
    public static final int OCTAL_ESC=15;
    public static final int OPER=16;
    public static final int PLUS=17;
    public static final int STRING=18;
    public static final int UNICODE_ESC=19;
    public static final int WS=20;

    // delegates
    public Parser[] getDelegates() {
        return new Parser[] {};
    }

    // delegators


public static final String[] ruleNames = new String[] {
    "invalidRule", "expression", "instruction", "block", "args_rest", "args", 
    "assignment", "params", "func", "param_rest", "env", "call", "program", 
    "value", "instruction_rest"
};

public static final boolean[] decisionCanBacktrack = new boolean[] {
    false, // invalid decision
    false, false, false, false, false, false, false, false, false
};

 
    public int ruleLevel = 0;
    public int getRuleLevel() { return ruleLevel; }
    public void incRuleLevel() { ruleLevel++; }
    public void decRuleLevel() { ruleLevel--; }
    public giraffeParser(TokenStream input) {
        this(input, DebugEventSocketProxy.DEFAULT_DEBUGGER_PORT, new RecognizerSharedState());
    }
    public giraffeParser(TokenStream input, int port, RecognizerSharedState state) {
        super(input, state);
        DebugEventSocketProxy proxy =
            new DebugEventSocketProxy(this, port, null);

        setDebugListener(proxy);
        try {
            proxy.handshake();
        }
        catch (IOException ioe) {
            reportError(ioe);
        }
    }

public giraffeParser(TokenStream input, DebugEventListener dbg) {
    super(input, dbg, new RecognizerSharedState());
}

protected boolean evalPredicate(boolean result, String predicate) {
    dbg.semanticPredicate(result, predicate);
    return result;
}

    public String[] getTokenNames() { return giraffeParser.tokenNames; }
    public String getGrammarFileName() { return "/home/gatt/fit/RUN/semestralka/giraffe.g"; }



    // $ANTLR start "program"
    // /home/gatt/fit/RUN/semestralka/giraffe.g:3:1: program : block ;
    public final void program() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "program");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(3, 0);

        try {
            // /home/gatt/fit/RUN/semestralka/giraffe.g:3:9: ( block )
            dbg.enterAlt(1);

            // /home/gatt/fit/RUN/semestralka/giraffe.g:3:11: block
            {
            dbg.location(3,11);
            pushFollow(FOLLOW_block_in_program10);
            block();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }

        finally {
        	// do for sure before leaving
        }
        dbg.location(3, 15);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "program");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "program"



    // $ANTLR start "env"
    // /home/gatt/fit/RUN/semestralka/giraffe.g:5:1: env : '{' block '}' ;
    public final void env() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "env");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(5, 0);

        try {
            // /home/gatt/fit/RUN/semestralka/giraffe.g:5:5: ( '{' block '}' )
            dbg.enterAlt(1);

            // /home/gatt/fit/RUN/semestralka/giraffe.g:5:7: '{' block '}'
            {
            dbg.location(5,7);
            match(input,28,FOLLOW_28_in_env18); 
            dbg.location(5,11);
            pushFollow(FOLLOW_block_in_env20);
            block();

            state._fsp--;

            dbg.location(5,17);
            match(input,29,FOLLOW_29_in_env22); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }

        finally {
        	// do for sure before leaving
        }
        dbg.location(5, 19);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "env");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "env"



    // $ANTLR start "block"
    // /home/gatt/fit/RUN/semestralka/giraffe.g:7:1: block : ( instruction instruction_rest | COMMENT );
    public final void block() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "block");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(7, 0);

        try {
            // /home/gatt/fit/RUN/semestralka/giraffe.g:8:2: ( instruction instruction_rest | COMMENT )
            int alt1=2;
            try { dbg.enterDecision(1, decisionCanBacktrack[1]);

            int LA1_0 = input.LA(1);

            if ( (LA1_0==EOF||LA1_0==ID||LA1_0==24||(LA1_0 >= 26 && LA1_0 <= 29)) ) {
                alt1=1;
            }
            else if ( (LA1_0==COMMENT) ) {
                alt1=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 1, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;

            }
            } finally {dbg.exitDecision(1);}

            switch (alt1) {
                case 1 :
                    dbg.enterAlt(1);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:8:4: instruction instruction_rest
                    {
                    dbg.location(8,4);
                    pushFollow(FOLLOW_instruction_in_block31);
                    instruction();

                    state._fsp--;

                    dbg.location(8,16);
                    pushFollow(FOLLOW_instruction_rest_in_block33);
                    instruction_rest();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:9:4: COMMENT
                    {
                    dbg.location(9,4);
                    match(input,COMMENT,FOLLOW_COMMENT_in_block38); 

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }

        finally {
        	// do for sure before leaving
        }
        dbg.location(9, 10);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "block");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "block"



    // $ANTLR start "instruction_rest"
    // /home/gatt/fit/RUN/semestralka/giraffe.g:11:1: instruction_rest : ( ( ( ( '\\r' )? '\\n' ) | ';' ) block |);
    public final void instruction_rest() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "instruction_rest");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(11, 0);

        try {
            // /home/gatt/fit/RUN/semestralka/giraffe.g:12:2: ( ( ( ( '\\r' )? '\\n' ) | ';' ) block |)
            int alt4=2;
            try { dbg.enterDecision(4, decisionCanBacktrack[4]);

            int LA4_0 = input.LA(1);

            if ( (LA4_0==24||(LA4_0 >= 26 && LA4_0 <= 27)) ) {
                alt4=1;
            }
            else if ( (LA4_0==EOF||LA4_0==29) ) {
                alt4=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 4, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;

            }
            } finally {dbg.exitDecision(4);}

            switch (alt4) {
                case 1 :
                    dbg.enterAlt(1);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:12:5: ( ( ( '\\r' )? '\\n' ) | ';' ) block
                    {
                    dbg.location(12,5);
                    // /home/gatt/fit/RUN/semestralka/giraffe.g:12:5: ( ( ( '\\r' )? '\\n' ) | ';' )
                    int alt3=2;
                    try { dbg.enterSubRule(3);
                    try { dbg.enterDecision(3, decisionCanBacktrack[3]);

                    int LA3_0 = input.LA(1);

                    if ( ((LA3_0 >= 26 && LA3_0 <= 27)) ) {
                        alt3=1;
                    }
                    else if ( (LA3_0==24) ) {
                        alt3=2;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("", 3, 0, input);

                        dbg.recognitionException(nvae);
                        throw nvae;

                    }
                    } finally {dbg.exitDecision(3);}

                    switch (alt3) {
                        case 1 :
                            dbg.enterAlt(1);

                            // /home/gatt/fit/RUN/semestralka/giraffe.g:12:6: ( ( '\\r' )? '\\n' )
                            {
                            dbg.location(12,6);
                            // /home/gatt/fit/RUN/semestralka/giraffe.g:12:6: ( ( '\\r' )? '\\n' )
                            dbg.enterAlt(1);

                            // /home/gatt/fit/RUN/semestralka/giraffe.g:12:7: ( '\\r' )? '\\n'
                            {
                            dbg.location(12,7);
                            // /home/gatt/fit/RUN/semestralka/giraffe.g:12:7: ( '\\r' )?
                            int alt2=2;
                            try { dbg.enterSubRule(2);
                            try { dbg.enterDecision(2, decisionCanBacktrack[2]);

                            int LA2_0 = input.LA(1);

                            if ( (LA2_0==27) ) {
                                alt2=1;
                            }
                            } finally {dbg.exitDecision(2);}

                            switch (alt2) {
                                case 1 :
                                    dbg.enterAlt(1);

                                    // /home/gatt/fit/RUN/semestralka/giraffe.g:12:7: '\\r'
                                    {
                                    dbg.location(12,7);
                                    match(input,27,FOLLOW_27_in_instruction_rest50); 

                                    }
                                    break;

                            }
                            } finally {dbg.exitSubRule(2);}

                            dbg.location(12,13);
                            match(input,26,FOLLOW_26_in_instruction_rest53); 

                            }


                            }
                            break;
                        case 2 :
                            dbg.enterAlt(2);

                            // /home/gatt/fit/RUN/semestralka/giraffe.g:12:21: ';'
                            {
                            dbg.location(12,21);
                            match(input,24,FOLLOW_24_in_instruction_rest58); 

                            }
                            break;

                    }
                    } finally {dbg.exitSubRule(3);}

                    dbg.location(12,26);
                    pushFollow(FOLLOW_block_in_instruction_rest61);
                    block();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:13:4: 
                    {
                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }

        finally {
        	// do for sure before leaving
        }
        dbg.location(13, 3);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "instruction_rest");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "instruction_rest"



    // $ANTLR start "instruction"
    // /home/gatt/fit/RUN/semestralka/giraffe.g:15:1: instruction : ( assignment | call | func | env |);
    public final void instruction() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "instruction");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(15, 0);

        try {
            // /home/gatt/fit/RUN/semestralka/giraffe.g:16:2: ( assignment | call | func | env |)
            int alt5=5;
            try { dbg.enterDecision(5, decisionCanBacktrack[5]);

            switch ( input.LA(1) ) {
            case ID:
                {
                switch ( input.LA(2) ) {
                case 25:
                    {
                    alt5=1;
                    }
                    break;
                case 21:
                    {
                    alt5=2;
                    }
                    break;
                case ID:
                    {
                    alt5=3;
                    }
                    break;
                default:
                    NoViableAltException nvae =
                        new NoViableAltException("", 5, 1, input);

                    dbg.recognitionException(nvae);
                    throw nvae;

                }

                }
                break;
            case 28:
                {
                alt5=4;
                }
                break;
            case EOF:
            case 24:
            case 26:
            case 27:
            case 29:
                {
                alt5=5;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 5, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;

            }

            } finally {dbg.exitDecision(5);}

            switch (alt5) {
                case 1 :
                    dbg.enterAlt(1);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:16:4: assignment
                    {
                    dbg.location(16,4);
                    pushFollow(FOLLOW_assignment_in_instruction74);
                    assignment();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:17:4: call
                    {
                    dbg.location(17,4);
                    pushFollow(FOLLOW_call_in_instruction79);
                    call();

                    state._fsp--;


                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:18:4: func
                    {
                    dbg.location(18,4);
                    pushFollow(FOLLOW_func_in_instruction84);
                    func();

                    state._fsp--;


                    }
                    break;
                case 4 :
                    dbg.enterAlt(4);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:19:4: env
                    {
                    dbg.location(19,4);
                    pushFollow(FOLLOW_env_in_instruction89);
                    env();

                    state._fsp--;


                    }
                    break;
                case 5 :
                    dbg.enterAlt(5);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:20:4: 
                    {
                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }

        finally {
        	// do for sure before leaving
        }
        dbg.location(20, 3);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "instruction");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "instruction"



    // $ANTLR start "func"
    // /home/gatt/fit/RUN/semestralka/giraffe.g:22:1: func : ID params env ;
    public final void func() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "func");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(22, 0);

        try {
            // /home/gatt/fit/RUN/semestralka/giraffe.g:22:7: ( ID params env )
            dbg.enterAlt(1);

            // /home/gatt/fit/RUN/semestralka/giraffe.g:22:9: ID params env
            {
            dbg.location(22,9);
            match(input,ID,FOLLOW_ID_in_func103); 
            dbg.location(22,12);
            pushFollow(FOLLOW_params_in_func105);
            params();

            state._fsp--;

            dbg.location(22,19);
            pushFollow(FOLLOW_env_in_func107);
            env();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }

        finally {
        	// do for sure before leaving
        }
        dbg.location(22, 21);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "func");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "func"



    // $ANTLR start "params"
    // /home/gatt/fit/RUN/semestralka/giraffe.g:24:1: params : ID param_rest ;
    public final void params() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "params");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(24, 0);

        try {
            // /home/gatt/fit/RUN/semestralka/giraffe.g:24:8: ( ID param_rest )
            dbg.enterAlt(1);

            // /home/gatt/fit/RUN/semestralka/giraffe.g:24:10: ID param_rest
            {
            dbg.location(24,10);
            match(input,ID,FOLLOW_ID_in_params115); 
            dbg.location(24,13);
            pushFollow(FOLLOW_param_rest_in_params117);
            param_rest();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }

        finally {
        	// do for sure before leaving
        }
        dbg.location(24, 22);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "params");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "params"



    // $ANTLR start "param_rest"
    // /home/gatt/fit/RUN/semestralka/giraffe.g:26:1: param_rest : ( ',' params |);
    public final void param_rest() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "param_rest");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(26, 0);

        try {
            // /home/gatt/fit/RUN/semestralka/giraffe.g:27:2: ( ',' params |)
            int alt6=2;
            try { dbg.enterDecision(6, decisionCanBacktrack[6]);

            int LA6_0 = input.LA(1);

            if ( (LA6_0==23) ) {
                alt6=1;
            }
            else if ( (LA6_0==28) ) {
                alt6=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 6, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;

            }
            } finally {dbg.exitDecision(6);}

            switch (alt6) {
                case 1 :
                    dbg.enterAlt(1);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:27:4: ',' params
                    {
                    dbg.location(27,4);
                    match(input,23,FOLLOW_23_in_param_rest126); 
                    dbg.location(27,8);
                    pushFollow(FOLLOW_params_in_param_rest128);
                    params();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:28:4: 
                    {
                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }

        finally {
        	// do for sure before leaving
        }
        dbg.location(28, 3);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "param_rest");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "param_rest"



    // $ANTLR start "call"
    // /home/gatt/fit/RUN/semestralka/giraffe.g:30:1: call : ID '(' args ')' ;
    public final void call() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "call");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(30, 0);

        try {
            // /home/gatt/fit/RUN/semestralka/giraffe.g:31:2: ( ID '(' args ')' )
            dbg.enterAlt(1);

            // /home/gatt/fit/RUN/semestralka/giraffe.g:31:4: ID '(' args ')'
            {
            dbg.location(31,4);
            match(input,ID,FOLLOW_ID_in_call142); 
            dbg.location(31,7);
            match(input,21,FOLLOW_21_in_call144); 
            dbg.location(31,11);
            pushFollow(FOLLOW_args_in_call146);
            args();

            state._fsp--;

            dbg.location(31,16);
            match(input,22,FOLLOW_22_in_call148); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }

        finally {
        	// do for sure before leaving
        }
        dbg.location(31, 18);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "call");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "call"



    // $ANTLR start "args"
    // /home/gatt/fit/RUN/semestralka/giraffe.g:33:1: args : expression args_rest ;
    public final void args() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "args");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(33, 0);

        try {
            // /home/gatt/fit/RUN/semestralka/giraffe.g:34:2: ( expression args_rest )
            dbg.enterAlt(1);

            // /home/gatt/fit/RUN/semestralka/giraffe.g:34:4: expression args_rest
            {
            dbg.location(34,4);
            pushFollow(FOLLOW_expression_in_args159);
            expression();

            state._fsp--;

            dbg.location(34,15);
            pushFollow(FOLLOW_args_rest_in_args161);
            args_rest();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }

        finally {
        	// do for sure before leaving
        }
        dbg.location(34, 23);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "args");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "args"



    // $ANTLR start "args_rest"
    // /home/gatt/fit/RUN/semestralka/giraffe.g:36:1: args_rest : ( ',' args |);
    public final void args_rest() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "args_rest");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(36, 0);

        try {
            // /home/gatt/fit/RUN/semestralka/giraffe.g:37:2: ( ',' args |)
            int alt7=2;
            try { dbg.enterDecision(7, decisionCanBacktrack[7]);

            int LA7_0 = input.LA(1);

            if ( (LA7_0==23) ) {
                alt7=1;
            }
            else if ( (LA7_0==22) ) {
                alt7=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 7, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;

            }
            } finally {dbg.exitDecision(7);}

            switch (alt7) {
                case 1 :
                    dbg.enterAlt(1);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:37:4: ',' args
                    {
                    dbg.location(37,4);
                    match(input,23,FOLLOW_23_in_args_rest172); 
                    dbg.location(37,8);
                    pushFollow(FOLLOW_args_in_args_rest174);
                    args();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:38:4: 
                    {
                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }

        finally {
        	// do for sure before leaving
        }
        dbg.location(38, 3);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "args_rest");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "args_rest"



    // $ANTLR start "expression"
    // /home/gatt/fit/RUN/semestralka/giraffe.g:41:1: expression : ( ID | '(' expression OPER expression ')' | INT | FLOAT | call );
    public final void expression() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "expression");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(41, 0);

        try {
            // /home/gatt/fit/RUN/semestralka/giraffe.g:42:2: ( ID | '(' expression OPER expression ')' | INT | FLOAT | call )
            int alt8=5;
            try { dbg.enterDecision(8, decisionCanBacktrack[8]);

            switch ( input.LA(1) ) {
            case ID:
                {
                int LA8_1 = input.LA(2);

                if ( (LA8_1==21) ) {
                    alt8=5;
                }
                else if ( (LA8_1==EOF||LA8_1==OPER||(LA8_1 >= 22 && LA8_1 <= 24)||(LA8_1 >= 26 && LA8_1 <= 27)||LA8_1==29) ) {
                    alt8=1;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("", 8, 1, input);

                    dbg.recognitionException(nvae);
                    throw nvae;

                }
                }
                break;
            case 21:
                {
                alt8=2;
                }
                break;
            case INT:
                {
                alt8=3;
                }
                break;
            case FLOAT:
                {
                alt8=4;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 8, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;

            }

            } finally {dbg.exitDecision(8);}

            switch (alt8) {
                case 1 :
                    dbg.enterAlt(1);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:42:4: ID
                    {
                    dbg.location(42,4);
                    match(input,ID,FOLLOW_ID_in_expression189); 

                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:43:4: '(' expression OPER expression ')'
                    {
                    dbg.location(43,4);
                    match(input,21,FOLLOW_21_in_expression194); 
                    dbg.location(43,8);
                    pushFollow(FOLLOW_expression_in_expression196);
                    expression();

                    state._fsp--;

                    dbg.location(43,19);
                    match(input,OPER,FOLLOW_OPER_in_expression198); 
                    dbg.location(43,24);
                    pushFollow(FOLLOW_expression_in_expression200);
                    expression();

                    state._fsp--;

                    dbg.location(43,35);
                    match(input,22,FOLLOW_22_in_expression202); 

                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:44:4: INT
                    {
                    dbg.location(44,4);
                    match(input,INT,FOLLOW_INT_in_expression207); 

                    }
                    break;
                case 4 :
                    dbg.enterAlt(4);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:45:4: FLOAT
                    {
                    dbg.location(45,4);
                    match(input,FLOAT,FOLLOW_FLOAT_in_expression212); 

                    }
                    break;
                case 5 :
                    dbg.enterAlt(5);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:46:4: call
                    {
                    dbg.location(46,4);
                    pushFollow(FOLLOW_call_in_expression217);
                    call();

                    state._fsp--;


                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }

        finally {
        	// do for sure before leaving
        }
        dbg.location(46, 7);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "expression");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "expression"



    // $ANTLR start "value"
    // /home/gatt/fit/RUN/semestralka/giraffe.g:48:1: value : ( expression | STRING | CHAR );
    public final void value() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "value");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(48, 0);

        try {
            // /home/gatt/fit/RUN/semestralka/giraffe.g:49:2: ( expression | STRING | CHAR )
            int alt9=3;
            try { dbg.enterDecision(9, decisionCanBacktrack[9]);

            switch ( input.LA(1) ) {
            case FLOAT:
            case ID:
            case INT:
            case 21:
                {
                alt9=1;
                }
                break;
            case STRING:
                {
                alt9=2;
                }
                break;
            case CHAR:
                {
                alt9=3;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 9, 0, input);

                dbg.recognitionException(nvae);
                throw nvae;

            }

            } finally {dbg.exitDecision(9);}

            switch (alt9) {
                case 1 :
                    dbg.enterAlt(1);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:49:5: expression
                    {
                    dbg.location(49,5);
                    pushFollow(FOLLOW_expression_in_value228);
                    expression();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    dbg.enterAlt(2);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:50:4: STRING
                    {
                    dbg.location(50,4);
                    match(input,STRING,FOLLOW_STRING_in_value234); 

                    }
                    break;
                case 3 :
                    dbg.enterAlt(3);

                    // /home/gatt/fit/RUN/semestralka/giraffe.g:51:4: CHAR
                    {
                    dbg.location(51,4);
                    match(input,CHAR,FOLLOW_CHAR_in_value239); 

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }

        finally {
        	// do for sure before leaving
        }
        dbg.location(51, 7);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "value");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "value"



    // $ANTLR start "assignment"
    // /home/gatt/fit/RUN/semestralka/giraffe.g:53:1: assignment : ID '=' value ;
    public final void assignment() throws RecognitionException {
        try { dbg.enterRule(getGrammarFileName(), "assignment");
        if ( getRuleLevel()==0 ) {dbg.commence();}
        incRuleLevel();
        dbg.location(53, 0);

        try {
            // /home/gatt/fit/RUN/semestralka/giraffe.g:54:2: ( ID '=' value )
            dbg.enterAlt(1);

            // /home/gatt/fit/RUN/semestralka/giraffe.g:54:4: ID '=' value
            {
            dbg.location(54,4);
            match(input,ID,FOLLOW_ID_in_assignment249); 
            dbg.location(54,7);
            match(input,25,FOLLOW_25_in_assignment251); 
            dbg.location(54,11);
            pushFollow(FOLLOW_value_in_assignment253);
            value();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }

        finally {
        	// do for sure before leaving
        }
        dbg.location(54, 15);

        }
        finally {
            dbg.exitRule(getGrammarFileName(), "assignment");
            decRuleLevel();
            if ( getRuleLevel()==0 ) {dbg.terminate();}
        }

        return ;
    }
    // $ANTLR end "assignment"

    // Delegated rules


 

    public static final BitSet FOLLOW_block_in_program10 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_28_in_env18 = new BitSet(new long[]{0x000000001D000820L});
    public static final BitSet FOLLOW_block_in_env20 = new BitSet(new long[]{0x0000000020000000L});
    public static final BitSet FOLLOW_29_in_env22 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_instruction_in_block31 = new BitSet(new long[]{0x000000000D000000L});
    public static final BitSet FOLLOW_instruction_rest_in_block33 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_COMMENT_in_block38 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_27_in_instruction_rest50 = new BitSet(new long[]{0x0000000004000000L});
    public static final BitSet FOLLOW_26_in_instruction_rest53 = new BitSet(new long[]{0x000000001D000820L});
    public static final BitSet FOLLOW_24_in_instruction_rest58 = new BitSet(new long[]{0x000000001D000820L});
    public static final BitSet FOLLOW_block_in_instruction_rest61 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_assignment_in_instruction74 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_call_in_instruction79 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_func_in_instruction84 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_env_in_instruction89 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_func103 = new BitSet(new long[]{0x0000000000000800L});
    public static final BitSet FOLLOW_params_in_func105 = new BitSet(new long[]{0x0000000010000000L});
    public static final BitSet FOLLOW_env_in_func107 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_params115 = new BitSet(new long[]{0x0000000000800000L});
    public static final BitSet FOLLOW_param_rest_in_params117 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_23_in_param_rest126 = new BitSet(new long[]{0x0000000000000800L});
    public static final BitSet FOLLOW_params_in_param_rest128 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_call142 = new BitSet(new long[]{0x0000000000200000L});
    public static final BitSet FOLLOW_21_in_call144 = new BitSet(new long[]{0x0000000000201A00L});
    public static final BitSet FOLLOW_args_in_call146 = new BitSet(new long[]{0x0000000000400000L});
    public static final BitSet FOLLOW_22_in_call148 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_expression_in_args159 = new BitSet(new long[]{0x0000000000800000L});
    public static final BitSet FOLLOW_args_rest_in_args161 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_23_in_args_rest172 = new BitSet(new long[]{0x0000000000201A00L});
    public static final BitSet FOLLOW_args_in_args_rest174 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_expression189 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_21_in_expression194 = new BitSet(new long[]{0x0000000000201A00L});
    public static final BitSet FOLLOW_expression_in_expression196 = new BitSet(new long[]{0x0000000000010000L});
    public static final BitSet FOLLOW_OPER_in_expression198 = new BitSet(new long[]{0x0000000000201A00L});
    public static final BitSet FOLLOW_expression_in_expression200 = new BitSet(new long[]{0x0000000000400000L});
    public static final BitSet FOLLOW_22_in_expression202 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INT_in_expression207 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_FLOAT_in_expression212 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_call_in_expression217 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_expression_in_value228 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STRING_in_value234 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_CHAR_in_value239 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ID_in_assignment249 = new BitSet(new long[]{0x0000000002000000L});
    public static final BitSet FOLLOW_25_in_assignment251 = new BitSet(new long[]{0x0000000000241A10L});
    public static final BitSet FOLLOW_value_in_assignment253 = new BitSet(new long[]{0x0000000000000002L});

}
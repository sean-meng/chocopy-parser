package chocopy.pa1;
import java_cup.runtime.*;

%%

/*** Do not change the flags below unless you know what you are doing. ***/

%unicode
%line
%column

%class ChocoPyLexer
%public

%cupsym ChocoPyTokens
%cup
%cupdebug

%eofclose false

/*** Do not change the flags above unless you know what you are doing. ***/




/* The following code section is copied verbatim to the generated lexer class. */
%{

    // You can put fields and methods in this section if you want data structures
    // or methods to use in the action code that emits tokens upon recognizing a lexeme.
    // Hint: this is a good place to maintain state for handling indentation




    // Code below includes some convenience methods to create tokens of a given type
    // and optionally a value which the CUP parser can understand. Specifically,
    // a lot of the logic below deals with embedded information about where in the source
    // code a given token was recognized, so that we can report the line and column numbers
    // whenever an error occurs in later stages of the compiler.

    // You do not need to modify any of this for the assignment.

    final ComplexSymbolFactory symbolFactory = new ComplexSymbolFactory();

    private Symbol symbol(int type) {
        return symbol(type, yytext());
    }

    private Symbol symbol(int type, Object value) {
        return symbolFactory.newSymbol(ChocoPyTokens.terminalNames[type], type,
            new ComplexSymbolFactory.Location(yyline+1, yycolumn +1),
            new ComplexSymbolFactory.Location(yyline+1,yycolumn+yylength()),
            value);
    }

%}

/* Macros (regexes used in rules below) */

WhiteSpace = [ \t]
LineBreak  = \r|\n|\r\n

IntegerLiteral = 0 | [1-9][0-9]*

%%


<YYINITIAL> {

  /* delimiters */
  {LineBreak}                    { return symbol(ChocoPyTokens.NEWLINE); }
   
  /* literals */
  {IntegerLiteral}               { return symbol(ChocoPyTokens.NUMBER, Integer.parseInt(yytext())); }

  /* operators */
  "+"                            { return symbol(ChocoPyTokens.PLUS, yytext()); }

  /* whitespace */
  {WhiteSpace}                   { /* ignore */ }
}

<<EOF>>                          { return symbol(ChocoPyTokens.EOF); }

/* error fallback */
[^]                              { return symbol(ChocoPyTokens.UNRECOGNIZED); }

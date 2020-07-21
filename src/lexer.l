%{
#include "node.hpp"
#include "y.tab.h"
#include<bits/stdc++.h>
%}
line_terminator \r|\n|\r\n
underscore   [_]

EscapeSequence	\\b|\\\\|\\t|\\'|\\n|\\f|\\\"|\\r

dot [\.]


KeywordBoolean 	boolean
KeywordByte 	byte
KeywordShort 	short
KeywordInt 	int
KeywordLong 	long
KeywordChar 	char
KeywordFloat 	float
KeywordDouble 	double
KeywordClass 	class
KeywordVoid	void
KeywordIf	if
KeywordElse	else
KeywordSwitch	switch
KeywordCase	case
KeywordDefault	default
KeywordWhile	while
KeywordBreak	break
KeywordContinue	continue
KeywordReturn	return
KeywordThis	this
KeywordNew	new
KeywordInstanceof	instanceof
KeywordFor	for
KeywordDo 	do
KeywordSuper	super
KeywordThrow	throw
KeywordPackage  package
KeywordTry      try 
KeywordCatch    catch
KeywordStatic   static
KeywordPublic   public
KeyworsExtends extends
KeywordInterface interface
KeywordPrivate private
KeywordNative native 
KeywordProtected protected 
KeywordSynchronized synchronized
KeywordTransient transient
KeywordVolatile volatile 
KeywordThrows  throws
KeywordImport import
KeywordAbstract abstract
KeywordFinal final
KeywordFinally finally
KeywordImplements implements
KeywordExtends extends
SeparatorLSqBrac "["
SeparatorRSqBrac "]"
SeparatorDot	 "."
SeparatorSemiCo  ";"
SeparatorLCuBrac "{"
SeparatorRCuBrac "}"
SeparatorComma	 ","
SeparatorLParen	 "("
SeparatorRParen	 ")"
SeparatorAlpha   "@"

OperatorEq	"="
OperatorColon	":"
OperatorPlPl	"++"
OperatorMiMi	"--"
OperatorPl 	"+"
OperatorMi 	"-"
OperatorExcl 	"!"
OperatorTild 	"~"
OperatorMul	"*"
OperatorDiv	"/"
OperatorPerc	"%"
OperatorLeLe 	"<<"
OperatorGrGr	">>"
OperatorGrGrGr 	">>>"
OperatorLe 	"<"
OperatorGr 	">"
OperatorLeEq 	"<="
OperatorGrEq 	">="
OperatorEqEq 	"=="
OperatorNE 	"!="
OperatorAmp	"&"
OperatorUp	"^"
OperatorVert	"|"
OperatorAnd	"&&"
OperatorOr	"||"
OperatorQm	"?"
OperatorAsEq	"*=" 
OperatorSlEq	"/="
OperatorPercEq	"%="
OperatorPlEq	"+="
OperatorMiEq	"-="
OperatorLeLeEq	"<<="
OperatorGrGrEq 	">>="
OperatorGrGrGrEq	">>>="
OperatorAmpEq	"&="
OperatorUpEq	"^="
OperatorVertEq	"|="

KEY   abstract|continue|for|new|switch|assert|default|if|package|synchronized|boolean|do|goto|private|this|break|double|implements|protected|throw|byte|else|import|public|throws|case|enum|instanceof|return|transient|catch|extends|int|short|try|char|final|interface|static|void|class|finally|long|strictfp|volatile|const|float|native|super|while

BooleanLiteral  true|false
NullLiteral  null

int_suffix [lL]?

digit  [0-9]
undigit [1-9]
digits ({digit}|({undigit}({digit}|{underscore})*{digit}))

decimal   ((0)|{digits}){int_suffix}

hexdigit [0-9a-fA-F]
hexdigits (({hexdigit})|(({hexdigit})({hexdigit}|{underscore})*{hexdigit}))
hexnumeral ((0x)|(0X))({hexdigits}{int_suffix})  

octaldigit [0-7]
octaldigits ({underscore}|{octaldigit})*{octaldigit}
octal (0)({octaldigits}+{int_suffix}) 

binarydigit    0|1
binarydigits   (({binarydigit})|(({binarydigit})({binarydigit}|{underscore})*({binarydigit})))
binary       ((0b)|(0B)){binarydigits}{int_suffix} 


one_d (({digits})+([eE][\+-]?({digits})+)[fFdD]?)
two_d (\.({digits})+([eE][\+-]?({digits})+)?[fFdD]?)
three_d (({digits})+\.({digits})*([eE][\+-]?({digits})+)?[fFdD]?)
four_d  (({digits})+([eE][\+-]?({digits})+)?[fFdD])
five_d ((0[xX]({hexdigits})+\.?|0[xX]({hexdigits})*\.({hexdigits})+)[pP][\+-]?({digits})+[fFdD]?)

quotes       "\""

zeroTothree [0-3]

octalescape  \{octaldigit} | \{octaldigit}{octaldigit} | \{zeroTothree}{octaldigit}{octaldigit}



%x IN_COMMENT IN_STRING
%%
<INITIAL>{
{line_terminator}               {yylineno++; }   // removing spaces tabs newlines

[  \t\f]                    ;

\/\/.*              ;   // removing comments



"/*"                                        BEGIN(IN_COMMENT); yymore();




{SeparatorLSqBrac}			{ 
				           yylval.node_type = new Node("SeparatorLSqBrac", string(yytext));
                                            return SeparatorLSqBrac ;
						}
	{SeparatorRSqBrac}			{ 
						yylval.node_type = new Node("SeparatorRSqBrac", string(yytext));
							return SeparatorRSqBrac ;
						}
	{SeparatorDot}			{          yylval.node_type = new Node("SeparatorDot", string(yytext));
							 return SeparatorDot ;
						}

	{SeparatorSemiCo}			{ 
							yylval.node_type = new Node("SeparatorSemiCo", string(yytext)); return SeparatorSemiCo ;
						}
	{SeparatorComma}			{ 
							yylval.node_type = new Node("SeparatorComma", string(yytext)); return SeparatorComma ;
						}
	{SeparatorLCuBrac}			{ 
							yylval.node_type = new Node("SeparatorLCuBrac", string(yytext)); return SeparatorLCuBrac ;
						}
	{SeparatorRCuBrac}			{ 
							yylval.node_type = new Node("SeparatorRCuBrac", string(yytext)); return SeparatorRCuBrac ;
						}
	{SeparatorLParen}			{ 
							yylval.node_type = new Node("SeparatorLParen", string(yytext)); return SeparatorLParen ;
						}
	{SeparatorRParen}			{ 
							yylval.node_type = new Node("SeparatorRParen", string(yytext)); return SeparatorRParen ;
						}
    {SeparatorAlpha}			{ 
							yylval.node_type = new Node("SeparatorAlpha", string(yytext)); return SeparatorAlpha ;
						}
	
	{OperatorEq}		{
							yylval.node_type = new Node("OperatorEq", string(yytext)); return OperatorEq ;
						}
	{OperatorColon}				{
							yylval.node_type = new Node("OperatorColon", string(yytext)); return OperatorColon ;
						}
	{OperatorPlPl}		{
							yylval.node_type = new Node("OperatorPlPl", string(yytext)); return OperatorPlPl ;
						}
	{OperatorMiMi}		{
							yylval.node_type = new Node("OperatorMiMi", string(yytext)); return OperatorMiMi;
						}
	{OperatorPl}		{
							yylval.node_type = new Node("OperatorPl", string(yytext)); return OperatorPl;
						}
	{OperatorMi}		{
							yylval.node_type = new Node("OperatorMi", string(yytext)); return OperatorMi;
						}
    {OperatorTild}		{
							yylval.node_type = new Node("OperatorTild", string(yytext)); return OperatorTild;
						}
	{OperatorExcl}		{
							yylval.node_type = new Node("OperatorExcl", string(yytext)); return OperatorExcl;
						}
	{OperatorMul}		{
							yylval.node_type = new Node("OperatorMul", string(yytext)); return OperatorMul;
						}
	{OperatorDiv}		{
							yylval.node_type = new Node("OperatorDiv", string(yytext)); return OperatorDiv;
						}
	{OperatorPerc}		{
							yylval.node_type = new Node("OperatorPerc", string(yytext)); return OperatorPerc;
						}
	{OperatorLeLe}		{
							yylval.node_type = new Node("OperatorLele", string(yytext)); return OperatorLeLe;
						}
	{OperatorGrGr}		{
							yylval.node_type = new Node("OperatorGrGr", string(yytext)); return OperatorGrGr;
						}
	{OperatorGrGrGr}		{
							yylval.node_type = new Node("OperatorGrGr", string(yytext)); return OperatorGrGrGr;
						}
	{OperatorLe}		{
							yylval.node_type = new Node("OperatorLe", string(yytext)); return OperatorLe;
						}
	{OperatorGr}		{
							yylval.node_type = new Node("OperatorGr", string(yytext)); return OperatorGr;
						}
	{OperatorLeEq}		{
							yylval.node_type = new Node("OperatorLeEq", string(yytext)); return OperatorLeEq;
						}
	{OperatorGrEq}		{
							yylval.node_type = new Node("OperatorGrEq", string(yytext)); return OperatorGrEq;
						}
	{OperatorEqEq}		{
							yylval.node_type = new Node("OperatorEqEq", string(yytext)); return OperatorEqEq;
						}
	{OperatorNE}		{
							yylval.node_type = new Node("OperatorNE", string(yytext)); return OperatorNE;
						}
	{OperatorAmp}		{
							yylval.node_type = new Node("OperatorAmp", string(yytext)); return OperatorAmp;
						}

	{OperatorUp}		{
							yylval.node_type = new Node("OperatorUp", string(yytext)); return OperatorUp;
						}
	{OperatorVert}		{
							yylval.node_type = new Node("OperatorVert", string(yytext)); return OperatorVert;
						}
	{OperatorAnd}		{
							yylval.node_type = new Node("OperatorAnd", string(yytext)); return OperatorAnd;
						}
	{OperatorOr}		{
							yylval.node_type = new Node("OperatorOr", string(yytext)); return OperatorOr;
						}
	{OperatorQm}		{
							yylval.node_type = new Node("OperatorQm", string(yytext)); return OperatorQm;
						}
	{OperatorAsEq}		{
							yylval.node_type = new Node("OperatorAsEq", string(yytext)); return OperatorAsEq;
						}
	{OperatorSlEq}		{
							yylval.node_type = new Node("OperatorSlEq", string(yytext)); return OperatorSlEq;
						}
	{OperatorPercEq}		{
							yylval.node_type = new Node("OperatorPercEq", string(yytext)); return OperatorPercEq;
						}
	{OperatorPlEq}		{
							yylval.node_type = new Node("OperatorPlEq", string(yytext)); return OperatorPlEq;
						}
	{OperatorMiEq}		{
							yylval.node_type = new Node("OperatorMiEq", string(yytext)); return OperatorMiEq;
						}
	{OperatorLeLeEq}		{
							yylval.node_type = new Node("OperatorLeLeEq", string(yytext)); return OperatorLeLeEq;
						}
	{OperatorGrGrEq}		{
							yylval.node_type = new Node("OperatorGrGrEq", string(yytext)); return OperatorGrGrEq;
						}
	{OperatorGrGrGrEq}		{
							yylval.node_type = new Node("OperatorGrGrGrEq", string(yytext)); return OperatorGrGrGrEq;
						}
	{OperatorAmpEq}		{
							yylval.node_type = new Node("OperatorAmpEq", string(yytext)); return OperatorAmpEq;
						}
	{OperatorUpEq}		{
							yylval.node_type = new Node("OperatorUpEq", string(yytext)); return OperatorUpEq;
						}
	{OperatorVertEq}		{
							yylval.node_type = new Node("OperatorVertEq", string(yytext)); return OperatorVertEq;
						}

	{KeywordBoolean}			{
							yylval.node_type = new Node("KeywordBoolean", string(yytext)); return KeywordBoolean;
						}

	{KeywordByte}				{
							yylval.node_type = new Node("KeywordByte", string(yytext)); return KeywordByte;
						}

	{KeywordShort}				{
							yylval.node_type = new Node("KeywordShort", string(yytext)); return KeywordShort;
						}

	{KeywordInt}				{
							yylval.node_type = new Node("KeywordInt", string(yytext)); return KeywordInt;
						}

	{KeywordLong}				{
							yylval.node_type = new Node("KeywordLong", string(yytext)); return KeywordLong;
						}
	{KeywordChar}				{
							yylval.node_type = new Node("KeywordChar", string(yytext)); return KeywordChar;
						}

	{KeywordFloat}				{
							yylval.node_type = new Node("KeywordFloat", string(yytext)); return KeywordFloat;
						}

	{KeywordDouble}				{
							yylval.node_type = new Node("KeywordDouble", string(yytext)); return KeywordDouble;
						}
	{KeywordClass}				{
							yylval.node_type = new Node("KeywordClass", string(yytext)); return KeywordClass;
						}
	{KeywordVoid}				{
							yylval.node_type = new Node("KeywordVoid", string(yytext)); return KeywordVoid;
						}

	{KeywordIf}				{
							yylval.node_type = new Node("KeywordIf", string(yytext)); return KeywordIf;
						}
	{KeywordElse}				{
							yylval.node_type = new Node("KeywordElse", string(yytext)); return KeywordElse;
						}
	{KeywordSwitch}				{
							yylval.node_type = new Node("KeywordSwitch", string(yytext)); return KeywordSwitch;
						}
	{KeywordCase}				{
							yylval.node_type = new Node("KeywordCase", string(yytext)); return KeywordCase;
						}
	{KeywordDefault}				{
							yylval.node_type = new Node("KeywordDefault", string(yytext)); return KeywordDefault;
						}
	{KeywordWhile}				{
							yylval.node_type = new Node("KeywordWhile", string(yytext)); return KeywordWhile;
						}
	{KeywordBreak}				{
							yylval.node_type = new Node("KeywordBreak", string(yytext)); return KeywordBreak;
						}
	{KeywordContinue}				{
							yylval.node_type = new Node("KeywordContinue", string(yytext)); return KeywordContinue;
						}
	{KeywordReturn}				{
							yylval.node_type = new Node("KeywordReturn", string(yytext)); return KeywordReturn;
						}
	{KeywordThis}				{
							yylval.node_type = new Node("KeywordThis", string(yytext)); return KeywordThis;
						}
	{KeywordNew}				{
							yylval.node_type = new Node("KeywordNew", string(yytext)); return KeywordNew;
						}
	{KeywordInstanceof}	{
							yylval.node_type = new Node("KeywordInstanceof", string(yytext)); return KeywordInstanceof;
						}
	{KeywordFor}		{
							yylval.node_type = new Node("KeywordFor", string(yytext)); return KeywordFor;
						}
	{KeywordDo}			{
							yylval.node_type = new Node("KeywordDo", string(yytext)); return KeywordDo;
						}

       {KeywordSuper}			{
							yylval.node_type = new Node("KeywordSuper", string(yytext)); return KeywordSuper;
						}
      {KeywordThrow}			{
							yylval.node_type = new Node("KeywordThrow", string(yytext)); return KeywordThrow;
						}
      {KeywordTry}			{
							yylval.node_type = new Node("KeywordTry", string(yytext)); return KeywordTry;
						}
     {KeywordCatch}			{
							yylval.node_type = new Node("KeywordCatch", string(yytext)); return KeywordCatch;
						}
     {KeywordPackage}			{
							yylval.node_type = new Node("KeywordPackage", string(yytext)); return KeywordPackage;
						}
    {KeywordPublic}			{
							yylval.node_type = new Node("KeywordPublic", string(yytext)); return KeywordPublic;
						}
    {KeywordStatic}			{
							yylval.node_type = new Node("KeywordStatic", string(yytext)); return KeywordStatic;
						}
   {KeywordAbstract}			{
							yylval.node_type = new Node("KeywordAbstract", string(yytext)); return KeywordAbstract;
						}
   {KeywordFinal}			{
							yylval.node_type = new Node("KeywordFinal", string(yytext)); return KeywordFinal;
						}
   {KeywordFinally}			{
							yylval.node_type = new Node("KeywordFinally", string(yytext)); return KeywordFinally;
						}
   {KeywordImplements}			{
							yylval.node_type = new Node("KeywordImplements", string(yytext)); return KeywordImplements;
						}
    {KeywordInterface}			{
							yylval.node_type = new Node("KeywordInterface", string(yytext)); return KeywordInterface ;
						}
    {KeywordPrivate}			{
							yylval.node_type = new Node("KeywordPrivate", string(yytext)); return KeywordPrivate;
						}
   {KeywordNative}			{
							yylval.node_type = new Node("KeywordNative", string(yytext)); return KeywordNative;
						}
   {KeywordProtected}			{
							yylval.node_type = new Node("KeywordProtected", string(yytext)); return KeywordProtected;
						}
   {KeywordSynchronized}			{
							yylval.node_type = new Node("KeywordSynchronized", string(yytext)); return KeywordSynchronized;

						}
   {KeywordTransient}			{
							yylval.node_type = new Node("KeywordTransient", string(yytext)); return KeywordTransient;
						}
   {KeywordVolatile}			{
							yylval.node_type = new Node("KeywordVolatile", string(yytext)); return KeywordVolatile;
						}
  {KeywordThrows}			{
							yylval.node_type = new Node(" KeywordThrows", string(yytext)); return KeywordThrows;
						}
  {KeywordExtends}			{
							yylval.node_type = new Node(" KeywordExtends", string(yytext)); return KeywordExtends;
						}
  {KeywordImport}			{
							yylval.node_type = new Node(" KeywordImport", string(yytext)); return KeywordImport;
						}
  

       
    

                                               

{KEY}            {yylval.node_type = new Node("Keyword", string(yytext)); return Keyword;  }

{BooleanLiteral}			{
							yylval.node_type = new Node("BooleanLiteral", string(yytext));
							return BooleanLiteral;
						}

{NullLiteral}				{
							yylval.node_type = new Node("NullLiteral", string(yytext));
							return NullLiteral;
						}

\"                                 { BEGIN(IN_STRING); }

\'([^\n\r'\\]|\\b|\\f|\\t|\\n|\\r|\\'|\\\"|\\\\|\\[0-7]{1,2}|\\[0-3][0-7]{2})\'         {  yylval.node_type = new Node("CharacterLiteral", string(yytext)); return CharacterLiteral ; }
\'\'\'|\'    { cout << "error character single quote in line no - "<< yylineno <<"\n" ; exit(0);}


({one_d}|{two_d}|{three_d}|{four_d}|{five_d}) { yylval.node_type = new Node("FloatingLiteral", string(yytext)); return FloatingLiteral ;   }

[a-zA-Z\$_][a-zA-Z\$_0-9]*  { yylval.node_type = new Node("Identifier", string(yytext)); return Identifier ;}


{hexnumeral}  { yylval.node_type = new Node("IntegerLiteral", string(yytext)); return IntegerLiteral ;}
         
((0x)|(0X))  { cout << yytext <<"  invalid, error in line no- " << yylineno <<"\n" ; exit(0);}
  
{binary} { yylval.node_type = new Node("IntegerLiteral", string(yytext)); return IntegerLiteral ;}

((0b)|(0B))  { cout << yytext <<"  invalid, error in line no- " << yylineno <<"\n" ; exit(0);}

{octal} { yylval.node_type = new Node("IntegerLiteral", string(yytext)); return IntegerLiteral ;} 

[0](([0-9]|{underscore})*[0-9]) { cout << yytext <<"  invalid, error in line no- " << yylineno <<"\n"; exit(0);}
{decimal} {
             if(*yytext=='0' && yyleng > 1 && yytext[yyleng-1] != 'L' && yytext[yyleng-1] != 'l')
             {   
                 yymore();
                 cout << "invalid, decimal error in line no- " << yylineno<<"\n" ;    exit(0);  
             }
             else { yylval.node_type = new Node("IntegerLiteral", string(yytext)); return IntegerLiteral ;}
                                
}


.  {  cout << yytext <<"    invalid character error in lineno- " << yylineno <<"\n"; exit(0) ;}

}


<IN_COMMENT>{
	"*/"    				{
							BEGIN(INITIAL);
							;
						}
	<<EOF>>					{ cout <<"error: Unterminated comment in line no  " << yylineno << "\n"; exit(0); return 0; }
	{line_terminator}			{yylineno++; yymore();}
	.   					yymore();
}
<IN_STRING>{
	\"					{
							BEGIN(INITIAL);	
							string s  = string(yytext);
							s.erase(s.end()-1, s.end());
							yylval.node_type = new Node("StringLiteral", s); return StringLiteral ;
                                                        
						}
	{EscapeSequence}				{yymore();}
	\\					{
							BEGIN(INITIAL); 
							 cout<< "error of escape_sequence in string literal in line no "<< yylineno<<"\n" ; exit(0);
						}
	<<EOF>>					{ cout << " error of EOF in string literal in line no "<< yylineno<<"\n" ; exit(0);}
	{line_terminator}			{
							yylineno++; 
							yytext[yyleng-1] = '\0'; 
							BEGIN(INITIAL); 
							 cout << " error of line_terminator in string literal in line no "<< yylineno <<"\n"; exit(0);
						}
	.         				yymore();
}

%%

int yywrap(void)
{
	return  1;
}




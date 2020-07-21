/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    IntegerLiteral = 258,
    SeparatorAlpha = 259,
    FloatingLiteral = 260,
    BooleanLiteral = 261,
    CharacterLiteral = 262,
    StringLiteral = 263,
    NullLiteral = 264,
    Identifier = 265,
    KeywordBoolean = 266,
    KeywordByte = 267,
    KeywordShort = 268,
    KeywordInt = 269,
    KeywordLong = 270,
    KeywordChar = 271,
    KeywordFloat = 272,
    KeywordDouble = 273,
    KeywordClass = 274,
    KeywordVoid = 275,
    KeywordIf = 276,
    KeywordElse = 277,
    KeywordThis = 278,
    KeywordSwitch = 279,
    KeywordCase = 280,
    KeywordDefault = 281,
    KeywordWhile = 282,
    KeywordBreak = 283,
    KeywordContinue = 284,
    KeywordReturn = 285,
    Keyword = 286,
    SeparatorLSqBrac = 287,
    SeparatorRSqBrac = 288,
    SeparatorDot = 289,
    SeparatorSemiCo = 290,
    SeparatorComma = 291,
    OperatorEq = 292,
    OperatorColon = 293,
    SeparatorLCuBrac = 294,
    SeparatorRCuBrac = 295,
    SeparatorLParen = 296,
    SeparatorRParen = 297,
    OperatorMiMi = 298,
    OperatorMiEq = 299,
    OperatorUp = 300,
    OperatorLeLeEq = 301,
    KeywordNew = 302,
    KeywordInstanceof = 303,
    OperatorVert = 304,
    OperatorDiv = 305,
    OperatorGrGrGr = 306,
    OperatorLe = 307,
    OperatorPlPl = 308,
    OperatorPl = 309,
    OperatorGrGrEq = 310,
    OperatorNE = 311,
    OperatorAmp = 312,
    OperatorExcl = 313,
    OperatorMi = 314,
    OperatorAnd = 315,
    OperatorUpEq = 316,
    OperatorAmpEq = 317,
    OperatorQm = 318,
    OperatorVertEq = 319,
    OperatorPlEq = 320,
    OperatorLeEq = 321,
    OperatorMul = 322,
    OperatorGrEq = 323,
    OperatorOr = 324,
    OperatorAsEq = 325,
    OperatorPercEq = 326,
    OperatorGr = 327,
    OperatorSlEq = 328,
    OperatorGrGrGrEq = 329,
    OperatorTild = 330,
    OperatorPerc = 331,
    OperatorGrGr = 332,
    OperatorEqEq = 333,
    OperatorLeLe = 334,
    KeywordFor = 335,
    KeywordDo = 336,
    KeywordExtends = 337,
    KeywordImport = 338,
    KeywordPackage = 339,
    KeywordTry = 340,
    KeywordCatch = 341,
    KeywordSuper = 342,
    KeywordAbstract = 343,
    KeywordFinal = 344,
    KeywordFinally = 345,
    KeywordImplements = 346,
    KeywordInterface = 347,
    KeywordPrivate = 348,
    KeywordNative = 349,
    KeywordProtected = 350,
    KeywordPublic = 351,
    KeywordStatic = 352,
    KeywordSynchronized = 353,
    KeywordThrow = 354,
    KeywordTransient = 355,
    KeywordVolatile = 356,
    KeywordThrows = 357
  };
#endif
/* Tokens.  */
#define IntegerLiteral 258
#define SeparatorAlpha 259
#define FloatingLiteral 260
#define BooleanLiteral 261
#define CharacterLiteral 262
#define StringLiteral 263
#define NullLiteral 264
#define Identifier 265
#define KeywordBoolean 266
#define KeywordByte 267
#define KeywordShort 268
#define KeywordInt 269
#define KeywordLong 270
#define KeywordChar 271
#define KeywordFloat 272
#define KeywordDouble 273
#define KeywordClass 274
#define KeywordVoid 275
#define KeywordIf 276
#define KeywordElse 277
#define KeywordThis 278
#define KeywordSwitch 279
#define KeywordCase 280
#define KeywordDefault 281
#define KeywordWhile 282
#define KeywordBreak 283
#define KeywordContinue 284
#define KeywordReturn 285
#define Keyword 286
#define SeparatorLSqBrac 287
#define SeparatorRSqBrac 288
#define SeparatorDot 289
#define SeparatorSemiCo 290
#define SeparatorComma 291
#define OperatorEq 292
#define OperatorColon 293
#define SeparatorLCuBrac 294
#define SeparatorRCuBrac 295
#define SeparatorLParen 296
#define SeparatorRParen 297
#define OperatorMiMi 298
#define OperatorMiEq 299
#define OperatorUp 300
#define OperatorLeLeEq 301
#define KeywordNew 302
#define KeywordInstanceof 303
#define OperatorVert 304
#define OperatorDiv 305
#define OperatorGrGrGr 306
#define OperatorLe 307
#define OperatorPlPl 308
#define OperatorPl 309
#define OperatorGrGrEq 310
#define OperatorNE 311
#define OperatorAmp 312
#define OperatorExcl 313
#define OperatorMi 314
#define OperatorAnd 315
#define OperatorUpEq 316
#define OperatorAmpEq 317
#define OperatorQm 318
#define OperatorVertEq 319
#define OperatorPlEq 320
#define OperatorLeEq 321
#define OperatorMul 322
#define OperatorGrEq 323
#define OperatorOr 324
#define OperatorAsEq 325
#define OperatorPercEq 326
#define OperatorGr 327
#define OperatorSlEq 328
#define OperatorGrGrGrEq 329
#define OperatorTild 330
#define OperatorPerc 331
#define OperatorGrGr 332
#define OperatorEqEq 333
#define OperatorLeLe 334
#define KeywordFor 335
#define KeywordDo 336
#define KeywordExtends 337
#define KeywordImport 338
#define KeywordPackage 339
#define KeywordTry 340
#define KeywordCatch 341
#define KeywordSuper 342
#define KeywordAbstract 343
#define KeywordFinal 344
#define KeywordFinally 345
#define KeywordImplements 346
#define KeywordInterface 347
#define KeywordPrivate 348
#define KeywordNative 349
#define KeywordProtected 350
#define KeywordPublic 351
#define KeywordStatic 352
#define KeywordSynchronized 353
#define KeywordThrow 354
#define KeywordTransient 355
#define KeywordVolatile 356
#define KeywordThrows 357

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 20 "parser.y" /* yacc.c:1909  */
 
    char *strval ;
    Node *node_type ;
 

#line 264 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

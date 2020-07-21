%{ 
    extern int yylex(); 
	#include <bits/stdc++.h>
	#include "node.hpp"
  	using namespace std;
	extern FILE *yyin;
    extern int yylineno;
    void yyerror(char *msg); 
	void ErrorCount();
    int flag; 
	int yydebug=1;
    Node * createnode(Node * child, string type, string value = "");
	void assignRoot(Node * n);
    int i; 
    int k =0;
	Node* root;
%} 


%union { 
    char *strval ;
    Node *node_type ;
 } 

%type <node_type> Goal
%type <node_type> CompilationUnit


%type <node_type> Literal IntegralType Type PrimitiveType NumericType ReferenceType  FloatingPointType ArrayType Name ClassType  SimpleName QualifiedName PackageDeclaration ImportDeclarations  ImportDeclaration TypeDeclarations TypeDeclaration SingleTypeImportDeclaration TypeImportOnDemandDeclaration ClassDeclaration InterfaceDeclaration Modifiers Modifier ClassBody ClassBodyDeclaration Super Interfaces InterfaceTypeList MethodDeclarator ClassBodyDeclarations VariableInitializer FormalParameter ConstructorDeclaration VariableDeclaratorId ClassMemberDeclaration StaticInitializer Expression MethodDeclaration ArrayInitializer FormalParameterList Block MethodHeader VariableDeclarators  MethodBody FieldDeclaration VariableDeclarator BlockStatements ConstructorBody VariableInitializers ConstructorDeclarator Throws ClassTypeList ExplicitConstructorInvocation ExtendsInterfaces InterfaceBody InterfaceMemberDeclarations InterfaceMemberDeclaration ConstantDeclaration AbstractMethodDeclaration PostDecrementExpression ExpressionStatement Statement Assignment PostIncrementExpression BlockStatement SwitchBlockStatementGroups PreIncrementExpression ReturnStatement ConstantExpression SwitchLabel BreakStatement IfThenStatement SwitchBlock EmptyStatement StatementNoShortIf MethodInvocation IfThenElseStatement WhileStatementNoShortIf ClassInstanceCreationExpression ContinueStatement SwitchStatement SwitchBlockStatementGroup SwitchLabels LocalVariableDeclaration WhileStatement LabeledStatement StatementExpression IfThenElseStatementNoShortIf LocalVariableDeclarationStatement PreDecrementExpression LabeledStatementNoShortIf StatementWithoutTrailingSubstatement AndExpression ArgumentList DimExpr PrimaryNoNewArray AssignmentOperator ConditionalAndExpression PostfixExpression EqualityExpression MultiplicativeExpression ArrayCreationExpression AssignmentExpression UnaryExpressionNotPlusMinus ArrayAccess ExclusiveOrExpression Primary RelationalExpression Dims ConditionalOrExpression AdditiveExpression ConditionalExpression UnaryExpression InclusiveOrExpression CastExpression DimExprs LeftHandSide ShiftExpression FieldAccess ForStatement ForStatementNoShortIf ForInit ForUpdate StatementExpressionList DoStatement    

%token <node_type> IntegerLiteral SeparatorAlpha FloatingLiteral  BooleanLiteral CharacterLiteral StringLiteral NullLiteral Identifier KeywordBoolean  KeywordByte KeywordShort KeywordInt KeywordLong KeywordChar KeywordFloat KeywordDouble KeywordClass KeywordVoid KeywordIf KeywordElse KeywordThis KeywordSwitch KeywordCase KeywordDefault KeywordWhile KeywordBreak KeywordContinue KeywordReturn Keyword SeparatorLSqBrac SeparatorRSqBrac SeparatorDot SeparatorSemiCo SeparatorComma OperatorEq OperatorColon SeparatorLCuBrac SeparatorRCuBrac SeparatorLParen SeparatorRParen OperatorMiMi OperatorMiEq OperatorUp OperatorLeLeEq KeywordNew KeywordInstanceof OperatorVert OperatorDiv OperatorGrGrGr OperatorLe OperatorPlPl OperatorPl OperatorGrGrEq OperatorNE OperatorAmp OperatorExcl OperatorMi OperatorAnd OperatorUpEq OperatorAmpEq OperatorQm OperatorVertEq OperatorPlEq OperatorLeEq OperatorMul OperatorGrEq OperatorOr OperatorAsEq OperatorPercEq OperatorGr OperatorSlEq OperatorGrGrGrEq OperatorTild OperatorPerc OperatorGrGr OperatorEqEq OperatorLeLe KeywordFor KeywordDo KeywordExtends KeywordImport KeywordPackage KeywordTry KeywordCatch KeywordSuper KeywordAbstract KeywordFinal KeywordFinally KeywordImplements KeywordInterface KeywordPrivate KeywordNative KeywordProtected KeywordPublic KeywordStatic KeywordSynchronized KeywordThrow KeywordTransient KeywordVolatile KeywordThrows
    
%start Goal


%%

Goal : CompilationUnit  { $$ = createnode($1, string("Goal"));
						  $$->nodeNo = 0; 
						  assignRoot($$);
						} ;

Literal: IntegerLiteral                         { $$ = createnode($1, string("Literal")); } // terminal
		| FloatingLiteral		{ $$ = createnode($1, string("Literal")); } // terminal
		| BooleanLiteral		{ $$ = createnode($1, string("Literal")); } // terminal
		| CharacterLiteral		{ $$ = createnode($1, string("Literal")); } // terminal
		| StringLiteral			{ $$ = createnode($1, string("Literal")); }// terminal
		| NullLiteral			{ $$ = createnode($1, string("Literal")); } // terminal
		;


Type		: PrimitiveType			{ $$ = createnode($1, string("Type")); }
		| ReferenceType                 { $$ = createnode($1, string("Type")); }
		;


PrimitiveType	: NumericType			{ $$ = createnode($1, string("PrimitiveType")); }
		| KeywordBoolean		{ $$ = createnode($1, string("PrimitiveType")); } // terminal
		;

NumericType	: IntegralType			{ $$ = createnode($1, string("NumericType")); }		
		| FloatingPointType		{ $$ = createnode($1, string("NumericType")); }
		;

IntegralType	: KeywordByte			{ $$ = createnode($1, string("IntegralType")); } // terminal
		| KeywordShort			{ $$ = createnode($1, string("IntegralType")); } // terminal
		| KeywordInt			{ $$ = createnode($1, string("IntegralType")); } // terminal
		| KeywordLong			{ $$ = createnode($1, string("IntegralType")); } // terminal
		| KeywordChar	  		{ $$ = createnode($1, string("IntegralType")); } // terminal	
		;

FloatingPointType	: KeywordDouble		{ $$ = createnode($1, string("FloatingPointType")); }   // terminal   

			| KeywordFloat		{ $$ = createnode($1, string("FloatingPointType")); }   // terminal   
			;

ReferenceType	: ClassType		{ $$ = createnode($1, string("ReferenceType")); }
		| ArrayType			{ $$ = createnode($1, string("ReferenceType")); }
		;

ClassType: Name   { $$ = createnode($1, string("ClassType")); } ;

ArrayType	: PrimitiveType SeparatorLSqBrac SeparatorRSqBrac
						{
						         $$ = createnode($1, string("ArrayType"));
							 $$->addChild($2); // create a node
							 $$->addChild($3); // create a node
						}
		| Name SeparatorLSqBrac SeparatorRSqBrac
		                 	    	{ 	 
							 $$ = createnode($1, string("ArrayType"));
							 $$->addChild($2); // create a node
							 $$->addChild($3); // create a node
						}
							   
		| ArrayType SeparatorLSqBrac SeparatorRSqBrac	
					    	{ 
							 	 $$ = createnode($1, string("ArrayType"));
								 $$->addChild($2); // create a node
								 $$->addChild($3); // create a node
						}
		;


Name: SimpleName     { $$ = createnode($1, string("Name")); } 
    | QualifiedName  { $$ = createnode($1, string("Name")); } ;

SimpleName: Identifier { $$ = createnode($1, string("SimpleName")); } ;

QualifiedName: Name SeparatorDot Identifier { 	 
							 $$ = createnode($1, string("QualifiedName"));
							 $$->addChild($2); // create a node
							 $$->addChild($3);
						};


CompilationUnit: PackageDeclaration ImportDeclarations TypeDeclarations { 	 
							 $$ = createnode($1, string("CompilationUnit"));
							 $$->addChild($2); 
							 $$->addChild($3);
						}
		| PackageDeclaration ImportDeclarations { 	 
							 $$ = createnode($1, string("CompilationUnit"));
							 $$->addChild($2);
						}
		| PackageDeclaration TypeDeclarations { 	 
							 $$ = createnode($1, string("CompilationUnit"));
							 $$->addChild($2);
						}
		| ImportDeclarations TypeDeclarations { 	 
							 $$ = createnode($1, string("CompilationUnit"));
							 $$->addChild($2);
						}
		| PackageDeclaration  { $$ = createnode($1, string("CompilationUnit")); } 
		| ImportDeclarations  { $$ = createnode($1, string("CompilationUnit")); }
		| TypeDeclarations  { $$ = createnode($1, string("CompilationUnit")); }
		| %empty    {;}  // emptynode 


ImportDeclarations : ImportDeclaration   { $$ = createnode($1, string("ImportDeclarations")); } 
                   | ImportDeclarations ImportDeclaration { 	 
							 $$ = createnode($1, string("ImportDeclarations"));
							 $$->addChild($2); 
						};

TypeDeclarations: TypeDeclaration  { $$ = createnode($1, string("TypeDeclarations")); } 
		| TypeDeclarations TypeDeclaration { 	 
							 $$ = createnode($1, string("TypeDeclarations"));
							 $$->addChild($2); 
						};

PackageDeclaration: KeywordPackage Name SeparatorSemiCo { 	 
							 $$ = createnode($1, string("PackageDeclaration"));
							 $$->addChild($2); 
							$$->addChild($3); 
						};

ImportDeclaration: SingleTypeImportDeclaration   { $$ = createnode($1, string("ImportDeclaration")); } 
			| TypeImportOnDemandDeclaration { $$ = createnode($1, string("ImportDeclaration")); } ;

SingleTypeImportDeclaration: KeywordImport Name SeparatorSemiCo { 	 
							 $$ = createnode($1, string("SingleTypeImportDeclaration"));
							 $$->addChild($2); $$->addChild($3);  
						};

TypeImportOnDemandDeclaration: KeywordImport Name SeparatorDot OperatorMul SeparatorSemiCo { 	 
							 $$ = createnode($1, string("TypeImportOnDemandDeclaration"));
							 $$->addChild($2); 
							 $$->addChild($3); //terminal
							 $$->addChild($4); //terminal
							$$->addChild($5);
						};

TypeDeclaration: ClassDeclaration	{ $$ = createnode($1, string("TypeDeclaration")); } 
		| InterfaceDeclaration	{ $$ = createnode($1, string("TypeDeclaration")); } 
		| SeparatorSemiCo  { $$ = createnode($1, string("TypeDeclaration")); } ;

//

Modifiers: Modifier  { $$ = createnode($1, string("Modifiers")); } 
	 | Modifiers Modifier { 	 
							 $$ = createnode($1, string("Modifiers"));
							 $$->addChild($2); 
						};

Modifier: KeywordPublic   { $$ = createnode($1, string("Modifier")); }
	| KeywordProtected { $$ = createnode($1, string("Modifier")); }
	| KeywordPrivate  { $$ = createnode($1, string("Modifier")); }
	| KeywordStatic   { $$ = createnode($1, string("Modifier")); }
	| KeywordAbstract  { $$ = createnode($1, string("Modifier")); }
	| KeywordFinal   { $$ = createnode($1, string("Modifier")); }
	| KeywordNative   { $$ = createnode($1, string("Modifier")); }
	| KeywordSynchronized   { $$ = createnode($1, string("Modifier")); }
	| KeywordTransient { $$ = createnode($1, string("Modifier")); }
	| KeywordVolatile { $$ = createnode($1, string("Modifier")); } ;

//

ClassDeclaration: Modifiers KeywordClass Identifier Super Interfaces ClassBody { $$ = createnode($1, string("ClassDeclaration"));
				$$->addChild($2);	$$->addChild($3); $$->addChild($4); $$->addChild($5); $$->addChild($6); }
                | Modifiers KeywordClass Identifier Super ClassBody   { $$ = createnode($1, string("ClassDeclaration"));
				$$->addChild($2);	$$->addChild($3); $$->addChild($4); $$->addChild($5);  }
		| Modifiers KeywordClass Identifier Interfaces ClassBody	{ $$ = createnode($1, string("ClassDeclaration"));
				$$->addChild($2);	$$->addChild($3); $$->addChild($4); $$->addChild($5);  }
		| KeywordClass Identifier Super Interfaces ClassBody	{ $$ = createnode($1, string("ClassDeclaration"));
				$$->addChild($2);	$$->addChild($3); $$->addChild($4); $$->addChild($5); }
		| Modifiers KeywordClass Identifier ClassBody	{ $$ = createnode($1, string("ClassDeclaration"));
				$$->addChild($2);	$$->addChild($3); $$->addChild($4);  }
		| KeywordClass Identifier Super ClassBody	{ $$ = createnode($1, string("ClassDeclaration"));
				$$->addChild($2);	$$->addChild($3); $$->addChild($4);  }
		| KeywordClass Identifier Interfaces ClassBody	{ $$ = createnode($1, string("ClassDeclaration"));
				$$->addChild($2);	$$->addChild($3); $$->addChild($4);  }
		| KeywordClass Identifier ClassBody 	{ $$ = createnode($1, string("ClassDeclaration"));
				$$->addChild($2);	$$->addChild($3);  };


Super: KeywordExtends ClassType { $$ = createnode($1, string("Super"));
								$$->addChild($2);	 };

Interfaces:	KeywordImplements InterfaceTypeList { $$ = createnode($1, string("Interfaces"));
								$$->addChild($2);	 };

InterfaceTypeList:	ClassType	 { $$ = createnode($1, string("InterfaceTypeList")); }
				 |	InterfaceTypeList SeparatorComma ClassType { $$ = createnode($1, string("InterfaceTypeList"));
								$$->addChild($2);	$$->addChild($3);	 };

ClassBody:	SeparatorLCuBrac ClassBodyDeclarations SeparatorRCuBrac	{ $$ = createnode($1, string("ClassBody"));
								$$->addChild($2);	$$->addChild($3);	 }
			|SeparatorLCuBrac  SeparatorRCuBrac	{ $$ = createnode($1, string("ClassBody"));
								$$->addChild($2);		 }								
			;

ClassBodyDeclarations:	ClassBodyDeclaration { $$ = createnode($1, string("ClassBodyDeclarations")); }
					 |	ClassBodyDeclarations ClassBodyDeclaration { $$ = createnode($1, string("ClassBodyDeclarations"));
								$$->addChild($2);	 };

ClassBodyDeclaration:	ClassMemberDeclaration	{ $$ = createnode($1, string("ClassBodyDeclaration")); }
					 |	StaticInitializer	{ $$ = createnode($1, string("ClassBodyDeclaration")); }
					 |	ConstructorDeclaration { $$ = createnode($1, string("ClassBodyDeclaration")); };

ClassMemberDeclaration:	FieldDeclaration	{ $$ = createnode($1, string("ClassMemberDeclaration")); }
					 |	MethodDeclaration { $$ = createnode($1, string("ClassMemberDeclaration")); }; 

FieldDeclaration: Modifiers Type VariableDeclarators SeparatorSemiCo { $$ = createnode($1, string("FieldDeclaration"));
								$$->addChild($2);	$$->addChild($3);	$$->addChild($4); }
		| Type VariableDeclarators SeparatorSemiCo { $$ = createnode($1, string("FieldDeclaration"));
								$$->addChild($2);	$$->addChild($3);} ;

VariableDeclarators: VariableDeclarator 	{ $$ = createnode($1, string("VariableDeclarators")); }
					 |	 VariableDeclarators SeparatorComma VariableDeclarator { $$ = createnode($1, string("VariableDeclarators"));
								$$->addChild($2);	$$->addChild($3); };

VariableDeclarator: VariableDeclaratorId 	{ $$ = createnode($1, string("VariableDeclarator")); }
                  | VariableDeclaratorId OperatorEq VariableInitializer	 { $$ = createnode($1, string("VariableDeclarator"));
								$$->addChild($2);	$$->addChild($3); };

VariableDeclaratorId: Identifier 	{ $$ = createnode($1, string("VariableDeclaratorId")); }
                     | VariableDeclaratorId SeparatorLSqBrac SeparatorRSqBrac { $$ = createnode($1, string("VariableDeclaratorId"));
								$$->addChild($2);	$$->addChild($3); };

VariableInitializer: Expression	{ $$ = createnode($1, string("VariableInitializer")); }
		    | ArrayInitializer { $$ = createnode($1, string("VariableInitializer")); };

MethodDeclaration: MethodHeader MethodBody 	{ $$ = createnode($1, string("MethodDeclaration"));
								$$->addChild($2);	 };

MethodHeader:	Modifiers Type MethodDeclarator Throws	{ $$ = createnode($1, string("MethodHeader"));
								$$->addChild($2);	$$->addChild($3); $$->addChild($4); }
	    | Modifiers Type MethodDeclarator  { $$ = createnode($1, string("MethodHeader"));
								$$->addChild($2);	$$->addChild($3);  }
	    | Type MethodDeclarator Throws   { $$ = createnode($1, string("MethodHeader"));
								$$->addChild($2);	$$->addChild($3);  }
	    | Type MethodDeclarator     { $$ = createnode($1, string("MethodHeader"));
								$$->addChild($2);	 }
	    | Modifiers KeywordVoid MethodDeclarator Throws { $$ = createnode($1, string("MethodHeader"));
								$$->addChild($2);	$$->addChild($3); $$->addChild($4); }
	    | Modifiers KeywordVoid MethodDeclarator   { $$ = createnode($1, string("MethodHeader"));
								$$->addChild($2);	$$->addChild($3); }
	    | KeywordVoid MethodDeclarator Throws   { $$ = createnode($1, string("MethodHeader"));
								$$->addChild($2);	$$->addChild($3);  }
	    | KeywordVoid MethodDeclarator { $$ = createnode($1, string("MethodHeader"));
								$$->addChild($2); } ;

MethodDeclarator: Identifier SeparatorLParen FormalParameterList SeparatorRParen { $$ = createnode($1, string("MethodDeclarator"));
								$$->addChild($2);	$$->addChild($3); $$->addChild($4); }
				 |	Identifier SeparatorLParen  SeparatorRParen { $$ = createnode($1, string("MethodDeclarator"));
								$$->addChild($2);	$$->addChild($3);  }
				 |	MethodDeclarator SeparatorLSqBrac  SeparatorRSqBrac { $$ = createnode($1, string("MethodDeclarator"));
								$$->addChild($2);	$$->addChild($3);};

FormalParameterList:	FormalParameter	{ $$ = createnode($1, string("FormalParameterList")); }
	 	   |			FormalParameterList SeparatorComma FormalParameter	 { $$ = createnode($1, string("FormalParameterList"));
								$$->addChild($2);	$$->addChild($3); };
		   

FormalParameter: Type VariableDeclaratorId  { $$ = createnode($1, string("FormalParameter"));
								$$->addChild($2); };

Throws:	KeywordThrows ClassTypeList	{ $$ = createnode($1, string("Throws"));
								$$->addChild($2); } ;

ClassTypeList:	ClassType	{ $$ = createnode($1, string("ClassTypeList")); }
			 |	ClassTypeList SeparatorComma ClassType { $$ = createnode($1, string("ClassTypeList"));
								$$->addChild($2);	$$->addChild($3); };

MethodBody:	Block 	{ $$ = createnode($1, string("MethodBody")); }
		 |	SeparatorSemiCo { $$ = createnode($1, string("MethodBody")); };

StaticInitializer: KeywordStatic Block	{ $$ = createnode($1, string("StaticInitializer"));
								$$->addChild($2); } ;

ConstructorDeclaration: Modifiers ConstructorDeclarator Throws ConstructorBody 	{ $$ = createnode($1, string("ConstructorDeclaration"));
								$$->addChild($2);	$$->addChild($3); $$->addChild($4); }
			| Modifiers ConstructorDeclarator ConstructorBody    { $$ = createnode($1, string("ConstructorDeclaration"));
								$$->addChild($2);	$$->addChild($3);  }
			| ConstructorDeclarator Throws ConstructorBody   { $$ = createnode($1, string("ConstructorDeclaration"));
								$$->addChild($2);	$$->addChild($3);  }
			| ConstructorDeclarator ConstructorBody   { $$ = createnode($1, string("ConstructorDeclaration")); $$->addChild($2); } ;

ConstructorDeclarator: SimpleName SeparatorLParen FormalParameterList SeparatorRParen { $$ = createnode($1, string("ConstructorDeclarator"));
								$$->addChild($2);	$$->addChild($3); $$->addChild($4); }
					|	SimpleName SeparatorLParen  SeparatorRParen { $$ = createnode($1, string("ConstructorDeclarator"));
								$$->addChild($2);	$$->addChild($3); };

ConstructorBody: SeparatorLCuBrac ExplicitConstructorInvocation BlockStatements SeparatorRCuBrac	{ $$ = createnode($1, string("ConstructorBody"));
								$$->addChild($2);	$$->addChild($3); $$->addChild($4); }
	        | SeparatorLCuBrac ExplicitConstructorInvocation  SeparatorRCuBrac	{ $$ = createnode($1, string("ConstructorBody"));
								$$->addChild($2);	$$->addChild($3);  }
		| SeparatorLCuBrac BlockStatements SeparatorRCuBrac	{ $$ = createnode($1, string("ConstructorBody"));
								$$->addChild($2);	$$->addChild($3); }
		| SeparatorLCuBrac  SeparatorRCuBrac { $$ = createnode($1, string("ConstructorBody"));
								$$->addChild($2); }; 


ExplicitConstructorInvocation:  KeywordThis SeparatorLParen ArgumentList SeparatorRParen SeparatorSemiCo	{ $$ = createnode($1, string("ExplicitConstructorInvocation"));
								$$->addChild($2);	$$->addChild($3); $$->addChild($4);  $$->addChild($5); }
						 |	KeywordThis SeparatorLParen  SeparatorRParen SeparatorSemiCo	{ $$ = createnode($1, string("ExplicitConstructorInvocation"));
								$$->addChild($2);	$$->addChild($3); $$->addChild($4); }
			     |  KeywordSuper SeparatorLParen ArgumentList SeparatorRParen SeparatorSemiCo { $$ = createnode($1, string("ExplicitConstructorInvocation"));
								$$->addChild($2);	$$->addChild($3); $$->addChild($4); $$->addChild($5); }
					 |  KeywordSuper SeparatorLParen  SeparatorRParen SeparatorSemiCo { $$ = createnode($1, string("ExplicitConstructorInvocation"));
								$$->addChild($2);	$$->addChild($3); $$->addChild($4); };


//


InterfaceDeclaration: Modifiers KeywordInterface Identifier ExtendsInterfaces InterfaceBody { 	 
							 $$ = createnode($1, string("InterfaceDeclaration"));
							 $$->addChild($2); 
							 $$->addChild($3); 
							 $$->addChild($4); 
							$$->addChild($5);
						}
			| Modifiers KeywordInterface Identifier  InterfaceBody { 	 
							 $$ = createnode($1, string("InterfaceDeclaration"));
							 $$->addChild($2); 
							 $$->addChild($3); 
							 $$->addChild($4); 
						}
			| KeywordInterface Identifier ExtendsInterfaces InterfaceBody { 	 
							 $$ = createnode($1, string("InterfaceDeclaration"));
							 $$->addChild($2); 
							 $$->addChild($3); 
							 $$->addChild($4); 
						}
			| KeywordInterface Identifier InterfaceBody { 	 
							 $$ = createnode($1, string("InterfaceDeclaration"));
							 $$->addChild($2); 
							 $$->addChild($3); 
						};

ExtendsInterfaces:KeywordExtends ClassType  { 	 
							 $$ = createnode($1, string("ExtendsInterfaces"));
							 $$->addChild($2); 
							}
		| ExtendsInterfaces SeparatorComma ClassType { 	 
							 $$ = createnode($1, string("ExtendsInterfaces"));
							 $$->addChild($2); 
							 $$->addChild($3); 
						};

InterfaceBody: SeparatorLCuBrac InterfaceMemberDeclarations SeparatorRCuBrac  { 	 
							 $$ = createnode($1, string("InterfaceBody"));
							 $$->addChild($2); 
							 $$->addChild($3); 
						}
		| SeparatorLCuBrac  SeparatorRCuBrac { 	 
							 $$ = createnode($1, string("InterfaceBody"));
							 $$->addChild($2); 
							};

InterfaceMemberDeclarations:	InterfaceMemberDeclaration { $$ = createnode($1, string("InterfaceMemberDeclarations")); } 
			 					|InterfaceMemberDeclarations InterfaceMemberDeclaration { 	 
							 $$ = createnode($1, string("InterfaceMemberDeclarations"));
							 $$->addChild($2); 
							};

InterfaceMemberDeclaration:ConstantDeclaration { $$ = createnode($1, string("InterfaceMemberDeclaration")); } 
			|AbstractMethodDeclaration { $$ = createnode($1, string("InterfaceMemberDeclaration")); }  ;

ConstantDeclaration:FieldDeclaration { $$ = createnode($1, string("ConstantDeclaration")); }  ;

AbstractMethodDeclaration: MethodHeader SeparatorSemiCo  { 	 
							 $$ = createnode($1, string("AbstractMethodDeclaration"));
							 $$->addChild($2); 
							};


//


ArrayInitializer: SeparatorLCuBrac VariableInitializers SeparatorComma SeparatorRCuBrac   { 	 
							 $$ = createnode($1, string("ArrayInitializer"));
							 $$->addChild($2); 
							 $$->addChild($3); 
							 $$->addChild($4); 
						}
		| SeparatorLCuBrac VariableInitializers  SeparatorRCuBrac { 	 
							 $$ = createnode($1, string("ArrayInitializer"));
							 $$->addChild($2); 
							 $$->addChild($3); 
						}
		| SeparatorLCuBrac  SeparatorComma SeparatorRCuBrac { 	 
							 $$ = createnode($1, string("ArrayInitializer"));
							 $$->addChild($2); 
							 $$->addChild($3); 
						}
		| SeparatorLCuBrac  SeparatorRCuBrac { 	 
							 $$ = createnode($1, string("ArrayInitializer"));
							 $$->addChild($2);
						};

VariableInitializers:VariableInitializer  { $$ = createnode($1, string("VariableInitializers")); }
			| VariableInitializers SeparatorComma VariableInitializer { 	 
							 $$ = createnode($1, string("VariableInitializers"));
							 $$->addChild($2); 
							 $$->addChild($3); 
						};


//

Block 	: SeparatorLCuBrac BlockStatements SeparatorRCuBrac	{  $$ = createnode($1, "Block"); 
								   $$->addChild($2);
								   $$->addChild($3);
								}
	| SeparatorLCuBrac SeparatorRCuBrac	{ 
						  $$ = createnode($1, "Block"); 
						  $$->addChild($2);
						}
	;
BlockStatements	: BlockStatement 	{ $$ = createnode($1, "BlockStatements"); }
		| BlockStatements BlockStatement 	{ $$ = createnode($1, "BlockStatements"); 
							  $$->addChild($2);
							}
		;
BlockStatement 	: LocalVariableDeclarationStatement	{ $$ = createnode($1, "BlockStatement"); }
		| Statement 				{ $$ = createnode($1, "BlockStatement"); }
		;
LocalVariableDeclarationStatement	: LocalVariableDeclaration SeparatorSemiCo{ $$ = createnode($1, "LocalVariableDeclarationStatement"); 
										    $$->addChild($2);
										  }
					;
LocalVariableDeclaration 	: Type VariableDeclarators 	{ $$ = createnode($1, "LocalVariableDeclaration"); 
								  $$->addChild($2);
								}
				;
Statement 	: StatementWithoutTrailingSubstatement 	{ $$ = createnode($1, "Statement"); }
		| LabeledStatement			{ $$ = createnode($1, "Statement"); }
		| IfThenStatement 			{ $$ = createnode($1, "Statement"); }
		| IfThenElseStatement			{ $$ = createnode($1, "Statement"); }
		| WhileStatement			{ $$ = createnode($1, "Statement"); }
		| ForStatement				{ $$ = createnode($1, "Statement"); }
		;
StatementNoShortIf 	: StatementWithoutTrailingSubstatement	{ $$ = createnode($1, "StatementNoShortIf"); }
			| LabeledStatementNoShortIf		{ $$ = createnode($1, "StatementNoShortIf"); }
			| IfThenElseStatementNoShortIf		{ $$ = createnode($1, "StatementNoShortIf"); }
			| WhileStatementNoShortIf		{ $$ = createnode($1, "StatementNoShortIf"); }
			| ForStatementNoShortIf			{ $$ = createnode($1, "StatementNoShortIf"); }
			;
StatementWithoutTrailingSubstatement	: Block 		{ $$ = createnode($1, "StatementWithoutTrailingSubstatement"); }
				   	| EmptyStatement	{ $$ = createnode($1, "StatementWithoutTrailingSubstatement"); }
					| ExpressionStatement	{ $$ = createnode($1, "StatementWithoutTrailingSubstatement"); }
					| SwitchStatement	{ $$ = createnode($1, "StatementWithoutTrailingSubstatement"); }
					| BreakStatement	{ $$ = createnode($1, "StatementWithoutTrailingSubstatement"); }
					| ContinueStatement	{ $$ = createnode($1, "StatementWithoutTrailingSubstatement"); }
					| ReturnStatement	{ $$ = createnode($1, "StatementWithoutTrailingSubstatement"); }
					| DoStatement 	{ $$ = createnode($1, "StatementWithoutTrailingSubstatement"); }
					;
EmptyStatement	: SeparatorSemiCo   { $$ = createnode($1, "EmptyStatement"); }
		;
LabeledStatement: Identifier OperatorColon Statement 	{ 	string v1 = $2->getNodeVal();
						  		$$ = createnode($1, "LabeledStatement"); 
						  		$$->addChild($2);
							}
		;
LabeledStatementNoShortIf	: Identifier OperatorColon StatementNoShortIf 	{ $$ = createnode($1, "LabeledStatementNoShortIf"); 
										  $$->addChild($2);
										  $$->addChild($3);
										}
				;
ExpressionStatement 	: StatementExpression SeparatorSemiCo { $$ = createnode($1, "ExpressionStatement"); 
							  	$$->addChild($2);
							      }
			;
StatementExpression	: Assignment 	{ $$ = createnode($1, "StatementExpression"); }
			| PreIncrementExpression	{ $$ = createnode($1, "StatementExpression"); }
			| PreDecrementExpression	{ $$ = createnode($1, "StatementExpression"); }
			| PostIncrementExpression	{ $$ = createnode($1, "StatementExpression"); }
			| PostDecrementExpression	{ $$ = createnode($1, "StatementExpression"); }
			| MethodInvocation	{ $$ = createnode($1, "StatementExpression"); }
			| ClassInstanceCreationExpression 	{ $$ = createnode($1, "StatementExpression"); }
			;
IfThenStatement : KeywordIf SeparatorLParen Expression SeparatorRParen Statement 	{ 
										  	$$ = createnode($1, "IfThenStatement"); 
										$$->addChild($2);
										$$->addChild($3);
										$$->addChild($4);
										$$->addChild($5);
									}
		;
IfThenElseStatement 	: KeywordIf SeparatorLParen Expression SeparatorRParen StatementNoShortIf KeywordElse Statement 	{ 													  	$$ = createnode($1, "IfThenElseStatement"); 
														$$->addChild($2);
														$$->addChild($3);
														$$->addChild($4);
														$$->addChild($5);
														$$->addChild($6);
														$$->addChild($7);
													}
			;
IfThenElseStatementNoShortIf	: KeywordIf SeparatorLParen Expression SeparatorRParen StatementNoShortIf KeywordElse StatementNoShortIf 	{ 															  	$$ = createnode($1, "IfThenElseStatementNoShortIf"); 
																$$->addChild($2);
																$$->addChild($3);
																$$->addChild($4);
																$$->addChild($5);
																$$->addChild($6);
																$$->addChild($7);
															}
				;
SwitchStatement : KeywordSwitch SeparatorLParen Expression SeparatorRParen SwitchBlock 	{ 									  	$$ = createnode($1, "SwitchStatement"); 
										$$->addChild($2);
										$$->addChild($3);
										$$->addChild($4);
										$$->addChild($5);
									}
		;
SwitchBlock 	:  SeparatorLCuBrac SwitchBlockStatementGroups SeparatorRCuBrac	{											$$ = createnode($1, "SwitchBlock");
											$$->addChild($2);
											$$->addChild($3);
									}
		| SeparatorLCuBrac SeparatorRCuBrac 	{								$$ = createnode($1, "SwitchBlock");
							$$->addChild($2);
						}
		;
SwitchBlockStatementGroups 	: SwitchBlockStatementGroup 	{ $$ = createnode($1, "SwitchBlockStatementGroups"); }
				| SwitchBlockStatementGroups SwitchBlockStatementGroup 	{ $$ = createnode($1, "SwitchBlockStatementGroups"); 
											  $$->addChild($2);
											}
				;
SwitchBlockStatementGroup 	: SwitchLabels BlockStatements 	{ $$ = createnode($1, "SwitchBlockStatementGroup"); 
								  $$->addChild($2);
								}
				;
SwitchLabels	: SwitchLabel 	{ $$ = createnode($1, "SwitchLabels"); }
		| SwitchLabels SwitchLabel 	{ $$ = createnode($1, "SwitchLabels"); 
						  $$->addChild($2);
						}
		;
SwitchLabel 	: KeywordCase ConstantExpression OperatorColon   {										$$ = createnode($1, "SwitchLabel");
									$$->addChild($2);
									$$->addChild($3);
							}
		| KeywordDefault OperatorColon	{							$$ = createnode($1, "SwitchLabel");
							$$->addChild($2);
					}
		;
WhileStatement 	: KeywordWhile SeparatorLParen Expression SeparatorRParen Statement 	{ $$ = createnode($1, "WhileStatement"); 
											  $$->addChild($2);
											  $$->addChild($3);
											  $$->addChild($4);
											  $$->addChild($5);
											}
		;
WhileStatementNoShortIf : KeywordWhile SeparatorLParen Expression SeparatorRParen StatementNoShortIf 	{ 											  	$$ = createnode($1, "WhileStatementNoShortIf"); 
												$$->addChild($2);
												$$->addChild($3);
												$$->addChild($4);
												$$->addChild($5);
											}
			;
DoStatement : KeywordDo Statement KeywordWhile SeparatorLParen Expression SeparatorRParen SeparatorSemiCo 	{ 											  	$$ = createnode($1, "DoStatement"); 
												$$->addChild($2);
												$$->addChild($3);
												$$->addChild($4);
												$$->addChild($5);
												$$->addChild($6);
												$$->addChild($7);
											}
			;
ForStatement 	: KeywordFor SeparatorLParen ForInit SeparatorSemiCo Expression SeparatorSemiCo ForUpdate SeparatorRParen Statement 	{ $$ = createnode($1, "ForStatement"); 
											  $$->addChild($2);
											  $$->addChild($3);
											  $$->addChild($4);
											  $$->addChild($5);
											  $$->addChild($6);
											  $$->addChild($7);
											  $$->addChild($8);
											  $$->addChild($9);
											}
		| KeywordFor SeparatorLParen ForInit SeparatorSemiCo Expression SeparatorSemiCo SeparatorRParen Statement 	{ $$ = createnode($1, "ForStatement"); 
											  $$->addChild($2);
											  $$->addChild($3);
											  $$->addChild($4);
											  $$->addChild($5);
											  $$->addChild($6);
											  $$->addChild($7);
											  $$->addChild($8);
											}
		| KeywordFor SeparatorLParen ForInit SeparatorSemiCo SeparatorSemiCo ForUpdate SeparatorRParen Statement 	{ $$ = createnode($1, "ForStatement"); 
											  $$->addChild($2);
											  $$->addChild($3);
											  $$->addChild($4);
											  $$->addChild($5);
											  $$->addChild($6);
											  $$->addChild($7);
											  $$->addChild($8);
											}
		| KeywordFor SeparatorLParen ForInit SeparatorSemiCo SeparatorSemiCo SeparatorRParen Statement 	{ $$ = createnode($1, "ForStatement"); 
											  $$->addChild($2);
											  $$->addChild($3);
											  $$->addChild($4);
											  $$->addChild($5);
											  $$->addChild($6);
											  $$->addChild($7);
											}
		| KeywordFor SeparatorLParen SeparatorSemiCo Expression SeparatorSemiCo ForUpdate SeparatorRParen Statement 	{ $$ = createnode($1, "ForStatement"); 
											  $$->addChild($2);
											  $$->addChild($3);
											  $$->addChild($4);
											  $$->addChild($5);
											  $$->addChild($6);
											  $$->addChild($7);
											  $$->addChild($8);
											}
		| KeywordFor SeparatorLParen SeparatorSemiCo Expression SeparatorSemiCo SeparatorRParen Statement 	{ $$ = createnode($1, "ForStatement"); 
											  $$->addChild($2);
											  $$->addChild($3);
											  $$->addChild($4);
											  $$->addChild($5);
											  $$->addChild($6);
											  $$->addChild($7);
											}
		| KeywordFor SeparatorLParen SeparatorSemiCo SeparatorSemiCo ForUpdate SeparatorRParen Statement 	{ $$ = createnode($1, "ForStatement"); 
											  $$->addChild($2);
											  $$->addChild($3);
											  $$->addChild($4);
											  $$->addChild($5);
											  $$->addChild($6);
											  $$->addChild($7);
											}
		| KeywordFor SeparatorLParen SeparatorSemiCo SeparatorSemiCo SeparatorRParen Statement 	{ $$ = createnode($1, "ForStatement"); 
											  $$->addChild($2);
											  $$->addChild($3);
											  $$->addChild($4);
											  $$->addChild($5);
											  $$->addChild($6);
											}
	    | KeywordFor SeparatorLParen ForInit SeparatorSemiCo Expression SeparatorSemiCo error SeparatorRParen Statement SeparatorSemiCo { yyerrok;yyclearin;}
		;
ForStatementNoShortIf	: KeywordFor SeparatorLParen ForInit SeparatorSemiCo Expression SeparatorSemiCo ForUpdate SeparatorRParen StatementNoShortIf 	{ $$ = createnode($1, "ForStatementNoShortIf"); 
											  $$->addChild($2);
											  $$->addChild($3);
											  $$->addChild($4);
											  $$->addChild($5);
											  $$->addChild($6);
											  $$->addChild($7);
											  $$->addChild($8);
											  $$->addChild($9);
											}
			| KeywordFor SeparatorLParen ForInit SeparatorSemiCo Expression SeparatorSemiCo SeparatorRParen StatementNoShortIf 	{ $$ = createnode($1, "ForStatementNoShortIf"); 
												  $$->addChild($2);
												  $$->addChild($3);
												  $$->addChild($4);
												  $$->addChild($5);
												  $$->addChild($6);
												  $$->addChild($7);
												  $$->addChild($8);
												}
			| KeywordFor SeparatorLParen ForInit SeparatorSemiCo SeparatorSemiCo ForUpdate SeparatorRParen StatementNoShortIf 	{ $$ = createnode($1, "ForStatementNoShortIf"); 
												  $$->addChild($2);
												  $$->addChild($3);
												  $$->addChild($4);
												  $$->addChild($5);
												  $$->addChild($6);
												  $$->addChild($7);
												  $$->addChild($8);
												}
			| KeywordFor SeparatorLParen ForInit SeparatorSemiCo SeparatorSemiCo SeparatorRParen StatementNoShortIf 	{ $$ = createnode($1, "ForStatementNoShortIf"); 
												  $$->addChild($2);
												  $$->addChild($3);
												  $$->addChild($4);
												  $$->addChild($5);
												  $$->addChild($6);
												  $$->addChild($7);
												}
			| KeywordFor SeparatorLParen SeparatorSemiCo Expression SeparatorSemiCo ForUpdate SeparatorRParen StatementNoShortIf 	{ $$ = createnode($1, "ForStatementNoShortIf"); 
												  $$->addChild($2);
												  $$->addChild($3);
												  $$->addChild($4);
												  $$->addChild($5);
												  $$->addChild($6);
												  $$->addChild($7);
												  $$->addChild($8);
												}
			| KeywordFor SeparatorLParen SeparatorSemiCo Expression SeparatorSemiCo SeparatorRParen StatementNoShortIf 	{ $$ = createnode($1, "ForStatementNoShortIf"); 
												  $$->addChild($2);
												  $$->addChild($3);
												  $$->addChild($4);
												  $$->addChild($5);
												  $$->addChild($6);
												  $$->addChild($7);
												}
			| KeywordFor SeparatorLParen SeparatorSemiCo SeparatorSemiCo ForUpdate SeparatorRParen StatementNoShortIf 	{ $$ = createnode($1, "ForStatementNoShortIf"); 
												  $$->addChild($2);
												  $$->addChild($3);
												  $$->addChild($4);
												  $$->addChild($5);
												  $$->addChild($6);
												  $$->addChild($7);
												}
			| KeywordFor SeparatorLParen SeparatorSemiCo SeparatorSemiCo SeparatorRParen StatementNoShortIf 	{ $$ = createnode($1, "ForStatementNoShortIf"); 
												  $$->addChild($2);
												  $$->addChild($3);
												  $$->addChild($4);
												  $$->addChild($5);
												  $$->addChild($6);
												}
			;
ForInit 	: StatementExpressionList 	{ $$ = createnode($1, "ForInit"); }
		| LocalVariableDeclaration 	{ $$ = createnode($1, "ForInit"); }
		;
ForUpdate 	: StatementExpressionList 	{ $$ = createnode($1, "ForUpdate"); }

StatementExpressionList 	: StatementExpression 	{ $$ = createnode($1, "StatementExpressionList"); }
				| StatementExpressionList SeparatorComma StatementExpression 	{ $$ = createnode($1, "StatementExpressionList"); }
				;
BreakStatement	: KeywordBreak Identifier SeparatorSemiCo 	{ 						  	$$ = createnode($1, "BreakStatement"); 
							$$->addChild($2);
							$$->addChild($3);
						}
		| KeywordBreak SeparatorSemiCo	{					  	$$ = createnode($1, "BreakStatement"); 
						$$->addChild($2);
					}
		;
ContinueStatement	: KeywordContinue Identifier SeparatorSemiCo	{ 							  	$$ = createnode($1, "ContinueStatement"); 
								$$->addChild($2);
								$$->addChild($3);
							}
			| KeywordContinue SeparatorSemiCo	{ 						  	$$ = createnode($1, "ContinueStatement"); 
							$$->addChild($2);
						}
			;
ReturnStatement	: KeywordReturn Expression SeparatorSemiCo { 						  	$$ = createnode($1, "ReturnStatement"); 
							$$->addChild($2);
							$$->addChild($3);
						}
		| KeywordReturn SeparatorSemiCo	{ $$ = createnode($1, "ReturnStatement"); 
						$$->addChild($2);
					}
		;



Primary:	PrimaryNoNewArray		{ $$ = createnode($1, string("Primary")); }
		 |	ArrayCreationExpression { $$ = createnode($1, string("Primary")); };

PrimaryNoNewArray:	Literal			{ $$ = createnode($1, string("PrimaryNoNewArray")); }
				 |	KeywordThis			{ $$ = createnode($1, string("PrimaryNoNewArray")); }
				 |	SeparatorLParen Expression SeparatorRParen			{ $$ = createnode($1, string("PrimaryNoNewArray")); 
				 														$$->addChild($2);
																			$$->addChild($3);	}
				 |	ClassInstanceCreationExpression			{ $$ = createnode($1, string("PrimaryNoNewArray")); }
				 |	FieldAccess			{ $$ = createnode($1, string("PrimaryNoNewArray")); }
				 |	MethodInvocation		{ $$ = createnode($1, string("PrimaryNoNewArray")); }
				 |	ArrayAccess 			{ $$ = createnode($1, string("PrimaryNoNewArray")); };

ClassInstanceCreationExpression:	KeywordNew ClassType SeparatorLParen ArgumentList SeparatorRParen { $$ = createnode($1, string("ClassInstanceCreationExpression"));
																			$$->addChild($2);
																			$$->addChild($3); $$->addChild($4); $$->addChild($5);	 }
								|	KeywordNew ClassType SeparatorLParen  SeparatorRParen { $$ = createnode($1, string("ClassInstanceCreationExpression"));
																			$$->addChild($2);
																			$$->addChild($3); $$->addChild($4); };

ArgumentList:	Expression { $$ = createnode($1, string("ArgumentList")); }
			 |	ArgumentList SeparatorComma Expression { $$ = createnode($1, string("ArgumentList"));
			 										$$->addChild($2);
													 $$->addChild($3);  };

ArrayCreationExpression:	KeywordNew PrimitiveType DimExprs Dims { $$ = createnode($1, string("ArrayCreationExpression"));
			 										$$->addChild($2);
													 $$->addChild($3);
													  $$->addChild($4);  }
					|		KeywordNew PrimitiveType DimExprs  { $$ = createnode($1, string("ArrayCreationExpression"));
			 										$$->addChild($2);
													  $$->addChild($3);  }
					 |		KeywordNew ClassType DimExprs Dims { $$ = createnode($1, string("ArrayCreationExpression"));
			 										$$->addChild($2);
													 $$->addChild($3);
													  $$->addChild($4);  }
					|		KeywordNew ClassType DimExprs  { $$ = createnode($1, string("ArrayCreationExpression"));
			 										$$->addChild($2);
													  $$->addChild($3);  };

DimExprs:	DimExpr 	{ $$ = createnode($1, string("DimExprs")); }
		 |	DimExprs DimExpr { $$ = createnode($1, string("DimExprs"));
		 							$$->addChild($2);	 };

DimExpr:	SeparatorLSqBrac Expression SeparatorRSqBrac	 { $$ = createnode($1, string("DimExpr"));
		 							$$->addChild($2); $$->addChild($3);	 } ;

Dims:	SeparatorLSqBrac SeparatorRSqBrac		{ $$ = createnode($1, string("Dims"));
		 							$$->addChild($2);	 }
	|	Dims SeparatorLSqBrac SeparatorRSqBrac 	{ $$ = createnode($1, string("Dims"));
		 							$$->addChild($2); $$->addChild($3);	 } ;

FieldAccess:	Primary SeparatorDot Identifier		{ $$ = createnode($1, string("FieldAccess"));
		 							$$->addChild($2); $$->addChild($3);	 }
			 |	KeywordSuper SeparatorDot Identifier 	{ $$ = createnode($1, string("FieldAccess"));
		 							$$->addChild($2); $$->addChild($3);	 };


MethodInvocation:	Name SeparatorLParen ArgumentList SeparatorRParen		{ $$ = createnode($1, string("MethodInvocation"));
		 							$$->addChild($2); $$->addChild($3); $$->addChild($4);	 }
				 |	Name SeparatorLParen SeparatorRParen		{ $$ = createnode($1, string("MethodInvocation"));
		 							$$->addChild($2); $$->addChild($3);	 }
				 |	Primary SeparatorDot  Identifier SeparatorLParen ArgumentList SeparatorRParen		{ $$ = createnode($1, string("MethodInvocation"));
		 							$$->addChild($2); $$->addChild($3);  $$->addChild($4);	 $$->addChild($5);	 $$->addChild($6);	 }
				 |	Primary SeparatorDot  Identifier SeparatorLParen  SeparatorRParen		{ $$ = createnode($1, string("MethodInvocation"));
		 							$$->addChild($2); $$->addChild($3);  $$->addChild($4);	 $$->addChild($5); }
				 |	KeywordSuper SeparatorDot Identifier SeparatorLParen ArgumentList SeparatorRParen 	{ $$ = createnode($1, string("MethodInvocation"));
		 							$$->addChild($2); $$->addChild($3);	$$->addChild($4);	 $$->addChild($5);	 $$->addChild($6); }
				 |	KeywordSuper SeparatorDot Identifier SeparatorLParen  SeparatorRParen 	{ $$ = createnode($1, string("MethodInvocation"));
		 							$$->addChild($2); $$->addChild($3);	$$->addChild($4);	 $$->addChild($5); };

ArrayAccess:	Name SeparatorLSqBrac Expression SeparatorRSqBrac	{ $$ = createnode($1, string("ArrayAccess"));
		 							$$->addChild($2); $$->addChild($3); $$->addChild($4);	 }
			 |	PrimaryNoNewArray SeparatorLSqBrac Expression SeparatorRSqBrac { $$ = createnode($1, string("ArrayAccess"));
		 							$$->addChild($2); $$->addChild($3); $$->addChild($4);	 };

PostfixExpression:	Primary			{ $$ = createnode($1, string("PostfixExpression"));}
				 |	Name			{ $$ = createnode($1, string("PostfixExpression"));}
				 |	PostIncrementExpression		{ $$ = createnode($1, string("PostfixExpression"));}
				 |	PostDecrementExpression 		{ $$ = createnode($1, string("PostfixExpression"));};						 

PostIncrementExpression:	PostfixExpression OperatorPlPl	{ $$ = createnode($1, string("PostIncrementExpression"));
		 											$$->addChild($2); } ;	

PostDecrementExpression:	PostfixExpression OperatorMiMi { $$ = createnode($1, string("PostDecrementExpression"));
		 											$$->addChild($2); } ;

UnaryExpression:	PreIncrementExpression		{ $$ = createnode($1, string("UnaryExpression")); }
				 |	PreDecrementExpression		{ $$ = createnode($1, string("UnaryExpression")); }
				 |	OperatorPl UnaryExpression		{ $$ = createnode($1, string("UnaryExpression"));
		 											$$->addChild($2); } 
				 |	OperatorMi UnaryExpression		{ $$ = createnode($1, string("UnaryExpression"));
		 											$$->addChild($2); } 
				 |	UnaryExpressionNotPlusMinus 	{ $$ = createnode($1, string("UnaryExpression")); };

PreIncrementExpression:	OperatorPlPl UnaryExpression	{ $$ = createnode($1, string("PreIncrementExpression"));
		 											$$->addChild($2); } ;

PreDecrementExpression:	OperatorMiMi UnaryExpression	{ $$ = createnode($1, string("PreDecrementExpression"));
		 											$$->addChild($2); } ;

UnaryExpressionNotPlusMinus:	PostfixExpression		{ $$ = createnode($1, string("UnaryExpressionNotPlusMinus"));	}
						 |	OperatorTild UnaryExpression	{ $$ = createnode($1, string("UnaryExpressionNotPlusMinus"));
		 											$$->addChild($2); }
						 |	OperatorExcl UnaryExpression	{ $$ = createnode($1, string("UnaryExpressionNotPlusMinus"));
		 											$$->addChild($2); }
						 |	CastExpression 	{ $$ = createnode($1, string("UnaryExpressionNotPlusMinus")); };

CastExpression:	SeparatorLParen PrimitiveType Dims SeparatorRParen UnaryExpression		{ $$ = createnode($1, string("CastExpression"));
		 						$$->addChild($2);	$$->addChild($3);	$$->addChild($4);	$$->addChild($5); }
			 |	SeparatorLParen PrimitiveType  SeparatorRParen UnaryExpression		{ $$ = createnode($1, string("CastExpression"));
		 						$$->addChild($2);	$$->addChild($3);	$$->addChild($4);	}
			 |	SeparatorLParen Expression SeparatorRParen UnaryExpressionNotPlusMinus	{ $$ = createnode($1, string("CastExpression"));
		 						$$->addChild($2);	$$->addChild($3);	$$->addChild($4);	 }
			 |	SeparatorLParen Name Dims SeparatorRParen UnaryExpressionNotPlusMinus 	{ $$ = createnode($1, string("CastExpression"));
		 						$$->addChild($2);	$$->addChild($3);	$$->addChild($4);	$$->addChild($5); };

MultiplicativeExpression:	UnaryExpression			{ $$ = createnode($1, string("MultiplicativeExpression"));	}
						 |	MultiplicativeExpression OperatorMul UnaryExpression		{ $$ = createnode($1, string("MultiplicativeExpression"));
		 											$$->addChild($2);	$$->addChild($3); } 
						|	MultiplicativeExpression OperatorDiv UnaryExpression	{ $$ = createnode($1, string("MultiplicativeExpression"));
		 											$$->addChild($2);	$$->addChild($3); } 
						|	MultiplicativeExpression OperatorPerc UnaryExpression 	{ $$ = createnode($1, string("MultiplicativeExpression"));
		 											$$->addChild($2);	$$->addChild($3); } 
						| MultiplicativeExpression OperatorMul error UnaryExpression { yyerrok;yyclearin; }
						| MultiplicativeExpression OperatorDiv error UnaryExpression { yyerrok;yyclearin; }
						| MultiplicativeExpression OperatorPerc error UnaryExpression { yyerrok;yyclearin; };

AdditiveExpression:	MultiplicativeExpression			{ $$ = createnode($1, string("AdditiveExpression"));	}
				 |	AdditiveExpression OperatorPl MultiplicativeExpression		{ $$ = createnode($1, string("AdditiveExpression"));
		 											$$->addChild($2);	$$->addChild($3); }
				|	AdditiveExpression OperatorMi MultiplicativeExpression	{ $$ = createnode($1, string("AdditiveExpression"));
		 											$$->addChild($2);	$$->addChild($3); } ;	

ShiftExpression:	AdditiveExpression	{ $$ = createnode($1, string("ShiftExpression"));	}
				|	ShiftExpression OperatorLeLe AdditiveExpression		{ $$ = createnode($1, string("ShiftExpression"));
		 											$$->addChild($2);	$$->addChild($3); }
				 |	ShiftExpression OperatorGrGr AdditiveExpression		{ $$ = createnode($1, string("ShiftExpression"));
		 											$$->addChild($2);	$$->addChild($3); }
				|	ShiftExpression OperatorGrGrGr AdditiveExpression 		{ $$ = createnode($1, string("ShiftExpression"));
		 											$$->addChild($2);	$$->addChild($3); };					 

RelationalExpression:	ShiftExpression			{ $$ = createnode($1, string("RelationalExpression"));	}
					 |	RelationalExpression OperatorLe ShiftExpression		{ $$ = createnode($1, string("RelationalExpression"));
		 											$$->addChild($2);	$$->addChild($3); }
					 |	RelationalExpression OperatorGr ShiftExpression		{ $$ = createnode($1, string("RelationalExpression"));
		 											$$->addChild($2);	$$->addChild($3); }
					 |	RelationalExpression OperatorLeEq ShiftExpression	{ $$ = createnode($1, string("RelationalExpression"));
		 											$$->addChild($2);	$$->addChild($3); }
					 |	RelationalExpression OperatorGrEq ShiftExpression		{ $$ = createnode($1, string("RelationalExpression"));
		 											$$->addChild($2);	$$->addChild($3); }
					 |	RelationalExpression KeywordInstanceof ReferenceType { $$ = createnode($1, string("RelationalExpression"));
		 											$$->addChild($2);	$$->addChild($3); };

EqualityExpression:	RelationalExpression		{ $$ = createnode($1, string("EqualityExpression"));	}
				 |	EqualityExpression OperatorEqEq RelationalExpression 	{ $$ = createnode($1, string("EqualityExpression"));
		 											$$->addChild($2);	$$->addChild($3); }
				 |	EqualityExpression OperatorNE RelationalExpression 	{ $$ = createnode($1, string("EqualityExpression"));
		 											$$->addChild($2);	$$->addChild($3); };

AndExpression:	EqualityExpression		{ $$ = createnode($1, string("AndExpression"));	}
			 |	AndExpression OperatorAmp EqualityExpression { $$ = createnode($1, string("AndExpression"));
		 											$$->addChild($2);	$$->addChild($3); };

ExclusiveOrExpression:	AndExpression		{ $$ = createnode($1, string("ExclusiveOrExpression"));	}
					|	ExclusiveOrExpression OperatorUp AndExpression { $$ = createnode($1, string("ExclusiveOrExpression"));
		 											$$->addChild($2);	$$->addChild($3); };

InclusiveOrExpression:	ExclusiveOrExpression	{ $$ = createnode($1, string("InclusiveOrExpression"));	}
					 |	InclusiveOrExpression OperatorVert ExclusiveOrExpression  { $$ = createnode($1, string("InclusiveOrExpression"));
		 											$$->addChild($2);	$$->addChild($3); };

ConditionalAndExpression:	InclusiveOrExpression	{ $$ = createnode($1, string("ConditionalAndExpression"));	}
						|	ConditionalAndExpression OperatorAnd InclusiveOrExpression	  { $$ = createnode($1, string("ConditionalAndExpression"));
		 											$$->addChild($2);	$$->addChild($3); } ;

ConditionalOrExpression:	ConditionalAndExpression		{ $$ = createnode($1, string("ConditionalOrExpression"));	}
						 |	ConditionalOrExpression OperatorOr ConditionalAndExpression   { $$ = createnode($1, string("ConditionalOrExpression"));
		 											$$->addChild($2);	$$->addChild($3); } ;								 

ConditionalExpression:	ConditionalOrExpression	{ $$ = createnode($1, string("ConditionalExpression"));	}
					|	ConditionalOrExpression OperatorQm Expression OperatorColon ConditionalExpression 	  { $$ = createnode($1, string("ConditionalExpression"));
		 											$$->addChild($2);	$$->addChild($3);	$$->addChild($4);	$$->addChild($5); } ;

AssignmentExpression:	ConditionalExpression	{ $$ = createnode($1, string("AssignmentExpression"));	}
					|	Assignment	{ $$ = createnode($1, string("AssignmentExpression"));	};	

Assignment:	LeftHandSide AssignmentOperator AssignmentExpression 	{ $$ = createnode($1, string("Assignment"));
		 											$$->addChild($2);	$$->addChild($3); };					

LeftHandSide:	Name		{ $$ = createnode($1, string("LeftHandSide"));	}
			 |	FieldAccess	{ $$ = createnode($1, string("LeftHandSide"));	}
 			 |	ArrayAccess 	{ $$ = createnode($1, string("LeftHandSide"));	};

AssignmentOperator:	OperatorEq	{ $$ = createnode($1, string("AssignmentOperator"));	}
				 |	 OperatorAsEq	{ $$ = createnode($1, string("AssignmentOperator"));	}
				 |	 OperatorSlEq	{ $$ = createnode($1, string("AssignmentOperator"));	}
				 |	 OperatorPercEq	{ $$ = createnode($1, string("AssignmentOperator"));	}
				 |	 OperatorPlEq	{ $$ = createnode($1, string("AssignmentOperator"));	}
				 |	 OperatorMiEq	{ $$ = createnode($1, string("AssignmentOperator"));	}
				 |	 OperatorLeLeEq	{ $$ = createnode($1, string("AssignmentOperator"));	}
				 |	 OperatorGrGrEq		{ $$ = createnode($1, string("AssignmentOperator"));	}
				 |	 OperatorGrGrGrEq	{ $$ = createnode($1, string("AssignmentOperator"));	}
				 |	 OperatorAmpEq	{ $$ = createnode($1, string("AssignmentOperator"));	}
				 |	 OperatorUpEq	{ $$ = createnode($1, string("AssignmentOperator"));	}
				 |	 OperatorVertEq { $$ = createnode($1, string("AssignmentOperator"));	};

Expression:	AssignmentExpression 	{ $$ = createnode($1, string("Expression"));	};

ConstantExpression:	Expression { $$ = createnode($1, string("ConstantExpression"));	};
%%


// function definitions
int counterr ;
void ErrorIni()
{
	counterr=0;
}
void ErrorCount()
{
	counterr++;
}
int FindCounterr()
{
	return counterr;
}
Node* createnode( Node* child, string type, string value)
{
    Node * n = new Node(type, value);
    n->addChild(child);
    return n;

}

void assignRoot(Node * n)
{
	root = n;
}


void yyerror(char *s) {
	printf("EEK, parse error!  Message: %d \n" , yylineno );
	// might as well halt now:
	exit(-1);
}
  
void dot_convert(string inputname)
{
	fstream fp; 
	fp.open(inputname ,ios::out);  
	if(!fp) 
	{
	   cout<<"File not created";
	}
	else
	{
	   fp <<"digraph G{ "<<endl;     //Writing to file

	   queue <pair<Node *,Node *>> g;
	   
    	int num = 1, i;
	   map<int,string> token_type;
  	   map<int,string> values ;
	   map<int, string>::iterator it ;
		pair<Node *, Node*> init ;
	   Node* curr ; Node* next ;
	   g.push(make_pair(root, root->child[0])) ;
		token_type[root->nodeNo] = root->getNodeType() ;
 	   while (!g.empty()) 
	  { 
		init = g.front();
		curr = init.second; 
		g.pop(); 
		
		i = 0;
		int size = curr->child.size() ;
		if(size>1)
		{
			token_type[init.first->nodeNo] = init.first->getNodeType() ;
			fp << init.first->nodeNo  << "->" << curr->nodeNo << ";" << endl ;
		}
		while(i < size )
		{
			next = curr->child[i];
			next->nodeNo = num ;
			if(size!=1)
			{
				token_type[curr->nodeNo] = curr->getNodeType() ;
				g.push(make_pair(curr,next));
			}
			else
			{
				token_type[init.first->nodeNo] = init.first->getNodeType() ;
				g.push(make_pair(init.first,next));
			}
			if(next->child.size()==0)
			{
				token_type[next->nodeNo] = next->getNodeType() ;
				values[next->nodeNo] = next->getNodeVal();
				if(size==1)
				{
					fp << init.first->nodeNo  << "->" << next->nodeNo << ";" << endl ;
				}
				else
				{
					if(token_type.find(curr->nodeNo) == token_type.end() )
					{
						token_type[curr->nodeNo] == curr->getNodeType();
						fp << init.first->nodeNo  << "->" << curr->nodeNo << ";" << endl ;
						fp << curr->nodeNo  << "->" << next->nodeNo << ";" << endl ;
						
					}
					else
					{
						fp << curr->nodeNo  << "->" << next->nodeNo << ";" << endl ;
					}
					
				}
				
			}
			num++; i++;
		}
		
	  }
	  for(map<int, string>::iterator it = token_type.begin(); it!=token_type.end(); it++)
		{
			if(values.find(it->first) == values.end())	//not a leaf
			{
				fp<<it->first<<" "<<"[label=\""<<it->second<<"\"];"<<endl;
			}
			else
			{
				fp<<it->first<<" "<<"[label=\""<<it->second<<"\\n\\n"<<values[it->first]<<" \"];"<<endl;
			}
		}
	   fp <<"}"<<endl;     //Writing to file

 
	   fp.close();
        }

}
int main(int argc, char* argv[])  
{ 
   FILE *fp = fopen(argv[1], "r");
   ErrorIni();
     if(fp)
     {
       yyin = fp;
     }
   do {
          yyparse();
     } while (!feof(yyin));
	
	if(FindCounterr() == 0)
    {
	 string filename = argv[1] ;
    int posOfDot = filename.find('.');
		 string outName = filename.substr(0, posOfDot);
		 outName += ".dot";
		 dot_convert(outName); 
		 cout<<"Success, dotfile "<<outName<<" created"<<endl;
     }
    else cout << "errors detected - : " << FindCounterr() << endl ;
   return 0;
}   

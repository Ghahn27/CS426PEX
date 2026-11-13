using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using CS426.node;

namespace CS426.analysis
{
    internal class SemanticAnalyzer : DepthFirstAdapter
    {
        // Global syumbol table: kepe track of global stuff
        // example: function definitions, data types, constants
        Dictionary<string, Definition> globalSymbolTable = new Dictionary<string, Definition>();

        // Local symbol table: keep track of local stuff
        // example: local variables, function parameters
        Dictionary<string, Definition> localSymbolTable = new Dictionary<string, Definition>();

        //Decorate Nodes
        Dictionary<Node, Definition> decoratedParseTree = new Dictionary<Node, Definition>();

        public void PrintWarning(Token t, String message)
        {
            Console.WriteLine("Line " +  t.Line + " Col " + t.Pos + ": " + message);
        }


        // Two types match when they have the same name ("int", "float", "str", "bool")
        public bool SameType(Definition a, Definition b)
        {
            return a != null && b != null && a.name == b.name;
        }

        // Look up a name in the local table first, then the global table
        public Definition LookUp(String name)
        {
            Definition def;

            if (localSymbolTable.TryGetValue(name, out def))
            {
                return def;
            }
            if (globalSymbolTable.TryGetValue(name, out def))
            {
                return def;
            }
            return null;
        }

        // The procedure currently being analyzed (so params can be added to it)
        FunctionDefinition currentFunction;

        public override void InAProgram(AProgram node)
        {
            /*
            // Create Definitoion for integers
            Definition intDefinition = new NumberDefinition();
            intDefinition.name = "INF";

            Definition strDefinition = new StringDefinition();
            strDefinition.name = "CBRN";

            // register the defininiton with the global symbol table
            globalSymbolTable.Add("INF", intDefinition);
            globalSymbolTable.Add("CBRN", strDefinition);

            Console.WriteLine("Semantic analysis started");
            */

        }


        // Assuming I have to add the rest of language outside of operands



        //------------------
        // Operands
        //------------------



        public override void OutAIntOperand(AIntOperand node)
        {
            {   //Create Def
                Definition intDefinition = new NumberDefinition();
                intDefinition.name = "int";

                decoratedParseTree.Add(node, intDefinition);
            }
        }

        public override void OutAFloatOperand(AFloatOperand node)
        {
            Definition floatDefinition = new NumberDefinition();
            floatDefinition.name = "float";

            decoratedParseTree.Add(node, floatDefinition);
        }

        public override void OutAStringOperand(AStringOperand node)
        {
            //Def
            Definition strDefinition = new StringDefinition();
            strDefinition.name = "str";

            decoratedParseTree.Add(node, strDefinition);
        }

        public override void OutAVariableOperand(AVariableOperand node)
        {
            // Get name of ID
            String varName = node.GetId().Text;

            Definition varDefinition;

            // Check locals first, then globals (constants live in the global table)
            if(!localSymbolTable.TryGetValue(varName, out varDefinition) &&
               !globalSymbolTable.TryGetValue(varName, out varDefinition))
            {
                PrintWarning(node.GetId(), varName + " Does not exist");
            }

            //Test to see if varDef is a var.
            else if (!(varDefinition is VariableDefinition))
            {
                PrintWarning(node.GetId(), varName + " is not a variable");
            }
            else
            {
                VariableDefinition v = (VariableDefinition)varDefinition;

                decoratedParseTree.Add(node, v.VariableType);

            }
        }

        //----------
        //Expression
        //----------

        // Each pass method copies its child's definition up one level,
        // so an operand's type reaches the top of the expression

        public override void OutAPassFactor(APassFactor node)
        {
            Definition operandDefinition;

            if (decoratedParseTree.TryGetValue(node.GetOperand(), out operandDefinition))
            {
                decoratedParseTree.Add(node, operandDefinition);
            }
        }

        public override void OutAPassTerm(APassTerm node)
        {
            Definition factorDefinition;

            if (decoratedParseTree.TryGetValue(node.GetFactor(), out factorDefinition))
            {
                decoratedParseTree.Add(node, factorDefinition);
            }
        }

        public override void OutAPassArith(APassArith node)
        {
            Definition termDefinition;

            if (decoratedParseTree.TryGetValue(node.GetTerm(), out termDefinition))
            {
                decoratedParseTree.Add(node, termDefinition);
            }
        }

        public override void OutAPassRelational(APassRelational node)
        {
            Definition arithDefinition;

            if (decoratedParseTree.TryGetValue(node.GetArith(), out arithDefinition))
            {
                decoratedParseTree.Add(node, arithDefinition);
            }
        }

        public override void OutAPassEquality(APassEquality node)
        {
            Definition relationalDefinition;

            if (decoratedParseTree.TryGetValue(node.GetRelational(), out relationalDefinition))
            {
                decoratedParseTree.Add(node, relationalDefinition);
            }
        }

        public override void OutAPassNotExpr(APassNotExpr node)
        {
            Definition equalityDefinition;

            if (decoratedParseTree.TryGetValue(node.GetEquality(), out equalityDefinition))
            {
                decoratedParseTree.Add(node, equalityDefinition);
            }
        }

        public override void OutAPassAndExpr(APassAndExpr node)
        {
            Definition notExprDefinition;

            if (decoratedParseTree.TryGetValue(node.GetNotExpr(), out notExprDefinition))
            {
                decoratedParseTree.Add(node, notExprDefinition);
            }
        }

        public override void OutAPassExpression(APassExpression node)
        {
            Definition andExprDefinition;

            if (decoratedParseTree.TryGetValue(node.GetAndExpr(), out andExprDefinition))
            {
                decoratedParseTree.Add(node, andExprDefinition);
            }
        }

        public override void OutAParenOperand(AParenOperand node)
        {
            Definition expressionDefinition;

            // ( expression ) has the same type as the expression inside it
            if (decoratedParseTree.TryGetValue(node.GetExpression(), out expressionDefinition))
            {
                decoratedParseTree.Add(node, expressionDefinition);
            }
        }

        //---------------------
        // Arithmetic operators
        //---------------------

        // Unary minus: operand must be a number, result is the same type
        public override void OutANegativeFactor(ANegativeFactor node)
        {
            Definition factorDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetFactor(), out factorDefinition))
            {
                // child already failed and printed its own warning
            }
            else if (!(factorDefinition is NumberDefinition))
            {
                PrintWarning(node.GetMinus(), "Cannot negate a " + factorDefinition.name);
            }
            else
            {
                decoratedParseTree.Add(node, factorDefinition);
            }
        }

        // Binary arithmetic: both sides must be the same number type, result is that type
        public override void OutAMultTerm(AMultTerm node)
        {
            Definition termDefinition;
            Definition factorDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetTerm(), out termDefinition) ||
                !decoratedParseTree.TryGetValue(node.GetFactor(), out factorDefinition))
            {
                // child already failed and printed its own warning
            }
            else if (!(termDefinition is NumberDefinition) || !SameType(termDefinition, factorDefinition))
            {
                PrintWarning(node.GetMult(), "Cannot multiply " + termDefinition.name + " by " + factorDefinition.name);
            }
            else
            {
                decoratedParseTree.Add(node, termDefinition);
            }
        }

        public override void OutADivTerm(ADivTerm node)
        {
            Definition termDefinition;
            Definition factorDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetTerm(), out termDefinition) ||
                !decoratedParseTree.TryGetValue(node.GetFactor(), out factorDefinition))
            {
                // child already failed and printed its own warning
            }
            else if (!(termDefinition is NumberDefinition) || !SameType(termDefinition, factorDefinition))
            {
                PrintWarning(node.GetDiv(), "Cannot divide " + termDefinition.name + " by " + factorDefinition.name);
            }
            else
            {
                decoratedParseTree.Add(node, termDefinition);
            }
        }

        public override void OutAAddArith(AAddArith node)
        {
            Definition arithDefinition;
            Definition termDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetArith(), out arithDefinition) ||
                !decoratedParseTree.TryGetValue(node.GetTerm(), out termDefinition))
            {
                // child already failed and printed its own warning
            }
            else if (!(arithDefinition is NumberDefinition) || !SameType(arithDefinition, termDefinition))
            {
                PrintWarning(node.GetPlus(), "Cannot add " + arithDefinition.name + " and " + termDefinition.name);
            }
            else
            {
                decoratedParseTree.Add(node, arithDefinition);
            }
        }

        public override void OutASubArith(ASubArith node)
        {
            Definition arithDefinition;
            Definition termDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetArith(), out arithDefinition) ||
                !decoratedParseTree.TryGetValue(node.GetTerm(), out termDefinition))
            {
                // child already failed and printed its own warning
            }
            else if (!(arithDefinition is NumberDefinition) || !SameType(arithDefinition, termDefinition))
            {
                PrintWarning(node.GetMinus(), "Cannot subtract " + termDefinition.name + " from " + arithDefinition.name);
            }
            else
            {
                decoratedParseTree.Add(node, arithDefinition);
            }
        }

        //---------------------
        // Relational operators
        //---------------------

        // Both sides must be the same number type, result is a bool
        public override void OutALessRelational(ALessRelational node)
        {
            Definition relationalDefinition;
            Definition arithDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetRelational(), out relationalDefinition) ||
                !decoratedParseTree.TryGetValue(node.GetArith(), out arithDefinition))
            {
                // child already failed and printed its own warning
            }
            else if (!(relationalDefinition is NumberDefinition) || !SameType(relationalDefinition, arithDefinition))
            {
                PrintWarning(node.GetLess(), "Cannot compare " + relationalDefinition.name + " < " + arithDefinition.name);
            }
            else
            {
                Definition boolDefinition = new BooleanDefinition();
                boolDefinition.name = "bool";

                decoratedParseTree.Add(node, boolDefinition);
            }
        }

        public override void OutAGreaterRelational(AGreaterRelational node)
        {
            Definition relationalDefinition;
            Definition arithDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetRelational(), out relationalDefinition) ||
                !decoratedParseTree.TryGetValue(node.GetArith(), out arithDefinition))
            {
                // child already failed and printed its own warning
            }
            else if (!(relationalDefinition is NumberDefinition) || !SameType(relationalDefinition, arithDefinition))
            {
                PrintWarning(node.GetGreater(), "Cannot compare " + relationalDefinition.name + " > " + arithDefinition.name);
            }
            else
            {
                Definition boolDefinition = new BooleanDefinition();
                boolDefinition.name = "bool";

                decoratedParseTree.Add(node, boolDefinition);
            }
        }

        public override void OutALesseqRelational(ALesseqRelational node)
        {
            Definition relationalDefinition;
            Definition arithDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetRelational(), out relationalDefinition) ||
                !decoratedParseTree.TryGetValue(node.GetArith(), out arithDefinition))
            {
                // child already failed and printed its own warning
            }
            else if (!(relationalDefinition is NumberDefinition) || !SameType(relationalDefinition, arithDefinition))
            {
                PrintWarning(node.GetLesseq(), "Cannot compare " + relationalDefinition.name + " <-= " + arithDefinition.name);
            }
            else
            {
                Definition boolDefinition = new BooleanDefinition();
                boolDefinition.name = "bool";

                decoratedParseTree.Add(node, boolDefinition);
            }
        }

        public override void OutAGreatereqRelational(AGreatereqRelational node)
        {
            Definition relationalDefinition;
            Definition arithDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetRelational(), out relationalDefinition) ||
                !decoratedParseTree.TryGetValue(node.GetArith(), out arithDefinition))
            {
                // child already failed and printed its own warning
            }
            else if (!(relationalDefinition is NumberDefinition) || !SameType(relationalDefinition, arithDefinition))
            {
                PrintWarning(node.GetGreatereq(), "Cannot compare " + relationalDefinition.name + " ->= " + arithDefinition.name);
            }
            else
            {
                Definition boolDefinition = new BooleanDefinition();
                boolDefinition.name = "bool";

                decoratedParseTree.Add(node, boolDefinition);
            }
        }

        //-------------------
        // Equality operators
        //-------------------

        // Both sides must be the same type (any type), result is a bool
        public override void OutAEquivEquality(AEquivEquality node)
        {
            Definition equalityDefinition;
            Definition relationalDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetEquality(), out equalityDefinition) ||
                !decoratedParseTree.TryGetValue(node.GetRelational(), out relationalDefinition))
            {
                // child already failed and printed its own warning
            }
            else if (!SameType(equalityDefinition, relationalDefinition))
            {
                PrintWarning(node.GetEquiv(), "Cannot compare " + equalityDefinition.name + " --> " + relationalDefinition.name);
            }
            else
            {
                Definition boolDefinition = new BooleanDefinition();
                boolDefinition.name = "bool";

                decoratedParseTree.Add(node, boolDefinition);
            }
        }

        public override void OutANotequivEquality(ANotequivEquality node)
        {
            Definition equalityDefinition;
            Definition relationalDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetEquality(), out equalityDefinition) ||
                !decoratedParseTree.TryGetValue(node.GetRelational(), out relationalDefinition))
            {
                // child already failed and printed its own warning
            }
            else if (!SameType(equalityDefinition, relationalDefinition))
            {
                PrintWarning(node.GetNotequiv(), "Cannot compare " + equalityDefinition.name + " #--> " + relationalDefinition.name);
            }
            else
            {
                Definition boolDefinition = new BooleanDefinition();
                boolDefinition.name = "bool";

                decoratedParseTree.Add(node, boolDefinition);
            }
        }

        //------------------
        // Logical operators
        //------------------

        // Operands must be bools, result is a bool
        public override void OutANotNotExpr(ANotNotExpr node)
        {
            Definition notExprDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetNotExpr(), out notExprDefinition))
            {
                // child already failed and printed its own warning
            }
            else if (!(notExprDefinition is BooleanDefinition))
            {
                PrintWarning(node.GetNot(), "Cannot apply # to a " + notExprDefinition.name);
            }
            else
            {
                decoratedParseTree.Add(node, notExprDefinition);
            }
        }

        public override void OutAAndAndExpr(AAndAndExpr node)
        {
            Definition andExprDefinition;
            Definition notExprDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetAndExpr(), out andExprDefinition) ||
                !decoratedParseTree.TryGetValue(node.GetNotExpr(), out notExprDefinition))
            {
                // child already failed and printed its own warning
            }
            else if (!(andExprDefinition is BooleanDefinition) || !(notExprDefinition is BooleanDefinition))
            {
                PrintWarning(node.GetAnd(), "Cannot & " + andExprDefinition.name + " and " + notExprDefinition.name);
            }
            else
            {
                decoratedParseTree.Add(node, andExprDefinition);
            }
        }

        public override void OutAOrExpression(AOrExpression node)
        {
            Definition expressionDefinition;
            Definition andExprDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetExpression(), out expressionDefinition) ||
                !decoratedParseTree.TryGetValue(node.GetAndExpr(), out andExprDefinition))
            {
                // child already failed and printed its own warning
            }
            else if (!(expressionDefinition is BooleanDefinition) || !(andExprDefinition is BooleanDefinition))
            {
                PrintWarning(node.GetOr(), "Cannot | " + expressionDefinition.name + " and " + andExprDefinition.name);
            }
            else
            {
                decoratedParseTree.Add(node, expressionDefinition);
            }
        }

        //------
        // Types
        //------

        // Label each type keyword with the same names the operands use
        public override void OutAIntType(AIntType node)
        {
            Definition intDefinition = new NumberDefinition();
            intDefinition.name = "int";

            decoratedParseTree.Add(node, intDefinition);
        }

        public override void OutAFloatType(AFloatType node)
        {
            Definition floatDefinition = new NumberDefinition();
            floatDefinition.name = "float";

            decoratedParseTree.Add(node, floatDefinition);
        }

        public override void OutAStringType(AStringType node)
        {
            Definition strDefinition = new StringDefinition();
            strDefinition.name = "str";

            decoratedParseTree.Add(node, strDefinition);
        }

        //-----------
        // Statements
        //-----------

        // TYPE id ;  -> add a new local variable
        public override void OutADeclareStatement(ADeclareStatement node)
        {
            String varName = node.GetId().Text;
            Definition typeDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetType(), out typeDefinition))
            {
                // type failed to decorate
            }
            else if (LookUp(varName) != null)
            {
                PrintWarning(node.GetId(), varName + " is already defined");
            }
            else
            {
                VariableDefinition varDefinition = new VariableDefinition();
                varDefinition.name = varName;
                varDefinition.VariableType = (TypeDefinition)typeDefinition;

                localSymbolTable.Add(varName, varDefinition);
                decoratedParseTree.Add(node, varDefinition);
            }
        }

        // id -> expression ;  -> id must be a non-constant variable of the same type
        public override void OutAAssignStatement(AAssignStatement node)
        {
            String varName = node.GetId().Text;
            Definition varDefinition = LookUp(varName);
            Definition expressionDefinition;

            if (varDefinition == null)
            {
                PrintWarning(node.GetId(), varName + " Does not exist");
            }
            else if (!(varDefinition is VariableDefinition))
            {
                PrintWarning(node.GetId(), varName + " is not a variable");
            }
            else if (varDefinition is ConstantDefinition)
            {
                PrintWarning(node.GetId(), varName + " is a constant and cannot be assigned to");
            }
            else if (!decoratedParseTree.TryGetValue(node.GetExpression(), out expressionDefinition))
            {
                // expression already failed and printed its own warning
            }
            else if (!SameType(((VariableDefinition)varDefinition).VariableType, expressionDefinition))
            {
                PrintWarning(node.GetAssign(), "Cannot assign " + expressionDefinition.name + " to " +
                    varName + " (" + ((VariableDefinition)varDefinition).VariableType.name + ")");
            }
            else
            {
                decoratedParseTree.Add(node, varDefinition);
            }
        }

        // SOP TYPE id -> expression ;  -> add a new global constant
        public override void OutAConstant(AConstant node)
        {
            String constName = node.GetId().Text;
            Definition typeDefinition;
            Definition expressionDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetType(), out typeDefinition))
            {
                // type failed to decorate
            }
            else if (globalSymbolTable.ContainsKey(constName))
            {
                PrintWarning(node.GetId(), constName + " is already defined");
            }
            else if (!decoratedParseTree.TryGetValue(node.GetExpression(), out expressionDefinition))
            {
                // expression already failed and printed its own warning
            }
            else if (!SameType(typeDefinition, expressionDefinition))
            {
                PrintWarning(node.GetAssign(), "Cannot assign " + expressionDefinition.name + " to constant " +
                    constName + " (" + typeDefinition.name + ")");
            }
            else
            {
                ConstantDefinition constDefinition = new ConstantDefinition();
                constDefinition.name = constName;
                constDefinition.VariableType = (TypeDefinition)typeDefinition;

                globalSymbolTable.Add(constName, constDefinition);
                decoratedParseTree.Add(node, constDefinition);
            }
        }

        // TLP ( expression ) block  -> condition must be a bool
        public override void OutAIfIfStatement(AIfIfStatement node)
        {
            Definition expressionDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetExpression(), out expressionDefinition))
            {
                // expression already failed and printed its own warning
            }
            else if (!(expressionDefinition is BooleanDefinition))
            {
                PrintWarning(node.GetTlp(), "TLP condition must be a bool, not " + expressionDefinition.name);
            }
        }

        public override void OutAIfelseIfStatement(AIfelseIfStatement node)
        {
            Definition expressionDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetExpression(), out expressionDefinition))
            {
                // expression already failed and printed its own warning
            }
            else if (!(expressionDefinition is BooleanDefinition))
            {
                PrintWarning(node.GetTlp(), "TLP condition must be a bool, not " + expressionDefinition.name);
            }
        }

        // STX ( expression ) block  -> condition must be a bool
        public override void OutAWhileStatement(AWhileStatement node)
        {
            Definition expressionDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetExpression(), out expressionDefinition))
            {
                // expression already failed and printed its own warning
            }
            else if (!(expressionDefinition is BooleanDefinition))
            {
                PrintWarning(node.GetStx(), "STX condition must be a bool, not " + expressionDefinition.name);
            }
        }

        // id ( args ) ;  -> id must be a procedure; arg count and types must match its params
        public override void OutACallStatement(ACallStatement node)
        {
            String funcName = node.GetId().Text;
            Definition funcDefinition;

            if (!globalSymbolTable.TryGetValue(funcName, out funcDefinition))
            {
                PrintWarning(node.GetId(), funcName + " Does not exist");
                return;
            }
            if (!(funcDefinition is FunctionDefinition))
            {
                PrintWarning(node.GetId(), funcName + " is not a procedure");
                return;
            }

            List<VariableDefinition> parameters = ((FunctionDefinition)funcDefinition).parameters;

            // Walk the arg list and collect each argument expression in order
            List<PExpression> argExpressions = new List<PExpression>();
            if (node.GetArgs() is ASomeArgs)
            {
                PArgList argList = ((ASomeArgs)node.GetArgs()).GetArgList();
                while (argList is AMultipleArgList)
                {
                    argExpressions.Add(((AMultipleArgList)argList).GetExpression());
                    argList = ((AMultipleArgList)argList).GetArgList();
                }
                argExpressions.Add(((ASingleArgList)argList).GetExpression());
            }

            if (argExpressions.Count != parameters.Count)
            {
                PrintWarning(node.GetId(), funcName + " expects " + parameters.Count +
                    " argument(s) but got " + argExpressions.Count);
                return;
            }

            bool argsOk = true;
            for (int i = 0; i < argExpressions.Count; i++)
            {
                Definition argDefinition;

                if (!decoratedParseTree.TryGetValue(argExpressions[i], out argDefinition))
                {
                    // expression already failed and printed its own warning
                    argsOk = false;
                }
                else if (!SameType(parameters[i].VariableType, argDefinition))
                {
                    PrintWarning(node.GetId(), "Argument " + (i + 1) + " of " + funcName + " should be " +
                        parameters[i].VariableType.name + " but got " + argDefinition.name);
                    argsOk = false;
                }
            }

            if (argsOk)
            {
                decoratedParseTree.Add(node, funcDefinition);
            }
        }

        //-----------
        // Procedures
        //-----------

        // Register the procedure before its params and body are visited,
        // so the body can call it (recursion) and params can be added to it
        public override void InAProcedure(AProcedure node)
        {
            String funcName = node.GetId().Text;

            // each procedure gets a fresh set of locals
            localSymbolTable = new Dictionary<string, Definition>();

            currentFunction = new FunctionDefinition();
            currentFunction.name = funcName;
            currentFunction.parameters = new List<VariableDefinition>();

            if (globalSymbolTable.ContainsKey(funcName))
            {
                PrintWarning(node.GetId(), funcName + " is already defined");
            }
            else
            {
                globalSymbolTable.Add(funcName, currentFunction);
            }
        }

        public override void OutAProcedure(AProcedure node)
        {
            decoratedParseTree.Add(node, currentFunction);
            currentFunction = null;
        }

        // TYPE id  -> add a local variable and record it as a parameter of the procedure
        public override void OutAParam(AParam node)
        {
            String paramName = node.GetId().Text;
            Definition typeDefinition;

            if (!decoratedParseTree.TryGetValue(node.GetType(), out typeDefinition))
            {
                // type failed to decorate
            }
            else if (LookUp(paramName) != null)
            {
                PrintWarning(node.GetId(), paramName + " is already defined");
            }
            else
            {
                VariableDefinition paramDefinition = new VariableDefinition();
                paramDefinition.name = paramName;
                paramDefinition.VariableType = (TypeDefinition)typeDefinition;

                localSymbolTable.Add(paramName, paramDefinition);
                currentFunction.parameters.Add(paramDefinition);
                decoratedParseTree.Add(node, paramDefinition);
            }
        }

        // MARCH block  -> fresh set of locals for main
        public override void InAMainProc(AMainProc node)
        {
            localSymbolTable = new Dictionary<string, Definition>();
        }
    }
}

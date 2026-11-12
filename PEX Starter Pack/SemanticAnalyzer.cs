using System;
using System.Collections.Generic;
using System.Linq;
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



        public override void InAProgram(AProgram node)
        {
            // Create Definitoion for integers
            Definition intDefinition = new NumberDefinition();
            intDefinition.name = "INF";

            Definition strDefinition = new StringDefinition();
            strDefinition.name = "CBRN";

            // register the defininiton with the global symbol table
            globalSymbolTable.Add("INF", intDefinition);
            globalSymbolTable.Add("CBRN", strDefinition);

            Console.WriteLine("Semantic analysis started");
        }
    }
}

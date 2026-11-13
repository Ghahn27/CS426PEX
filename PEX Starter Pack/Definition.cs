using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS426.analysis
{
    public abstract class Definition
    {
        public string name;

        public string toString()
        {
            return name;
        }
    }
    public abstract class TypeDefinition : Definition { }
    public class NumberDefinition : TypeDefinition { }

    public class StringDefinition : TypeDefinition { }

    public class BooleanDefinition : TypeDefinition { }

    public class VariableDefinition : Definition
    {
        public TypeDefinition VariableType;
    }

    // A constant (SOP) is a variable that cannot be assigned to after it is declared
    public class ConstantDefinition : VariableDefinition { }

    public class FunctionDefinition : Definition
    {
        public List<VariableDefinition> parameters;
    }
}

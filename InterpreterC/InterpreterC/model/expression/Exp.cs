using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InterpreterC.model.myDictionary;

namespace InterpreterC.model.expression
{
    public interface Exp
    {
        int Eval(MyIDictionary<string,int> tbl);
    }
}

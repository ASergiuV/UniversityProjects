using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InterpreterC.model.expression;
using InterpreterC.model.myDictionary;

namespace InterpreterC.model.expression
{
    public class ConstExp : Exp
    {
        private int number;

        public ConstExp(int _number)
        {
            number = _number;
        }

        public int Eval(MyIDictionary<string, int> tbl)
        {
            return number;
        }

        public override string ToString()
        {
            return "" + number;
        }
    }
}

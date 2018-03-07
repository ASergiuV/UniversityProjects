using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InterpreterC.model.myDictionary;

namespace InterpreterC.model.expression
{
    public class VarExp : Exp
    {
        private string id;

        public VarExp(string _id)
        {
            id = _id;
        }

        public int Eval(MyIDictionary<string, int> tbl)
        {
            if (!tbl.isDefined(id))
            {
                MyException ex = new MyException("Variable does not exist!");
                throw ex;
            }
            return tbl.lookup(id);
        }

        public override string ToString()
        {
            return id;
        }
    }
}

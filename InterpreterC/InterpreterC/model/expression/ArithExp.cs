using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InterpreterC.model.myDictionary;

namespace InterpreterC.model.expression
{
    public class ArithExp : Exp
    {
        private Exp e1;
        private Exp e2;
        private int op;

        public ArithExp(char _op, Exp _e1, Exp _e2)
        {
            if (_op == '+') op = 1;
            if (_op == '-') op = 2;
            if (_op == '*') op = 3;
            if (_op == '/') op = 4;
            e1 = _e1;
            e2 = _e2;
        }
        public int Eval(MyIDictionary<string, int> tbl)
        {
            if (op == 1) return (e1.Eval(tbl) + e2.Eval(tbl));
            if (op == 2) return (e1.Eval(tbl) - e2.Eval(tbl));
            if (op == 3) return (e1.Eval(tbl) * e2.Eval(tbl));
            if (op == 4)
            {
                if (e2.Eval(tbl) == 0)
                {
                    MyException ex = new MyException("Division by 0!");
                    throw ex;
                }
                return (e1.Eval(tbl) / e2.Eval(tbl));
            }

            return 0;
        }
        public override string ToString()
        {
            if (op == 1) return e1 + "+" + e2;
            if (op == 2) return e1 + "-" + e2;
            if (op == 3) return e1 + "*" + e2;
            if (op == 4) return e1 + "/" + e2;
            return null;
        }
    }
}

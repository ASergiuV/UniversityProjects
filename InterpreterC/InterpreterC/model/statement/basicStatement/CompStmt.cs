using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InterpreterC.model.myStack;

namespace InterpreterC.model.statement.basicStatement
{
    public class CompStmt : IStmt
    {
        private IStmt first;
        private IStmt second;

        public CompStmt(IStmt _fist, IStmt _second)
        {
            first = _fist;
            second = _second;
        }

        public PrgState execute(PrgState state)
        {
            MyIStack<IStmt> stk = state.getStk();
            stk.push(second);
            stk.push(first);
            return null;
        }

        public override string ToString()
        {
            return "(" + first + ";" + second + ")";
        }
    }
}

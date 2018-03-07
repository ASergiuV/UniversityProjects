using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InterpreterC.model.myDictionary;
using InterpreterC.model.myList;
using InterpreterC.model.expression;

namespace InterpreterC.model.statement.basicStatement
{
    public class PrintStmt : IStmt
    {
        private Exp exp;

        public PrintStmt(Exp _exp)
        {
            exp = _exp;
        }

        public PrgState execute(PrgState state)
        {
            MyIList < int > outList = state.getOutList();
            MyIDictionary<string, int> symTabel = state.getSymTable();
            outList.add(exp.Eval(symTabel));
            return null;
        }

        public override string ToString()
        {
            return "Print(" + exp + ")";
        }
    }
}

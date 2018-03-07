using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InterpreterC.model.expression;
using InterpreterC.model.myDictionary;
using InterpreterC.model.myStack;

namespace InterpreterC.model.statement.basicStatement
{
    public class AssignStmt : IStmt
    {
        private string id;
        private Exp exp;

        public AssignStmt(string _id, Exp _exp)
        {
            id = _id;
            exp = _exp;
        }

        public PrgState execute(PrgState state)
        {
            MyIStack<IStmt> stack = state.getStk();
            MyIDictionary<string, int> symTable = state.getSymTable();
            int val = exp.Eval(symTable);
            if (symTable.isDefined(id))
                symTable.update(id, val);
            else
                symTable.put(id, val);
            return null;
        }

        public override string ToString()
        {
            return id + "=" + exp;
        }
    }
}

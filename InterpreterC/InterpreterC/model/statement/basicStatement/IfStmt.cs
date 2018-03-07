using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InterpreterC.model.expression;
using InterpreterC.model.myStack;
using InterpreterC.model.myDictionary;

namespace InterpreterC.model.statement.basicStatement
{
    public class IfStmt : IStmt
    {
        private Exp exp;
        private IStmt thenStatement;
        private IStmt elseStatement;

        public IfStmt(Exp _exp, IStmt _thenStatement, IStmt _elseStatement)
        {
            exp = _exp;
            thenStatement = _thenStatement;
            elseStatement = _elseStatement;
        }

        public PrgState execute(PrgState state)
        {
            MyIStack<IStmt> stk = state.getStk();
            MyIDictionary<string, int> symTable = state.getSymTable();
            if (exp.Eval(symTable) != 0)
                stk.push(thenStatement);
            else
                stk.push(elseStatement);
            return null;
        }

        public override string ToString()
        {
            return "if " + exp + " then " + thenStatement + " else " + elseStatement;
        }
    }
}

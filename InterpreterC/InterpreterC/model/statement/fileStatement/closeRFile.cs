using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InterpreterC.model.expression;

namespace InterpreterC.model.statement.fileStatement
{
    public class closeRFile : IStmt
    {
        private Exp exp;

        public closeRFile(Exp _exp)
        {
            exp = _exp;
        }

        public PrgState execute(PrgState state)
        {
            int id = exp.Eval(state.getSymTable());
            Tuple<string, System.IO.StreamReader> pair = state.getFileTable().get(id);
            if (pair == null)
                throw new MyException("File not found!");
            state.getFileTable().remove(id);
            pair.Item2.Close();
            return null;
        }

        public override string ToString()
        {
            return "closeFileStmt(" + exp + ")";
        }
    }
}

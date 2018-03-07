using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InterpreterC.model.expression;
using System.IO;

namespace InterpreterC.model.statement.fileStatement
{
    public class readFile : IStmt
    {
        private Exp exp;
        private String var;

        public readFile(Exp _exp, String _var)
        {
            exp = _exp;
            var = _var;
        }

        public PrgState execute(PrgState state)
        {
            int id = exp.Eval(state.getSymTable());
            Tuple<string, StreamReader> pair = state.getFileTable().get(id);
            if (pair == null)
                throw new MyException("File not opened!");

            string line = pair.Item2.ReadLine();
            if (line != null)
                if (state.getSymTable().isDefined(var))
                    state.getSymTable().update(var, Convert.ToInt32(line));
                else
                    state.getSymTable().put(var, Convert.ToInt32(line));
            else
                if (state.getSymTable().isDefined(var))
                     state.getSymTable().update(var,0);
                else
                     state.getSymTable().put(var, 0);
            return null;
        }
        public override string ToString()
        {
            return "readFileStmt(" + exp + ", " + var + ")";
        }
    }
}

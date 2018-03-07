using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterpreterC.model.statement
{
    public interface IStmt
    {
        PrgState execute(PrgState state);
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InterpreterC.model.statement;

namespace InterpreterC.repository
{
    public interface IRepository
    {
        PrgState getCrtPrg();

        void addPrg(PrgState prgState);

        void logPrgStateExec();

        String getLogFilePath();
    }
}

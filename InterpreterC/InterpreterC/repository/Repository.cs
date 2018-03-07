using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InterpreterC.model.statement;
using System.IO;

namespace InterpreterC.repository
{
    public class Repository : IRepository
    {
        private List<PrgState> programStates;
        private string logFilePath;
   
        public Repository(String _logFilePath)
        {
            programStates = new List<PrgState>();
            logFilePath = _logFilePath;
        }

        public void addPrg(PrgState prgState)
        {
            programStates.Add(prgState);
        }

        public PrgState getCrtPrg()
        {
            return programStates[0];
        }

        public string getLogFilePath()
        {
            return logFilePath;
        }

        public void logPrgStateExec()
        {
            PrgState p = programStates[0];
            System.IO.File.AppendAllText(logFilePath, p.ToString());
        }
    }
}

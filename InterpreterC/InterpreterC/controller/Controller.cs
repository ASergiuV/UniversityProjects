using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InterpreterC.repository;
using InterpreterC.model.statement;
using InterpreterC.model.myStack;
using InterpreterC.model;

namespace InterpreterC.controller
{
    public class Controller
    {
        private IRepository repo;

        public Controller(IRepository _repo)
        {
            repo = _repo;
        }

        public void addPrgCtrl(PrgState prgState)
        {
            repo.addPrg(prgState);
        }

        public PrgState oneStep(PrgState state)
        {
            MyIStack<IStmt> stk = state.getStk();
            IStmt crtStmt = stk.pop();
            return crtStmt.execute(state);
        }

        public void allStep()
        {
            int ct = 0;
            PrgState prg = repo.getCrtPrg();
            try
            {
                while (true)
                {
                    oneStep(prg);
                    System.IO.File.AppendAllText(repo.getLogFilePath(), "Step-----" + ct + "\n");
                    ct += 1;
                    repo.logPrgStateExec();
                }
            }
            catch (MyException myex)
            {
                Console.WriteLine(myex.Message);
            }
        }
    }
}

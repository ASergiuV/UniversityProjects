using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InterpreterC.model.myDictionary;
using InterpreterC.model.myList;
using InterpreterC.model.myStack;
using System.IO;
using InterpreterC.model.myFileTable;
namespace InterpreterC.model.statement
{
    public class PrgState
    {
        private MyIStack<IStmt> exeStack;
        private MyIDictionary<string, int> symTable;
        private MyIList<int> outList;
        private MyIFileTable<int, Tuple<string,StreamReader>> fileTable;
        private IStmt originalProgram;

        public PrgState(IStmt prg)
        {
            exeStack = new MyStack<IStmt>();
            symTable = new MyDictionary<string, int>();
            outList = new MyList<int>();
            fileTable = new MyFileTable<int, Tuple<string, StreamReader>>();
            originalProgram = prg;
            exeStack.push(prg);
        }

        public MyIStack<IStmt> getStk()
        {
            return exeStack;
        }

        public MyIDictionary<string,int> getSymTable()
        {
            return symTable;
        }

        public MyIList<int> getOutList()
        {
            return outList;
        }

        public MyIFileTable<int, Tuple<string, StreamReader>> getFileTable()
        {
            return fileTable;
        }

        public override string ToString()
        {
            return "" + exeStack + symTable + outList + fileTable + "\n";
        }
    }
}

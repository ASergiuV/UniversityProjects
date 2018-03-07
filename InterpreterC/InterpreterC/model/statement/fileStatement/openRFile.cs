using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace InterpreterC.model.statement.fileStatement
{
    public class openRFile : IStmt
    {
        private int unique_key = 0;
        private String filename, id;

        public openRFile(String _id, String _filename)
        {
            id = _id;
            filename = _filename;
        }

        public PrgState execute(PrgState state)
        {
            if (!File.Exists(filename))
                throw new MyException("File does not exist!");
            
            state.getFileTable().put(unique_key, Tuple.Create(filename, new StreamReader(filename)));
            state.getSymTable().put(id, unique_key);
            unique_key += 1;
            return null;
        }
        public override string ToString()
        {
            return "openRFile(" + id + ", " + filename + ")";
        }

    }
}

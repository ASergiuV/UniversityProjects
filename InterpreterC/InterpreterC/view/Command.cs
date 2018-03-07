using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterpreterC.view
{
    public abstract class Command
    {
        private string key, description;

        public Command(string _key, string _description)
        {
            key = _key;
            description = _description;
        }

        public abstract void execute();

        public string getKey()
        {
            return key;
        }

        public string getDescription()
        {
            return description;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InterpreterC.controller;

namespace InterpreterC.view
{
    public class RunExample : Command
    {
        private Controller ctrl;

        public RunExample(String key, String description, Controller _ctrl) : base(key, description)
        {
            ctrl = _ctrl;
        }

        public override void execute()
        {

            ctrl.allStep();
        }
    }
}

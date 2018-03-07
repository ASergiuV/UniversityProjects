using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterpreterC.view
{
    public class TextMenu
    {
        private Dictionary<string, Command> commands;

        public TextMenu()
        {
            commands = new Dictionary<string, Command>();
        }

        public void addCommand(Command c)
        {
            commands.Add(c.getKey(), c);
        }

        private void printMenu()
        {
            string line = "";
            foreach(Command com in commands.Values)
            {
                line = com.getKey() + ") " + com.getDescription();
                Console.WriteLine(line);
            }
        }

        public void show()
        {
            while (true)
            {
                printMenu();
                Console.WriteLine("Input option:");
                string key = Console.ReadLine();
                Command com = commands[key];
                if (com == null)
                {
                    Console.WriteLine("Invalid option");
                    continue;
                }
                com.execute();
            }
        }
    }
}

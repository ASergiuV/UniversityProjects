using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterpreterC.model.myList
{
    public class MyList<T> : MyIList<T>
    {
        private List<T> list;

        public MyList()
        {
            list = new List<T>();
        }

        public void add(T elToAdd)
        {
            list.Add(elToAdd);
        }

        public T get(int i)
        {
            return list[i];
        }
        public override string ToString()
        {
            String str = "Out table:\n";
            foreach (T entry in list)
            {
                str += entry + "\n";
            }
            return str;
        }
    }
}

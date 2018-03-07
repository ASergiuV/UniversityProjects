using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterpreterC.model.myList
{
    public interface MyIList<T>
    {
        void add(T elToAdd);
        T get(int i);
    }
}

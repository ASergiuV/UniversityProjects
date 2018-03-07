using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterpreterC.model.myStack
{
    public interface MyIStack<T>
    {
        void push(T elToPush);

        T pop();

        T peek();

        bool isEmpty();
    }
}

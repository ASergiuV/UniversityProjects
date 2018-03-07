using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterpreterC.model.myStack
{
    public class MyStack<T> : MyIStack<T>
    {
        private Stack<T> stack;

        public MyStack()
        {
            stack = new Stack<T>();
        }

        public bool isEmpty()
        {
            if (stack.Count == 0)
                return true;
            return false;
        }

        public T peek()
        {
            return stack.Peek();
        }

        public T pop()
        {
            if (isEmpty())
            {
                MyException ex = new MyException("Stack is empty!");
                throw ex;
            }
            return stack.Pop();
        }

        public void push(T elToPush)
        {
            stack.Push(elToPush);
        }
        public override string ToString()
        {
            String str = "Execution stack:\n";
            for (int i = 0; i < stack.Count; i++)
            {
                str += stack.ElementAt(i) + "\n";
            }
            return str;
        }
    }
}

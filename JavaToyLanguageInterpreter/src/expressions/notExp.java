package expressions;

import model.MyIDictionary;
import model.MyIHeap;
import exceptions.ExceptionExpression;
import exceptions.ExceptionHeap;

public class notExp extends Expression {
    private Expression Expression;
    public notExp(Expression Expression) {
        this.Expression = Expression;
    }
    @Override
    public int Eval(MyIDictionary<String, Integer> symTable, MyIHeap<Integer> heap) throws ExceptionExpression, ExceptionHeap{
        // if x evals to 0 => false => !false = true
        /// else !true = false
        int x = this.Expression.Eval(symTable, heap);
        if(x == 0)
            return 1;
        return 0;
    }

    @Override
    public String toString() {
        return "!" + this.Expression.toString();
    }
}
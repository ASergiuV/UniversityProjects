package statements;

import model.MyIDictionary;
import model.MyIHeap;
import model.MyIStack;
import model.Tuple;
import expressions.ArithmExpression;
import expressions.ConstantExpression;
import expressions.Expression;
import exceptions.ExceptionExpression;
import exceptions.ExceptionHeap;
import exceptions.MyException;
import statements.ProgramState;

import java.io.BufferedReader;

public class sleepStmt implements IStatement{
    Expression number;

    public sleepStmt(Expression nr){
        this.number = nr;
    }

    public ProgramState execute(ProgramState state) throws ExceptionExpression, ExceptionHeap {
        MyIStack<IStatement>  localStack= state.get_Stack();
        MyIDictionary<String, Integer> localSym = state.get_Dictionary();
        MyIHeap<Integer> localHeap = state.get_heap();

        Integer nr = this.number.Eval(localSym,localHeap);
        Integer nr1 = nr;

        if(nr > 0){
            nr1  = nr - 1;
            localStack.push(new sleepStmt(new ConstantExpression(nr1)));
        }
        return null;
    }

    public String toString(){
        String rez = "";
        rez = rez + "sleep(" + this.number.toString() + ")";
        return rez;
    }
}

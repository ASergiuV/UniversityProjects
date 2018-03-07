package statements;

import model.MyIList;
import model.MyList;
import model.Tuple;
import expressions.Expression;
import statements.IStatement;
import statements.ProgramState;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import exceptions.ExceptionExpression;
import exceptions.ExceptionHeap;

public class newBarrierStmt implements IStatement {
    private String var;
    private Expression exp;
    private Integer newFreeLocation = -1;

    public newBarrierStmt(String var, Expression exp){
        this.var = var;
        this.exp = exp;
    }

    @Override
    public ProgramState execute(ProgramState state) throws ExceptionExpression, ExceptionHeap {
        int number = this.exp.Eval(state.get_Dictionary(), state.get_heap());
        synchronized (state.getBarrier()){
            MyIList<Integer> empty = new MyList<>();
            Tuple<MyIList<Integer>, Integer> param = new Tuple<MyIList<Integer>, Integer>(empty, number);
            state.getBarrier().add(newFreeLocation, param);
            synchronized (state.get_Dictionary()){
            	if(state.get_Dictionary().look_up(var))
            		state.get_Dictionary().update(var, newFreeLocation);
                state.get_Dictionary().add(var, newFreeLocation);
            }
        }

        return null;
    }

    public String toString(){
        String rez = "";

        rez = rez + "newBarrier(" + this.var + " , " + this.exp.toString() + ")";
        return rez;
    }
}

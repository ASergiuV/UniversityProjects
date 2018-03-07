package expressions;

import exceptions.ExceptionExpression;
import exceptions.ExceptionHeap;
import model.MyIDictionary;
import model.MyIHeap;


public abstract class Expression {
	public abstract int Eval(MyIDictionary<String, Integer> dic, MyIHeap<Integer> heap) throws ExceptionExpression,ExceptionHeap;
	public abstract String toString();
}

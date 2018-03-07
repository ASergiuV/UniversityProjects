package expressions;

import exceptions.ExceptionExpression;
import exceptions.ExceptionHeap;
import model.MyIDictionary;
import model.MyIHeap;

public class geExpression extends Expression{
	
	private Expression exp1;
	private Expression exp2;
	
	public geExpression(Expression e1,Expression e2){
		this.exp1=e1;
		this.exp2=e2;
	}
	
	@Override
	public int Eval(MyIDictionary<String, Integer> dic, MyIHeap<Integer> heap) throws ExceptionHeap,ExceptionExpression{
		int a,b;
		a=exp1.Eval(dic, heap);
		b=exp2.Eval(dic, heap);
		
		if(a>=b) return 1;
		
		return 0;
	}

	@Override
	public String toString() {
		return "("+exp1.toString()+">="+exp2.toString()+")";
	}
	
}

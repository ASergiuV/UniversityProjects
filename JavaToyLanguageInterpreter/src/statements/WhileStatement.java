package statements;

import exceptions.ExceptionExpression;
import exceptions.ExceptionFile;
import exceptions.ExceptionHeap;
import expressions.*;

public class WhileStatement implements IStatement{

	private Expression exp1;
	private IStatement stm1;
	
	public WhileStatement(Expression e,IStatement s){
		exp1=e;
		stm1=s;
	}
	
	@Override
	public ProgramState execute(ProgramState state) throws ExceptionExpression, ExceptionFile, ExceptionHeap {
		int a;
		a=exp1.Eval(state.get_Dictionary(),state.get_heap());
		if(a!=0){
			state.get_Stack().push(this);
			state.get_Stack().push(stm1);
		}		
		return null;
	}
	
	@Override
	public String toString(){
		return "While("+exp1.toString()+"){"+stm1.toString()+"}";
	}
}

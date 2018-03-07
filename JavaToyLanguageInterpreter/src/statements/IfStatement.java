package statements;

import exceptions.ExceptionExpression;
import exceptions.ExceptionHeap;
import expressions.Expression;
import model.MyIStack;

public class IfStatement implements IStatement{
	Expression exp;
	IStatement stm1;
	IStatement stm2;
	
	
	public IfStatement(Expression e,IStatement s1,IStatement s2){
		this.exp=e;
		this.stm1=s1;
		this.stm2=s2;
	}
	
	public String toString(){
		String res="";
		
			res="If(" + this.exp.toString() + ") then {" + this.stm1.toString() + "} else {" + this.stm2.toString() + "}";
		
		return res;
	}
	
	public ProgramState execute(ProgramState prg) throws ExceptionExpression,ExceptionHeap{
			MyIStack<IStatement> stk=prg.get_Stack();
			if(this.exp.Eval(prg.get_Dictionary(),prg.get_heap())!=0){
				stk.push(this.stm1);
			}
			else{
				stk.push(this.stm2);
			}
				
		return null;
	}
}

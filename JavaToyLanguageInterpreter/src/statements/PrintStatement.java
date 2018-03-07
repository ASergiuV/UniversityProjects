package statements;

import exceptions.ExceptionExpression;
import exceptions.ExceptionHeap;
import expressions.Expression;
import model.MyIList;

public class PrintStatement implements IStatement{
	Expression exp;
	
	public PrintStatement(Expression e){
		this.exp=e;
	}
	
	public String toString(){
		String res="";
			
			res="Print("+this.exp.toString()+")";
		
		return res;
	}
	
	public ProgramState execute(ProgramState prg) throws ExceptionExpression,ExceptionHeap{
		MyIList<String> li=prg.get_List();
		li.append(Integer.toString(this.exp.Eval(prg.get_Dictionary(),prg.get_heap())));
		return null;
	}
}

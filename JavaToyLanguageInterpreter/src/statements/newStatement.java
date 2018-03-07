package statements;

import exceptions.ExceptionExpression;
import exceptions.ExceptionFile;
import exceptions.ExceptionHeap;
import exceptions.MyException;
import expressions.ConstantExpression;
import expressions.Expression;
import model.MyIHeap;

public class newStatement implements IStatement{

	private String var_name;
	private Expression exp;
	
	public newStatement(String vn,Expression e){
		this.var_name=vn;
		this.exp=e;
	}
	
	@Override
	public ProgramState execute(ProgramState state) throws ExceptionExpression, ExceptionFile ,ExceptionHeap, MyException{
		
		MyIHeap<Integer> heap=state.get_heap();
		int address=heap.Add(exp.Eval(state.get_Dictionary(),state.get_heap()));
		IStatement st=new AssignStatement(var_name,new ConstantExpression(address));
		st.execute(state);
		
		return null;
	}
	
	@Override
	public String toString(){
		String res="";
		
			res="new( " + var_name.toString() + "," + exp.toString() + " )";
		
		return res;
	}

}

package statements;

import exceptions.ExceptionExpression;
import exceptions.ExceptionFile;
import exceptions.ExceptionHeap;
import expressions.Expression;

public class writeHeapStatement implements IStatement{
	
	private String var_name;
	private Expression exp;
	
	public writeHeapStatement(String vn,Expression e){
		this.var_name=vn;
		this.exp=e;
	}
	
	@Override
	public ProgramState execute(ProgramState state) throws ExceptionExpression, ExceptionFile, ExceptionHeap {
		
		Integer address=state.get_Dictionary().get_value(var_name);
		if(address==null) 
			throw new ExceptionHeap("Unknown variable");
		Integer res=state.get_heap().get(address);
		if(res==null)
			throw new ExceptionHeap("Unreachable address");
		
		state.get_heap().Modify(address, exp.Eval(state.get_Dictionary(), state.get_heap()));
		
		return null;
	}
	
	@Override
	public String toString(){
		String res="";
			
			res="writeHeap( var: "+var_name+" | value: "+exp.toString()+" )";
		
		return res;
	}

}

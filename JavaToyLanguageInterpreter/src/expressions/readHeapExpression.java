package expressions;

import exceptions.ExceptionExpression;
import exceptions.ExceptionHeap;
import model.MyIDictionary;
import model.MyIHeap;

public class readHeapExpression extends Expression{

	private String var_name;
	
	public readHeapExpression(String vn){
		var_name=vn;
	}
	
	@Override
	public int Eval(MyIDictionary<String, Integer> dic,MyIHeap<Integer> heap) throws ExceptionHeap,ExceptionExpression{
		
		Integer address=dic.get_value(var_name);
		Integer res=0;
		if(address!=null){
			res=heap.get(address);
			if(res==null){
				throw new ExceptionHeap("Unreachable address");
			}
		}
		else{
			throw new ExceptionHeap("Undeclared variable name");
		}
			
		return res;
	}
	
	@Override
	public String toString() {
		String res="";
		
			res="readHeap( "+var_name+" )";
		
		return res;
	}

}

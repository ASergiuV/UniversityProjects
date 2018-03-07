package expressions;

import exceptions.ExceptionExpression;
import model.MyIDictionary;
import model.MyIHeap;


public class VarExpression extends Expression{
	String name;
	
	public VarExpression(String s){
		this.name=s;
	}
	
	@Override
	public int Eval(MyIDictionary<String,Integer> dic,MyIHeap<Integer> heap) throws ExceptionExpression{
		int res=0;
			
			if(dic.look_up(this.name)==true)
				res=dic.get_value(this.name);
			else
				throw new ExceptionExpression("Unknown Variable "+this.name );
		return res;
	}
	
	@Override 
	public String toString(){
		String res="";
		
			res=this.name+" ";
		
		return res;
	}
}

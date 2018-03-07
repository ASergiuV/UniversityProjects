package expressions;

import model.MyIDictionary;
import model.MyIHeap;


public class ConstantExpression extends Expression{
	
	int number;
	
	public ConstantExpression(int nr){
		this.number=nr;
	}
	
	@Override
	public int Eval(MyIDictionary<String,Integer> dic,MyIHeap<Integer> heap){
		int res=0;
		
			res=this.number;
		
		return res;
	}
	
	@Override
	public String toString(){
		String res="";
			
			res=Integer.toString(this.number);
		
		return res;
	}
}

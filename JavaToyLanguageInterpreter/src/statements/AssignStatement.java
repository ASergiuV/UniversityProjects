package statements;

import exceptions.ExceptionExpression;
import exceptions.ExceptionHeap;
import expressions.Expression;
import model.MyIDictionary;

public class AssignStatement implements IStatement{
	private String id;
	private Expression val;
	
	public AssignStatement(String i,Expression v){
		this.id=i;
		this.val=v;
	}
	
	public String toString(){
		String res="";
			
			res=this.id+"="+this.val.toString();
		
		return res;
	}
	
	public ProgramState execute(ProgramState prg) throws ExceptionExpression,ExceptionHeap{
			MyIDictionary<String,Integer> dic=prg.get_Dictionary();
			if(dic.look_up(this.id)==true){
				dic.update(this.id, this.val.Eval(dic,prg.get_heap()));
			}
			else
				dic.add(this.id, this.val.Eval(dic,prg.get_heap()));
			
		return null;
	}
}

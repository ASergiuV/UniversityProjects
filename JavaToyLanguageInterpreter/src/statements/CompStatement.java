package statements;

import model.MyIStack;

public class CompStatement implements IStatement{
	IStatement stat1;
	IStatement stat2;
	
	public CompStatement(IStatement s1,IStatement s2){
		this.stat1=s1;
		this.stat2=s2;
	}
	
	public String toString(){
		String res="";
		
			res=this.stat1.toString()+" ; "+this.stat2.toString();
		
		return res;
	}
	
	public ProgramState execute(ProgramState prg){
		MyIStack<IStatement> stk=prg.get_Stack();
		stk.push(this.stat2);
		stk.push(this.stat1);
		return null;
	}
}

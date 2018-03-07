package statements;

import exceptions.ExceptionExpression;
import exceptions.ExceptionFile;
import exceptions.ExceptionHeap;
import model.MyIDictionary;
import model.MyIStack;
import model.MyStack;

public class ForkStatement implements IStatement{

	private IStatement stm;
	
	public ForkStatement(IStatement s){
		stm=s;
	}
	
	@Override
	public ProgramState execute(ProgramState state) throws ExceptionExpression, ExceptionFile, ExceptionHeap {
		
		MyIDictionary<String,Integer> dic=state.get_Dictionary().clone();
		MyIStack<IStatement> stk=new MyStack<IStatement>();
		stk.push(stm);
		
		state.inc_nr_ch();
		ProgramState nprog=new ProgramState(dic,stk,state.get_List(),state.get_FileTable(),state.get_heap(),null,state.getID()*100+state.get_nr_of_ch());
		
		return nprog;
	}
	
	@Override 
	public String toString(){
		return "fork( "+stm.toString()+" )";
	}
	
}

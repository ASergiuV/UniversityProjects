package statements;

import java.io.BufferedReader;
import java.io.IOException;

import exceptions.ExceptionExpression;
import exceptions.ExceptionFile;
import exceptions.ExceptionHeap;
import expressions.Expression;
import model.Tuple;

public class CloseFileStatement implements IStatement{
	private Expression exp;
	
	public CloseFileStatement(Expression e){
		this.exp=e;
	}
	
	
	public ProgramState execute(ProgramState prg) throws ExceptionExpression,ExceptionHeap, ExceptionFile{
		
		int pos=this.exp.Eval(prg.get_Dictionary(),prg.get_heap());
		Tuple<String,BufferedReader> t=prg.get_FileTable().get_value(pos);
		try{
			t.y.close();
		}
		catch(IOException e){
			throw new ExceptionFile(e.toString());
		}
		
		prg.get_FileTable().delete(pos);
		
		return null;
	}
	
	
	public String toString(){
		String res="";
		
			res+="CloseFile( ID: "+this.exp.toString()+" )";
		
		return res;
	}
}

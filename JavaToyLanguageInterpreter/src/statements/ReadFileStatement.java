package statements;

import java.io.BufferedReader;
import java.io.IOException;

import exceptions.ExceptionExpression;
import exceptions.ExceptionFile;
import exceptions.ExceptionHeap;
import exceptions.MyException;
import expressions.ConstantExpression;
import expressions.Expression;
import model.Tuple;

public class ReadFileStatement implements IStatement{
	private Expression exp;
	private String var;
	
	public ReadFileStatement(Expression e,String v){
		this.exp=e;
		this.var=v;
	}
	
	public ProgramState execute(ProgramState prg) throws ExceptionExpression,ExceptionHeap, ExceptionFile, MyException{
		
		int pos=this.exp.Eval(prg.get_Dictionary(),prg.get_heap());
		Tuple<String,BufferedReader> t=prg.get_FileTable().get_value(pos);
		IStatement s;
		try{
			String line = t.y.readLine();
			if(line==null){
				s=new AssignStatement(this.var,new ConstantExpression(0));
			}
			else
			{
				int nr=Integer.parseInt(line);
				s=new AssignStatement(this.var,new ConstantExpression(nr));
			}
		}
		catch(IOException e){
			throw new ExceptionFile(e.toString());
		}
		catch(NumberFormatException e){
			throw new ExceptionFile(e.toString());
		}
		
		prg=s.execute(prg);
		
		return null;
	}
	
	public String toString(){
		String res="";
			
			res+="ReadFromFile( ID: "+this.exp.toString()+" ; put data in "+this.var+" )";
			
		return res;
	}
}

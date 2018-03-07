package statements;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import exceptions.ExceptionExpression;
import exceptions.ExceptionFile;
import exceptions.ExceptionHeap;
import exceptions.MyException;
import expressions.ConstantExpression;
import model.*;

public class OpenRFileStatement implements IStatement{
	
	private String var_name;
	private String fileName;
	
	public OpenRFileStatement(String v,String f){
		this.var_name=v;
		this.fileName=f;
	}
	
	public ProgramState execute(ProgramState state) throws ExceptionFile,ExceptionExpression,ExceptionHeap, MyException{
		
			
			MyIDictionary<Integer,Tuple<String,BufferedReader>> dic;
			dic=state.get_FileTable();
			
			ArrayList<Tuple<Integer, Tuple<String, BufferedReader>>> l=dic.toArrayTuple();
			int max=0;
			
			for(int i=0;i<l.size();i++){
				if(max<(l.get(i)).x){
					max=(l.get(i)).x;
				}
				
				if(fileName.equals(l.get(i).y.x)){
					throw new ExceptionFile("File Already Exists "+fileName);
				}
			}
			BufferedReader br;
			try{
				br=new BufferedReader(new FileReader(fileName));
			}
			catch(IOException m){
				throw new ExceptionFile(m.toString());
			}
			
			Tuple<String,BufferedReader> t=new Tuple<String,BufferedReader>(fileName,br);
			dic.add(max+1, t);
			
			IStatement s=new AssignStatement(this.var_name,new ConstantExpression(max+1));
			state=s.execute(state);
			
		return null;
	}
	
	@Override
	public String toString(){
		String res="";
		
		res+="OpenFile( ID: "+this.var_name+" ; "+this.fileName+")";
		
		return res;
	}
}

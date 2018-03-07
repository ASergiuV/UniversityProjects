package repository;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import model.*;
import statements.*;

public class Repository implements IRepository{
	List<ProgramState> ProgStatesList;
	String fileName;
	
	public Repository(List<ProgramState> ps,String f){
		this.ProgStatesList=ps;
		this.fileName=f;
	}
	
	public Repository(String fn){
		this.ProgStatesList=new ArrayList<ProgramState>();
		this.fileName=fn;
	}
	
	public void add_prgState(ProgramState val){
		ProgStatesList.add(val);
	}
	
	public void logProgramStateExecution(ProgramState ps) throws IOException{
		PrintWriter logFile=new PrintWriter(new BufferedWriter(new FileWriter(this.fileName,true)));
		
		logFile.println("________________________________________________________________________");
		logFile.println("Thread ID:"+ps.getID());
		logFile.println("ExeStack:");
		Object[] l=ps.get_Stack().toArray();
		for(int i=l.length-1;i>=0;i--){
			logFile.println(l[i].toString());
		}
		
		logFile.println("\nSymTable:");
		ArrayList<String> l2=ps.get_Dictionary().toArrayString();
		
		for(int i=0;i<l2.size();i++){
			logFile.println(l2.get(i).toString());
		}
		
		logFile.println("\nOut:");
		Object[] l3=ps.get_List().toArray();
		for(int i=0;i<l3.length;i++){
			logFile.println(l3[i].toString());
		}
		
		logFile.println("\nFileTable:");
		ArrayList<Tuple<Integer, Tuple<String, BufferedReader>>> ft=ps.get_FileTable().toArrayTuple();
		for(int i=0;i<ft.size();i++){
			logFile.println("ID: "+ft.get(i).x.toString()+"  ; FilePath: "+ft.get(i).y.x);
		}
		
		logFile.println("\nHeap:");
		ArrayList<Tuple<Integer,Integer>> heap=ps.get_heap().toArrayTuple();
		for(int i=0;i<heap.size();i++){
			logFile.println("ID: "+heap.get(i).x.toString()+" ---> Val: "+heap.get(i).y.toString());
		}
		
		logFile.print("\n\n\n\n");
		
		logFile.close();
	}

	public List<ProgramState> get_prog_list(){
		return this.ProgStatesList;
	}

	@Override
	public void set_prog_list(List<ProgramState> l) {
		this.ProgStatesList=l;
		
	}
	
}

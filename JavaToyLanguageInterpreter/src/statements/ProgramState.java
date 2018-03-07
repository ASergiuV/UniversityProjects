package statements;
import java.io.BufferedReader;

import exceptions.ExceptionEndOfExecution;
import exceptions.ExceptionExpression;
import exceptions.ExceptionFile;
import exceptions.ExceptionHeap;
import exceptions.ExceptionMyStack;
import exceptions.MyException;
import model.*;


public class ProgramState {
	private MyIDictionary<String,Integer> variables_dictionary;
	private MyIStack<IStatement> execution_stack;
	private MyIList<String> output;
	private MyIDictionary<Integer,Tuple<String,BufferedReader>> FileTable;
	private MyIHeap<Integer> heap;
	private int id;
	private MyIBarrier localBarrier;
	private int nr_of_childrens;
	private Integer firtsThread ;
	private MyILock lock;
	
	@SuppressWarnings({"unused"})
	private IStatement original_state;
	
	public ProgramState(MyIDictionary<String, Integer> vars, MyIStack<IStatement> stk, MyIList<String> out,IStatement prg) {
		this.variables_dictionary=vars;
		this.execution_stack=stk;
		this.output=out;
		this.original_state=prg;
		this.nr_of_childrens=0;
	}
	
	public ProgramState(MyIDictionary<String, Integer> vars, MyIStack<IStatement> stk, MyIList<String> out,MyIDictionary<Integer,Tuple<String,BufferedReader>> fil,IStatement prg) {
		this.variables_dictionary=vars;
		this.execution_stack=stk;
		this.output=out;
		this.FileTable=fil;
		this.original_state=prg;
		this.nr_of_childrens=0;
	}
	
	public ProgramState(MyIDictionary<String, Integer> vars, MyIStack<IStatement> stk, MyIList<String> out,MyIDictionary<Integer,Tuple<String,BufferedReader>> fil,MyIHeap<Integer> Heap,IStatement prg) {
		this.variables_dictionary=vars;
		this.execution_stack=stk;
		this.output=out;
		this.FileTable=fil;
		this.heap=Heap;
		this.original_state=prg;
		this.nr_of_childrens=0;
	}
	public ProgramState(MyIStack<IStatement> stk, MyIDictionary<String, Integer> symtbl, MyIList<String> ot, IStatement prg,
			MyIDictionary<Integer, Tuple<String, BufferedReader>> fileTable,
			MyIHeap<Integer> h, Integer id,
			MyIBarrier barrier){
		this.execution_stack = stk;
		this.variables_dictionary = symtbl;
		this.output = ot;
		this.FileTable = fileTable;
		this.heap = h;
		this.original_state = prg;
		this.id = id;
		this.firtsThread = this.id;
		localBarrier = barrier;
		stk.push(prg);
		}
	public ProgramState(MyIStack<IStatement> stk, MyIDictionary<String, Integer> symtbl, MyIList<String> ot, IStatement prg,
			MyIDictionary<Integer, Tuple<String, BufferedReader>> fileTable,
			MyIHeap<Integer> h, Integer id,
			MyILock lock){
		this.execution_stack = stk;
		this.variables_dictionary = symtbl;
		this.output = ot;
		this.FileTable = fileTable;
		this.heap = h;
		this.original_state = prg;
		this.id = id;
		this.firtsThread = this.id;
		this.lock = lock;
		stk.push(prg);
		}
	
	public ProgramState() {
		this.variables_dictionary=new MyDictionary<String,Integer>();
		this.execution_stack=new MyStack<IStatement>();
		this.output=new MyList<String>();
		this.FileTable=new MyDictionary<Integer,Tuple<String,BufferedReader>>();
		this.heap=new MyHeap<Integer>();
		this.original_state=null;
		this.id=1;
		this.nr_of_childrens=0;
	}
	
	public ProgramState(int nid) {
		this.variables_dictionary=new MyDictionary<String,Integer>();
		this.execution_stack=new MyStack<IStatement>();
		this.output=new MyList<String>();
		this.FileTable=new MyDictionary<Integer,Tuple<String,BufferedReader>>();
		this.heap=new MyHeap<Integer>();
		this.original_state=null;
		this.id=nid;
		this.nr_of_childrens=0;
	}
	
	public ProgramState(MyIDictionary<String, Integer> vars, MyIStack<IStatement> stk, MyIList<String> out,MyIDictionary<Integer,Tuple<String,BufferedReader>> fil,MyIHeap<Integer> Heap,IStatement prg,int id) {
		this.variables_dictionary=vars;
		this.execution_stack=stk;
		this.output=out;
		this.FileTable=fil;
		this.heap=Heap;
		this.original_state=prg;
		this.id=id;
		this.nr_of_childrens=0;
	}
	
	public int getID(){
		return this.id;
	}
	public Integer getId(){
		return this.id;
	}
	
	public String getStrID(){
		return (new Integer(this.id)).toString();
	}
	
	public int get_nr_of_ch(){
		return this.nr_of_childrens;
	}
	
	public void inc_nr_ch(){
		this.nr_of_childrens+=1;
	}
	
	public String toString(){
		String res="";
		
			res="Program Statement Thread ID: "+this.getID()+"{\n";
			res+="Execution Stack: " + this.execution_stack.toString() + "\n";
			res+="Variables Dictionary: " + this.variables_dictionary.toString() + "\n";
			res+="Output: "+ this.output.toString()+"\n";
			res+="FileTable: "+ this.FileTable.toString()+"\n";
			res+="Heap: "+this.heap.toString()+"\n";
			res+="}\n";
		
		return res;
	}
	
	public boolean isNotCompleted(){
		if(this.execution_stack.is_empty() == true) return false;
		return true;
	}
	
	public ProgramState oneStep() throws ExceptionEndOfExecution, ExceptionExpression, ExceptionFile, ExceptionHeap, ExceptionMyStack, MyException {
		ProgramState ps=this;
		if(ps.isNotCompleted() == false) throw new ExceptionEndOfExecution("Empty Stack");
		return ps.execution_stack.pop().execute(this);
	}
	
	public MyIDictionary<String,Integer> get_Dictionary(){
		return this.variables_dictionary;
	}
	
	public MyIStack<IStatement> get_Stack(){
		return this.execution_stack;
	}
	
	public MyIList<String> get_List(){
		return this.output;
	}
	
	public MyIDictionary<Integer,Tuple<String,BufferedReader>> get_FileTable(){
		return this.FileTable;
	}
	
	public MyIHeap<Integer> get_heap(){
		return this.heap;
	}
	public MyIBarrier getBarrier(){
		return this.localBarrier;
	}
	
	public void set_Dictionary(MyDictionary<String,Integer> new_dic){
		this.variables_dictionary=new_dic;
	}
	
	public void set_Stack(MyStack<IStatement> stm){
		this.execution_stack=stm;
	}
	
	public void set_List(MyList<String> list){
		this.output=list;
	}
	
	public void set_Filetable(MyIDictionary<Integer,Tuple<String,BufferedReader>> fl){
		this.FileTable=fl;
	}
	
	public void set_heap(MyIHeap<Integer> nheap){
		this.heap=nheap;
	}

	public MyILock getLock() {
		return lock;
	}

	public void setLock(MyILock lock) {
		this.lock = lock;
	}
	
}

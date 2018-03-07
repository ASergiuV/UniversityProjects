package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.stream.Collectors;

import exceptions.ExceptionEndOfExecution;
import exceptions.ExceptionExpression;
import exceptions.ExceptionFile;
import exceptions.ExceptionHeap;
import model.MyIDictionary;
import model.MyIHeap;
import model.MyIList;
import model.Tuple;
import repository.IRepository;
import statements.ProgramState;

public class Controller implements IController{
	private IRepository repo;
	private ExecutorService executor;
	
	public Controller(IRepository r){
		this.repo=r;
	}
	
	public ProgramState getPrgStateByStr(String str){
		List<ProgramState> a = repo.get_prog_list();
		
		for(int i=0;i<a.size();i++){
			if(str.equals("ProgramState (Thread) : " + a.get(i).getStrID())){
				return a.get(i);
			}
		}
		return null;
	}
	
	public ArrayList<String> getAllPrgStates(){
		ArrayList<String> l = new ArrayList<String>();
		
		List<ProgramState> a = repo.get_prog_list();
		
		for(int i=0;i<a.size();i++){
			l.add("ProgramState (Thread) : " + a.get(i).getStrID());
		}
		
		return l;
	}
	
	public void oneStepForAllProgStates(List<ProgramState> l) throws ExceptionFile,ExceptionHeap,ExceptionExpression,IOException, InterruptedException{
		l.forEach(prg->{
			try {
				repo.logProgramStateExecution(prg);
			} catch (IOException e) {
				System.out.println("Log file ERROR");
			}
		});
		
		List<Callable<ProgramState>> callList=l.stream().map((ProgramState p)->(Callable<ProgramState>)(()->{return p.oneStep();})).collect(Collectors.toList());
		List<ProgramState> nl=executor.invokeAll(callList).stream().map(future->{
			try{
				return future.get();
			} 
			catch(Exception e){
				return null;
			}
		}).filter(p->p!=null).collect(Collectors.toList());
		
		l.addAll(nl);
		
		l.forEach(prg->{
			try {
				repo.logProgramStateExecution(prg);
			} catch (IOException e) {
				System.out.println("Log file ERROR");
			}
		});
		
		repo.set_prog_list(l);
	}
	
	public void OneStep() throws ExceptionFile, ExceptionHeap, ExceptionExpression, IOException, InterruptedException, ExceptionEndOfExecution{
		
		executor=Executors.newFixedThreadPool(6);
		List<ProgramState> l=this.remove_completed_threads(repo.get_prog_list());
		if(l.size() == 0)
			throw new ExceptionEndOfExecution("");
		this.oneStepForAllProgStates(l);
		l=this.remove_completed_threads(repo.get_prog_list());
		executor.shutdownNow();
		
		repo.set_prog_list(l);
	}
	
	public MyIList<String> allSteps() throws ExceptionFile,ExceptionHeap,ExceptionExpression,IOException, InterruptedException{
		MyIList<String> output =repo.get_prog_list().get(0).get_List();
		
		executor=Executors.newFixedThreadPool(2);
		List<ProgramState> l=this.remove_completed_threads(repo.get_prog_list());
		while(l.size()>0){
			this.oneStepForAllProgStates(l);
			l=this.remove_completed_threads(repo.get_prog_list());
		}
		executor.shutdownNow();
		
		repo.set_prog_list(l);
		
		return output;
	}
	
	MyIHeap<Integer> conservativeGarbageCollector(MyIDictionary<String,Integer> dic,MyIHeap<Integer> heap){
		
		ArrayList<Tuple<Integer,Integer>> s=heap.toArrayTuple();
		for(int i=0;i<s.size();i++){
			Tuple<Integer,Integer> t=s.get(i);
			if(dic.look_up_value(t.x)==false){
				heap.Del(t.x);
			}
		}
		
		return heap;
	}

	@Override
	public List<ProgramState> remove_completed_threads(List<ProgramState> l) {
		
		return l.stream().filter(p->p.isNotCompleted()).collect(Collectors.toList());
	}
}

package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import exceptions.ExceptionEndOfExecution;
import exceptions.ExceptionExpression;
import exceptions.ExceptionFile;
import exceptions.ExceptionHeap;
import model.MyIList;
import statements.ProgramState;


public interface IController {
	public void oneStepForAllProgStates(List<ProgramState> l) throws ExceptionFile,ExceptionHeap,ExceptionExpression,IOException, InterruptedException;
	public MyIList<String> allSteps() throws ExceptionFile,ExceptionHeap,ExceptionExpression,IOException, InterruptedException;
	public List<ProgramState> remove_completed_threads(List<ProgramState> l);
	public void OneStep() throws ExceptionFile, ExceptionHeap,ExceptionEndOfExecution, ExceptionExpression, IOException, InterruptedException;
	public ArrayList<String> getAllPrgStates();
	public ProgramState getPrgStateByStr(String str);
}

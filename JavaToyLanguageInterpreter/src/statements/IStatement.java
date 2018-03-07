package statements;

import exceptions.ExceptionExpression;
import exceptions.ExceptionFile;
import exceptions.ExceptionHeap;
import exceptions.MyException;

public interface IStatement {
	public String toString();
	public ProgramState execute(ProgramState state) throws ExceptionExpression,ExceptionFile,ExceptionHeap, MyException;
}

package exceptions;

@SuppressWarnings("serial")
public class ExceptionEndOfExecution extends Exception{
	public ExceptionEndOfExecution(String mes){
		super(mes);
	}
}

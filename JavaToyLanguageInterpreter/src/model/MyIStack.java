package model;
import exceptions.ExceptionMyStack;

public interface MyIStack<T> {
	public T pop() throws ExceptionMyStack;
	public void push(T val);
	public T peek() throws ExceptionMyStack;
	public String toString();
	public boolean is_empty();
	public Object[] toArray();
}

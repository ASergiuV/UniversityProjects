package model;

import java.util.Stack;

import exceptions.ExceptionMyStack;

public class MyStack<T> implements MyIStack<T>{
	private Stack<T> stack;
	
	public MyStack(){
		this.stack=new Stack<T>();
	}
	
	public T pop() throws ExceptionMyStack{
		if(this.is_empty()==true){
			throw new ExceptionMyStack("The Stack is Empty");
		}
		return this.stack.pop();
	}
	
	public void push(T val){
		this.stack.push(val);
	}
	
	public T peek() throws ExceptionMyStack{
		if(this.is_empty()==true){
			throw new ExceptionMyStack("The Stack is Empty");
		}
		T val;
		val=this.stack.pop();
		this.stack.push(val);
		return val;
		}
	
	public boolean is_empty(){
		return this.stack.empty();
	}
	
	
	@Override
	public String toString(){
		String res;
			res="[";
			try{
			
			Object[] obj=this.stack.toArray();
			for(int i=obj.length-1;i>=1;i--){
				res=res+obj[i].toString()+" | ";
			}
			if(obj.length>0)
				res=res+obj[0].toString();
			}
			catch(NullPointerException e){
				
			}
			res=res+"]";
		return res;
		
	}
	
	public Object[] toArray(){
		return this.stack.toArray();
	}
}

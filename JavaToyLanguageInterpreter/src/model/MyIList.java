package model;


public interface MyIList<T>{
	public void append(T val);
	public String toString();
	public T get_val(int pos);
	public void update(int pos,T nval);
	public Object[] toArray();
	public int size();
	public boolean isInList(T id);
}

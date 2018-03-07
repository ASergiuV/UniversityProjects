package model;

import java.util.ArrayList;

public interface MyIHeap<T> {
	public int Add(T el);
	public void Del(int pos);
	public void Modify(int pos,T val);
	public ArrayList<Tuple<Integer,T>> toArrayTuple();
	public String toString();
	public T get(Integer key);
}

package model;

import java.util.ArrayList;

public interface MyIDictionary<K,E>{
	public void add(K key,E el);
	public void delete(K key);
	public boolean look_up(K key);
	public void update(K key,E val);
	public E get_value(K key);
	public String toString();
	public E lookup(K id);
	public ArrayList<String> toArrayString();
	public ArrayList<Tuple<K,E>> toArrayTuple();
	//public ArrayList<Tuple<K,E>> toArrayTuple2();
	public boolean look_up_value(E val);
	public MyIDictionary<K,E> clone();
}

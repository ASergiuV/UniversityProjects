package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

public class MyHeap<T> implements MyIHeap<T>{
	private HashMap<Integer,T> dic;
	private int npos;
	
	public MyHeap(){
		dic=new HashMap<Integer,T>();
		npos=1;
	}
	
	public int Add(T el){
		dic.put(npos, el);
		npos++;
		return npos-1;
	}
	
	public T get(Integer key){
		return this.dic.get(key);
	}
	
	public void Del(int pos){
		this.dic.remove(pos);
	}
	
	public void Modify(int pos,T val){
		this.dic.remove(pos);
		this.dic.put(pos, val);
	}
	
	public ArrayList<Tuple<Integer,T>> toArrayTuple(){
		ArrayList<Tuple<Integer,T>> l=new ArrayList<Tuple<Integer,T>>();
		
		Iterator<Entry<Integer, T>> it=this.dic.entrySet().iterator();
		while(it.hasNext()){
			@SuppressWarnings("rawtypes")
			Map.Entry pair=(Map.Entry)it.next();
			@SuppressWarnings("unchecked")
			Tuple<Integer,T> t=new Tuple<Integer,T>((Integer)pair.getKey(),(T)pair.getValue());
			l.add(t);
		}
		
		return l;
	}
	
	@Override
	public String toString(){
		String res;
		res="[";
		
		Iterator<Entry<Integer, T>> it=this.dic.entrySet().iterator();
		while(it.hasNext()){
			@SuppressWarnings("rawtypes")
			Map.Entry pair=(Map.Entry)it.next();
			res=res+" "+pair.getKey()+" ---> "+pair.getValue().toString()+" ; ";
		}
		
		res=res+"]";
		
		return res;
	}
}

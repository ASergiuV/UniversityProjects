package model;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

public class MyDictionary<K,E> implements MyIDictionary<K,E>{
	private HashMap<K,E> dic;
	
	public MyDictionary(){
		this.dic=new HashMap<K,E>();
	}
	
	public boolean look_up(K key){
		E x=this.dic.get(key);
		if(x==null)
			return false;
		else 
			return true;
	}
	
	public boolean look_up_value(E val){
		Iterator<Entry<K, E>> it=this.dic.entrySet().iterator();
		while(it.hasNext()){
			@SuppressWarnings("rawtypes")
			Map.Entry pair=(Map.Entry)it.next();
			if(pair.getValue()==val)
				return true;
		}
		return false;
	}
	
	public void update(K key,E val){
		this.dic.remove(key);
		this.dic.put(key, val);
	}
	
	public void add(K key,E el){
		this.dic.put(key, el);
	}
	
	public void delete(K key){
		this.dic.remove(key);
	}
	
	public E get_value(K key){
		return this.dic.get(key);
	}
	
	public E lookup(K id){
		return this.dic.get(id);
	}
	@Override
	public String toString(){
		String res;
		res="[";
		
		Iterator<Entry<K, E>> it=this.dic.entrySet().iterator();
		while(it.hasNext()){
			@SuppressWarnings("rawtypes")
			Map.Entry pair=(Map.Entry)it.next();
			res=res+"(Key: "+pair.getKey()+" ; Element: "+pair.getValue().toString()+") ; ";
		}
		
		res=res+"]";
		
		return res;
	}
	
	public ArrayList<Tuple<K,E>> toArrayTuple(){
		ArrayList<Tuple<K,E>> l=new ArrayList<Tuple<K,E>>();
		
		Iterator<Entry<K, E>> it=this.dic.entrySet().iterator();
		while(it.hasNext()){
			@SuppressWarnings("rawtypes")
			Map.Entry pair=(Map.Entry)it.next();
			@SuppressWarnings("unchecked")
			Tuple<K,E> t=new Tuple<K,E>((K)pair.getKey(),(E)pair.getValue());
			l.add(t);
		}
		
		return l;
	}
	
	public ArrayList<String> toArrayString(){
		ArrayList<String> l=new ArrayList<String>();
		
		Iterator<Entry<K, E>> it=this.dic.entrySet().iterator();
		while(it.hasNext()){
			@SuppressWarnings("rawtypes")
			Map.Entry pair=(Map.Entry)it.next();
			l.add(pair.getKey()+" --> "+pair.getValue().toString());
		}
		
		return l;
	}

	@Override
	public MyIDictionary<K, E> clone() {
		MyIDictionary<K, E> orig=this;
		MyIDictionary<K,E> clone=new MyDictionary<K,E>();
		ArrayList<Tuple<K,E>> l=orig.toArrayTuple();
		for(int i=0;i<l.size();i++){
			clone.add(l.get(i).x, l.get(i).y);
		}
		return clone;
	}
//
//	@Override
//	public ArrayList<Tuple<K, E>> toArrayTuple2() {
//		ArrayList<Tuple<K,E>> l=new ArrayList<Tuple<K,E>>();
//		
//		for(Entry<K, E> t:this.dic.entrySet())
//			Tuple<K,E> tup2=new Tuple<K,E>((K)t.getKey(),(E)t.getValue());
//			l.add(tup);
//		}
//		
//		return l;
//	}
}

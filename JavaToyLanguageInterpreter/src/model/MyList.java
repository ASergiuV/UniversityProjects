package model;

import java.util.ArrayList;

public class MyList<T> implements MyIList<T>{
	private ArrayList<T> list;
	
	public MyList(){
		this.list=new ArrayList<T>();
	}
	
	public void append(T el){
		this.list.add(el);
	}
	public int size() {
		return list.size();
	}
	
	public T get_val(int pos){
		return this.list.get(pos);
	}
	
	public void update(int pos,T nval){
		this.list.set(pos, nval);
	}
	
	@Override
	public String toString(){
		String rez;
		rez="[";
		Object[] obj=this.list.toArray();
		for(int i=0;i<obj.length-1;i++){
			rez=rez+obj[i].toString()+" ; ";
		}
		if(obj.length>0)
			rez=rez+obj[obj.length-1].toString();
		rez=rez+"]";
		
		return rez;
	}
	
	public Object[] toArray(){
		return this.list.toArray();
	}

	@Override
	public boolean isInList(T el){
		for(T e:list){
			if(e == el){
				return true;
			}
		}
		return false;
	}
}

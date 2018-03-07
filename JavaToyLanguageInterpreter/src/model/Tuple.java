package model;

public class Tuple<X,Y>{
	public X x;
	public Y y;
	public String z;
	
	public Tuple(X v1,Y v2){
		this.x=v1;
		this.y=v2;
	}
	public X getFirst() {
		return x;
	}
	public Y getSecond() {
		return y;
	}
	
	public Tuple(X v1,Y v2,String v3){
		this.x=v1;
		this.y=v2;
		this.z=v3;
	}
	
	@Override
	public String toString(){
		String res="";
			
			res+=" < "+this.x.toString()+" ; "+ this.y.toString()+" > ";
		
		return res;
	}
}

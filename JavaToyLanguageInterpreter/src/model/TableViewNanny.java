package model;

public class TableViewNanny {
	private String val_one;
	private String val_two;
	private String val_three;
	
	public TableViewNanny(){
		val_one="";
		val_two="";
	}
	
	public TableViewNanny(String a,String b){
		val_one=a;
		val_two=b;
	}
	public TableViewNanny(String a,String b,String c){
		val_one=a;
		val_two=b;
		setVal_three(c);
	}
	
	public void setVal_one(String s){
		val_one=s;
	}
	
	public void setVal_two(String s){
		val_two=s;
	}
	
	public String getVal_one(){
		return val_one;
	}
	
	public String getVal_two(){
		return val_two;
	}

	public String getVal_three() {
		return val_three;
	}

	public void setVal_three(String val_three) {
		this.val_three = val_three;
	}
}

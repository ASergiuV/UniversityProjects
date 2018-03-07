package expressions;

import exceptions.ExceptionExpression;
import exceptions.ExceptionHeap;
import model.MyIDictionary;
import model.MyIHeap;


public class ArithmExpression extends Expression {
	 
	 Expression Exp1;
	 Expression Exp2;
	 int operation;
	 
	 public ArithmExpression(Expression ex1,Expression ex2,int oper){
		 this.Exp1=ex1;
		 this.Exp2=ex2;
		 this.operation=oper;
	 }
	
	 @Override
	 public int Eval(MyIDictionary<String,Integer> dic,MyIHeap<Integer> heap) throws ExceptionExpression,ExceptionHeap{
		 int res=0;
		 
		 if(this.operation==1){
			 res=this.Exp1.Eval(dic,heap)+this.Exp2.Eval(dic,heap);
		 }
		 else
		 if(this.operation==2){
			 res=this.Exp1.Eval(dic,heap)-this.Exp2.Eval(dic,heap);
		 }
		 else
		 if(this.operation==3){
			 res=this.Exp1.Eval(dic,heap)*this.Exp2.Eval(dic,heap);
		 }
		 else
		 if(this.operation==4){
			 if(this.Exp2.Eval(dic,heap)==0)
				 throw new ExceptionExpression("Division by 0");
			 res=this.Exp1.Eval(dic,heap)/this.Exp2.Eval(dic,heap);
		 }
		 
		 
		 return res;
	 }
	 
	 @Override
	 public String toString(){
		 String res="";
		 String op;
		 op=" Unknown Operation ";
		 if(this.operation==1) op="+";
		 if(this.operation==2) op="-";
		 if(this.operation==3) op="*";
		 if(this.operation==4) op="/";
		 
		 res="("+this.Exp1.toString()+op+this.Exp2.toString()+")";
		 
		 return res;
	 }
}

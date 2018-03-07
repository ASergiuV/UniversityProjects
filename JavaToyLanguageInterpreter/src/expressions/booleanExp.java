package expressions;

import model.MyIDictionary;
import model.MyIHeap;
import exceptions.ExceptionExpression;
import exceptions.ExceptionHeap;

public class booleanExp extends Expression {
    Expression e1;
    Expression e2;
    int op;

    public booleanExp(Expression e1, Expression e2, int op){
        this.e1 = e1;
        this.e2 = e2;
        this.op = op;
    }

    public String toString(){

        if(1 == op)
            return this.e1.toString() + "<" + this.e2.toString();
        if(2 == op)
            return this.e1.toString() + "<=" + this.e2.toString();
        if(3 == op)
            return this.e1.toString() + "==" + this.e2.toString();
        if(4 == op)
            return this.e1.toString() + "!=" + this.e2.toString();
        if(5 == op)
            return this.e1.toString() + ">" + this.e2.toString();
        if(6 == op)
            return this.e1.toString() + ">=" + this.e2.toString();
        return "";
    }

    public int Eval(MyIDictionary<String, Integer> tbl, MyIHeap<Integer> heap) throws ExceptionExpression, ExceptionHeap {
        int rez = 0;

        if(op == 1){
            if(e1.Eval(tbl,heap) < e2.Eval(tbl, heap)){
                rez = 1;
            }
        }
        if(op == 2){
            if(e1.Eval(tbl,heap) <= e2.Eval(tbl, heap)){
                rez = 1;
            }
        }
        if(op == 3){
            if(e1.Eval(tbl,heap) == e2.Eval(tbl, heap)){
                rez = 1;
            }
        }
        if(op == 4){
            if(e1.Eval(tbl,heap) != e2.Eval(tbl, heap)){
                rez = 1;
            }
        }
        if(op == 5){
            if(e1.Eval(tbl,heap) > e2.Eval(tbl, heap)){
                rez = 1;
            }
        }
        if(op == 6){
            if(e1.Eval(tbl,heap) >= e2.Eval(tbl, heap)){
                rez = 1;
            }
        }

        return rez;
    }
}

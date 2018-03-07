package statements;

import expressions.ConstantExpression;
import expressions.Expression;
import expressions.VarExpression;
import expressions.booleanExp;
import expressions.eqExpression;
import exceptions.MyException;
import statements.ProgramState;

public class switchStatement implements IStatement{
    Expression e,e1,e2;
    IStatement s1,s2,defaul;

    public switchStatement(Expression e, Expression e1,IStatement s1, Expression e2,IStatement s2,IStatement defaul){
        this.e1 = e1;
        this.e2 = e2;
        this.e = e;
        this.s1 = s1;
        this.s2 = s2;
        this.defaul = defaul;
    }

    @Override
    public ProgramState execute(ProgramState state) {
       // if(exp==exp1) then stmt1 else (if (exp==exp2) then stmt2 else stmt3)
    	IStatement Stmt=new IfStatement(new eqExpression(e,e1),s1,new IfStatement(new eqExpression(e,e2),s2,defaul));
        state.get_Stack().push(Stmt);
        return null;
    }
/* IStatement stmt1  = new AssignStatement("v", e1);
        IStatement whileStmt = new CompStatement(stmt1, new WhileStatement(new booleanExp(new VarExpression("v"), e2, 1), new CompStatement(this.stmt,
                new AssignStatement("v", e3))));*/
    public String toString(){
        String rez = "";
        rez+= "switch("+e.toString()+")\n\t{"
        		+ "\n\t\t"
        		+ "case "+e1.toString()+": "
        +s1.toString()+"\n\t\t"
        		+ "case " +e2.toString()+": "+s2.toString()+
        "\n\t\t"
        + "default: "+defaul.toString()+"\n}";
        return rez;
    }
}
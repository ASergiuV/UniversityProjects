package statements;

import expressions.ConstantExpression;
import expressions.Expression;
import expressions.VarExpression;
import expressions.booleanExp;
import exceptions.MyException;
import statements.ProgramState;

public class forStmt implements IStatement{
    Expression e1,e2,e3;
    IStatement stmt;

    public forStmt(Expression e1, Expression e2, Expression e3,IStatement stmt){
        this.e1 = e1;
        this.e2 = e2;
        this.e3 = e3;
        this.stmt = stmt;
    }

    @Override
    public ProgramState execute(ProgramState state) {
        IStatement stmt1  = new AssignStatement("v", e1);
        IStatement whileStmt = new CompStatement(stmt1, new WhileStatement(new booleanExp(new VarExpression("v"), e2, 1), new CompStatement(this.stmt,
                new AssignStatement("v", e3))));
        state.get_Stack().push(whileStmt);
        return null;
    }

    public String toString(){
        String rez = "";

        rez = rez + "for(v = " + e1.toString() + "; v < " + e2.toString() + "; v  = " + e3.toString() + "){\n\t" +
                this.stmt.toString() + "\n}";

        return rez;
    }
}
package statements;
import exceptions.MyException;
import expressions.Expression;
import statements.ProgramState;
import statements.CompStatement;
import statements.WhileStatement;
import expressions.notExp;
public class repeatUntilStmt implements IStatement{
    IStatement localStmt;
    Expression localExpression;

    public repeatUntilStmt(IStatement st, Expression ex){
        this.localExpression = ex;
        this.localStmt = st;
    }


    @Override
    public ProgramState execute(ProgramState state) {
        IStatement stmt = new CompStatement(localStmt, new WhileStatement(new notExp(localExpression), localStmt));
        state.get_Stack().push(stmt);
        return null;
    }

    public String toString(){
        String rez = "";

        rez = rez + "repeat(" + this.localStmt.toString() + ")...until(" + this.localExpression.toString()+")";

        return rez;
    }
}

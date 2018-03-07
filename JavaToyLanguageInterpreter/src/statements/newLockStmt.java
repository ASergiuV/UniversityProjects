package statements;

import statements.IStatement;
import exceptions.MyException;
import statements.ProgramState;

public class newLockStmt implements IStatement {
    private String var;
    private Integer newFreeLocation = -1;

    public newLockStmt(String var){
        this.var = var;
    }

    @Override
    public ProgramState execute(ProgramState state) throws MyException {

        synchronized (state.getLock()){
            newFreeLocation += 1;
            state.getLock().add(newFreeLocation, -1);
            state.get_Dictionary().add(var, newFreeLocation);
        }
        return null;
    }

    public String toString(){
        String rez = "";

        rez = rez + "newLock(" + var + ")";

        return rez;
    }
}

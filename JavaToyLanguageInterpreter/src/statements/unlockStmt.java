package statements;

import statements.IStatement;
import exceptions.MyException;
import statements.ProgramState;

public class unlockStmt implements IStatement {
    private String var;

    public unlockStmt(String var){
        this.var = var;
    }

    @Override
    public ProgramState execute(ProgramState state) throws MyException {

        if(null == state.get_Dictionary().lookup(var)){
            throw new MyException("Unknown Variable!");
        }

        int foundIndex = state.get_Dictionary().lookup(var);

        synchronized (state.getLock()){
            if(null == state.getLock().lookup(foundIndex)){
                throw new MyException("Unexisting Var!");
            }

            int number = state.getLock().lookup(foundIndex);

            if(state.getId() == number){
                state.getLock().update(foundIndex, -1);
            }
        }

        return null;
    }

    public String toString(){
        String rez = "";

        rez = rez + "unlock(" + var + ")";

        return rez;
    }
}

package statements;

import statements.IStatement;
import exceptions.MyException;
import statements.ProgramState;

public class lockStmt implements IStatement {
    private String var;

    public lockStmt(String var){
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
                throw new MyException("Unlocked Variable!");
            }

            int number = state.getLock().lookup(foundIndex);

            if(number == -1){
                state.getLock().update(foundIndex, state.getId());
            }
            else{
                state.get_Stack().push(this);
            }
        }
        return null;
    }

    public String toString(){
        String rez = "";

        rez = rez + "lock(" + var + ")";

        return rez;
    }
}

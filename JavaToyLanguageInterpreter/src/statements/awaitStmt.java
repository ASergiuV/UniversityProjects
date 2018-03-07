package statements;

import statements.IStatement;
import exceptions.MyException;
import statements.ProgramState;

public class awaitStmt implements IStatement {
    private String var;

    public awaitStmt(String var){
        this.var = var;
    }

    @Override
    public ProgramState execute(ProgramState state) throws MyException{
        if(!state.get_Dictionary().look_up(var)){
            throw new MyException("Unknown variable!");
        }

        int foundIndex = state.get_Dictionary().lookup(var);

        if(!state.getBarrier().look_up(foundIndex)){
            throw new MyException("Unknown variable!\n");
        }

        synchronized (state.getBarrier()){
            if(state.getBarrier().lookup(foundIndex).getFirst().size() < state.getBarrier().lookup(foundIndex).getSecond()){
            if(state.getBarrier().lookup(foundIndex).getFirst().isInList(state.getId())){
                state.get_Stack().push(this);
            }
            else{
                state.getBarrier().lookup(foundIndex).getFirst().append(state.getId());
                state.get_Stack().push(this);
            }
        }
            }
        return null;
    }

    public String toString(){
        String rez = "";

        rez = rez + "await(" + var + ")";
        return rez;
    }
}

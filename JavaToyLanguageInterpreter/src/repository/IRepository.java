package repository;

import java.io.IOException;
import java.util.List;

import statements.*;

public interface IRepository {
	public void add_prgState(ProgramState prg);
	public void logProgramStateExecution(ProgramState ps) throws IOException;
	public List<ProgramState> get_prog_list();
	public void set_prog_list(List<ProgramState> l);
}

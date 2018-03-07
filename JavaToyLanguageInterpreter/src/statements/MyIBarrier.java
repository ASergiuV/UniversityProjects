package statements;

import model.MyIDictionary;
import model.MyIList;
import model.Tuple;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface MyIBarrier extends MyIDictionary<Integer, Tuple<MyIList<Integer>, Integer>> {
	public Map<Integer, Tuple<MyIList<Integer>, Integer>> getContent();
	public Set<Integer> keySet();
}

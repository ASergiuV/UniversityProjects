package statements;

import model.MyDictionary;
import model.MyIDictionary;
import model.MyIList;
import model.Tuple;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class MyBarrier implements MyIBarrier {
    Map<Integer, Tuple<MyIList<Integer>, Integer>> dictionary = new HashMap<Integer, Tuple<MyIList<Integer>, Integer>>();

    public Tuple<MyIList<Integer>, Integer> lookup(Integer id){
        return this.dictionary.get(id);
    }



    public boolean isDefined(Integer id){
        return this.dictionary.containsKey(id);
    }

    public void update(Integer id, Tuple<MyIList<Integer>, Integer> val){
        this.dictionary.replace(id, val);
    }

    public void add(Integer id, Tuple<MyIList<Integer>, Integer> val){
        this.dictionary.put(id, val);
    }

    public String toString(){
        String str = "\n";
        for(Integer key:dictionary.keySet()){
            str = str + key.toString();
            str = str + "->";
            Tuple<MyIList<Integer>, Integer> value = lookup(key);
            str = str + value.toString()+"\n";
        }
        return str;
    }

    public Map<Integer, Tuple<MyIList<Integer>, Integer>> getContent(){
        return this.dictionary;
    }

    public void setContent(Map<Integer, Tuple<MyIList<Integer>, Integer>> myMap){
        this.dictionary = myMap;
    }

    public void remove(Integer key) {
        this.dictionary.remove(key);
    }

    public Tuple<MyIList<Integer>, Integer> getValue(Integer key){
        return this.dictionary.get(key);
    }

    public Set<Integer> getKeys() {
        return this.dictionary.keySet();
    }

    public MyIDictionary<Integer, Tuple<MyIList<Integer>, Integer>> clone() {
        MyIDictionary<Integer, Tuple<MyIList<Integer>, Integer>> dict = new MyDictionary<Integer, Tuple<MyIList<Integer>, Integer>>();
        for(Integer key : dictionary.keySet())
            dict.add(key, dictionary.get(key));
        return dict;
    }



	@Override
	public void delete(Integer key) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public boolean look_up(Integer key) {
		// TODO Auto-generated method stub
		return false;
	}



	@Override
	public Tuple<MyIList<Integer>, Integer> get_value(Integer key) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public ArrayList<String> toArrayString() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public ArrayList<Tuple<Integer, Tuple<MyIList<Integer>, Integer>>> toArrayTuple() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public boolean look_up_value(Tuple<MyIList<Integer>, Integer> val) {
		// TODO Auto-generated method stub
		return false;
	}



	@Override
	public Set<Integer> keySet() {
		return this.dictionary.keySet();
		
	}



	
}

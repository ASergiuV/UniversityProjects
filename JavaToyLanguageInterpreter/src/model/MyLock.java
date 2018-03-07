package model;

import model.MyDictionary;
import model.MyIDictionary;
import model.MyILock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;


public class MyLock implements MyILock {

        Map<Integer, Integer> dictionary = new HashMap<Integer, Integer>();

        public Integer lookup(Integer id){
            return this.dictionary.get(id);
        }

        public boolean isDefined(Integer id){
            return this.dictionary.containsKey(id);
        }

        public void update(Integer id, Integer val){
            this.dictionary.replace(id, val);
        }

        public void add(Integer id, Integer val){
            this.dictionary.put(id, val);
        }

        public String toString(){
            String str = "\n";
            for(Integer key:dictionary.keySet()){
                str = str + key.toString();
                str = str + "->";
                Integer value = lookup(key);
                str = str + value.toString()+"\n";
            }
            return str;
        }

        public Map<Integer,Integer> getContent(){
            return this.dictionary;
        }

        public void setContent(Map<Integer,Integer> myMap){
            this.dictionary = myMap;
        }

        public void remove(Integer key) {
            this.dictionary.remove(key);
        }

        public Integer getValue(Integer key){
            return this.dictionary.get(key);
        }

        public Set<Integer> getKeys() {
            return this.dictionary.keySet();
        }

        public MyIDictionary<Integer, Integer> clone() {
            MyIDictionary<Integer, Integer> dict = new MyDictionary<Integer, Integer>();
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
		public Integer get_value(Integer key) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public ArrayList<String> toArrayString() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public ArrayList<Tuple<Integer, Integer>> toArrayTuple() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public boolean look_up_value(Integer val) {
			// TODO Auto-generated method stub
			return false;
		}

}



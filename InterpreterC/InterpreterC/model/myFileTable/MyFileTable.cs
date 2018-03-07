using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace InterpreterC.model.myFileTable
{
    public class MyFileTable<K,V>  : MyIFileTable<K, V> where V : Tuple<string, StreamReader>
    {
        private Dictionary<K, V> table;
        public MyFileTable()
        {
            table = new Dictionary<K, V>();
        }

        public V get(K key)
        {
            try {
                return table[key];
            }
            catch(Exception e)
            {
                return default(V);
            }
        }

        public Dictionary<K, V> getTable()
        {
            return table;
        }

        public bool isDefined(V myValue)
        {
            if (lookup(myValue) != true)
                return true;
            return false;
        }

        public bool lookup(V myValue)
        {
            foreach (KeyValuePair<K, V> entry in table)
            {
                if (entry.Value.Item1 == myValue.Item1)
                    return true;          
            }
            return false;
        }

        public void put(K key, V value)
        {
            table.Add(key, value);
        }

        public void remove(K key)
        {
            table.Remove(key);
        }

        public int size()
        {
            return table.Count;
        }
        public override string ToString()
        {
            String str = "File table:\n";
            foreach (KeyValuePair<K, V> entry in table)
            {
                str += entry.Value.Item1 + "\n";
            }
            return str;
        }
    }
}

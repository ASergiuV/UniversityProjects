using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterpreterC.model.myDictionary
{
    class MyDictionary<K, V> : MyIDictionary<K, V>
    {
        private Dictionary<K, V> table;

        public MyDictionary()
        {
            table = new Dictionary<K, V>();
        }

        public V get(K key)
        {
            if (isDefined(key))
                return table[key];
            return default(V);
        }

        public Dictionary<K, V> getTable()
        {
            return table;
        }

        public bool isDefined(K key)
        {
            return table.ContainsKey(key);
        }

        public V lookup(K key)
        {
            if (table.ContainsKey(key))
                return table[key];
            return default(V);
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
            String str = "Symbol table:\n";
            foreach (KeyValuePair<K, V> entry in table)
            {
                str += entry.Key + "=>" + entry.Value + "\n";
            }
            return str;
        }

        public void update(K key, V value)
        {
            table[key] = value;
        }
    }
}

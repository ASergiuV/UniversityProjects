using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterpreterC.model.myDictionary
{
    public interface MyIDictionary<K,V>
    {
        V get(K key);

        void put(K key, V value);

        int size();

        void remove(K key);

        V lookup(K key);

        Dictionary<K, V> getTable();

        bool isDefined(K key);

        void update(K key, V value);
    }
}

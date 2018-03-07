using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace InterpreterC.model.myFileTable
{
    public interface MyIFileTable<K, V> where V : Tuple<string, StreamReader>
    {
        V get(K key);

        void put(K key, V value);

        int size();

        void remove(K key);

        bool lookup(V myValue);

        Dictionary<K, V> getTable();

        bool isDefined(V myValue);
    }
}

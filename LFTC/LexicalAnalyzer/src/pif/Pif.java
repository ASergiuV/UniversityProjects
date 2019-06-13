package pif;

import javafx.util.Pair;

import java.util.ArrayList;
import java.util.List;

public class Pif {

    private List<Pair<Integer, Integer>> pif;

    public Pif() {
        pif = new ArrayList<>();
    }

    public void add(Pair<Integer,Integer> value) {
        pif.add(value);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder("PIF: {\n\t");

        pif.forEach( pair -> {
            sb.append(pair.getKey()).append(": ").append(pair.getValue()).append("\n\t");
        });

        sb.append("}\n");

        return sb.toString();

    }


}

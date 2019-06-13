import domain.Codification;
import domain.LexicalException;
import javafx.util.Pair;
import pif.Pif;

public class Main {

    private Pif pif;
    private SymbolTable symTbl;
    private Analyzer analyzer;

    private Main() {
        pif = new Pif();
        symTbl = new SymbolTable();
        analyzer = new Analyzer();
    }

    public void addToPif(Integer code){
        pif.add(new Pair<>(code, -1));
    }

    public void addToPifAndSymTbl(Integer code, String atom) {
        int index = symTbl.contains(atom);
        if( index > 0) {
            pif.add(new Pair<>(code, index));
        }
        else {
            pif.add(new Pair<>(code, symTbl.add(atom)));
        }
    }

    private void printContent() {
        System.out.println(pif);
        System.out.println(symTbl);
    }

    public static void main(String[] args) throws Exception {

        Main program = new Main();
        Analyzer analyzer = program.analyzer;

        while(!analyzer.isEnd()) {
            Codification codification;
            try{
                codification = analyzer.read();
            } catch (LexicalException e) {
//                e.printStackTrace();
                System.out.println(e.getMessage());
                return;
            }

            if(codification.id!=0 && codification.id < 33) {
                program.addToPif(codification.id);
            }

            else if(codification.id == 0 || codification.id > 32){
                program.addToPifAndSymTbl(codification.id, codification.token);
            }

            else {
                throw new Exception("Error");
            }



        }

        program.printContent();

    }
}

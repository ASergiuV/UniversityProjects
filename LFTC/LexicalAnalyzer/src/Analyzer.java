import domain.Codification;
import domain.LexicalException;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;


public class Analyzer {

    private static final List<Character> SEPARATORS = Arrays.asList('(', ')', '[' , ']', '{', '}',  ';');
    private String fileAsString;
    private static final String FILE_PATH = "D:\\Programming\\Facultate\\LFTC\\LexicalAnalyzer\\src\\input.txt";

    public Analyzer() {

        try{
            List<String> lines = Files.readAllLines(Paths.get(FILE_PATH));
            StringBuilder sb = new StringBuilder();
            lines.forEach( x-> sb.append(x.trim()).append(" "));

            this.fileAsString = sb.toString().trim();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public Codification read() throws LexicalException {

        int pointer  = 1;
        char separator = fileAsString.charAt(0);

        if (SEPARATORS.contains(separator)){

            fileAsString = fileAsString.substring(1).trim();

            return Codification.getSeparatorCodification(separator);
        }

        if(separator=='"') {
            String withoutMark = fileAsString.substring(1);
            int idxQ = withoutMark.indexOf('"');
            if(idxQ < 0){
                throw new LexicalException("Quotation marks left unclosed");
            }
            String strConst = fileAsString.substring(0, idxQ+2);
            fileAsString = fileAsString.substring(idxQ+2).trim();

            return Codification.getCodification(strConst);
        }

        while(pointer < fileAsString.length()) {

            separator = fileAsString.charAt(pointer);

            if(SEPARATORS.contains(separator) || separator==' '){
                String atom = fileAsString.substring(0, pointer).trim();

                Codification codification = Codification.getCodification(atom);

                if(codification == null) {
                    throw new LexicalException("Undefined atom: " + atom);
                }

                fileAsString = fileAsString.substring(pointer).trim();

                return codification;

            }
            pointer++;

        }
        throw new LexicalException("Missing separator after: " + fileAsString);

    }

    public boolean isEnd() {

        return fileAsString.isEmpty();
    }


}

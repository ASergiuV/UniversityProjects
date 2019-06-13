package domain;

public enum Codification {

    IDENTIFIER(0, "^[a-zA-Z][a-zA-Z0-9_]{0,255}$", ""),
    MAIN(1, "MAIN"),
    CURLY_BRACKET_OPEN(2, "{"),
    CURLY_BRACKET_CLOSE(3, "}"),
    BRACKET_OPEN(4, "("),
    BRACKET_CLOSE(5, ")"),
    SQUARE_BRACKET_OPEN(6,"["),
    SQUARE_BRACKET_CLOSE(7, "]"),
    SEMICOLON(8, ";"),
    ASSIGN(9, "="),
    PLUS(10, "+"),
    MINUS(11, "-"),
    TIMES(12, "*"),
    DIV(13, "/"),
    MOD(14, "%"),
    LESS_THAN(15, "<"),
    LESS_OR_EQUAL(16, "<="),
    EQUAL(17, "=="),
    GREATER_OR_EQUAL(18, ">="),
    GREATER(19, ">"),
    IF(20, "IF"),
    THEN(21, "THEN"),
    ELSE(22, "ELSE"),
    FOR(23, "FOR"),
    WHILE(24, "WHILE"),
    DO(25, "DO"),
    READ(26, "READ"),
    PRINT(27, "PRINT"),
    EMPTY_SPACE(28, " "),
    INT(29, "INT"),
    FLOAT(30, "FLOAT"),
    BOOL(31, "BOOL"),
    ENUM(32, "ENUM"),
    INT_CONST(33, "^-?[0-9]+$", ""),
    FLOAT_CONST(34, "^-?[0-9]+.[0-9]+"),
    BOOL_CONST(35, "^true|false$", ""),
    STRING_CONST(36, "^\".*\"$");


    public int id;
    public String name;
    public String token;

    Codification(int id, String name) {

        this.id = id;
        this.name = name;
    }

    Codification(int id, String name, String token){

        this.id = id;
        this.name = name;
        this.token = token;
    }

    public void setToken(String token){
        this.token = token;
    }

    public static Codification getSeparatorCodification(Character separator) {

        for(int i=2; i<9; i++) {
            if(Codification.values()[i].name.charAt(0) == separator) {

                return Codification.values()[i];
            }
        }

        return null;
    }

    public static Codification getCodification(String name) {

        for( Codification atom : Codification.values()) {
            if( atom.name.equals(name.toUpperCase()))
                return atom;
        }

        if( name.matches(Codification.IDENTIFIER.name)){
            Codification.IDENTIFIER.setToken(name);
            return Codification.IDENTIFIER;
        }

        if( name.matches(Codification.INT_CONST.name)){
            Codification.INT_CONST.setToken(name);
            return Codification.INT_CONST;
        }

        if( name.matches(Codification.BOOL_CONST.name)){
            Codification.BOOL_CONST.setToken(name);
            return Codification.BOOL_CONST;
        }

        if( name.matches(Codification.FLOAT_CONST.name)){
            Codification.FLOAT_CONST.setToken(name);
            return Codification.FLOAT_CONST;
        }

        if( name.matches(Codification.STRING_CONST.name)) {
            Codification.STRING_CONST.setToken(name);
            return Codification.STRING_CONST;
        }

        return null;

    }
}

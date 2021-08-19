package clasesDAO;

public class Token {
    private String lexema;
    private String tipoToken;
    private int linea;
    private int columna;

    /**
     * Constructor de los tokens
     * se obtiene el tipo de token
     * el lexema (valor del token)
     * y las linea y col donde ocurre
     * @param tipoToken
     * @param lexema
     * @param linea
     * @param columna
     */
    public Token(String tipoToken, String lexema, int linea, int columna) {
        this.tipoToken = tipoToken;
        this.lexema = lexema;
        this.linea = linea;
        this.columna = columna;
    }

    /**
     * Se obtiene el valor (lexema ) del  token
     * @return
     */
    public String getLexema() {
        return lexema;
    }

    /**
     * Se obtiene la linea del token
     * @return
     */
    public int getLinea() {
        return linea;
    }

    /**
     * Se obtiene la columa del token
     * @return
     */
    public int getColumna() {
        return columna;
    }

    public String getTipoToken() {
        return tipoToken;
    }

    public void setTipoToken(String tipoToken) {
        this.tipoToken = tipoToken;
    }

    public void setLinea(int linea) {
        this.linea = linea;
    }

    public void setColumna(int columna) {
        this.columna = columna;
    }
    
    
}
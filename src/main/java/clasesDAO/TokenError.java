package clasesDAO;

/**
 * Clase especializada en los tipos de errores
 */
public class TokenError extends Token{
    // String que contendra la descripcion de los errores
    private String msgError;

    /**
     * Constructor de los tokens
     * se obtiene el tipo de token
     * el lexema (valor del token)
     * el mensaje/descripcion del error
     * y las linea y col donde ocurre
     *
     * @param tipoToken
     * @param lexema
     * @param linea
     * @param columna
     */
    public TokenError(String tipoToken, String lexema, String msgError, int linea, int columna) {
        super(tipoToken, lexema, linea, columna);
        this.msgError = msgError;
    }

    /**
     * getter de mensaje error
     * @return
     */
    public String getMsgError() {
        return msgError;
    }

    /**
     * Setter de mensaje error
     * @param msgError
     */
    public void setMsgError(String msgError) {
        this.msgError = msgError;
    }
}

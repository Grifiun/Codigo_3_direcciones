/*Primera seccion, librerias */
package gramatica;
import java_cup.runtime.*;
import static gramatica.sym.*;
import clasesDAO.Token;
import clasesDAO.TokenError;
import java.util.ArrayList;

/*Segunda seccion, config*/
%%
%class lexer
%cup
%cupdebug
%unicode
%line
%public
%column


%{
    //Creamos un listado de llos errores lexicos
    ArrayList<TokenError> listadoErroresLexicos = new ArrayList();
    int nivelIdentacion = 0;
    ArrayList<Integer> nivelesIdentacion = new ArrayList();
%}

%{
    //Funciones
    //retorna un simbolo despues de crear un nuevo token y agregarlo al listado
    private Symbol retornarSimbolo(int tipo, String tipoToken, String lexema, int fila, int columna){
        //creamos un  token auxiliar
        Token tokenAux = new Token(tipoToken, lexema, fila, columna);
        //System.out.println("Fila: "+fila+" Columa: "+columna+" Token: "+tipoToken+ " Lexema: "+lexema);
        //retornamos el token aux como simbolo
        return new Symbol(tipo, tokenAux);
    }

       
    //Agregamos un token al array list de errores lexicos
    private void addErrorLexico(String tipoToken, String lexema, String msgError, int fila, int columna){
        //creamos un  token auxiliar
        TokenError tokenErrorAux = new TokenError(tipoToken, lexema, msgError, fila, columna);
        //Agregamos al listado
        listadoErroresLexicos.add(tokenErrorAux);
    }

    //Obtenemos el arrLust de los errores lexicos
    public ArrayList<TokenError> obtenerListadoErroresLexicos(){
        return listadoErroresLexicos;
    }
%}

//SEPARADORES
SEPARADORES = [ \r\t\b\f\n]

//SIMBOLOS
PAREN_INI    = "("
PAREN_FIN    = ")"

//OPERADORES MATEMATICOS
SIGNO_MAS   = "+"
SIGNO_MIN   = "-"
SIGNO_POR   = "*"
SIGNO_DIV   = "/"
SIGNO_IGUAL = "="

//DATOS
NUMERO = [0-9]+
ID = ([a-z]|[A-Z])+

/////////////////////

%%

/*Tercera accion, expresiones*/
<YYINITIAL>{
    //SIMBOLOS
    {PAREN_INI       }           { return retornarSimbolo(PAREN_INI       , "PAREN_INI"       , yytext(), yyline + 1, yycolumn + 1); }    
    {PAREN_FIN       }           { return retornarSimbolo(PAREN_FIN       , "PAREN_FIN"       , yytext(), yyline + 1, yycolumn + 1); }  

    //OPERADORES MATEMATICOS
    {SIGNO_MAS   }           { return retornarSimbolo(SIGNO_MAS   , "SIGNO_MAS"   , yytext(), yyline + 1, yycolumn + 1); }
    {SIGNO_MIN   }           { return retornarSimbolo(SIGNO_MIN   , "SIGNO_MIN"   , yytext(), yyline + 1, yycolumn + 1); }
    {SIGNO_POR   }           { return retornarSimbolo(SIGNO_POR   , "SIGNO_POR"   , yytext(), yyline + 1, yycolumn + 1); }
    {SIGNO_DIV   }           { return retornarSimbolo(SIGNO_DIV   , "SIGNO_DIV"   , yytext(), yyline + 1, yycolumn + 1); } 
    {SIGNO_IGUAL   }           { return retornarSimbolo(SIGNO_IGUAL   , "SIGNO_IGUAL"   , yytext(), yyline + 1, yycolumn + 1); }  


    //DATOS
    {NUMERO       }           { return retornarSimbolo(NUMERO       , "NUMERO"       , yytext(), yyline + 1, yycolumn + 1); }  
    {ID           }           { return retornarSimbolo(ID           , "ID"           , yytext(), yyline + 1, yycolumn + 1); }   

    ///////////////////
    //{PROGRAMA       }           { return retornarSimbolo(PROGRAMA       , "PROGRAMA"       , yytext(), yyline + 1, yycolumn + 1); }   
    
    //{}           { return retornarSimbolo(HEX, "HEX" , yytext(), yyline + 1, yycolumn + 1); }
    
    {SEPARADORES }           { /*                                                                                     */ }
}

[^] { addErrorLexico ("LEXICO", yytext(), "Token no valido", yyline + 1, yycolumn + 1);}




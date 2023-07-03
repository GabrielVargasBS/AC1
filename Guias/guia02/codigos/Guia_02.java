/**
 * Arquitetura de Computadores I - Guia_02.
 * Nome: Gabriel Vargas Bento de Souza Matricula: 778023
 */


public class Guia_02
{
    /**
     * Contador de erros.
     */
    private static int errors = 0;

    /**
     * Testar se dois valores sao iguais.
     * @param x - primeiro valor
     * @param y - segundo  valor
     */
    public static void test_equals ( Object x, Object y )
    {
        if ( (""+x).compareTo(""+y) != 0 )
            errors = errors + 1;
    } // end test_equals( )

    /**
     * Exibir total de erros.
     * @return mensagem com total de erros
     */
    public static String test_report ( )
    {
        return ( ""+errors );
    } // end test_report( )

    
    /**
     * Testar se e' numero binario decimal
     */
    public static boolean eBinarioDecimal ( String s )
    {
        boolean OK = true;
        int index = 0;
        char ponto [] = { '0', '0', '0' };

        int tamanho = s.length();
        OK = OK && (tamanho > 0);
    
        for ( int i = 0; i < tamanho; i++ )
        {
            OK = OK && (s.charAt(i) == '0' || s.charAt(i) == '1' || s.charAt(i) == '.' );
            if (s.charAt(i) == '.' && i != 0 )
            {
                ponto[index] = '.';
                index++;
            }
        }
        
        OK = OK && ( ponto[0] == '.' || ponto[1] == '0' || ponto[2] == '0' );
    
        return OK;
    } // end eBinario( )

    /**
     * Funcao para contar digitos antes da virgula
     * @param value
     * @return valor
     */
    public static int antesDaVirgula ( String value )
    {
        int  i =  0 ;
        char c = ' ';

        if ( eBinarioDecimal(value) )
        {
            while( c != '.' )
            {
                c = value.charAt(i);
                i++;
            }
            i--;
        }

        return (i);
    }

    /**
     * Converter valor binario para decimal com parte fracionaria.
     * @return decimal equivalente
     * @param value - valor binario
     */
    public static double bin2double ( String value )
    {
        double decimal  =  0.0;
        double expoente =  0  ;
        double potencia =  0  ;
        int    index    =  0  ;
        char    c       = ' ' ;

        int antesVirgula  = 0;
        int depoisVirgula = 0;

        if ( eBinarioDecimal(value) )
        {

            antesVirgula  = antesDaVirgula(value);
            depoisVirgula = value.length() - antesVirgula - 1;


            expoente = 1.0*(antesVirgula-1);
            while ( expoente >= (-depoisVirgula) )
            {
                c = value.charAt(index);
                potencia = Math.pow(2.0,expoente);
                decimal += (potencia * ((int)c-48));
                expoente--;
                index++;

                if ( index == antesVirgula )
                {
                    index++;
                }
            }
        }
        return (decimal);
    } // end bin2double( )

    /**
     * Converter valor decimal para binario com parte fracionaria.
     * @return valor binario equivalente
     * @param value - decimal
     */
    public static String double2bin ( double value )
    {
        return ( "0" );
    } // end double2bin ( )

    /**
     * Converter valor binario com parte fracionaria para base indicada.
     * @return base para a conversao
     * @param value - valor binario
     */
    public static String dbin2base ( String value, int base )
    {
        return ( "0" );
    } // end dbin2base ( )

    /**
     * Converter valor com parte fracionaria de uma base para outra base indicada.
     * @return valor equivalente na segunda base
     * @param value - valor na base1
     * @param base1 - primeira base
     * @param base2 - base para a conversao
     */
    public static String dbase2base ( String value, int base1, int base2 )
    {
        return ( "0" );
    } // end dbase2base ( )

    /**
     * Operar valores em binartest_
     * @return valor resultante da operacao, se valida
     * @param value1 - primeiro valor binario
     * @param op - operacao
     * @param value2 - segundo valor binario
     */
    public static String dbinEval ( String value1, String op, String value2 )
    {
        return ( "0" );
    } // end dbinEval ( )

    /**
     * Acao principal
     */
    public static void main ( String[] args )
    {
        System.out.println ( "Guia_01 - Java Tests" );
        System.out.println ( "Nome: Gabriel Vargas" );
        System.out.println ( "Matricula: 778023"    );
        System.out.println ( );

        test_equals ( bin2double ( "0.01001"  ), 0.28125  );
        test_equals ( bin2double ( "0.01011"  ), 0.34375 );
        test_equals ( bin2double ( "0.11001"  ), 0.78125 );
        test_equals ( bin2double ( "1.10011"  ), 1.59375 );
        test_equals ( bin2double ( "11.10110"  ), 3.6875 );
        System.out.println ( "1. errorTotalReport = "+test_report ( ) );
    
        System.out.print ( "\n\nApertar ENTER para terminar." );
        System.console ( ).readLine ( );

    }

}
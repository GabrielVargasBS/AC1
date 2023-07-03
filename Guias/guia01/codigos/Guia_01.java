/**
 * Arquitetura de Computadores I - Guia_01.
 * Nome: Gabriel Vargas Bento de Souza Matricula: 778023
 */


public class Guia_01
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
     * Converter valor decimal para binario.
     * @return binario equivalente
     * @param  value - valor decimal
     */
    public static String dec2bin ( int value )
    {
        String espelhado  = "";
        String convertido = "";
        int y   = 0;
        int tmp = 0;
        int cont= 0;

        if ( value >= 0 )
        {
            y = value;
            do
            {
                tmp = y % 2;
                y   = y / 2;
                espelhado += (char)( 48+tmp );
                cont++; 
            } while ( y > 0 );
        }

        // inverter resultado
        for ( int i = cont-1; i >= 0; i-- )
            convertido += espelhado.charAt(i); 

        return (convertido);
    } // end dec2bin( )

    /**
     * Testar se e' numero binario 
     */
    public static boolean eBinario ( String s )
    {
        boolean OK = true;
        int tamanho = s.length();
        OK = OK && (tamanho > 0);
    
        for ( int i = 0; i < tamanho; i++ )
        {
            OK = OK && (s.charAt(i) == '0' || s.charAt(i) == '1' );
        }
    
        return OK;
    } // end eBinario( )

    /**
     * Converter valor binario para decimal.
     * @return decimal equivalente
     * @param  value - valor binario
     */
    public static int bin2dec ( String value )
    {
        int decimal  =  0 ;
        int expoente =  0 ;
        int potencia =  0 ;
        int index    =  0 ;
        char c       = ' ';

        if ( eBinario(value) )
        {
            expoente = value.length()-1;
            while ( expoente >= 0 )
            {
                c = value.charAt(index);
                potencia = (int)Math.pow(2.0,expoente);
                decimal += (potencia * ((int)c-48));
                // MyIO.println("decimal " + decimal);
                expoente--;
                index++;
            }
        }
        return (decimal);   
    } // end bin2dec( )

    /**
     * Converter decimal para a base indicada.
     * @return base para a conversao
     * @param value - valor decimal
     */
    public static String dec2base ( int value, int base )
    {
        String espelhado  = "";
        String convertido = "";
        int tmp = 0 ;
        int y   = 0 ;
        int cont= 0 ;

        if ( value >= 0 && base > 1)
        {
            y = value;
            do
            {
                tmp = y % base;
                y   = y / base;

                if ( tmp >= 10 )
                {
                    espelhado += (char)( 55+tmp );
                    cont++;
                }
                else
                {
                    espelhado += (char)( 48+tmp );
                    cont++;
                }
            } while ( y > 0 );
        }

        // inverter resultado
        for ( int i = cont-1; i >= 0; i-- )
        {
            convertido += espelhado.charAt(i); 
        }

        return (convertido);
    } // end dec2base( )

    /**
     * Converter valor binario para base indicada.
     * @return valor equivalente na basa indicada
     * @param value - valor binario
     * @param base  - para a conversao
     */
    public static String bin2base ( String value, int base )
    {
        String convertido = "";
        String completado = "";

        int restoDivisao  =  0;
        int teste         =  0;
        int expoente      = -1;
        int parcela1      =  0;
        int parcela2      =  0;
        int index         =  0;

        if (eBinario(value) && (base == 2 || base == 4 || 
                                base == 8 || base == 16))
        {
            // encontrar expoente da base
            teste = base;
            while ( teste != 0 )
            {
                teste = teste / 2;
                expoente ++;
            }

            // completar value
            restoDivisao = value.length() % expoente;
            
            if ( restoDivisao != 0 )
            {
                restoDivisao = expoente - restoDivisao;
                for (int i = 0; i < restoDivisao; i++ )
                {
                    completado += "0";
                }
                completado += value;
            }
            else
               completado = value;

            // converter
            teste = 0;
            index = 0;
            for ( int x = completado.length()/expoente; x > 0; x-- )
            {
                for ( int y = expoente-1; y >= 0; y-- )
                {
                    parcela1 = (int)Math.pow( 2.0, (1.0*y) );
                    parcela2 = (int)completado.charAt(index) - 48;
                    teste += parcela1 * parcela2;
                    index++;
                }

                if ( teste >= 10 )
                   teste += 7;
                
                
                convertido += (char)(teste+48);
                teste = 0;
            }
            
        }
        return ( convertido );
    } // end bin2base( )

    // /**
    //  * Testar se letra minuscula
    //  */
    // public static boolean eLetraMinuscula ( char c )
    // {
    //     return  ( c >= 'a' && c <= 'z' );
    // } // end eLetraMinuscula( )

    // /**
    //  * Converter minuscula em maiuscula
    //  */
    // public static String paraMaiuscula ( char c )
    // {
    //     String buffer = "";
    //     buffer += (char) (c-32);
    //     return ( buffer );
    // }

    /**
     * Converter valor em ASCII pra hexadecimal.
     * @return hexadecimal equivalente
     * @param value - caractere(s) em codigo ASCII
     */

    // ESTA resolucao nao e' de total autoral, pois tive de pesquisar;
    // esta funcao ja existente em Java
    public static String ASCII2hex ( String value )
    {
        String convertido = "";
        int tamanho = 0;
        char[] separados = new char[80];

        tamanho = value.length();
        separados = value.toCharArray();
        for ( int i = 0; i < tamanho; i++ )
        {
            convertido += Integer.toHexString((int)separados[i]);
            convertido += " ";
        }
        
        return ( convertido );
    } // end ASII2hex( )

    /**
     * Converter valor em hexadecimal para ASCII.
     * @return caractere(s) em codigo ASCII
     * @param value - hexadecimal equivalente(s)
     */
    public static String hex2ASCII ( String value )
    {
        return ( "0" );
    } // end hex2ASCII( )

    /**
     * Acao principal
     */
    public static void main ( String[] args )
    {
        System.out.println ( "Guia_01 - Java Tests" );
        System.out.println ( "Nome: Gabriel Vargas" );
        System.out.println ( "Matricula: 778023"    );
        System.out.println ( );

        test_equals ( dec2bin ( 27 ), "11011"     );
        test_equals ( dec2bin ( 56 ), "111000"    );
        test_equals ( dec2bin ( 721), "1011010001");
        test_equals ( dec2bin ( 231), "11100111"  );
        test_equals ( dec2bin ( 365), "101101101" );
        System.out.println ( "1. errorTotalReport = "+test_report ( ) );

        test_equals ( bin2dec ( "10111"  ), 23 );
        test_equals ( bin2dec ( "11100"  ), 28 );
        test_equals ( bin2dec ( "101100" ), 44 );
        test_equals ( bin2dec ( "110101" ), 53 );
        test_equals ( bin2dec ( "111001" ), 57 );
        System.out.println ( "2. errorTotalReport = "+test_report ( ) );

        test_equals ( dec2base (  77,  4 ), "1031" );
        test_equals ( dec2base (  49,  8 ), "61"   );
        test_equals ( dec2base (  68, 16 ), "44"   );
        test_equals ( dec2base ( 175, 16 ), "AF"   );
        test_equals ( dec2base ( 781, 16 ), "30D"  );
        System.out.println ( "3. errorTotalReport = "+test_report ( ) );

        test_equals ( bin2base (  "10010",   4 ), "102" );
        test_equals ( bin2base (  "11001",   8 ), "31"  );
        test_equals ( bin2base ( "101101",  16 ), "2D"  );
        test_equals ( bin2base ( "101110",   8 ), "56"  );        
        test_equals ( bin2base ( "110101",   4 ), "311" );
        System.out.println ( "4. errorTotalReport = "+test_report ( ) );

        test_equals ( ASCII2hex ( "PUC-Minas" ), "50 55 43 2d 4d 69 6e 61 73" );
        test_equals ( ASCII2hex ( "02-2022" ), "50 55 43 2d 4d 69 6e 61 7330 32 2d 32 30 32 32" );
        test_equals ( ASCII2hex ( "Belo Horizonte" ), "42 65 6c 6f 20 48 6f 72 69 7a 6f 6e 74 65" );      
        System.out.println ( "5. errorTotalReport = "+test_report ( ) );

        System.out.print ( "\n\nApertar ENTER para terminar." );
        System.console ( ).readLine ( );

    }

}

/*
A funcao ASCII2hex esta' dando erro na hora de comparar; acredito ser porque
o sistema esta interpretando os dois caracteres que formam o ASCII, por exempo,
4d como sendo um unico char.
Tentei inclusive passar 4d para 4D, por exemplo, mas nao foi possivel
 */
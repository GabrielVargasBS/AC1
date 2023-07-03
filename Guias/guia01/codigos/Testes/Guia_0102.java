/*
 Guia_0102.java - v0.0. - 04 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */


class Guia_0102 {

    /* Parar quando encontrar o numero -1 */
    public static boolean chegouFim ( String s ){
        return ( s.length() == 2 && s.charAt(0) == '-' && s.charAt(1) == '1' );
        }
    
    /* Popular arranjo com zeros */
    public static int[] resertarArranjo ( int[] arranjo ){
        for ( int i = 0; i < 8; i++ ){
            arranjo[i] = 0;
        }
        return (arranjo);
    }

    /* Testar se e' numero binario */
    public static boolean eBinario ( String s ){
        boolean OK = true;
        int tamanho = s.length();
        OK = OK && (tamanho > 0);

        for ( int i = 0; i < tamanho; i++ ){
            OK = OK && (s.charAt(i) == '0' || s.charAt(i) == '1' );
        }

        return OK;
    }

    /* Converter binario para decimal, se possivel */
    public static int bin2dec ( String bin ) {
        int decimal  =  0 ;
        int expoente =  0 ;
        int potencia =  0 ;
        int index    =  0 ;
        char c       = ' ';

        if ( eBinario(bin) ){
            expoente = bin.length()-1;
            while ( expoente >= 0 ){
                c = bin.charAt(index);
                potencia = (int)Math.pow(2.0,expoente);
                decimal += (potencia * ((int)c-48));
                // MyIO.println("decimal " + decimal);
                expoente--;
                index++;
            }
        }
        return (decimal);
    }

    public static void main (String[] args){
        String[] linha = new String[80];
        String numeroLido = "";

        int index   = -1;
        int decimal = 0 ;
        
        /* Realiza a leitura dos numeros como string */
        while ( chegouFim(numeroLido) == false ){
            index++;
            linha[index] = MyIO.readLine( );
            numeroLido   = linha[index];
        }

        /* Percorre o array para transformar em decimal e mostra resultado */    
        for ( int i = 0; i < index; i++ ){
            decimal = bin2dec(linha[i]);
            MyIO.println(decimal);
        }
    }
}

/*
 Programa testado mediante a entrada padrao pelo arquivo "Guia_0102_dados.txt",
 no qual a ultima linha deve ser "-1".
 Assim, foi gerada a saida "Guia_0102_resultados.txt".

 javac Guia_0102.java
 java Guia_0102 < Guia_0102_dados.txt > Guia_0102_dados.txt
 */
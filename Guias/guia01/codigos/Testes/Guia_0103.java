/*
 Guia_0103.java - v0.0. - 04 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */


class Guia_0103 {

    /* Parar quando encontrar o numero -1 */
    public static boolean chegouFim ( int x ){
        return ( x == -1);
        }
    

    /* Converter decimal para binario, retornando um arranjo */
    public static String dec2base ( int base, int x ) {
        String espelhado  = "";
        String convertido = "";
        int tmp = 0 ;
        int y   = 0 ;
        int cont= 0 ;

        if ( x >= 0 && base > 1){
            y = x;
            do{
                tmp = y % base;
                y   = y / base;

                if ( tmp >= 10 ){
                    espelhado += (char)( 55+tmp );
                    cont++;
                }
                else{
                    espelhado += (char)( 48+tmp );
                    cont++;
                }
            } while ( y > 0 );
        }

        // inverter resultado
        for ( int i = cont-1; i >= 0; i-- ){
            convertido += espelhado.charAt(i); 
        }

        return (convertido);
    }

    public static void main (String[] args){
        String[] linha = new String[80];
        int[] baseQualquer = new int[80];

        int index = -1;
        int numeroLido = 0;
        String convertido = "";

        /* Realiza a leitura da base desejada (primeira linha) */
        int base = 0;
        String temp = "";
        temp = MyIO.readLine( );
        base = Integer.parseInt(temp);
        
        /* Realiza a leitura dos numeros como string e converte para inteiro */
        while ( chegouFim(numeroLido) == false ){
            index++;
            linha[index] = MyIO.readLine( );
            baseQualquer[index] = Integer.parseInt(linha[index]);
            numeroLido = baseQualquer[index];
        }

        /* Percorre o array para transformar mudar de base */      
        for ( int i = 0; i < index; i++ ){
            convertido = dec2base(base, baseQualquer[i]);
            MyIO.println(convertido);
        }
    }
}

/*
 Programa testado mediante a entrada padrao pelo arquivo "Guia_0103_dados.txt",
 no qual a ultima linha deve ser "-1".
 Assim, foi gerada a saida "Guia_0103_resultados.txt".

 javac Guia_0103.java
 java Guia_0103 < Guia_0103_dados.txt > Guia_0103_dados.txt

 Nestes arquivos estao com a base 16, mas testes foram realizados com as bases:
 2, 4, 8, 10 tambem
 */
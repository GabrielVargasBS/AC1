/*
 Guia_0101.java - v0.0. - 04 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */


class Guia_0101 {

    /* Parar quando encontrar o numero -1 */
    public static boolean chegouFim ( int x ){
        return ( x == -1);
        }
    
    /* Popular arranjo com zeros */
    public static int[] resertarArranjo ( int[] arranjo ){
        for ( int i = 0; i < 10; i++ ){
            arranjo[i] = 0;
        }
        return (arranjo);
    }

    /* Converter decimal para binario, retornando um arranjo */
    public static int[] dec2bin ( int x ) {
        int[] bin = new int[10]; // valor maximo com 10 casas binarias
        int y = 0 ;
        int i = 10;

        bin = resertarArranjo(bin);

        if ( x >= 0 ){
            y = x;
            while ( y > 0 ){
                i--;
                bin[i] = y % 2;
                y      = y / 2;
            }
        }
        return (bin);
    }

    /* Opcao para entrada de dados pelo teclado */
/*
    public static void main (String[] args){
        int decimal = 0;
        int[] tmp = new int[8];
        String binario = "";

        decimal = MyIO.readInt( );
        tmp = dec2bin(decimal);

        for ( int k = 0; k < 8; k++ ){
            binario += tmp[k];
        }
        MyIO.println(binario);
    }
*/
    public static void main (String[] args){
        String[] linha = new String[80];
        int[] decimal = new int[80];
        int[] tmp = new int[10];

        int index = -1;
        int numeroLido = 0;
        String binario = "";
        
        /* Realiza a leitura dos numeros como string e converte para inteiro */
        while ( chegouFim(numeroLido) == false ){
            index++;
            linha[index] = MyIO.readLine( );
            decimal[index] = Integer.parseInt(linha[index]);
            numeroLido = decimal[index];
        }

        /* Percorre o array para transformar em binario e mostra resultado */      
        for ( int i = 0; i < index; i++ ){
            tmp = dec2bin(decimal[i]);

            for ( int k = 0; k < 10; k++ ){
                binario += tmp[k];
            }
            MyIO.println(binario);
            tmp = resertarArranjo(tmp);
            binario = "";
        }
    }
}

/*
 Programa testado mediante a entrada padrao pelo arquivo "Guia_0101_dados.txt",
 no qual a ultima linha deve ser "-1".
 Assim, foi gerada a saida "Guia_0101_resultados.txt".

 javac Guia_0101.java
 java Guia_0101 < Guia_0101_dados.txt > Guia_0101_dados.txt
 */
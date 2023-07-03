/*
 Recuperacao_0101d.v - v0.0. - 30 / 10 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
 Produto das Somas
              ___
F(A,B,C,D) =  | |   M (2,3,4,7,A,B,D,F)  = PoS(2,3,4,7,A,B,D,F)

*/

/**
 PoS(2,3,4,7,A,B,D,F)
 */
module PoS (output S,
            input  A, B, C, D);
   assign S = (~C | ~D)            // 3, 7, B, F
            & ( B | ~C)            // 2, 3, A, B
            & (~A | ~B | ~D)       // D, F
            & ( A | ~B |  C |  D); // 4
endmodule // SoP

/**
  Recuperacao_0101d.v
 */
module Recuperacao_0101d;
   reg  A, B, C, D;
   reg[7:0] M;
   wire S;
   
   // instancias
   PoS POS1 (S, A, B, C, D);
   
   // valores iniciais
   initial begin: start
      A=1'bx; B=1'bx; C=1'bx; D=1'bx;                      
   end

   // parte principal
   initial begin: main
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Recuperacao_01");
       $display("\n01.d) PoS (0,1,5,6,8,9,C,E)\n");

       // monitoramento
       $display(" M  A  B  C  D  S");
       $monitor("%2c %2b %2b %2b %2b %2b", M, A,  B,  C,  D, S);

       // sinalizacao
          A=0; B=0; C=0; D=0; M="0";
       #1                D=1; M="1";
       #1           C=1; D=0; M="2";
       #1                D=1; M="3";
       #1      B=1; C=0; D=0; M="4";
       #1                D=1; M="5";
       #1           C=1; D=0; M="6";
       #1                D=1; M="7";
       #1 A=1; B=0; C=0; D=0; M="8";
       #1                D=1; M="9";
       #1           C=1; D=0; M="A";
       #1                D=1; M="B";
       #1      B=1; C=0; D=0; M="C";
       #1                D=1; M="D";
       #1           C=1; D=0; M="E";
       #1                D=1; M="F";
   end
endmodule // Recuperacao_0101d

/*
gabriel@desktop-ubuntu:~/Desktop/CC-PUC/2periodo/ARQ1/Tarefas/Recuperacao01$ vvp Recuperacao_0101d.vvp
Gabriel Vargas Bento de Souza - 778023
Recuperacao_01

01.d) PoS (0,1,5,6,8,9,C,E)

 M  A  B  C  D  S
 0  0  0  0  0  1
 1  0  0  0  1  1
 2  0  0  1  0  0
 3  0  0  1  1  0
 4  0  1  0  0  0
 5  0  1  0  1  1
 6  0  1  1  0  1
 7  0  1  1  1  0
 8  1  0  0  0  1
 9  1  0  0  1  1
 A  1  0  1  0  0
 B  1  0  1  1  0
 C  1  1  0  0  1
 D  1  1  0  1  0
 E  1  1  1  0  1
 F  1  1  1  1  0

*/
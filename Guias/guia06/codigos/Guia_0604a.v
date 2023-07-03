/*
 Guia_0604a.v - v0.0. - 28 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
 Produto das somas
                  ____
F(X, Y, W, Z) =   | |  M (2,6,7,13)
*/

/**
 PoS (2,6,7,13)
 */
module PoS (output S,
            input  X, Y, W, Z);
   assign S = ( X |  Y | ~W |  Z)   // 2 
            & ( X | ~Y | ~W |  Z)   // 6
            & ( X | ~Y | ~W | ~Z)   // 7
            & (~X | ~Y |  W | ~Z);  // 13
endmodule // PoS 

/**
 PoS(2,6,7,13)_Simplificado = X +W'+Z . X +W'+Y' . X'+Y'+W +Z'
 */
module PoS_simple (output S,
                   input  X, Y, W, Z);
   assign S = ( X | ~W |  Z)
            & ( X | ~W | ~Y)
            & (~X | ~Y |  W | ~Z);
endmodule // PoS_simple

/**
  Guia_0604a.v
 */
module Guia_0604a;
   reg  X, Y, W, Z;
   wire S1, S2;
   
   // instancias
   PoS        POS1 (S1, X, Y, W, Z);
   PoS_simple POS2 (S2, X, Y, W, Z);
   
   // valores iniciais
   initial begin: start
      X=1'bx; Y=1'bx; W=1'bx; Z=1'bx;
   end

   // parte principal
   initial begin: main
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Guia_06");
       $display("\n04.a) PoS (2,6,7,13)\n");

       // monitoramento
       $display(" X  Y  W  Z  S1  S2");
       $monitor("%2b %2b %2b %2b %2b %3b", X,  Y,  W,  Z,  S1, S2);

       // sinalizacao
          X=0; Y=0; W=0; Z=0;
       #1                Z=1;
       #1           W=1; Z=0;
       #1                Z=1;
       #1      Y=1; W=0; Z=0;
       #1                Z=1;
       #1           W=1; Z=0;
       #1                Z=1;
       #1 X=1; Y=0; W=0; Z=0;
       #1                Z=1;
       #1           W=1; Z=0;
       #1                Z=1;
       #1      Y=1; W=0; Z=0;
       #1                Z=1;
       #1           W=1; Z=0;
       #1                Z=1;
   end
endmodule // Guia_0604a

/*
C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia06>vvp Guia_0604a.vvp
Gabriel Vargas Bento de Souza - 778023
Guia_06

04.a) PoS (2,6,7,13)

 X  Y  W  Z  S1  S2
 0  0  0  0  1   1
 0  0  0  1  1   1
 0  0  1  0  0   0
 0  0  1  1  1   1
 0  1  0  0  1   1
 0  1  0  1  1   1
 0  1  1  0  0   0
 0  1  1  1  0   0
 1  0  0  0  1   1
 1  0  0  1  1   1
 1  0  1  0  1   1
 1  0  1  1  1   1
 1  1  0  0  1   1
 1  1  0  1  0   0
 1  1  1  0  1   1
 1  1  1  1  1   1

*/
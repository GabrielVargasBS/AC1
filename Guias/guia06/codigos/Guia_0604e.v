/*
 Guia_0604e.v - v0.0. - 28 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
 Produto das somas
                  ____
F(X, Y, W, Z) =   | |  M (3,5,6,7,11,15)
*/

/**
 PoS (3,5,6,7,11,15)
 */
module PoS (output S,
            input  X, Y, W, Z);
   assign S = ( X |  Y | ~W | ~Z)   // 3
            & ( X | ~Y |  W | ~Z)   // 5
            & ( X | ~Y | ~W |  Z)   // 6
            & ( X | ~Y | ~W | ~Z)   // 7
            & (~X |  Y | ~W | ~Z)   // 11
            & (~X | ~Y | ~W | ~Z);  // 15
endmodule // PoS 

/**
 PoS(3,5,6,7,11,15)_Simplificado = W'+Z' . X +Y'+Z' . X +Y'+W'
 */
module PoS_simple (output S,
                   input  X, Y, W, Z);
   assign S = (~W | ~Z)
            & ( X | ~Y | ~Z)
            & ( X | ~Y | ~W);
endmodule // PoS_simple

/**
  Guia_0604e.v
 */
module Guia_0604e;
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
       $display("\n04.e) PoS (3,5,6,7,11,15)\n");

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
endmodule // Guia_0604e

/*
C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia06>vvp Guia_0604e.vvp
Gabriel Vargas Bento de Souza - 778023
Guia_06

04.e) PoS (3,5,6,7,11,15)

 X  Y  W  Z  S1  S2
 0  0  0  0  1   1
 0  0  0  1  1   1
 0  0  1  0  1   1
 0  0  1  1  0   0
 0  1  0  0  1   1
 0  1  0  1  0   0
 0  1  1  0  0   0
 0  1  1  1  0   0
 1  0  0  0  1   1
 1  0  0  1  1   1
 1  0  1  0  1   1
 1  0  1  1  0   0
 1  1  0  0  1   1
 1  1  0  1  1   1
 1  1  1  0  1   1
 1  1  1  1  0   0

*/
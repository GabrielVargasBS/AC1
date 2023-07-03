/*
 Guia_0604c.v - v0.0. - 28 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
 Produto das somas
                  ____
F(X, Y, W, Z) =   | |  M (4,8,10,13,14)
*/

/**
 PoS (4,8,10,13,14)
 */
module PoS (output S,
            input  X, Y, W, Z);
   assign S = ( X | ~Y |  W |  Z)   // 4
            & (~X |  Y |  W |  Z)   // 8
            & (~X |  Y | ~W |  Z)   // 10
            & (~X | ~Y |  W | ~Z)   // 13
            & (~X | ~Y | ~W |  Z);  // 14
endmodule // PoS 

/**
 PoS(4,8,10,13,14)_Simplificado = X'+Y +Z . X'+W'+Z . X +Y'+W +Z . X'+Y'+W +Z'
 */
module PoS_simple (output S,
                   input  X, Y, W, Z);
   assign S = (~X |  Y |  Z)
            & (~X | ~W |  Z)
            & ( X | ~Y |  W |  Z)
            & (~X | ~Y |  W | ~Z);
endmodule // PoS_simple

/**
  Guia_0604c.v
 */
module Guia_0604c;
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
       $display("\n04.c) PoS (4,8,10,13,14)\n");

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
endmodule // Guia_0604c

/*
C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia06>vvp Guia_0604c.vvp
Gabriel Vargas Bento de Souza - 778023
Guia_06

04.c) PoS (4,8,10,13,14)

 X  Y  W  Z  S1  S2
 0  0  0  0  1   1
 0  0  0  1  1   1
 0  0  1  0  1   1
 0  0  1  1  1   1
 0  1  0  0  0   0
 0  1  0  1  1   1
 0  1  1  0  1   1
 0  1  1  1  1   1
 1  0  0  0  0   0
 1  0  0  1  1   1
 1  0  1  0  0   0
 1  0  1  1  1   1
 1  1  0  0  1   1
 1  1  0  1  0   0
 1  1  1  0  0   0
 1  1  1  1  1   1

*/
/*
 Guia_0405d.v - v0.0. - 28 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/**
 SoP(0, 2, 3, 7)
 */
module SoP (output s,
            input  x, y, z);
   assign s = (~x & ~y & ~z)  // 0
            | (~x &  y & ~z)  // 2
            | (~x &  y &  z)  // 3
            | ( x &  y &  z); // 7
endmodule // SoP

/**
 PoS(1, 4, 5, 6)
 */
module PoS (output S,
            input  X, Y, Z);
   assign S = ( X |  Y | ~Z)  // 1
            & (~X |  Y |  Z)  // 4
            & (~X |  Y | ~Z)  // 5
            & (~X | ~Y |  Z); // 6
endmodule // PoS 

/**
  Guia_0405d.v
 */
module Guia_0405d;
   reg  x, y, z;
   wire s, S;
   
   // instancias
   SoP SOP (s, x, y, z);
   PoS POS (S, x, y, z);
   
   // valores iniciais
   initial begin: start
      x=1'bx; y=1'bx; z=1'bx; // indefinidos
   end

   // parte principal
   initial begin: main
      // identificacao
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Test boolean expression");
       $display("\n04.d) SoP(0, 2, 3, 7) = PoS(1, 4, 5, 6)\n");

       // monitoramento
       $display(" x  y  z  SoP(0, 2, 3, 7)  PoS(1, 4, 5, 6)");
       $monitor("%2b %2b %2b %9b %16b", x, y, z, s, S);

       // sinalizacao
          x=0; y=0; z=0;
       #1           z=1;
       #1      y=1; z=0;
       #1           z=1;
       #1 x=1; y=0; z=0;
       #1           z=1;
       #1      y=1; z=0;
       #1           z=1;

   end
endmodule // Guia_0405d

// --------------------------------------------------------------------- testes
/*
C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia04>vvp Guia_0405e.vvp
Gabriel Vargas Bento de Souza - 778023
Test boolean expression

04.e) SoP(0, 3, 5, 7, 8, 10, 14, 15) = PoS (1, 2, 4, 6, 9, 11, 12, 13)

 x  y  z  SoP(0, 3, 5, 7, 8, 10, 14, 15)  PoS (1, 2, 4, 6, 9, 11, 12, 13)
 0  0  0               1                                1
 0  0  1               0                                0
 0  0  0               0                                0
 0  0  1               1                                1
 0  1  0               0                                0
 0  1  1               1                                1
 0  1  0               0                                0
 0  1  1               1                                1
 1  0  0               1                                1
 1  0  1               0                                0
 1  0  0               1                                1
 1  0  1               0                                0
 1  1  0               0                                0
 1  1  1               0                                0
 1  1  0               1                                1
 1  1  1               1                                1
*/
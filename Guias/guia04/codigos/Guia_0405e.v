/*
 Guia_0405e.v - v0.0. - 28 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/**
 SoP(0, 3, 5, 7, 8, 10, 14, 15)
 */
module SoP (output s,
            input  x, y, w, z);
   assign s = (~x & ~y & ~w & ~z)  // 0
            | (~x & ~y &  w &  z)  // 3
            | (~x &  y & ~w &  z)  // 5
            | (~x &  y &  w &  z)  // 7
            | ( x & ~y & ~w & ~z)  // 8
            | ( x & ~y &  w & ~z)  // 10
            | ( x &  y &  w & ~z)  // 14
            | ( x &  y &  w &  z); // 15
endmodule // SoP

/**
 PoS (1, 2, 4, 6, 9, 11, 12, 13)
 */
module PoS (output S,
            input  X, Y, W, Z);
   assign S = ( X |  Y |  W | ~Z)   // 1
            & ( X |  Y | ~W |  Z)   // 2
            & ( X | ~Y |  W |  Z)   // 4
            & ( X | ~Y | ~W |  Z)   // 6
            & (~X |  Y |  W | ~Z)   // 9
            & (~X |  Y | ~W | ~Z)   // 11
            & (~X | ~Y |  W |  Z)   // 12
            & (~X | ~Y |  W | ~Z);  // 13
endmodule // PoS 

/**
  Guia_0405e.v
 */
module Guia_0405e;
   reg  x, y, w, z;
   wire s, S;
   
   // instancias
   SoP SOP (s, x, y, w, z);
   PoS POS (S, x, y, w, z);
   
   // valores iniciais
   initial begin: start
      x=1'bx; y=1'bx; z=1'bx; // indefinidos
   end

   // parte principal
   initial begin: main
      // identificacao
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Test boolean expression");
       $display("\n04.e) SoP(0, 3, 5, 7, 8, 10, 14, 15) = PoS (1, 2, 4, 6, 9, 11, 12, 13)\n");

       // monitoramento
       $display(" x  y  z  SoP(0, 3, 5, 7, 8, 10, 14, 15)  PoS (1, 2, 4, 6, 9, 11, 12, 13)");
       $monitor("%2b %2b %2b %15b %32b", x, y, z, s, S);

       // sinalizacao
          x=0; y=0; w=0; z=0;
       #1                z=1;
       #1           w=1; z=0;
       #1                z=1;
       #1      y=1; w=0; z=0;
       #1                z=1;
       #1           w=1; z=0;
       #1                z=1;
       #1 x=1; y=0; w=0; z=0;
       #1                z=1;
       #1           w=1; z=0;
       #1                z=1;
       #1      y=1; w=0; z=0;
       #1                z=1;
       #1           w=1; z=0;
       #1                z=1;

   end
endmodule // Guia_0405e

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
/*
 Guia_0405c.v - v0.0. - 28 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/**
 SoP(0, 2, 3, 4, 6, 7)
 */
module SoP (output s,
            input  x, y, z);
   assign s = (~x & ~y & ~z)  // 0
            | (~x &  y & ~z)  // 2
            | (~x &  y &  z)  // 3
            | ( x & ~y & ~z)  // 4
            | ( x &  y & ~z)  // 6
            | ( x &  y &  z);  // 7
endmodule // SoP

/**
 PoS(1, 5)
 */
module PoS (output S,
            input  X, Y, Z);
   assign S = ( X |  Y | ~Z)  // 1
            & (~X |  Y | ~Z); // 5
endmodule // PoS 

/**
  Guia_0405c.v
 */
module Guia_0405c;
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
       $display("\n04.a) SoP(0, 2, 3, 4, 6, 7) = PoS(1, 5)\n");

       // monitoramento
       $display(" x  y  z  SoP(0, 2, 3, 4, 6, 7)  PoS(1, 5)");
       $monitor("%2b %2b %2b %12b %15b", x, y, z, s, S);

       // sinalizacao
       #1 x=0; y=0; z=0;
       #1 x=0; y=0; z=1;
       #1 x=0; y=1; z=0;
       #1 x=0; y=1; z=1;
       #1 x=1; y=0; z=0;
       #1 x=1; y=0; z=1;
       #1 x=1; y=1; z=0;
       #1 x=1; y=1; z=1;

   end
endmodule // Guia_0405c
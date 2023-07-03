/*
 Guia_0405b.v - v0.0. - 28 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/**
 SoP(0, 2)
 */
module SoP (output s,
            input  x, y);
   assign s = (~x & ~y)  // 0
            | ( x & ~y); // 2
endmodule // SoP

/**
 PoS(1, 3)
 */
module PoS (output S,
            input  X, Y);
   assign S = ( X | ~Y)  // 1
            & (~X | ~Y); // 3
endmodule // PoS 

/**
  Guia_0405b.v
 */
module Guia_0405b;
   reg  x, y;
   wire s, S;
   
   // instancias
   SoP SOP (s, x, y);
   PoS POS (S, x, y);
   
   // valores iniciais
   initial begin: start
      x=1'bx; y=1'bx; // indefinidos
   end

   // parte principal
   initial begin: main
      // identificacao
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Test boolean expression");
       $display("\n04.a) SoP(0, 2) = PoS(1, 3)\n");

       // monitoramento
       $display(" x  y  SoP(0, 2)  PoS(1, 3)");
       $monitor("%2b %2b %6b %10b", x, y, s, S);

       // sinalizacao
       #1 x=0; y=0;
       #1 x=0; y=1;
       #1 x=1; y=0;
       #1 x=1; y=1;

   end
endmodule // Guia_0405b
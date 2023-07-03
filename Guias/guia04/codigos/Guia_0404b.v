/*
 Guia_0404b.v - v0.0. - 28 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
 Produto das somas
               ____
F(X, Y, Z) =   | |  M (0, 2, 3, 6, 7)
*/

/**
 PoS (0, 2, 3, 6, 7)
 */
module PoS (output S,
            input  X, Y, Z);
   assign S = ( X |  Y |  Z)   // 0
            & ( X | ~Y |  Z)   // 2
            & ( X | ~Y | ~Z)   // 3  
            & (~X | ~Y |  Z)   // 6
            & (~X | ~Y | ~Z);  // 7
endmodule // PoS 

/**
  Guia_0404b.v
 */
module Guia_0404b;
   reg  X, Y, Z;
   wire S;
   
   // instancias
   PoS POS (S, X, Y, Z);
   
   // valores iniciais
   initial begin: start
      X=1'bx; Y=1'bx; Z=1'bx; // indefinidos
   end

   // parte principal
   initial begin: main
      // identificacao
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Test boolean expression");
       $display("\n04.b) PoS (0, 2, 3, 6, 7)\n");

       // monitoramento
       $display(" X  Y  Z  PoS(0, 2, 3, 6, 7)");
       $monitor("%2b %2b %2b %11b", X, Y, Z, S);

       // sinalizacao
       #1 X=0; Y=0; Z=0;
       #1 X=0; Y=0; Z=1;
       #1 X=0; Y=1; Z=0;
       #1 X=0; Y=1; Z=1;
       #1 X=1; Y=0; Z=0;
       #1 X=1; Y=0; Z=1;
       #1 X=1; Y=1; Z=0;
       #1 X=1; Y=1; Z=1;
   end
endmodule // Guia_0404b
/*
 Guia_0404d.v - v0.0. - 28 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
 Produto das somas
                  ____
F(X, Y, W, Z) =   | |  M (0, 1, 2, 3, 6, 11, 15)
*/

/**
 PoS (0, 1, 2, 3, 6, 11, 15)
 */
module PoS (output S,
            input  X, Y, W, Z);
   assign S = ( X |  Y |  W |  Z)   // 0
            & ( X |  Y |  W | ~Z)   // 1
            & ( X |  Y | ~W |  Z)   // 2
            & ( X |  Y | ~W | ~Z)   // 3 
            & ( X | ~Y | ~W |  Z)   // 6
            & (~X |  Y | ~W | ~Z)   // 11
            & (~X | ~Y | ~W | ~Z);  // 15
endmodule // PoS 

/**
  Guia_0404d.v
 */
module Guia_0404d;
   reg  X, Y, W, Z;
   wire S;
   
   // instancias
   PoS POS (S, X, Y, W, Z);
   
   // valores iniciais
   initial begin: start
      X=1'bx; Y=1'bx; W=1'bx; Z=1'bx; // indefinidos
   end

   // parte principal
   initial begin: main
      // identificacao
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Test boolean expression");
       $display("\n04.e) PoS (0, 1, 2, 3, 6, 11, 15)\n");

       // monitoramento
       $display(" X  Y  W  Z  PoS(0, 1, 2, 3, 6, 11, 15)");
       $monitor("%2b %2b %2b %2b %14b", X, Y, W, Z, S);

       // sinalizacao
       #1 X=0; Y=0; W=0; Z=0;
       #1 X=0; Y=0; W=0; Z=1;
       #1 X=0; Y=0; W=1; Z=0;
       #1 X=0; Y=0; W=1; Z=1;
       #1 X=0; Y=1; W=0; Z=0;
       #1 X=0; Y=1; W=0; Z=1;
       #1 X=0; Y=1; W=1; Z=0;
       #1 X=0; Y=1; W=1; Z=1;
       #1 X=1; Y=0; W=0; Z=0;
       #1 X=1; Y=0; W=0; Z=1;
       #1 X=1; Y=0; W=1; Z=0;
       #1 X=1; Y=0; W=1; Z=1;
       #1 X=1; Y=1; W=0; Z=0;
       #1 X=1; Y=1; W=0; Z=1;
       #1 X=1; Y=1; W=1; Z=0;
       #1 X=1; Y=1; W=1; Z=1;
   end
endmodule // Guia_0404d
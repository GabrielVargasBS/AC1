/*
 Guia_0403b.v - v0.0. - 28 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
 Soma dso produtos
               ___
f(x, y, z) =  \   m (1, 3, 5, 7)  = SoP(1,3,5,7) = 1
              /___
*/

/**
 SoP(1,3,5,7)
 */
module SoP (output s,
            input  x, y, z);
   assign s = (~x & ~y &  z)  // 1
            | (~x &  y &  z)  // 3
            | ( x & ~y &  z)  // 5
            | ( x &  y &  z); // 7
endmodule // SoP

/**
  Guia_0403b.v
 */
module Guia_0403b;
   reg  x, y, z;
   wire s1;
   
   // instancias
   SoP SOP (s, x, y, z);
   
   // valores iniciais
   initial begin: start
      x=1'bx; y=1'bx; z=1'bx; // indefinidos
   end

   // parte principal
   initial begin: main
      // identificacao
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Test boolean expression");
       $display("\n03.b) SoP (1, 3, 5, 7)\n");

       // monitoramento
       $display(" x  y  z  SoP(1, 3, 5, 7)");
       $monitor("%2b %2b %2b %10b", x, y, z, s);

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
endmodule // Guia_0403b
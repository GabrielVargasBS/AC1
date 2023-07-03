/*
 Guia_0403d.v - v0.0. - 28 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
 Soma dso produtos
                  ___
f(x, y, w, z) =  \   m(0, 2, 5, 7, 9, 10, 12)  = SoP(0, 2, 5, 7, 9, 10, 12) = 1
                 /___
*/

/**
 SoP(0, 2, 5, 7, 9, 10, 12)
 */
module SoP (output s,
            input  x, y, w, z);
   assign s = (~x & ~y & ~w & ~z)  // 0
            | (~x & ~y &  w & ~z)  // 2
            | (~x &  y & ~w &  z)  // 5
            | (~x &  y &  w &  z)  // 7
            | ( x & ~y & ~w &  z)  // 9
            | ( x & ~y &  w & ~z)  // 10
            | ( x &  y & ~w & ~z); // 12
endmodule // SoP

/**
  Guia_0403d.v
 */
module Guia_0403d;
   reg  x, y, w, z;
   wire s1;
   
   // instancias
   SoP SOP (s, x, y, w, z);
   
   // valores iniciais
   initial begin: start
      x=1'bx; y=1'bx; x=1'bx; z=1'bx; // indefinidos
   end

   // parte principal
   initial begin: main
      // identificacao
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Test boolean expression");
       $display("\n03.d) SoP(0, 2, 5, 7, 9, 10, 12)\n");

       // monitoramento
       $display(" x  y  w  z  SoP(0, 2, 5, 7, 9, 10, 12)");
       $monitor("%2b %2b %2b %2b %15b", x, y, w, z, s);

       // sinalizacao
       #1 x=0; y=0; w=0; z=0;
       #1 x=0; y=0; w=0; z=1;
       #1 x=0; y=0; w=1; z=0;
       #1 x=0; y=0; w=1; z=1;
       #1 x=0; y=1; w=0; z=0;
       #1 x=0; y=1; w=0; z=1;
       #1 x=0; y=1; w=1; z=0;
       #1 x=0; y=1; w=1; z=1;
       #1 x=1; y=0; w=0; z=0;
       #1 x=1; y=0; w=0; z=1;
       #1 x=1; y=0; w=1; z=0;
       #1 x=1; y=0; w=1; z=1;
       #1 x=1; y=1; w=0; z=0;
       #1 x=1; y=1; w=0; z=1;
       #1 x=1; y=1; w=1; z=0;
       #1 x=1; y=1; w=1; z=1;
   end
endmodule // Guia_0403d
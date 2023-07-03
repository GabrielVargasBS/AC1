/*
 Guia_0401a.v - v0.0. - 27 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* TRUTH TABLE */

// x'.(y'+z')'

/**
 expression: x'
 */
module fxy1 (output s,
            input  x, y, z);
   assign s = ~x;
endmodule // fxy1

/**
 expression: y'
 */
module fxy2 (output s,
            input  x, y, z);
   assign s = ~y;
endmodule // fxy2

/**
 expression: z'
 */
module fxy3 (output s,
            input  x, y, z);
   assign s = ~z;
endmodule // fxy3

/**
 expression: y' + z'
 */
module fxy4 (output s,
            input  x, y, z);
   assign s = (~y | ~z);
endmodule // fxy4

/**
 expression: (y' + z')'
 */
module fxy5 (output s,
            input  x, y, z);
   assign s = ~(~y | ~z);
endmodule // fxy5

/**
 expression: x' . (y' + z')'
 */
module fxy6 (output s,
            input  x, y, z);
   assign s = ~x & ~(~y | ~z);
endmodule // fxy6

/**
  Guia_0401a.v
 */
module Guia_0401a;
   reg  x, y, z;
   wire s1, s2, s3, s4, s5, s6;
   
   // instancias
   fxy1 FXY1 (s1, x, y, z);
   fxy2 FXY2 (s2, x, y, z);
   fxy3 FXY3 (s3, x, y, z);
   fxy4 FXY4 (s4, x, y, z);
   fxy5 FXY5 (s5, x, y, z);
   fxy6 FXY6 (s6, x, y, z);
   
   // valores iniciais
   initial begin: start
      x=1'bx; y=1'bx; z=1'bx; // indefinidos
   end

   // parte principal
   initial begin: main
      // identificacao
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Test boolean expression");
       $display("\n01.a) x'.(y'+z')'\n");

       // monitoramento
       $display(" x  y  z   x'   y'   z'  (y'+z')  (y'+z')'  x'.(y'+z')' ");
       $monitor("%2b %2b %2b %3b %4b %4b %6b %8b %11b", x, y, z, s1, s2, s3, s4, s5, s6);

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
endmodule // Guia_0401a

/*
 Guia_0402a.v - v0.0. - 27 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
 TRUTH TABLE
 x'.(x+y')' == x'.y
*/

/**
 expression: x'
 */
module fxy1 (output s,
            input  x, y);
   assign s = ~x;
endmodule // fxy1

/**
 expression: y'
 */
module fxy2 (output s,
            input  x, y);
   assign s = ~y;
endmodule // fxy2

/**
 expression: x+y'
 */
module fxy3 (output s,
            input  x, y);
   assign s = (x | ~y);
endmodule // fxy3

/**
 expression: (x+y')'
 */
module fxy4 (output s,
            input  x, y);
   assign s = ~(x | ~y);
endmodule // fxy4

/**
 expression: x'.(x+y')'
 */
module fxy5 (output s,
            input  x, y);
   assign s = ~x & ~(x | ~y);
endmodule // fxy5

/**
 expression: x'.y
 */
module fxy6 (output s,
            input  x, y);
   assign s = ~x & y;
endmodule // fxy6

/**
  Guia_0402a.v
 */
module Guia_0402a;
   reg  x, y, z;
   wire s1, s2, s3, s4, s5, s6;
   
   // instancias
   fxy1 FXY1 (s1, x, y);
   fxy2 FXY2 (s2, x, y);
   fxy3 FXY3 (s3, x, y);
   fxy4 FXY4 (s4, x, y);
   fxy5 FXY5 (s5, x, y);
   fxy6 FXY6 (s6, x, y);
   
   // valores iniciais
   initial begin: start
      x=1'bx; y=1'bx; // indefinidos
   end

   // parte principal
   initial begin: main
      // identificacao
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Test boolean expression");
       $display("\n02.a) x'.(x+y')' == x'.y\n");

       // monitoramento
       $display(" x  y   x'  y'  x+y'  (x+y')'  x'.(x+y')' =  x'.y ");
       $monitor("%2b %2b %3b %3b %4b %6b %9b %11b", x, y, s1, s2, s3, s4, s5, s6);

       // sinalizacao
       #1 x=0; y=0;
       #1 x=0; y=1;
       #1 x=1; y=0;
       #1 x=1; y=1;
   end
endmodule // Guia_0402a
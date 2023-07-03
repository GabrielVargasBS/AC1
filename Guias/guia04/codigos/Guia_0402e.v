/*
 Guia_0402e.v - v0.0. - 27 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
 TRUTH TABLE
 (y'+x')' . (y+x')  == x.y
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
 expression: x'+y'
 */
module fxy3 (output s,
            input  x, y);
   assign s = ~x | ~y;
endmodule // fxy3

/**
 expression: (x'+y')'
 */
module fxy4 (output s,
            input  x, y);
   assign s = ~(~x | ~y);
endmodule // fxy4

/**
 expression: y+x'
 */
module fxy5 (output s,
            input  x, y);
   assign s = y | ~x;
endmodule // fxy5

/**
 expression: (y'+x')'.(y+x')
 */
module fxy6 (output s,
            input  x, y);
   assign s = ~(~y | ~x) & (y | ~x);
endmodule // fxy6

/**
 expression: x.y
 */
module fxy7 (output s,
            input  x, y);
   assign s = x & y;
endmodule // fxy7

/**
  Guia_0402e.v
 */
module Guia_0402e;
   reg  x, y, z;
   wire s1, s2, s3, s4, s5, s6, s7;
   
   // instancias
   fxy1 FXY1 (s1, x, y);
   fxy2 FXY2 (s2, x, y);
   fxy3 FXY3 (s3, x, y);
   fxy4 FXY4 (s4, x, y);
   fxy5 FXY5 (s5, x, y);
   fxy6 FXY6 (s6, x, y);
   fxy7 FXY7 (s7, x, y);
   
   // valores iniciais
   initial begin: start
      x=1'bx; y=1'bx; // indefinidos
   end

   // parte principal
   initial begin: main
      // identificacao
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Test boolean expression");
       $display("\n02.d) (x.y)' + (x+y)' == (x.y)'\n");

       // monitoramento
       $display(" x  y  x' y'  x'+y'  (x'+y')'  y+x'  (y'+x')'.(y+x')  =  x.y ");
       $monitor("%2b %2b %2b %2b %5b %7b %7b %12b %12b", x, y, s1, s2, s3, s4, s5, s6, s7);

       // sinalizacao
       #1 x=0; y=0;
       #1 x=0; y=1;
       #1 x=1; y=0;
       #1 x=1; y=1;
   end
endmodule // Guia_0402e
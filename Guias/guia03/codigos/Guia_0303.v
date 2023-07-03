/*
 Guia_0303.v - v0.0. - 11 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
  Guia_0303.v
 */

module Guia_0303;

// define data
   
   reg signed [4:0] a = 8'b1011_0   ; // binary
   reg signed [5:0] b = 8'b1101_01  ; // binary
   reg signed [5:0] c = 8'b1100_11  ; // binary
   reg signed [6:0] d = 8'b1011_001 ; // binary
   reg signed [6:0] e = 8'b1011_101 ; // binary

   reg signed [7:0] x = 0           ; // binary
   reg signed [6:0] y = 0           ; // binary

// actions
   initial
    begin : main
     $display ( "Guia_0303 - Tests" );
     x = ~a+1;
     y = ~(a-1);
     $display ( "a = %5b -> C1(a) = %5b -> C2(a) = %5b = %d = %d", a, ~a, x, x, y );
     x = ~b+1;
     y = ~(b-1);
     $display ( "b = %6b -> C1(b) = %6b -> C2(b) = %6b = %d = %d", b, ~b, x, x, y );
     x = ~c+1;
     y = ~(c-1);
     $display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b = %d = %d", c, ~c, x, x, y );
     x = ~d+1;
     y = ~(d-1);
     $display ( "d = %7b -> C1(d) = %7b -> C2(d) = %7b = %d = %d", d, ~d, x, x, y );
     x = ~e+1;
     y = ~(e-1);
     $display ( "e = %7b -> C1(c) = %7b -> C2(c) = %7b = %d = %d", e, ~e, x, x, y );
    end // main

endmodule // Guia_0303

/*
 ---------------------------------------------------------- testes e resultados

Guia_0303 - Tests
a = 10110 -> C1(a) = 01001 -> C2(a) = 00001010 =   10 =  10
b = 110101 -> C1(b) = 001010 -> C2(b) = 00001011 =   11 =  11
c = 110011 -> C1(c) = 001100 -> C2(c) = 00001101 =   13 =  13
d = 1011001 -> C1(d) = 0100110 -> C2(d) = 00100111 =   39 =  39
e = 1011101 -> C1(c) = 0100010 -> C2(c) = 00100011 =   35 =  35

*/
/*
 Guia_0301.v - v0.0. - 11 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
  Guia_0301.v
 */

module Guia_0301;

// define data
   reg [5:0] a = 8'b0010_01   ; // binary
   reg [7:0] b = 8'b0000_1100 ; // binary
   reg [5:0] c = 8'b1001_11   ; // binary
   reg [6:0] d = 8'b0101_001  ; // binary
   reg [7:0] e = 8'b0011_0001 ; // binary

   reg [7:0] f = 0            ; // binary
   reg [6:0] g = 0            ; // binary
   reg [5:0] h = 0            ; // binary
   reg [5:0] i = 0            ; // binary
   reg [5:0] j = 0            ; // binary

// actions
   initial
    begin : main
     $display ( "Guia_0301 - Tests" );
     f = ~a+1;
     $display ( "a = %6b -> C1(a) = %6b -> C2(a) = %6b", a, ~a, f );
     g = ~b+1;
     $display ( "b = %8b -> C1(b) = %8b -> C2(b) = %8b", b, ~b, g );
     h = ~c+1;
     $display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b", c, ~c, h );
     i = ~d+1;
     $display ( "d = %7b -> C1(d) = %7b -> C2(c) = %7b", d, ~d, i );
     j = ~e+1;
     $display ( "e = %8b -> C1(e) = %8b -> C2(c) = %8b", e, ~e, j );
    end // main

endmodule // Guia_0301

/*
 ---------------------------------------------------------- testes e resultados

Guia_0301 - Tests
a = 001001 -> C1(a) = 110110 -> C2(a) = 11110111
b = 00001100 -> C1(b) = 11110011 -> C2(b) =  1110100
c = 100111 -> C1(c) = 011000 -> C2(c) = 011001
d = 0101001 -> C1(d) = 1010110 -> C2(c) =  010111
e = 00110001 -> C1(e) = 11001110 -> C2(c) =   001111

*/
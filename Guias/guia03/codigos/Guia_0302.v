/*
 Guia_0302.v - v0.0. - 11 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
  Guia_0302.v
 */

module Guia_0302;

// define data
   
   reg [5:0] a = 27    ; // decimal
   reg [7:0] b = 8'h5e ; // hexadecimal
   reg [5:0] c = 57    ; // decimal
   reg [6:0] d = 8'o517; // octal
   reg [7:0] e = 8'hd3 ; // hexadecimal

   reg [7:0] f = 0     ; // binary
   reg [7:0] g = 0     ; // binary
   reg [5:0] h = 0     ; // binary
   reg [6:0] i = 0     ; // binary
   reg [7:0] j = 0     ; // binary

// actions
   initial
    begin : main
     $display ( "Guia_0302 - Tests" );
     f = ~a+1;
     $display ( "a = %6b -> C1(a) = %6b -> C2(a) = %6b", a, ~a, f );
     g = ~b+1;
     $display ( "b = %8b -> C1(b) = %8b -> C2(b) = %8b", b, ~b, g );
     h = ~c+1;
     $display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b", c, ~c, h );
     i = ~d+1;
     $display ( "d = %7b -> C1(d) = %7b -> C2(d) = %7b", d, ~d, i );
     j = ~e+1;
     $display ( "e = %8b -> C1(e) = %8b -> C2(e) = %8b", e, ~e, j );
    end // main

endmodule // Guia_0302

/*
 ---------------------------------------------------------- testes e resultados

Guia_0302 - Tests
a = 011011 -> C1(a) = 100100 -> C2(a) = 11100101
b = 01011110 -> C1(b) = 10100001 -> C2(b) = 10100010
c = 111001 -> C1(c) = 000110 -> C2(c) = 000111
d = 1001111 -> C1(d) = 0110000 -> C2(d) = 0110001
e = 11010011 -> C1(e) = 00101100 -> C2(e) = 00101101

*/
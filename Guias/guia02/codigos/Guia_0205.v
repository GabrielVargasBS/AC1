/*
 Guia_0205.v - v0.0. - 14 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
  Guia_0205.v
 */

module Guia_0205; 

// define data

   reg [7:0] a = 8'b000_1010;   // binary
   reg [7:0] b = 8'b000_1100;   // binary

   // reg [7:0] a = 8'b0101_0100;   // binary
   // reg [7:0] b = 8'b0011_1010;   // binary
   
   // reg [7:0] a = 8'b1001_0110;   // binary
   // reg [7:0] b = 8'b0010_0100;   // binary

   // reg [7:0] a = 8'b0100_0010;   // binary
   // reg [7:0] b = 8'b0011_0100;   // binary

   // reg [7:0] a = 8'b1011_0110;   // binary
   // reg [7:0] b = 8'b0001_0101;   // binary

   // reg [7:0] a = 8'b0110_1001;   // binary
   // reg [7:0] b = 8'b0000_1011;   // binary

   reg [7:0] c;

// actions
   initial
    begin : main
     $display ( "Guia_0205 - Tests" );

     $display ( "a = %8b", a );
     $display ( "b = %8b", b );
     c = a+b;
     $display ( "c = a+b = %8b", c );

     c = a-b;
     $display ( "c = a-b = %8b", c );

     c = b-a;
     $display ( "c = b-a = %8b", c );

     c = a*b;
     $display ( "c = a*b = %8b", c );

     c = b/a;
     $display ( "c = b/a = %8b", c );
    end // main

endmodule // Guia_0205

/*
 ---------------------------------------------------------- testes e resultados

01.) reg [7:0] a = 8'b000_1010;   // binary
     reg [7:0] b = 8'b000_1100;   // binary

  Guia_0205 - Tests
  a = 00001010
  b = 00001100
  c = a+b = 00010110
  c = a-b = 11111110
  c = b-a = 00000010
  c = a*b = 01111000
  c = b/a = 00000001

02.) reg [7:0] a = 8'b0101_0100;   // binary
     reg [7:0] b = 8'b0011_1010;   // binary
  
  Guia_0205 - Tests
  a = 01010100
  b = 00111010
  c = a+b = 10001110
  c = a-b = 00011010
  c = b-a = 11100110
  c = a*b = 00001000
  c = b/a = 00000000


03.) reg [7:0] a = 8'b1001_0110;   // binary
     reg [7:0] b = 8'b0010_0100;   // binary

  Guia_0205 - Tests
  a = 10010110
  b = 00100100
  c = a+b = 10111010
  c = a-b = 01110010
  c = b-a = 10001110
  c = a*b = 00011000
  c = b/a = 00000000

04.) reg [7:0] a = 8'b0100_0010;   // binary
     reg [7:0] b = 8'b0011_0100;   // binary
  
  Guia_0205 - Tests
  a = 01000010
  b = 00110100
  c = a+b = 01110110
  c = a-b = 00001110
  c = b-a = 11110010
  c = a*b = 01101000
  c = b/a = 00000000

05.) reg [7:0] a = 8'b1011_0110;   // binary
     reg [7:0] b = 8'b0001_0101;   // binary

  Guia_0205 - Tests
  a = 10110110
  b = 00010101
  c = a+b = 11001011
  c = a-b = 10100001
  c = b-a = 01011111
  c = a*b = 11101110
  c = b/a = 00000000

06.) reg [7:0] a = 8'b0110_1001;   // binary
     reg [7:0] b = 8'b0000_1011;   // binary
  
  Guia_0205 - Tests
  a = 01101001
  b = 00001011
  c = a+b = 01110100
  c = a-b = 01011110
  c = b-a = 10100010
  c = a*b = 10000011
  c = b/a = 00000000

OBS.: A divisao somente mostra se resultado inteiro!

*/
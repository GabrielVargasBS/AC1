/*
 Guia_0203.v - v0.0. - 12 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
  Guia_0203.v
 */

module Guia_0203; 

// define data
   real      x = 0.625;         // decimal
   reg [7:0] b = 8'b1010_0000;  // binary

   // real      x = 0.328125;       // decimal
   // reg [7:0] b = 8'b0101_0100;   // binary

   // real      x = 0.609375;       // decimal
   // reg [7:0] b = 8'b1001_1100;   // binary

   // real      x = 0.65625;       // decimal
   // reg [7:0] b = 8'b1010_1000;  // binary

   // real      x = 0.765625;      // decimal
   // reg [7:0] b = 8'b1100_0100;  // binary

   // real      x = 0.6875;        // decimal
   // reg [7:0] b = 8'b1011_0000;  // binary

// actions
   initial
    begin : main
     $display ( "Guia_0203 - Tests" );
     $display ( "x = %f"   , x );
     $display ( "b = 0.%8b", b );
     $display ( "b = 0.%x%x (16)"   , b[7:4],b[3:0] );
     $display ( "b = 0.%o%o (8) "   , b[7:5],b[4:2] ); // somente se final = 00
     $display ( "b = 0.%d%d%d%d (4)", b[7:6],b[5:4],b[3:2],b[1:0] );
    end // main

endmodule // Guia_0203

/*
 ---------------------------------------------------------- testes e resultados

OBS.: Acrescentei o que pode representar a base 4


01.) real      x = 0.625;         // decimal
     reg [7:0] b = 8'b1010_0000;  // binary

  Guia_0203 - Tests
  x = 0.625000
  b = 0.10100000
  b = 0.a0 (16)
  b = 0.50 (8)
  b = 0.2200 (4)

02.) real      x = 0.328125;       // decimal
     reg [7:0] b = 8'b0101_0100;   // binary
  
  Guia_0203 - Tests
  x = 0.328125
  b = 0.01010100
  b = 0.54 (16)
  b = 0.25 (8)
  b = 0.1110 (4)

03.) real      x = 0.609375;       // decimal
     reg [7:0] b = 8'b1001_1100;   // binary

  Guia_0203 - Tests
  x = 0.609375
  b = 0.10011100
  b = 0.9c (16)
  b = 0.47 (8)
  b = 0.2130 (4)

04.) real      x = 0.65625;       // decimal
     reg [7:0] b = 8'b1010_1000;  // binary
  
  Guia_0203 - Tests
  x = 0.656250
  b = 0.10101000
  b = 0.a8 (16)
  b = 0.52 (8)
  b = 0.2220 (4)

05.) real      x = 0.765625;      // decimal
     reg [7:0] b = 8'b1100_0100;  // binary

  Guia_0203 - Tests
  x = 0.765625
  b = 0.11000100
  b = 0.c4 (16)
  b = 0.61 (8)
  b = 0.3010 (4)

06.) real      x = 0.6875;        // decimal
     reg [7:0] b = 8'b1011_0000;  // binary
  
  Guia_0203 - Tests
  x = 0.687500
  b = 0.10110000
  b = 0.b0 (16)
  b = 0.54 (8)
  b = 0.2300 (4)

*/
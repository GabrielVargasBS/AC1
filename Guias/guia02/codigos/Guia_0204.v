/*
 Guia_0204.v - v0.0. - 14 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
  Guia_0204.v
 */

module Guia_0204; 

// define data

   real      x = 0.625;          // decimal
   reg [7:0] b = 8'b1010_0000;   // binary

   // real      x = 0.84375;       // decimal
   // reg [7:0] b = 8'b1101_1000;  // binary

   // real      x = 0.23622812;    // decimal
   // reg [7:0] b = 8'b0011_1101;  // binary

   // real      x = 0.953125;      // decimal
   // reg [7:0] b = 8'b1111_0110;  // binary

   // real      x = 0.390625;      // decimal
   // reg [7:0] b = 8'b0110_0100;  // binary

   // real      x = 0.796875;      // decimal
   // reg [7:0] b = 8'b1100_1000;  // binary

   integer   q [3:0];

// actions
   initial
    begin : main
     $display ( "Guia_0204 - Tests" );
     $display ( "x = %f"   , x );
     $display ( "b = 0.%8b", b );
     $display ( "b = 0.%x%x (16)", b[7:4],b[3:0] );
     q[3] = b[7:6];
     q[2] = b[5:4];
     q[1] = b[3:2];
     q[0] = b[1:0];
     $display ( "b = 0.%2b %2b %2b %2b (2)", b[7:6],b[5:4],b[3:2],b[1:0] );
     $display ( "q = 0.%2d %2d %2d %2d (4)", q[3]  ,q[2]  ,q[1]  ,q[0]   );
    end // main

endmodule // Guia_0204

/*
 ---------------------------------------------------------- testes e resultados

01.) real      x = 0.625;         // decimal
     reg [7:0] b = 8'b1010_0000;  // binary

  Guia_0204 - Tests
  x = 0.625000
  b = 0.10100000
  b = 0.a0 (16)
  b = 0.10 10 00 00 (2)
  q = 0. 2  2  0  0 (4)

02.) real      x = 0.84375;       // decimal
     reg [7:0] b = 8'b1101_1000;  // binary
  
  Guia_0203 - Tests
  x = 0.843750
  b = 0.11011000
  b = 0.d8 (16)
  b = 0.11 01 10 00 (2)
  q = 0. 3  1  2  0 (4)


03.) real      x = 0.23622812;      // decimal
     reg [7:0] b = 8'b0011_1101;    // binary

  Guia_0204 - Tests
  x = 0.236228
  b = 0.00111101
  b = 0.3d (16)
  b = 0.00 11 11 01 (2)
  q = 0. 0  3  3  1 (4)

04.) real      x = 0.953125;      // decimal
     reg [7:0] b = 8'b1111_0110;  // binary
  
  Guia_0203 - Tests
  x = 0.953125
  b = 0.11110110
  b = 0.f6 (16)
  b = 0.11 11 01 10 (2)
  q = 0. 3  3  1  2 (4)

05.) real      x = 0.390625;      // decimal
     reg [7:0] b = 8'b0110_0100;  // binary

  Guia_0203 - Tests
  x = 0.390625
  b = 0.01100100
  b = 0.64 (16)
  b = 0.01 10 01 00 (2)
  q = 0. 1  2  1  0 (4)

06.) real      x = 0.796875;      // decimal
     reg [7:0] b = 8'b1100_1000;  // binary
  
  Guia_0203 - Tests
  x = 0.796875
  b = 0.11001000
  b = 0.c8 (16)
  b = 0.11 00 10 00 (2)
  q = 0. 3  0  2  0 (4)

*/
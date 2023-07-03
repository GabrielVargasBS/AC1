/*
 Guia_0102.v - v0.0. - 04 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
  Guia_0102.v
 */

module Guia_0102; 

// define data
   integer   x = 0;          // decimal
   reg [7:0] b = 8'b0001101; // binary (bits)

// actions
   initial
   begin : main
    $display ( "Guia_0102 - Tests" );
    $display ( "x = %d" , x );
    $display ( "b = %8b", b );
    x = b;
    $display ( "b = %d" , x );
   end // main

endmodule // Guia_0102

/*
 ---------------------------------------------------------- testes e resultados
 Para exemplo pre-definido:
 Guia_0102 - Tests
 x =           0
 b = 00001101
 b =          13

 Para b = 001110001:
 Guia_0102 - Tests
 x =           0
 b = 00111001
 b =          57

 Para b = 00101100
 Guia_0102 - Tests
 x =           0
 b = 00101100
 b =          44

*/
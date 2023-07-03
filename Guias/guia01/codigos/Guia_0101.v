/*
 Guia_0101.v - v0.0. - 03 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
  Guia_0101.v
 */

module Guia_0101; 

// define data
   integer x   = 13 ;  // decimal
   reg [7:0] b = 0  ;  // binary

// actions
   initial
   begin : main
    $display ( "Guia_0101 - Tests" );
    $display ( "x = %d" , x );
    $display ( "b = %8b", b );
    b = x;
    $display ( "b = %8b", b );
   end // main

endmodule // Guia_0101

/*
 ---------------------------------------------------------- testes e resultados
 Para exemplo pre-definido:

 Guia_0101 - Tests
 x =          13
 b = 00000000
 b = 00001101

 Para x = 27:
 Guia_0101 - Tests
 x =          27
 b = 00000000
 b = 00011011

 Para x = 721:
 Guia_0101 - Tests
 x =         721
 b = 00000000
 b = 11010001 *apresentou erro pela quantidade de casas; logo, alterei para 12
 --> b = 001011010001
*/
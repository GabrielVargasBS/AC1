/*
 Guia_0105.v - v0.0. - 04 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
  Guia_0105.v
 */

module Guia_0105; 

// define data
   integer   x = 13;  // decimal
   reg [7:0] b =  0;  // binary
   reg [0:2][7:0] s = "PUC"; // 3 characters (8 bits)

// actions
   initial
   begin : main
    $display ( "Guia_0105 - Tests" );
    $display ( "x = %d" , x );
    $display ( "b = %8b", b );
    $display ( "s = %s" , s );
    b = x;
    $display ( "b = [%4b] [%4b] = %h %h", b[7:4], b[3:0], b[7:4], b[3:0] );
    s[0] = "-";
    s[1] = 8'b01001101; // 'M'
    s[2] = 71;          // 'G'
    $display ( "s = %s" , s );
   end // main

endmodule // Guia_0105

/*
 ---------------------------------------------------------- testes e resultados
 Para exemplo pre-definido:
 Guia_0105 - Tests
 x =          13
 b = xxxxxxxx
 s = PUC
 b = [0000] [1101] = 0 d
 s = -MG

*/
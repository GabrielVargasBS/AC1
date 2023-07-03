/*
 Guia_0201.v - v0.0. - 11 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
  Guia_0201.v
 */

module Guia_0201; 

// define data
   real x      = 0  ; // decimal
   real power2 = 1.0; // power of 2
   integer y   = 7  ; // counter
   reg [7:0] b = 8'b10100000; // binary (only fraction part, Big Endian)

   // reg [7:0] b = 8'b01001000;   // 0.281250
   // reg [7:0] b = 8'b01011000;   // 0.343750
   // reg [7:0] b = 8'b11001000;   // 0.781250
   // reg [7:0] b = 8'b10011000;   // 0.593750
   // reg [7:0] b = 8'b10110000;   // 0.687500

// actions
   initial
    begin : main
     $display ( "Guia_0201 - Tests" );
     $display ( "x = %f" , x );
     $display ( "b = 0.%8b", b );

     while ( y >= 0 )
      begin
       power2 = power2 / 2.0;
       if ( b[y] == 1 )
        begin
         x = x + power2;
         $display ( "x = %f", x );
        end // end if
        // $display ( "x = %f", x );
       y=y-1;
      end // end while
      $display ( "\nx = %f", x );
    end // main

endmodule // Guia_0201

/*
 ---------------------------------------------------------- testes e resultados
 
OBS.: Alterei a parte do codigo para mostrar o valor de x apenas se ele mudar;
tambem, coloquei uma quebra de linha para mostrar o resultado final.

01.) reg [7:0] b = 8'b10100000
               b = 0.101

  Guia_0201 - Tests
  x = 0.000000
  b = 0.10100000
  x = 0.500000
  x = 0.625000

  x = 0.625000


02.) reg [7:0] b = 8'b01001000
               b = 0.01001

  Guia_0201 - Tests
  x = 0.000000
  b = 0.01001000
  x = 0.250000
  x = 0.281250

  x = 0.281250

03.) reg [7:0] b = 8'b01011000
               b = 0.01011

  Guia_0201 - Tests
  x = 0.000000
  b = 0.01011000
  x = 0.250000
  x = 0.312500
  x = 0.343750

  x = 0.343750

04.) reg [7:0] b = 8'b11001000
               b = 0.11001

  Guia_0201 - Tests
  x = 0.000000
  b = 0.11001000
  x = 0.500000
  x = 0.750000
  x = 0.781250

  x = 0.781250

05.) reg [7:0] b = 8'b10011000
               b = 0.10011

  Guia_0201 - Tests
  x = 0.000000
  b = 0.10011000
  x = 0.500000
  x = 0.562500
  x = 0.593750

  x = 0.593750

06.) reg [7:0] b = 8'b10110000
               b = 0.10110
  
  Guia_0201 - Tests
  x = 0.000000
  b = 0.10110000
  x = 0.500000
  x = 0.625000
  x = 0.687500

  x = 0.687500

*/
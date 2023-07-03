/*
 Guia_0202.v - v0.0. - 11 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
  Guia_0202.v
 */

module Guia_0202; 

// define data
   real      x = 0.75;      // decimal
   integer   y = 7   ;      // counter
   reg [7:0] b = 0   ;      // binary

   // real      x = 0.125;     // 0.001
   // real      x = 0.625;     // 0.101
   // real      x = 0.03125;   // 0.00001 
   // real      x = 0.25;      // 0.01
   // real      x = 0.875;     // 0.111

// actions
   initial
    begin : main
     $display ( "Guia_0202 - Tests" );
     $display ( "x = %f" , x );
     $display ( "b = 0.%8b", b );
     
     while ( x > 0 && y >= 0 )
      begin
       if ( x*2 >= 1 )
        begin
         b[y] = 1;
         x = x*2.0 - 1.0;
        end // end if
       else
        begin
         b[y] = 0;
         x = x*2.0;
        end // end if
      // $display ( "x = %f" , x );
      $display ( "b = 0.%8b", b );
      y=y-1;
     end // end while
    end // main

endmodule // Guia_0202


/*
 ---------------------------------------------------------- testes e resultados

01.) real x = 0.75;

  Guia_0202 - Tests
  x = 0.750000
  b = 0.00000000
  b = 0.10000000
  b = 0.11000000

02.) real x = 0.125;
  
  Guia_0202 - Tests
  x = 0.125000
  b = 0.00000000
  b = 0.00000000
  b = 0.00000000
  b = 0.00100000

03.) real x = 0.625;

  Guia_0202 - Tests
  x = 0.625000
  b = 0.00000000
  b = 0.10000000
  b = 0.10000000
  b = 0.10100000

04.) real x = 0.03125;
  
  Guia_0202 - Tests
  x = 0.031250
  b = 0.00000000
  b = 0.00000000
  b = 0.00000000
  b = 0.00000000
  b = 0.00000000
  b = 0.00001000

05.) real x = 0.25;

  Guia_0202 - Tests
  x = 0.250000
  b = 0.00000000
  b = 0.00000000
  b = 0.01000000

06.) real x = 0.875
  
  Guia_0202 - Tests
  x = 0.875000
  b = 0.00000000
  b = 0.10000000
  b = 0.11000000
  b = 0.11100000

*/
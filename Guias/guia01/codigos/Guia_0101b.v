/*
 Guia_0101b.v - v0.0. - 05 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
  Guia_0101b.v
 */

// modules
module Exemplo_01 ( input [31:0] x );
  initial 
  begin
  #1;                                // controle de tempo
  $display ( "Tests - Exemplo_01" );
  $display ( "x = %d\n", x );
  end
endmodule // Exemplo_01
 
module Exemplo_02;
  initial
  begin
  #2;                                // controle de tempo
  $display ( "\nTests - Exemplo_02\n" );
  end
endmodule // Exemplo_02

module Modules;
// define data
 integer   x = 13;           // decimal
 Exemplo_01 E01 ( x );       // instancia de modulo
 Exemplo_02 E02 (   );       // instancia de modulo
 
// actions
 initial
 begin : main
  $display ( "\nGuia_0101 - Tests" );
  $display ( "x = %d\n"        , x );
 end // main
endmodule // Guia_0101b


/*
 Testes
 */
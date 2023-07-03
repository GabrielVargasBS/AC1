/*
 * Exemplo_1103 - Mealy-Moore
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
 */

// incluir bibliotecas
`include "Mealy_1011_semIntersecao.v"

/*
 -----------------------
 --- Mealy-Moore FSM ---
 -----------------------
*/
module Exemplo1103;
   reg clk, reset, x;
   wire m1, m2;

   mealy_1011_semIntersecao mealy1 ( m1, x, clk, reset );

   initial
    begin
       $display ("\nGabriel Vargas Bento de Souza - 778023");
       $display ("Mealy semIntersecao (id1011)");
       $display ("\n Time   x    Mealy");
        
        // initial values
        clk   = 1;
        reset = 0;
        x     = 0;

        // input signal changing
        #5  reset = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #20 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #30 $finish;
    end // initial

   always
    #5 clk = ~clk;

   always @( posedge clk )
    begin
        $display ( "%4d %4b %6b", $time, x, m1 );
    end // always at positive edge clocking changing
endmodule // Exemplo_1103

/*
// ---------------------------------- previsao

Com Mealy, a identificacao sera' automatica. Ou seja, o resultado vira' no
mesmo clock de entrada do digito.

Apos a identificacao, nao havera' intersecao. Logo, somente 2 identificacoes

   
// ---------------------------------- testes

gabriel@desktop-ubuntu:~/Desktop/CC-PUC/2periodo/ARQ1/Tarefas/Guia11$ vvp Exemplo_1103.vvp

Gabriel Vargas Bento de Souza - 778023
Mealy semIntersecao (id1011)

 Time   x    Mealy
  10    0      0
  20    1      0
  30    0      0
  40    1      0
  50    1      1
  60    1      0
  70    0      0
  80    1      0
  90    1      1
 100    0      0
 110    1      0
 120    1      0
 130    0      0
 140    0      0
 150    0      0


*/
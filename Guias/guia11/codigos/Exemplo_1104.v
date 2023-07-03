/*
 * Exemplo_1104 - Mealy-Moore
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
 */

// incluir bibliotecas
`include "Moore_1011_comIntersecao.v"

/*
 -----------------------
 --- Mealy-Moore FSM ---
 -----------------------
*/
module Exemplo1104;
   reg clk, reset, x;
   wire m1, m2;

   moore_1011_comIntersecao moore1 ( m1, x, clk, reset );

   initial
    begin
       $display ("\nGabriel Vargas Bento de Souza - 778023");
       $display ("Moore comIntersecao (id1011)");
       $display ("\n Time   x    Moore");
        
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
endmodule // Exemplo_1104

/*
// ---------------------------------- previsao

Com Moore, a identificacao sera' posterior 'a entrada.

Apos a identificacao, havera' intersecao. Logo, 3 vezes.
   
// ---------------------------------- testes

gabriel@desktop-ubuntu:~/Desktop/CC-PUC/2periodo/ARQ1/Tarefas/Guia11$ vvp Exemplo_1104.vvp

Gabriel Vargas Bento de Souza - 778023
Moore comIntersecao (id1011)

 Time   x    Moore
  10    0      0
  20    1      0
  30    0      0
  40    1      0
  50    1      0
  60    1      1
  70    0      0
  80    1      0
  90    1      0
 100    0      1
 110    1      0
 120    1      0
 130    0      1
 140    0      0
 150    0      0

*/
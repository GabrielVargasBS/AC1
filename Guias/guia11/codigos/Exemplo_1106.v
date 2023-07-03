/*
 * Exemplo_1106 - Mealy-Moore
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
 */

// incluir bibliotecas
`include "Mealy_010_or_101.v"
`include "Moore_010_or_101.v"


/*
 -----------------------
 --- Mealy-Moore FSM ---
 -----------------------
*/
module Exemplo1106;
   reg clk, reset, x;
   wire m1, m2;

   mealy_010_or_101 mealy1 ( m1, x, clk, reset );
   moore_010_or_101 moore1 ( m2, x, clk, reset );

   initial
    begin
       $display ("\nGabriel Vargas Bento de Souza - 778023");
       $display ("Mealy-Moore FSM (id010 or id101)");
       $display ("\n Time   x    Mealy   Moore");
        
        // initial values
        clk   = 1;
        reset = 0;
        x     = 1;

        // input signal changing
        #5  reset = 1;
        #20 x = 0;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #30 $finish;
    end // initial

   always
    #5 clk = ~clk;

   always @( posedge clk )
    begin
        $display ( "%4d %4b %6b %7b", $time, x, m1, m2 );
    end // always at positive edge clocking changing
endmodule // Exemplo_1106

/*
// ---------------------------------- previsao

Devera' haver mutua identificacao das sequencias 010 e 101

   
// ---------------------------------- testes

gabriel@desktop-ubuntu:~/Desktop/CC-PUC/2periodo/ARQ1/Tarefas/Guia11$ vvp Exemplo_1106.vvp

Gabriel Vargas Bento de Souza - 778023
Mealy-Moore FSM (id010 or id101)

 Time   x    Mealy   Moore
  10    1      0       0
  20    1      0       0
  30    0      0       0
  40    1      1       0
  50    0      1       1
  60    1      1       1
  70    1      0       1
  80    0      0       0
  90    1      1       0
 100    0      1       1
 110    1      1       1
 120    1      0       1
 130    1      0       0
 140    1      0       0


*/
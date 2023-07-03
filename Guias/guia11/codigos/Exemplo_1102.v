/*
 * Exemplo_1102 - Mealy-Moore
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
 */

// incluir bibliotecas
`include "Mealy_1101_once.v"
`include "Moore_1101_once.v"


/*
 -----------------------
 --- Mealy-Moore FSM ---
 -----------------------
*/
module Exemplo1102;
   reg clk, reset, x;
   wire m1, m2;

   mealy_1101_once mealy1 ( m1, x, clk, reset );
   moore_1101_once moore1 ( m2, x, clk, reset );

   initial
    begin
       $display ("\nGabriel Vargas Bento de Souza - 778023");
       $display ("Mealy-Moore FSM (id1101)");
       $display ("\n Time   x    Mealy   Moore");
        
        // initial values
        clk   = 1;
        reset = 0;
        x     = 0;

        // input signal changing
        #5  reset = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #20 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #30 $finish;
    end // initial

   always
    #5 clk = ~clk;

   always @( posedge clk )
    begin
        $display ( "%4d %4b %6b %7b", $time, x, m1, m2 );
    end // always at positive edge clocking changing
endmodule // Exemplo_1102

/*
// ---------------------------------- previsao

Com Mealy, a identificacao sera' automatica. Ou seja, o resultado vira' no
mesmo clock de entrada do digito.
Porem, com Moore, a identificacao sera' posterior 'a entrada.

Apos a identificacao, ambos deverao mostrar o sinal de indeterminacao: x

   
// ---------------------------------- testes

gabriel@desktop-ubuntu:~/Desktop/CC-PUC/2periodo/ARQ1/Tarefas/Guia11$ vvp Exemplo_1102.vvp

Gabriel Vargas Bento de Souza - 778023
Mealy-Moore FSM (id1101)

 Time   x    Mealy   Moore
  10    0      0       0
  20    1      0       0
  30    0      0       0
  40    1      0       0
  50    1      0       0
  60    0      0       0
  70    1      1       0
  80    1      x       1
  90    0      x       x
 100    1      x       x
 110    1      x       x
 120    1      x       x


*/
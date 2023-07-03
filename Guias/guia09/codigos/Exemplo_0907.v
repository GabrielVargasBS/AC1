/*
 * Exemplo_0907 - CLOCK
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
*/

// -------------------------
// test clock generator (4)
// -------------------------

`include "clock.v"

module pulse (signal, clock);
   input  clock;
   output signal;
   reg    signal;

   always @ (negedge clock)
   begin
          signal = 1'b1;   // marcar apenas durante 5 unidades de tempo e
       #5 signal = 1'b0;   // retornar ao estado inicial 
   end
endmodule // pulse ()

// -------------------------
// main
// -------------------------
module Exemplo_0907;
   
   wire clock;
   wire p;

   clock CLK1 (clock);
   pulse PLS1 (p, clock);

   initial
   begin
      $dumpfile ( "Exemplo_0907.vcd" );
      $dumpvars ( 1, clock, p );
      #120 $finish;
   end
endmodule // Exemplo_0907 ()

// -------------------------
// test
// -------------------------
/*
---------- previsao ----------

Durante a descida do clock, pulso sobre tambem, mas durante 5 u.t.

---------- execucao ----------

C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia09>vvp Exemplo_0907.vvp
VCD info: dumpfile Exemplo_0907.vcd opened for output.
Exemplo_0907.v:40: $finish called at 120 (1s)

*/
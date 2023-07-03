/*
 * Exemplo_0904 - CLOCK
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

   always @ (clock)
   begin
          signal = 1'b0;
       #4 signal = 1'b1;
       #4 signal = 1'b0;
       #4 signal = 1'b1;
       #4 signal = 1'b0;
       #4 signal = 1'b1;
   end
endmodule // pulse ()

// -------------------------
// main
// -------------------------
module Exemplo_0904;
   
   wire clock;
   wire p;

   clock CLK1 (clock);
   pulse PLS1 (p, clock);

   initial
   begin
      $dumpfile ( "Exemplo_0904.vcd" );
      $dumpvars ( 1, clock, p );
      #120 $finish;
   end
endmodule // Exemplo_0904 ()

// -------------------------
// test
// -------------------------
/*
---------- previsao ----------

Equanto o clock leva 12u.t. para mudar o estado, o pulse deve levar 1/3u.t..
Assim, aos 24u.t., o clock tera mudado 4 vezes, e o pulse, 12.

---------- execucao ----------

C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia09>vvp Exemplo_0904.vvp
VCD info: dumpfile Exemplo_0904.vcd opened for output.
Exemplo_0904.v:44: $finish called at 120 (1s)

*/
/*
 * Exemplo_0905 - CLOCK
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
       #48 signal = 1'b0;
       #48 signal = 1'b1;
   end
endmodule // pulse ()

// -------------------------
// main
// -------------------------
module Exemplo_0905;
   
   wire clock;
   wire p;

   clock CLK1 (clock);
   pulse PLS1 (p, clock);

   initial
   begin
      $dumpfile ( "Exemplo_0905.vcd" );
      $dumpvars ( 1, clock, p );
      #480 $finish;
   end
endmodule // Exemplo_0905 ()

// -------------------------
// test
// -------------------------
/*
---------- previsao ----------

Foi necessario tempo de indeterminacao durante os primeiros 48u.t.

Equanto o clock leva 12u.t. para mudar o estado, o pulse deve levar 4*12u.t..
Assim, aos 48u.t., o clock tera mudado 4 vezes, e o pulse, 1.

---------- execucao ----------

C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia09>vvp Exemplo_0905.vvp
VCD info: dumpfile Exemplo_0905.vcd opened for output.
Exemplo_0905.v:40: $finish called at 480 (1s)

*/
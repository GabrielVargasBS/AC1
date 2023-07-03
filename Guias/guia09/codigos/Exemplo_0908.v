/*
 * Exemplo_0908 - CLOCK
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
       #15 signal = 1'b1;    // alinhar com o meio do clock
       #06 signal = 1'b0;
   end
endmodule // pulse ()

// -------------------------
// main
// -------------------------
module Exemplo_0908;
   
   wire clock;
   wire p;

   clock CLK1 (clock);
   pulse PLS1 (p, clock);

   initial
   begin
      $dumpfile ( "Exemplo_0908.vcd" );
      $dumpvars ( 1, clock, p );
      #120 $finish;
   end
endmodule // Exemplo_0908 ()

// -------------------------
// test
// -------------------------
/*
---------- previsao ----------

O maior nivel e a maior estabilidade ocorrem quando o clock vale 1 e esta longe
das bordas; logo, deve-se alinhar de modo centralizado.

---------- execucao ----------

C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia09>vvp Exemplo_0908.vvp
VCD info: dumpfile Exemplo_0908.vcd opened for output.
Exemplo_0908.v:40: $finish called at 120 (1s)

*/
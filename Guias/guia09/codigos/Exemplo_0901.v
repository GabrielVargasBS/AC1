/*
 * Exemplo_0901 - CLOCK
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
*/

// -------------------------
// test clock generator (1)
// -------------------------
module clock ( output clk );
   reg clk;
   
   initial
   begin
      clk = 1'b0;
   end

   always
   begin
      #12 clk = ~clk;
   end
endmodule // clock ()

// -------------------------
// main
// -------------------------
module Exemplo_0901;
   
   wire  clk;
   clock CLK1 (clk);

   initial
   begin
      $dumpfile ( "Exemplo_0901.vcd" );
      $dumpvars;

      #120 $finish;
   end
endmodule // Exemplo_0901 ()

// -------------------------
// test
// -------------------------
/*
---------- previsao ----------

  clk     sinal
    0       0
   12       1
   24       0
   36       1
  ...      ...
  108       1
  120       0

---------- execucao ----------

C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia09>vvp Exemplo_0901.vvp
VCD info: dumpfile Exemplo_0901.vcd opened for output.
Exemplo_0901.v:37: $finish called at 120 (1s)

*/
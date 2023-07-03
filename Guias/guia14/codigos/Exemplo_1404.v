/*
 Exemplo_1404.v - v0.0. - 05 / 11 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

`include "FlipFlops.v"

/**
  Main
 */
module Exemplo_1404;
   wire q[5:0];       // q
   wire qnot[5:0];    // qnot
   reg  d;            // d (input)
   wire new_d;        // d       
   reg  clk;          // clock
   reg  preset;       // 1
   reg  notpreset;    // 0
   reg  clr;          // clear
   
   // instancias
   or  OR_1 (new_d, d, qnot[5]);

   dff D_1  (q[5], qnot[5], q[4],  clk, notpreset, clr);
   dff D_2  (q[4], qnot[4], q[3],  clk, notpreset, clr);
   dff D_3  (q[3], qnot[3], q[2],  clk, notpreset, clr);
   dff D_4  (q[2], qnot[2], q[1],  clk, notpreset, clr);
   dff D_5  (q[1], qnot[1], q[0],  clk, notpreset, clr);
   dff D_6  (q[0], qnot[0], new_d, clk,    preset, clr);

   
   // valores iniciais
   initial begin: start
      d         = 1'bx;
      clk       = 1'b0;
      preset    = 1'b1;
      notpreset = 1'b0;
      clr       = 1'b0;
   end

   // parte principal
   initial begin: main
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Exemplo_1404\n");
       $display("(Left) 'Twisted Ring' Register - 6 bits - preset[xxxxx1]\n");

       // monitoramento
       $display(" data a b c d e f");
       $monitor(" %2b   %b %b %b %b %b %b", 
                 d, q[5], q[4], q[3], q[2], q[1], q[0]);

       // sinalizacao
           clk = ~clk; clk = ~clk;
       #1  clk = ~clk; clk = ~clk; d = 1'b1; preset = 1'b0;
       #1  clk = ~clk; clk = ~clk; d = 1'b0;
       #1  clk = ~clk; clk = ~clk; d = 1'b1;
       #1  clk = ~clk; clk = ~clk; d = 1'b1;
       #1  clk = ~clk; clk = ~clk; d = 1'b0;
       #1  clk = ~clk; clk = ~clk; d = 1'b0;
       #1  clk = ~clk; clk = ~clk; d = 1'b1;
       #1  clk = ~clk; clk = ~clk; d = 1'b1;
       #1  clk = ~clk; clk = ~clk; d = 1'b0;
       #1  clk = ~clk; clk = ~clk; d = 1'b0;
       #1  clk = ~clk; clk = ~clk; d = 1'b0;
       #1  clk = ~clk; clk = ~clk; d = 1'b0;
       #1  clk = ~clk; clk = ~clk; d = 1'b0;
       #1  clk = ~clk; clk = ~clk; d = 1'b0;
   end
endmodule // Exemplo_1404

/*
gabriel@desktop-ubuntu:~/Desktop/CC-PUC/2periodo/ARQ1/Tarefas/Guia14$ vvp Exemplo_1404.vvp
Gabriel Vargas Bento de Souza - 778023
Exemplo_1404

(Left) 'Twisted Ring' Register - 6 bits - preset[xxxxx1]

 data a b c d e f
  x   0 0 0 0 0 1
  1   0 0 0 0 1 1
  0   0 0 0 1 1 1
  1   0 0 1 1 1 1
  1   0 1 1 1 1 1
  0   1 1 1 1 1 1
  0   1 1 1 1 1 0
  1   1 1 1 1 0 0
  1   1 1 1 0 0 1
  0   1 1 0 0 1 1
  0   1 0 0 1 1 0
  0   0 0 1 1 0 0
  0   0 1 1 0 0 1
  0   1 1 0 0 1 1
  0   1 0 0 1 1 0
 
  // OBS.: Nao fiquei satisfeito com essa resolucao (logisim e verilog). A 
  // entrada de dados nao esta' de maneira satisfatoria.

*/
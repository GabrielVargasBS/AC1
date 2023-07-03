/*
 Exemplo_1306.v - v0.0. - 05 / 11 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

`include "FlipFlops.v"

/**
  Main
 */
module Exemplo_1306;
   wire q[5:0];       // q
   wire qnot[5:0];    // qnot
   reg  d;            // d (input)
   wire new_d;        // d       
   reg  clk;          // clock
   
   // instancias
   or  OR_1 (new_d, d, qnot[5]);

   dff D_1  (q[5], qnot[5], new_d, clk);
   dff D_2  (q[4], qnot[4], q[5],  clk);
   dff D_3  (q[3], qnot[3], q[4],  clk);
   dff D_4  (q[2], qnot[2], q[3],  clk);
   dff D_5  (q[1], qnot[1], q[2],  clk);
   dff D_6  (q[0], qnot[0], q[1],  clk);

   
   // valores iniciais
   initial begin: start
      d     = 1'bx;
      clk   = 1'b0;
   end

   // parte principal
   initial begin: main
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Exemplo_1306\n");
       $display("Ring Counter - 6 bits\n");

       // monitoramento
       $display(" input a b c d e f");
       $monitor("   %b   %b %b %b %b %b %b", 
                 d, q[5], q[4], q[3], q[2], q[1], q[0]);

       // sinalizacao
       #1  clk = ~clk; clk = ~clk; d = 1'b1;
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
endmodule // Exemplo_1306

/*
gabriel@desktop-ubuntu:~/Desktop/CC-PUC/2periodo/ARQ1/Tarefas/Guia13$ vvp Exemplo_1306.vvp
Gabriel Vargas Bento de Souza - 778023
Exemplo_1306

Ring Counter - 6 bits

 input a b c d e f
   x   x x x x x x
   1   x x x x x x
   0   1 x x x x x
   1   0 1 x x x x
   1   1 0 1 x x x
   0   1 1 0 1 x x
   0   0 1 1 0 1 x
   1   1 0 1 1 0 1
   1   1 1 0 1 1 0
   0   1 1 1 0 1 1
   0   0 1 1 1 0 1
   0   1 0 1 1 1 0
   0   0 1 0 1 1 1
   0   1 0 1 0 1 1
   0   0 1 0 1 0 1

*/
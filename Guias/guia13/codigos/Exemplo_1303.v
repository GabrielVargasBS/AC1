/*
 Exemplo_1303.v - v0.0. - 30 / 10 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

`include "FlipFlops.v"

/**
  Main
 */
module Exemplo_1303;
   wire q   [4:0];    // q
   wire qnot[4:0];    // qnot
   reg  jk;           // j k
   reg  clk;          // clock
   reg  preset;       // 0
   reg  clr;          // clear
   wire CLR;          // new clear
   wire count;        // para contagem
   integer x;         // decimal correspondente

   
   // instancias

   jkff JK_1 (q[4], qnot[4], jk, jk, clk    , preset, CLR);
   jkff JK_2 (q[3], qnot[3], jk, jk, qnot[4], preset, CLR);
   jkff JK_3 (q[2], qnot[2], jk, jk, qnot[3], preset, CLR);
   jkff JK_4 (q[1], qnot[1], jk, jk, qnot[2], preset, CLR);
   jkff JK_5 (q[0], qnot[0], jk, jk, qnot[1], preset, CLR);

   nand NAND_1 (CLR, clr, count);
   nand NAND_2 (count, qnot[4], q[3], qnot[2], q[1], qnot[0]);

   // valores iniciais
   initial begin: start
      jk     = 1'b1;
      clk    = 1'b1;
      preset = 1'b0;
      clr    = 1'b0;
   end

   // parte principal
   initial begin: main
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Exemplo_1303");
       $display("\n(Up) Asynchronous counter [10] - 5 bits \n");

       // monitoramento
       $display("[id]: a b c d e ");
       $monitor(" %2d  %2b %b %b %b %b", 
                 x, q[0], q[1], q[2], q[3], q[4]);

       // sinalizacao
       #5  clk = ~clk; clk = ~clk; clr = 1'b0;
       #5  clk = ~clk; clk = ~clk; clr = 1'b1;
       #5  clk = ~clk; clk = ~clk; x   = 0;

       for (integer i = 0; i < 20; i=i+1)
        begin
            #5 clk = ~clk; clk = ~clk; x=x+1;
            if (x == 10)
                x = -1;
        end

   end
endmodule // Exemplo_1303

/*
gabriel@desktop-ubuntu:~/Desktop/CC-PUC/2periodo/ARQ1/Tarefas/Guia13$ vvp Exemplo_1303.vvp
Gabriel Vargas Bento de Souza - 778023
Exemplo_1303

(Up) Asynchronous counter [10] - 5 bits 

[id]: a b c d e 
  x   0 0 0 0 0
  x   1 1 1 1 1
  0   0 0 0 0 0
  1   0 0 0 0 1
  2   0 0 0 1 0
  3   0 0 0 1 1
  4   0 0 1 0 0
  5   0 0 1 0 1
  6   0 0 1 1 0
  7   0 0 1 1 1
  8   0 1 0 0 0
  9   0 1 0 0 1
 -1   1 1 1 1 1
  0   0 0 0 0 0
  1   0 0 0 0 1
  2   0 0 0 1 0
  3   0 0 0 1 1
  4   0 0 1 0 0
  5   0 0 1 0 1
  6   0 0 1 1 0
  7   0 0 1 1 1
  8   0 1 0 0 0
  9   0 1 0 0 1

*/
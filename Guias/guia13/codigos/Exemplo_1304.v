/*
 Exemplo_1304.v - v0.0. - 30 / 10 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

`include "FlipFlops.v"

/**
  Main
 */
module Exemplo_1304;
   wire q   [4:0];    // q
   wire qnot[4:0];    // qnot
   reg  jk;           // j k
   reg  clk;          // clock
   reg  preset;       // 0
   wire clr;          // clear
   wire count;        // para contagem
   integer x;         // decimal correspondente

   
   // instancias

   jkff JK_1 (q[4], qnot[4], jk, jk, clk , preset, clr);
   jkff JK_2 (q[3], qnot[3], jk, jk, q[4], preset, clr);
   jkff JK_3 (q[2], qnot[2], jk, jk, q[3], preset, clr);
   jkff JK_4 (q[1], qnot[1], jk, jk, q[2], preset, clr);
   jkff JK_5 (q[0], qnot[0], jk, jk, q[1], preset, clr);

   or  OR__1 (clr, ~jk, count);
   and AND_1 (count, q[4], qnot[3], q[2], qnot[1], q[0]);

   // valores iniciais
   initial begin: start
      jk     = 1'b0;
      clk    = 1'b0;
      preset = 1'b0;
   end

   // parte principal
   initial begin: main
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Exemplo_1304");
       $display("\n(Down) Asynchronous counter [10] - 5 bits \n");

       // monitoramento
       $display("[id]: a b c d e");
       $monitor(" %2d  %2b %b %b %b %b", 
                 x, q[0], q[1], q[2], q[3], q[4]);

       // sinalizacao
       #5  clk = ~clk; clk = ~clk; jk = 1'b1;
       #5  clk = ~clk; clk = ~clk;
       #5  clk = ~clk; clk = ~clk; x  = 63;

       for (integer i = 0; i < 20; i=i+1)
        begin
            #5 clk = ~clk; clk = ~clk; x=x-1;
            if (x == 52)
                x = 64;
        end

   end
endmodule // Exemplo_1304

/*
gabriel@desktop-ubuntu:~/Desktop/CC-PUC/2periodo/ARQ1/Tarefas/Guia13$ vvp Exemplo_1304.vvp
Gabriel Vargas Bento de Souza - 778023
Exemplo_1304

(Down) Asynchronous counter [10] - 5 bits 

[id]: a b c d e
  x   0 0 0 0 0
  x   0 0 0 0 1
  x   0 0 0 0 0
 63   1 1 1 1 1
 62   1 1 1 1 0
 61   1 1 1 0 1
 60   1 1 1 0 0
 59   1 1 0 1 1
 58   1 1 0 1 0
 57   1 1 0 0 1
 56   1 1 0 0 0
 55   1 0 1 1 1
 54   1 0 1 1 0
 53   0 0 0 0 1
 64   0 0 0 0 0
 63   1 1 1 1 1
 62   1 1 1 1 0
 61   1 1 1 0 1
 60   1 1 1 0 0
 59   1 1 0 1 1
 58   1 1 0 1 0
 57   1 1 0 0 1
 56   1 1 0 0 0
 55   1 0 1 1 1
 54   1 0 1 1 0
 53   0 0 0 0 1
 64   0 0 0 0 0
 63   1 1 1 1 1
 62   1 1 1 1 0
 
*/
/*
 Exemplo_1301.v - v0.0. - 30 / 10 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

`include "FlipFlops.v"

/**
  Main
 */
module Exemplo_1301;
   wire q;            // q
   wire qnot[5:0];    // qnot
   reg  jk;           // j k
   reg  clk;          // clock
   reg  preset;       // 0
   reg  clr;          // clear
   integer x;         // decimal correspondente

   
   // instancias
   jkff JK_1 (q, qnot[5], jk, jk, qnot[4], preset, clr);
   jkff JK_2 (q, qnot[4], jk, jk, qnot[3], preset, clr);
   jkff JK_3 (q, qnot[3], jk, jk, qnot[2], preset, clr);
   jkff JK_4 (q, qnot[2], jk, jk, qnot[1], preset, clr);
   jkff JK_5 (q, qnot[1], jk, jk, qnot[0], preset, clr);
   jkff JK_6 (q, qnot[0], jk, jk, clk, preset, clr);

   
   // valores iniciais
   initial begin: start
      jk     = 1'b1;
      clk    = 1'b0;
      preset = 1'b0;
      clr    = 1'b1;
   end

   // parte principal
   initial begin: main
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Exemplo_1301");
       $display("\n(Down) Asynchronous counter - 6 bits \n");

       // monitoramento
       $display("[id]: a b c d e f");
       $monitor(" %2d  %2b %b %b %b %b %b", 
                 x, qnot[5], qnot[4], qnot[3], qnot[2], qnot[1], qnot[0]);

       // sinalizacao
       #1  clk = ~clk; clk = ~clk; clr = 1'b0;
       #1  clk = ~clk;

       for (x = 63; x > 0; x=x-1)
        begin
            #1 clk = ~clk; clk = ~clk;
        end
   end
endmodule // Exemplo_1301

/*
gabriel@desktop-ubuntu:~/Desktop/CC-PUC/2periodo/ARQ1/Tarefas/Guia13$ vvp Exemplo_1301.vvp
Gabriel Vargas Bento de Souza - 778023
Exemplo_1301

(Down) Asynchronous counter - 6 bits 

[id]: a b c d e f
  x   1 1 1 1 1 1
  x   0 0 0 0 0 0
 63   1 1 1 1 1 1
 62   1 1 1 1 1 0
 61   1 1 1 1 0 1
 60   1 1 1 1 0 0
 59   1 1 1 0 1 1
 58   1 1 1 0 1 0
 57   1 1 1 0 0 1
 56   1 1 1 0 0 0
 55   1 1 0 1 1 1
 54   1 1 0 1 1 0
 53   1 1 0 1 0 1
 52   1 1 0 1 0 0
 51   1 1 0 0 1 1
 50   1 1 0 0 1 0
 49   1 1 0 0 0 1
 48   1 1 0 0 0 0
 47   1 0 1 1 1 1
 46   1 0 1 1 1 0
 45   1 0 1 1 0 1
 44   1 0 1 1 0 0
 43   1 0 1 0 1 1
 42   1 0 1 0 1 0
 41   1 0 1 0 0 1
 40   1 0 1 0 0 0
 39   1 0 0 1 1 1
 38   1 0 0 1 1 0
 37   1 0 0 1 0 1
 36   1 0 0 1 0 0
 35   1 0 0 0 1 1
 34   1 0 0 0 1 0
 33   1 0 0 0 0 1
 32   1 0 0 0 0 0
 31   0 1 1 1 1 1
 30   0 1 1 1 1 0
 29   0 1 1 1 0 1
 28   0 1 1 1 0 0
 27   0 1 1 0 1 1
 26   0 1 1 0 1 0
 25   0 1 1 0 0 1
 24   0 1 1 0 0 0
 23   0 1 0 1 1 1
 22   0 1 0 1 1 0
 21   0 1 0 1 0 1
 20   0 1 0 1 0 0
 19   0 1 0 0 1 1
 18   0 1 0 0 1 0
 17   0 1 0 0 0 1
 16   0 1 0 0 0 0
 15   0 0 1 1 1 1
 14   0 0 1 1 1 0
 13   0 0 1 1 0 1
 12   0 0 1 1 0 0
 11   0 0 1 0 1 1
 10   0 0 1 0 1 0
  9   0 0 1 0 0 1
  8   0 0 1 0 0 0
  7   0 0 0 1 1 1
  6   0 0 0 1 1 0
  5   0 0 0 1 0 1
  4   0 0 0 1 0 0
  3   0 0 0 0 1 1
  2   0 0 0 0 1 0
  1   0 0 0 0 0 1
  0   0 0 0 0 0 0

*/
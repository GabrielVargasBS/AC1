/*
 Exemplo_1305.v - v0.0. - 30 / 10 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

`include "FlipFlops.v"

/**
  Main
 */
module Exemplo_1305;
   wire q   [2:0];    // q
   wire qnot[2:0];    // qnot
   reg  t;            // t
   reg  clk;          // clock
   reg  preset;       // 0
   reg  clr;          // clear
   wire CLR;          // new clear
   wire count;        // para contagem
   integer x;         // decimal correspondente

   
   // instancias

   tff T_1 (q[0], qnot[0], qnot[1], qnot[1], preset, CLR);
   tff T_2 (q[1], qnot[1], qnot[2], qnot[2], preset, CLR);
   tff T_3 (q[2], qnot[2], clk    , clk    , preset, CLR);

   or  OR__1 (CLR, clr, count);
   and AND_1 (count, q[2], q[1], q[0]);

   // valores iniciais
   initial begin: start
      clk    = 1'b0;
      clr    = 1'b0;
      preset = 1'b0;
   end

   // parte principal
   initial begin: main
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Exemplo_1305");
       $display("\nContador módulo 7 \n");

       // monitoramento
       $display("[id]: a b c CLR count");
       $monitor(" %2d  %2b %b %b %2b %3b", 
                 x, q[0], q[1], q[2], CLR, count);

       // sinalizacao
       #5  clk = ~clk; clk = ~clk; x = 0;

       for (integer i = 0; i < 20; i=i+1)
        begin
            #5 clk = ~clk; clk = ~clk; x=x+1;
            if (x == 7)
                x = -1;
        end

   end
endmodule // Exemplo_1305

/*
gabriel@desktop-ubuntu:~/Desktop/CC-PUC/2periodo/ARQ1/Tarefas/Guia13$ vvp Exemplo_1305.vvp
Gabriel Vargas Bento de Souza - 778023
Exemplo_1305

Contador módulo 7 

[id]: a b c CLR count
  x   1 1 1   1   1
  0   1 1 1   1   1
  1   1 1 1   1   1
  2   1 1 1   1   1
  3   1 1 1   1   1
  4   1 1 1   1   1
  5   1 1 1   1   1
  6   1 1 1   1   1
 -1   1 1 1   1   1
  0   1 1 1   1   1
  1   1 1 1   1   1
  2   1 1 1   1   1
  3   1 1 1   1   1
  4   1 1 1   1   1
  5   1 1 1   1   1
  6   1 1 1   1   1
 -1   1 1 1   1   1
  0   1 1 1   1   1
  1   1 1 1   1   1
  2   1 1 1   1   1
  3   1 1 1   1   1
  4   1 1 1   1   1

// ERRO!

*/
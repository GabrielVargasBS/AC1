/*
 Exemplo_1405.v - v0.0. - 05 / 11 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

`include "FlipFlops.v"

/**
  Main
 */
module Exemplo_1405;
   wire q[5:0];           // q
   wire qnot[5:0];        // qnot
   reg  d[5:0];           // d (input)
   reg  clk;              // clock
   reg  preset;           // 1 (input)
   wire new_preset[5:0];  // preset
   reg  clr;              // clear
   
   // instancias
   and AND_1 (new_preset[5], preset, d[5]);
   and AND_2 (new_preset[4], preset, d[4]);
   and AND_3 (new_preset[3], preset, d[3]);
   and AND_4 (new_preset[2], preset, d[2]);
   and AND_5 (new_preset[1], preset, d[1]);
   and AND_6 (new_preset[0], preset, d[0]);

   dff DFF_1 (q[5], qnot[5], 1'b0, clk, new_preset[5], clr);
   dff DFF_2 (q[4], qnot[4], q[5], clk, new_preset[4], clr);
   dff DFF_3 (q[3], qnot[3], q[4], clk, new_preset[3], clr);
   dff DFF_4 (q[2], qnot[2], q[3], clk, new_preset[2], clr);
   dff DFF_5 (q[1], qnot[1], q[2], clk, new_preset[1], clr);
   dff DFF_6 (q[0], qnot[0], q[1], clk, new_preset[0], clr);

   
   // valores iniciais
   initial begin: start
      d[5] = 1'bx; d[4] = 1'bx; d[3] = 1'bx; 
      d[2] = 1'bx; d[1] = 1'bx; d[0] = 1'bx;

      clk     = 1'b0;
      preset  = 1'b0;
      clr     = 1'b0;
   end

   // parte principal
   initial begin: main
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Exemplo_1405");
       $display("\nParalel_In / Serial_Out - 6 bits\n");

       // monitoramento
       $display("  data   LD  a b c d e f");
       $monitor(" %b%b%b%b%b%b  %b   %b %b %b %b %b %b", 
                 d[5], d[4], d[3], d[2], d[1], d[0], preset,
                 q[5], q[4], q[3], q[2], q[1], q[0]);

       // sinalizacao
           clk = ~clk; clk = ~clk;
       #1  clk = ~clk; clk = ~clk; d[5] = 1'b1; d[4] = 1'b1; d[3] = 1'b0; 
           preset = 1'b1;          d[2] = 1'b0; d[1] = 1'b0; d[0] = 1'b1;
       
       #1  clk = ~clk; clk = ~clk; d[5] = 1'bx; d[4] = 1'bx; d[3] = 1'bx; 
           preset = 1'b0;          d[2] = 1'bx; d[1] = 1'bx; d[0] = 1'bx;

       #1  clk = ~clk; clk = ~clk; 
       #1  clk = ~clk; clk = ~clk; 
       #1  clk = ~clk; clk = ~clk; 
       #1  clk = ~clk; clk = ~clk; 
       #1  clk = ~clk; clk = ~clk; 
       #1  clk = ~clk; clk = ~clk; 
       #1  clk = ~clk; clk = ~clk; 

       #1  clk = ~clk; clk = ~clk; d[5] = 1'b1; d[4] = 1'b0; d[3] = 1'b1; 
           preset = 1'b1;          d[2] = 1'b1; d[1] = 1'b1; d[0] = 1'b1;
       
       #1  clk = ~clk; clk = ~clk; d[5] = 1'bx; d[4] = 1'bx; d[3] = 1'bx; 
           preset = 1'b0;          d[2] = 1'bx; d[1] = 1'bx; d[0] = 1'bx;

       #1  clk = ~clk; clk = ~clk; 
       #1  clk = ~clk; clk = ~clk; 
       #1  clk = ~clk; clk = ~clk; 
       #1  clk = ~clk; clk = ~clk; 
       #1  clk = ~clk; clk = ~clk; 
       #1  clk = ~clk; clk = ~clk; 
       #1  clk = ~clk; clk = ~clk; 
   end
endmodule // Exemplo_1405

/*
gabriel@desktop-ubuntu:~/Desktop/CC-PUC/2periodo/ARQ1/Tarefas/Guia14$ vvp Exemplo_1405.vvp
Gabriel Vargas Bento de Souza - 778023
Exemplo_1405

Paralel_In / Serial_Out - 6 bits

  data   LD  a b c d e f
 xxxxxx  0   0 0 0 0 0 0
 110001  1   0 0 0 0 0 0
 xxxxxx  0   1 1 0 0 0 1
 xxxxxx  0   0 1 1 0 0 0
 xxxxxx  0   0 0 1 1 0 0
 xxxxxx  0   0 0 0 1 1 0
 xxxxxx  0   0 0 0 0 1 1
 xxxxxx  0   0 0 0 0 0 1
 xxxxxx  0   0 0 0 0 0 0
 101111  1   0 0 0 0 0 0
 xxxxxx  0   1 0 1 1 1 1
 xxxxxx  0   0 1 0 1 1 1
 xxxxxx  0   0 0 1 0 1 1
 xxxxxx  0   0 0 0 1 0 1
 xxxxxx  0   0 0 0 0 1 0
 xxxxxx  0   0 0 0 0 0 1
 xxxxxx  0   0 0 0 0 0 0


*/
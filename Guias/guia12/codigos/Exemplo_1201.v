/*
 Exemplo_1201.v - v0.0. - 27 / 11 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

`include "MemoriasRAM.v"

/**
  Main
 */
module Exemplo_1201;
   reg in [3:0];     // input
   wire out[3:0];     // output
   reg  clk;          // clock
   reg  rw;           // r/w
   reg  addr;         // address
   reg  clr;          // clear
   
   // instancias
   RAM_1x4 MEM_01 (out[0], out[1], out[2], out[3], 
                   clk,    rw,     addr,   clr, 
                   in[0],  in[1],  in[2],  in[3]);

   // valores iniciais
   initial begin: start
      clr  = 1'b0;
      clk  = 1'b0;
      addr = 1'b0;
      rw   = 1'b0; 
   end

   // parte principal
   initial begin: main
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Exemplo_1201");
       $display("\nMemoria RAM 1x4\n");

       $display("rw == 0 -> write");
       $display("rw == 1 -> read\n");

       // monitoramento
       $display(" input    r/w   addr   output ");
       $monitor(" %b%b%b%b  %5b   %4b   %3b%b%b%b", 
                 in[3], in[2], in[1], in[0], rw, addr, 
                 out[3], out[2], out[1], out[0]);

       // sinalizacao
           clr = ~clr; clr = ~clr;
        #1 in[3] = 1'b0; in[2] = 1'b1; in[1] = 1'b1; in[0] = 1'b1;  // 0111
           rw = 1'b1; addr = 1'b1; clk = ~clk; clk = ~clk;

        #1 in[3] = 1'b0; in[2] = 1'b1; in[1] = 1'b1; in[0] = 1'b1;  // 0111
           rw = 1'b1; addr = 1'b1; clk = ~clk; clk = ~clk;
           
        #1 in[3] = 1'b0; in[2] = 1'b0; in[1] = 1'b0; in[0] = 1'b0;
           rw = 1'b0; addr = 1'b0;       
   end
endmodule // Exemplo_1201

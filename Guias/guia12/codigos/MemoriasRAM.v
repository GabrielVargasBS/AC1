/*
 MemoriasRAM.v - v0.0. - 27 / 11 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

`include "FlipFlops.v"

/**
 * RAM_1x2
 */
module RAM_1x2 ( output q0,   output q1, 
                 input clk,   input rw,    input addr,
                 input data0, input data1, input clr );
   
   wire q_0, qnot_0, q_1, qnot_1;
   wire clock;
   wire not_rw;

   and AND__ (clock, clk, rw, addr);

   jkff JK_0 (q_0, qnot_0, data0, data0, clock, 1'b0, clr);
   jkff JK_1 (q_1, qnot_1, data1, data1, clock, 1'b0, clr);
   
   not NOT_0 (not_rw, rw);

   and AND_0 (q0, q_0, not_rw, addr);
   and AND_1 (q1, q_1, not_rw, addr);

endmodule // RAM_1x2

/**
 * RAM_1x4
 */
module RAM_1x4 ( output q0,   output q1,   output q2,   output q3, 
                 input clk,   input rw,    input addr,  input clr,
                 input data0, input data1, input data2, input data3 );
   
   wire q_0, qnot_0, q_1, qnot_1, q_2, qnot_2, q_3, qnot_3;
   wire clock;
   wire not_rw;

   and AND__ (clock, clk, rw, addr);

   jkff JK_0 (q_0, qnot_0, data0, data0, clock, 1'b0, clr);
   jkff JK_1 (q_1, qnot_1, data1, data1, clock, 1'b0, clr);
   jkff JK_2 (q_2, qnot_2, data2, data2, clock, 1'b0, clr);
   jkff JK_3 (q_3, qnot_3, data3, data3, clock, 1'b0, clr);

   not NOT_0 (not_rw, rw);

   and AND_0 (q0, q_0, not_rw, addr);
   and AND_1 (q1, q_1, not_rw, addr);
   and AND_2 (q2, q_2, not_rw, addr);
   and AND_3 (q3, q_3, not_rw, addr);

endmodule // RAM_1x4
/*
 * Exemplo_0705 - GATES
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
*/

// -------------------------
// f7_gates
// -------------------------
module f7_1 (output s1,
             input  a , 
             input  b);
   
   // descrever por portas
   not NOT1 (s1, a);

endmodule // f7_1

module f7_2 (output s1,
             input  a , 
             input  b);
   
   // descrever por portas
   and AND1 (s1, a, b);

endmodule // f7_2

module f7_3 (output s1,
             input  a , 
             input  b);
   
   // descrever por portas
   nand NAND1 (s1, a, b);

endmodule // f7_3

module f7_4 (output s1,
             input  a , 
             input  b);
   
   // descrever por portas
   xor XOR1 (s1, a, b);

endmodule // f7_4

module f7_5 (output s2,
            input  a , 
            input  b);
   
   // descrever por portas
   xnor XNOR1 (s2, a, b);

endmodule // f7_5

module f7_6 (output s3,
             input  a , 
             input  b);
   
   // descrever por portas
   or OR1 (s3, a, b);

endmodule // f7_6

module f7_7 (output s4,
            input  a , 
            input  b);
   
   // descrever por portas
   nor NOR1 (s4, a, b);

endmodule // f7_7

module f7_8 (output s1,
             input  a , 
             input  b);
   
   // descrever por portas
   not NOT1 (s1, b);

endmodule // f7_8

// -------------------------
// multiplexer
// -------------------------
module mux (output s,
            input  a, b, c, d, e, f, g, h,
            input  c1, c2, c3);

   // definir dados locais
   wire not_c1, not_c2, not_c3;
   wire sa, sb, sc, sd, se, sf, sg, sh;

   // descrever por portas
   not NOT1 (not_c1, c1);
   not NOT2 (not_c2, c2);
   not NOT3 (not_c3, c3);
   
   and AND1 (sa, a, not_c1, not_c2, not_c3);   // 000
   and AND2 (sb, b,     c1, not_c2, not_c3);   // 100
   and AND3 (sc, c, not_c1,     c2, not_c3);   // 010
   and AND4 (sd, d,     c1,     c2, not_c3);   // 110

   and AND5 (se, e, not_c1, not_c2,     c3);   // 001
   and AND6 (sf, f,     c1, not_c2,     c3);   // 101
   and AND7 (sg, g, not_c1,     c2,     c3);   // 011
   and AND8 (sh, h,     c1,     c2,     c3);   // 111

   or  OR1  (s, sa, sb, sc, sd, se, sf, sg, sh);
endmodule // mux

// -------------------------
// main
// -------------------------
module test_f7;
   
   // definir dados
   reg  c1, c2, c3, x, y;
   wire s1, s2, s3, s4, s5, s6, s7, s8, s;

   f7_1 gate1 (s1, x, y);
   f7_2 gate2 (s2, x, y);
   f7_3 gate3 (s3, x, y);
   f7_4 gate4 (s4, x, y);
   f7_5 gate5 (s5, x, y);
   f7_6 gate6 (s6, x, y);
   f7_7 gate7 (s7, x, y);
   f7_8 gate8 (s8, x, y);

   mux MUX    (s, s1, s2, s3, s4, s5, s6, s7, s8, c1, c2, c3);
   
   // parte principal
   initial
   begin : main
      $display("\n Exemplo_0705 - Gabriel Vargas Bento de Souza - 778023\n");
      // $display(" LU's module\n");
      $display(" x  y  s1  s2  s3  s4  s5  s6  s7  s8  c1  c2  c3  s");
      $display(" ------**------------------------------------------- 000 - NOT(x)");
      $monitor("%2b %2b %2b %3b %3b %3b %3b %3b %3b %3b %3b %3b %3b %3b", 
                x,  y,  s1, s2, s3, s4, s5, s6, s7, s8, c1, c2, c3, s);

      // projetar testes do modulo
         x = 1'b0; y = 1'b0; c1 = 1'b0; c2 = 1'b0; c3 = 1'b0;
      #1           y = 1'b1;
      #1 x = 1'b1; y = 1'b0;
      #1           y = 1'b1;
      #1 x = 1'b0; y = 1'b0;                       c3 = 1'b1;

      $display("\n x  y  s1  s2  s3  s4  s5  s6  s7  s8  c1  c2  c3  s");
      $display  (" ----------------------**--------------------------- 001 - XNOR");
      #1           y = 1'b1;
      #1 x = 1'b1; y = 1'b0;
      #1           y = 1'b1;
      #1 x = 1'b0; y = 1'b0;            c2 = 1'b1; c3 = 1'b0;

      $display("\n x  y  s1  s2  s3  s4  s5  s6  s7  s8  c1  c2  c3  s");
      $display  (" --------------**----------------------------------- 010 - NAND");
      #1           y = 1'b1;
      #1 x = 1'b1; y = 1'b0;
      #1           y = 1'b1;
      #1 x = 1'b0; y = 1'b0;                       c3 = 1'b1;

      $display("\n x  y  s1  s2  s3  s4  s5  s6  s7  s8  c1  c2  c3  s");
      $display  (" ------------------------------**------------------- 011 - NOR");
      #1           y = 1'b1;
      #1 x = 1'b1; y = 1'b0;
      #1           y = 1'b1;
      #1 x = 1'b0; y = 1'b0; c1 = 1'b1; c2 = 1'b0; c3 = 1'b0;

      $display("\n x  y  s1  s2  s3  s4  s5  s6  s7  s8  c1  c2  c3  s");
      $display  (" ----------**--------------------------------------- 100 - AND");
      #1           y = 1'b1;
      #1 x = 1'b1; y = 1'b0;
      #1           y = 1'b1;
      #1 x = 1'b0; y = 1'b0;                       c3 = 1'b1;

      $display("\n x  y  s1  s2  s3  s4  s5  s6  s7  s8  c1  c2  c3  s");
      $display  (" --------------------------**----------------------- 101 - OR");
      #1           y = 1'b1;
      #1 x = 1'b1; y = 1'b0;
      #1           y = 1'b1;
      #1 x = 1'b0; y = 1'b0;            c2 = 1'b1; c3 = 1'b0;

      $display("\n x  y  s1  s2  s3  s4  s5  s6  s7  s8  c1  c2  c3  s");
      $display  (" ------------------**------------------------------- 110 - XOR");
      #1           y = 1'b1;
      #1 x = 1'b1; y = 1'b0;
      #1           y = 1'b1;
      #1 x = 1'b0; y = 1'b0;                       c3 = 1'b1;

      $display("\n x  y  s1  s2  s3  s4  s5  s6  s7  s8  c1  c2  c3  s");
      $display  (" ----------------------------------**--------------- 111 - NOT(y)");
      #1           y = 1'b1;
      #1 x = 1'b1; y = 1'b0;
      #1           y = 1'b1;
   end
endmodule // test_f7

// -------------------------
// test
// -------------------------
/*
---------- previsao ----------
               c1 c2 c3

s1 = NOTx ----- 0  0  0 |
                        |
s2 =  AND ----- 1  0  0 |
                        |
s3 = NAND ----- 0  1  0 |
                        |
s4 = X OR ----- 1  1  0 |
                        |  ----> s
s5 = XNOR ----- 0  0  1 |
                        |
s6 =   OR ----- 1  0  1 |
                        |
s7 =  NOR ----- 0  1  1 |
                        |
s8 = NOTy ----- 1  1  1 |

c1c2c3 ==  0: porta NOTx (1100)
c1c2c3 ==  1: porta   OR (0111)
c1c2c3 == 10: porta XNOR (1001)
cac2c3 == 11: porta  NOR (1000)

---------- execucao ----------

C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia07>vvp Exemplo_0705.vvp

 Exemplo_0705 - Gabriel Vargas Bento de Souza - 778023

 x  y  s1  s2  s3  s4  s5  s6  s7  s8  c1  c2  c3  s
 ------**------------------------------------------- 000 - NOT(x)
 0  0  1   0   1   0   1   0   1   1   0   0   0   1
 0  1  1   0   1   1   0   1   0   0   0   0   0   1
 1  0  0   0   1   1   0   1   0   1   0   0   0   0
 1  1  0   1   0   0   1   1   0   0   0   0   0   0

 x  y  s1  s2  s3  s4  s5  s6  s7  s8  c1  c2  c3  s
 ----------------------**--------------------------- 001 - XNOR
 0  0  1   0   1   0   1   0   1   1   0   0   1   1
 0  1  1   0   1   1   0   1   0   0   0   0   1   0
 1  0  0   0   1   1   0   1   0   1   0   0   1   0
 1  1  0   1   0   0   1   1   0   0   0   0   1   1

 x  y  s1  s2  s3  s4  s5  s6  s7  s8  c1  c2  c3  s
 --------------**----------------------------------- 010 - NAND
 0  0  1   0   1   0   1   0   1   1   0   1   0   1
 0  1  1   0   1   1   0   1   0   0   0   1   0   1
 1  0  0   0   1   1   0   1   0   1   0   1   0   1
 1  1  0   1   0   0   1   1   0   0   0   1   0   0

 x  y  s1  s2  s3  s4  s5  s6  s7  s8  c1  c2  c3  s
 ------------------------------**------------------- 011 - NOR
 0  0  1   0   1   0   1   0   1   1   0   1   1   1
 0  1  1   0   1   1   0   1   0   0   0   1   1   0
 1  0  0   0   1   1   0   1   0   1   0   1   1   0
 1  1  0   1   0   0   1   1   0   0   0   1   1   0

 x  y  s1  s2  s3  s4  s5  s6  s7  s8  c1  c2  c3  s
 ----------**--------------------------------------- 100 - AND
 0  0  1   0   1   0   1   0   1   1   1   0   0   0
 0  1  1   0   1   1   0   1   0   0   1   0   0   0
 1  0  0   0   1   1   0   1   0   1   1   0   0   0
 1  1  0   1   0   0   1   1   0   0   1   0   0   1

 x  y  s1  s2  s3  s4  s5  s6  s7  s8  c1  c2  c3  s
 --------------------------**----------------------- 101 - OR
 0  0  1   0   1   0   1   0   1   1   1   0   1   0
 0  1  1   0   1   1   0   1   0   0   1   0   1   1
 1  0  0   0   1   1   0   1   0   1   1   0   1   1
 1  1  0   1   0   0   1   1   0   0   1   0   1   1

 x  y  s1  s2  s3  s4  s5  s6  s7  s8  c1  c2  c3  s
 ------------------**------------------------------- 110 - XOR
 0  0  1   0   1   0   1   0   1   1   1   1   0   0
 0  1  1   0   1   1   0   1   0   0   1   1   0   1
 1  0  0   0   1   1   0   1   0   1   1   1   0   1
 1  1  0   1   0   0   1   1   0   0   1   1   0   0

 x  y  s1  s2  s3  s4  s5  s6  s7  s8  c1  c2  c3  s
 ----------------------------------**--------------- 111 - NOT(y)
 0  0  1   0   1   0   1   0   1   1   1   1   1   1
 0  1  1   0   1   1   0   1   0   0   1   1   1   0
 1  0  0   0   1   1   0   1   0   1   1   1   1   1
 1  1  0   1   0   0   1   1   0   0   1   1   1   0
*/
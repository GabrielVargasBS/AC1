/*
 * Exemplo_0704 - GATES
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
   xor XOR1 (s1, a, b);

endmodule // f7_1

module f7_2 (output s2,
            input  a , 
            input  b);
   
   // descrever por portas
   xnor XNOR1 (s2, a, b);

endmodule // f7_2

module f7_3 (output s3,
             input  a , 
             input  b);
   
   // descrever por portas
   or OR1 (s3, a, b);

endmodule // f7_3

module f7_4 (output s4,
            input  a , 
            input  b);
   
   // descrever por portas
   nor NOR1 (s4, a, b);

endmodule // f7_4

// -------------------------
// multiplexer
// -------------------------
module mux (output s,
            input  a, b, c, d, 
            input  c1, c2);

   // definir dados locais
   wire not_c1, not_c2;
   wire sa, sb, sc, sd;

   // descrever por portas
   not NOT1 (not_c1, c1);
   not NOT2 (not_c2, c2);
   
   and AND1 (sa, a, not_c1, not_c2);   // 00
   and AND2 (sc, b,     c1, not_c2);   // 10
   and AND3 (sb, c, not_c1,     c2);   // 01
   and AND4 (sd, d,     c1,     c2);   // 11

   or  OR1  (s, sa, sb, sc, sd);
endmodule // mux

// -------------------------
// main
// -------------------------
module test_f7;
   
   // definir dados
   reg  c1, c2, x, y;
   wire s1, s2, s3, s4, s;

   f7_1 gate1 (s1, x, y);
   f7_2 gate2 (s2, x, y);
   f7_3 gate3 (s3, x, y);
   f7_4 gate4 (s4, x, y);

   mux MUX    (s, s1, s2, s3, s4, c1, c2);
   
   // parte principal
   initial
   begin : main
      $display("\n Exemplo_0704 - Gabriel Vargas Bento de Souza - 778023\n");
      // $display(" LU's module\n");
      $display(" x  y  s1  s2  s3  s4  c1  c2  s");
      $display(" ------**----------------------- 00 - XOR");
      $monitor("%2b %2b %2b %3b %3b %3b %3b %3b %3b", x, y, s1, s2, s3, s4, c1, c2, s);

      // projetar testes do modulo
         x = 1'b0; y = 1'b0; c1 = 1'b0; c2 = 1'b0;
      #1           y = 1'b1;
      #1 x = 1'b1; y = 1'b0;
      #1           y = 1'b1;
      #1 x = 1'b0; y = 1'b0;            c2 = 1'b1;

      $display("\n x  y  s1  s2  s3  s4  c1  c2  s");
      $display  (" --------------**--------------- 01 - XNOR");
      #1           y = 1'b1;
      #1 x = 1'b1; y = 1'b0;
      #1           y = 1'b1;
      #1 x = 1'b0; y = 1'b0; c1 = 1'b1; c2 = 1'b0;

      $display("\n x  y  s1  s2  s3  s4  c1  c2  s");
      $display  (" ----------**------------------- 10 - OR");
      #1           y = 1'b1;
      #1 x = 1'b1; y = 1'b0;
      #1           y = 1'b1;
      #1 x = 1'b0; y = 1'b0;            c2 = 1'b1;

      $display("\n x  y  s1  s2  s3  s4  c1  c2  s");
      $display  (" ------------------**----------- 11 - NOR");
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
               c1 c2

s1 =  XOR ----- 0  0 |
                     |
s2 = XNOR ----- 1  0 |
                     | ---> s
s3 =  OR ----- 0   1 |                  
                     |
s4 = NOR ----- 1   1 |

c1c2 ==  0: porta  XOR (0110)
c1c2 ==  1: porta   OR (0111)
c1c2 == 10: porta XNOR (1001)
cac2 == 11: porta  NOR (1000)

---------- execucao ----------

C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia07>vvp Exemplo_0704.vvp

 Exemplo_0704 - Gabriel Vargas Bento de Souza - 778023

 x  y  s1  s2  s3  s4  c1  c2  s
 ------**----------------------- 00 - XOR
 0  0  0   1   0   1   0   0   0
 0  1  1   0   1   0   0   0   1
 1  0  1   0   1   0   0   0   1
 1  1  0   1   1   0   0   0   0

 x  y  s1  s2  s3  s4  c1  c2  s
 --------------**--------------- 01 - XNOR
 0  0  0   1   0   1   0   1   0
 0  1  1   0   1   0   0   1   1
 1  0  1   0   1   0   0   1   1
 1  1  0   1   1   0   0   1   1

 x  y  s1  s2  s3  s4  c1  c2  s
 ----------**------------------- 10 - OR
 0  0  0   1   0   1   1   0   1
 0  1  1   0   1   0   1   0   0
 1  0  1   0   1   0   1   0   0
 1  1  0   1   1   0   1   0   1

 x  y  s1  s2  s3  s4  c1  c2  s
 ------------------**----------- 11 - NOR
 0  0  0   1   0   1   1   1   1
 0  1  1   0   1   0   1   1   0
 1  0  1   0   1   0   1   1   0
 1  1  0   1   1   0   1   1   0
*/
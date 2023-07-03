/*
 * Exemplo_0702 - GATES
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
   or OR1 (s1, a, b);

endmodule // f7_1

module f7_2 (output s2,
            input  a , 
            input  b);
   
   // descrever por portas
   nor NOR1 (s2, a, b);

endmodule // f7_2

// -------------------------
// multiplexer
// -------------------------
module mux (output s,
            input  a,
            input  b,
            input  select);

   // definir dados locais
   wire not_select;
   wire sa, sb;

   // descrever por portas
   not NOT1 (not_select, select);
   
   and AND1 (sa, a, not_select);
   and AND2 (sb, b, select);

   or  OR1  (s, sa, sb);
endmodule // mux

// -------------------------
// main
// -------------------------
module test_f7;
   
   // definir dados
   reg  c, x, y;
   wire s1, s2, s;

   f7_1 gate1 (s1, x, y);
   f7_2 gate2 (s2, x, y);
   mux MUX1   (s, s1, s2, c);
   
   // parte principal
   initial
   begin : main
      $display("\n Exemplo_0702 - Gabriel Vargas Bento de Souza - 778023\n");
      // $display(" LU's module\n");
      $display(" x  y  s1  s2  c  s");
      $display(" ------**---------- 0 - OR");
      $monitor("%2b %2b %2b %3b %3b %2b", x, y, s1, s2, c, s);

      // projetar testes do modulo
         x = 1'b0; y = 1'b0; c = 1'b0;
      #1           y = 1'b1;
      #1 x = 1'b1; y = 1'b0;
      #1           y = 1'b1;
      #1 x = 1'b0; y = 1'b0; c = 1'b1;

      $display("\n x  y  s1  s2  c  s");
      $display  (" ----------**------ 1 - NOR");

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

c == 0: porta  OR (0111)
c == 1: porta NOR (1000)

---------- execucao ----------

C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia07>vvp Exemplo_0702.vvp

 Exemplo_0702 - Gabriel Vargas Bento de Souza - 778023

 x  y  s1  s2  c  s
 ------**---------- 0 - OR
 0  0  0   1   0  0
 0  1  1   0   0  1
 1  0  1   0   0  1
 1  1  1   0   0  1

 x  y  s1  s2  c  s
 ----------**------ 1 - NOR
 0  0  0   1   1  1
 0  1  1   0   1  0
 1  0  1   0   1  0
 1  1  1   0   1  0
*/
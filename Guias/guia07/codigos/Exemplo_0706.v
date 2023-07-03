/*
 * Exemplo_0706 - GATES
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
*/

// -------------------------
// f7_gates
// -------------------------
module isEquals (output s1,
                 input  a, b,     // input x[1], x[0]
                 input  c, d);    // input y[1], y[0]
   
   // variaveis auxiliares
   wire tmp0, tmp1;

   // descrever por portas
   xnor XNOR1 (tmp0, a, c);
   xnor XNOR2 (tmp1, b, d);

   and  AND1  (s1, tmp0, tmp1);

endmodule // isEquals

module isDiferent (output s1,
                   input  a, b,     // input x[1], x[0]
                   input  c, d);    // input y[1], y[0]
   
   // variaveis auxiliares
   wire tmp0, tmp1;

   // descrever por portas
   xor XOR1 (tmp0, a, c);
   xor XOR2 (tmp1, b, d);

   or  OR1  (s1, tmp0, tmp1);

endmodule // isDiferent

// -------------------------
// multiplexer
// -------------------------
module mux (output s,
            input  a, b, c1);

   // definir dados locais
   wire not_c1;
   wire sa, sb;

   // descrever por portas
   not NOT1 (not_c1, c1);
   
   and AND1 (sa, a, not_c1);   // 0
   and AND2 (sb, b,     c1);   // 1

   or  OR1  (s, sa, sb);
endmodule // mux

// -------------------------
// main
// -------------------------
module test_f7;
   
   // definir dados
   reg  c;
   reg  [1:0] x;
   reg  [1:0] y;
   wire s1, s2, s;

   isEquals   EQU1 (s1, x[1], x[0], y[1], y[0]);
   isDiferent DIF1 (s2, x[1], x[0], y[1], y[0]);

   mux        MUX   (s, s1, s2, c);
   
   // parte principal
   initial
   begin : main
      $display("\n Exemplo_0706 - Gabriel Vargas Bento de Souza - 778023\n");
      $display(" x   y   s1  s2  c  s");
      $display(" --------**------------ 0 - igual");
      $monitor("%3b %3b %2b %3b %3b %2b", 
                x,  y,  s1, s2, c, s);

      // projetar testes do modulo
         x[1] = 1'b0; x[0] = 1'b0; y[1] = 1'b0; y[0] = 1'b0; c = 1'b0;
      #1                                        y[0] = 1'b1;
      #1                           y[1] = 1'b1; y[0] = 1'b0;
      #1                                        y[0] = 1'b1;
      #1              x[0] = 1'b1; y[1] = 1'b0; y[0] = 1'b0;
      #1                                        y[0] = 1'b1;
      #1                           y[1] = 1'b1; y[0] = 1'b0;
      #1                                        y[0] = 1'b1;
      #1 x[1] = 1'b1; x[0] = 1'b0; y[1] = 1'b0; y[0] = 1'b0;
      #1                                        y[0] = 1'b1;
      #1                           y[1] = 1'b1; y[0] = 1'b0;
      #1                                        y[0] = 1'b1;
      #1              x[0] = 1'b1; y[1] = 1'b0; y[0] = 1'b0;
      #1                                        y[0] = 1'b1;
      #1                           y[1] = 1'b1; y[0] = 1'b0;
      #1                                        y[0] = 1'b1;
      #1 x[1] = 1'b0; x[0] = 1'b0; y[1] = 1'b0; y[0] = 1'b0; c = 1'b1;

      $display("\n x   y   s1  s2  c  s");
      $display(" ------------**-------- 1 - diferente");
      #1                                        y[0] = 1'b1;
      #1                           y[1] = 1'b1; y[0] = 1'b0;
      #1                                        y[0] = 1'b1;
      #1              x[0] = 1'b1; y[1] = 1'b0; y[0] = 1'b0;
      #1                                        y[0] = 1'b1;
      #1                           y[1] = 1'b1; y[0] = 1'b0;
      #1                                        y[0] = 1'b1;
      #1 x[1] = 1'b1; x[0] = 1'b0; y[1] = 1'b0; y[0] = 1'b0;
      #1                                        y[0] = 1'b1;
      #1                           y[1] = 1'b1; y[0] = 1'b0;
      #1                                        y[0] = 1'b1;
      #1              x[0] = 1'b1; y[1] = 1'b0; y[0] = 1'b0;
      #1                                        y[0] = 1'b1;
      #1                           y[1] = 1'b1; y[0] = 1'b0;
      #1                                        y[0] = 1'b1;

   end
endmodule // test_f7

// -------------------------
// test
// -------------------------
/*
---------- previsao ----------

x[1]   x[0]   y[1]   y[0]    =      !=

 0      0      0      0      1      0  
 0      0      0      1      0      1  
 0      0      1      0      0      1  
 0      0      1      1      0      1  

 0      1      0      0      0      1  
 0      1      0      1      1      0  
 0      1      1      0      0      1  
 0      1      1      1      0      1  

 1      0      0      0      0      1  
 1      0      0      1      0      1  
 1      0      1      0      1      0  
 1      0      1      1      0      1  

 1      1      0      0      0      1  
 1      1      0      1      0      1  
 1      1      1      0      0      1  
 1      1      1      1      1      0  

---------- execucao ----------

C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia07>vvp Exemplo_0706.vvp

 Exemplo_0706 - Gabriel Vargas Bento de Souza - 778023

 x   y   s1  s2  c  s
 --------**------------ 0 - igual
 00  00  1   0   0  1
 00  01  0   1   0  0
 00  10  0   1   0  0
 00  11  0   1   0  0
 01  00  0   1   0  0
 01  01  1   0   0  1
 01  10  0   1   0  0
 01  11  0   1   0  0
 10  00  0   1   0  0
 10  01  0   1   0  0
 10  10  1   0   0  1
 10  11  0   1   0  0
 11  00  0   1   0  0
 11  01  0   1   0  0
 11  10  0   1   0  0
 11  11  1   0   0  1

 x   y   s1  s2  c  s
 ------------**-------- 1 - diferente
 00  00  1   0   1  0
 00  01  0   1   1  1
 00  10  0   1   1  1
 00  11  0   1   1  1
 01  00  0   1   1  1
 01  01  1   0   1  0
 01  10  0   1   1  1
 01  11  0   1   1  1
 10  00  0   1   1  1
 10  01  0   1   1  1
 10  10  1   0   1  0
 10  11  0   1   1  1
 11  00  0   1   1  1
 11  01  0   1   1  1
 11  10  0   1   1  1
 11  11  1   0   1  0
*/
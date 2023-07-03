/*
 * Exemplo_0705 - GATES
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
*/

// -------------------------
// f7_gates
// -------------------------
module isMoreThan (output s1,
                   input  a, b, 
                   input  c, d);
   
   // a.c' +b.c'.d' + a.b.d'
   assign s1 = ( a &       ~c )
             | (       b & ~c & ~d )
             | ( a &  b &       ~d );

endmodule // isMoreThan


module isLessThan (output s1,
                   input  a, b, 
                   input  c, d);
   
   // descrever por portas
   assign s1 = (~a &        c )
             | (      ~b &  c &  d )
             | (~a & ~b &        d );

endmodule // isLessThan

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

   isLessThan LESS1 (s1, x[1], x[0], y[1], y[0]);
   isMoreThan MORE1 (s2, x[1], x[0], y[1], y[0]);

   mux        MUX   (s, s1, s2, c);
   
   // parte principal
   initial
   begin : main
      $display("\n Exemplo_0707 - Gabriel Vargas Bento de Souza - 778023\n");
      $display(" x   y   s1  s2  c  s");
      $display(" --------**------------ 0 -menor");
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
      $display(" ------------**-------- 1 - maior");
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
     a      b      c      d
m   x[1]   x[0]   y[1]   y[0]    >      <
                                      
0   0      0      0      0      0      0 
1   0      0      0      1      0      1  
2   0      0      1      0      0      1  
3   0      0      1      1      0      1  

4   0      1      0      0      1      0  
5   0      1      0      1      0      0  
6   0      1      1      0      0      1  
7   0      1      1      1      0      1  

8   1      0      0      0      1      0  
9   1      0      0      1      1      0  
10  1      0      1      0      0      0  
11  1      0      1      1      0      1  

12  1      1      0      0      1      0  
13  1      1      0      1      1      0  
14  1      1      1      0      1      0  
15  1      1      1      1      0      0

isMoreThan(x,y){}

SoP(4, 8, 9, 12, 13, 14)

                                           |
                              E            |            F
           ab\cd  |     c'    |     c'     |     c      |     c       
                  |     00    |     01     |     11     |     10      
__________________|___________|____________|____________|__________________
      a'   00     |   - (0)   |    - (1)   |    - (3)   |    - (2)    b' D
  A --------------|-----------|------------|------------|------------------
      a'   01     |   1 (4)   |    - (5)   |    - (7)   |    - (6)    b 
__________________|___________|____________|____________|_____________   C  
      a    11     |   1 (12)  |    1 (13)  |    - (15)  |    1 (14)   b
  B --------------|-----------|------------|------------|------------------
      a    10     |   1 (8)   |    1 (9)   |    - (11)  |    - (10)   b' D
__________________|___________|____________|____________|_________________
                       d'     |     d            d      |      d'
                              |                         |
                              |                         |
                       H                   G                   H

Com ( 8, 9,12,13) = a.c'
Com ( 4,12)       = b .c'.d'
Com (12,14)       = a. b .d'

a.c' +b.c'.d' + a.b.d'



isLessThan(x,y){}

SoP(1, 2, 3, 6, 7, 11)

                                           |
                              E            |            F
           ab\cd  |     c'    |     c'     |     c      |     c       
                  |     00    |     01     |     11     |     10      
__________________|___________|____________|____________|__________________
      a'   00     |   - (0)   |    1 (1)   |    1 (3)   |    1 (2)    b' D
  A --------------|-----------|------------|------------|------------------
      a'   01     |   - (4)   |    - (5)   |    1 (7)   |    1 (6)    b 
__________________|___________|____________|____________|_____________   C  
      a    11     |   - (12)  |    - (13)  |    - (15)  |    - (14)   b
  B --------------|-----------|------------|------------|------------------
      a    10     |   - (8)   |    - (9)   |    1 (11)  |    - (10)   b' D
__________________|___________|____________|____________|_________________
                       d'     |     d            d      |      d'
                              |                         |
                              |                         |
                       H                   G                   H

Com ( 2, 3, 6, 7) = a'.c
Com ( 1, 3)       = a'.b'.d
Com ( 3,11)       = b'.c.d

a'.c + a'.b'.d + b'.c.d

---------- execucao ----------

C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia07>vvp Exemplo_0707.vvp

 Exemplo_0707 - Gabriel Vargas Bento de Souza - 778023

 x   y   s1  s2  c  s
 --------**------------ 0 -menor
 00  00  0   0   0  0
 00  01  1   0   0  1
 00  10  1   0   0  1
 00  11  1   0   0  1
 01  00  0   1   0  0
 01  01  0   0   0  0
 01  10  1   0   0  1
 01  11  1   0   0  1
 10  00  0   1   0  0
 10  01  0   1   0  0
 10  10  0   0   0  0
 10  11  1   0   0  1
 11  00  0   1   0  0
 11  01  0   1   0  0
 11  10  0   1   0  0
 11  11  0   0   0  0

 x   y   s1  s2  c  s
 ------------**-------- 1 - maior
 00  00  0   0   1  0
 00  01  1   0   1  0
 00  10  1   0   1  0
 00  11  1   0   1  0
 01  00  0   1   1  1
 01  01  0   0   1  0
 01  10  1   0   1  0
 01  11  1   0   1  0
 10  00  0   1   1  1
 10  01  0   1   1  1
 10  10  0   0   1  0
 10  11  1   0   1  0
 11  00  0   1   1  1
 11  01  0   1   1  1
 11  10  0   1   1  1
 11  11  0   0   1  0
*/
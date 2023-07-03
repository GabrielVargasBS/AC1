/*
 Recuperacao_0101c.v - v0.0. - 30 / 10 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
 Soma dos produtos
               ___
f(a,b,c,d) =  \   m (0,1,5,6,8,9,C,E)  = SoP(0,1,5,6,8,9,C,E)
              /___
*/

/**
 SoP(0,1,5,6,8,9,C,E)
 Simplificacao: (b'.c') + (b. c .d') + (a'.c'.d ) + (a .c'.d')
 */
module SoP (output s,
            input  a, b, c, d);
   assign s = (~b & ~c)            // 0, 1, 8, 9
            | ( b &  c & ~d)       // 6, E
            | (~a & ~c &  d)       // 1, 5
            | ( a & ~c & ~d);      // 8, C
endmodule // SoP

/**
  Recuperacao_0101c.v
 */
module Recuperacao_0101c;
   reg  a, b, c, d;
   reg[7:0] m;
   wire s;
   
   // instancias
   SoP SOP1 (s, a, b, c, d);
   
   // valores iniciais
   initial begin: start
      a=1'bx; b=1'bx; c=1'bx; d=1'bx;                      
   end

   // parte principal
   initial begin: main
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Recuperacao_01");
       $display("\n01.c) SoP (0,1,5,6,8,9,C,E)\n");

       // monitoramento
       $display(" m  a  b  c  d  s");
       $monitor("%2c %2b %2b %2b %2b %2b", m, a,  b,  c,  d, s);

       // sinalizacao
          a=0; b=0; c=0; d=0; m="0";
       #1                d=1; m="1";
       #1           c=1; d=0; m="2";
       #1                d=1; m="3";
       #1      b=1; c=0; d=0; m="4";
       #1                d=1; m="5";
       #1           c=1; d=0; m="6";
       #1                d=1; m="7";
       #1 a=1; b=0; c=0; d=0; m="8";
       #1                d=1; m="9";
       #1           c=1; d=0; m="A";
       #1                d=1; m="B";
       #1      b=1; c=0; d=0; m="C";
       #1                d=1; m="D";
       #1           c=1; d=0; m="E";
       #1                d=1; m="F";
   end
endmodule // Recuperacao_0101c

/*
gabriel@desktop-ubuntu:~/Desktop/CC-PUC/2periodo/ARQ1/Tarefas/Recuperacao01$ vvp Recuperacao_0101c.vvp
Gabriel Vargas Bento de Souza - 778023
Recuperacao_01

01.c) SoP (0,1,5,6,8,9,C,E)

 m  a  b  c  d  s
 0  0  0  0  0  1
 1  0  0  0  1  1
 2  0  0  1  0  0
 3  0  0  1  1  0
 4  0  1  0  0  0
 5  0  1  0  1  1
 6  0  1  1  0  1
 7  0  1  1  1  0
 8  1  0  0  0  1
 9  1  0  0  1  1
 A  1  0  1  0  0
 B  1  0  1  1  0
 C  1  1  0  0  1
 D  1  1  0  1  0
 E  1  1  1  0  1
 F  1  1  1  1  0


*/
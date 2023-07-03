/*
 Recuperacao_0103.v - v0.0. - 30 / 10 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/**
  Module A0113 (a,b,c)
 */
module A0113 (output s, 
              input a, b, c);
   assign s = ~((~a|~b) & ~(a&c));
endmodule // s = A0113 (a,b,c)

/**
  Recuperacao_0103.v
 */
module Recuperacao_0103;
   reg  a, b, c;
   reg[7:0] m;
   wire s;
   
   // instancias
   A0113 A0113_1 (s, a, b, c);
   
   // valores iniciais
   initial begin: start
      a=1'bx; b=1'bx; c=1'bx;                     
   end

   // parte principal
   initial begin: main
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Recuperacao_01");
       $display("\n03. A0113(a,b,c)\n");

       // monitoramento
       $display(" m  a  b  c  s");
       $monitor("%2c %2b %2b %2b %2b", m, a, b, c, s);

       // sinalizacao
          a=0; b=0; c=0; m="0";
       #1           c=1; m="1";
       #1      b=1; c=0; m="2";
       #1           c=1; m="3";
       #1 a=1; b=0; c=0; m="4";
       #1           c=1; m="5";
       #1      b=1; c=0; m="6";
       #1           c=1; m="7";
   end
endmodule // Recuperacao_0103

/*
gabriel@desktop-ubuntu:~/Desktop/CC-PUC/2periodo/ARQ1/Tarefas/Recuperacao01$ vvp Recuperacao_0103.vvp
Gabriel Vargas Bento de Souza - 778023
Recuperacao_01

03. A0113(a,b,c)

 m  a  b  c  s
 0  0  0  0  0
 1  0  0  1  0
 2  0  1  0  0
 3  0  1  1  0
 4  1  0  0  0
 5  1  0  1  1
 6  1  1  0  1
 7  1  1  1  1


*/
/*
 Guia_0601c.v - v0.0. - 28 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
 Soma dos produtos
               ___
f(x, y, z) =  \   m (2, 4, 5, 7)  = SoP(2,4,5,7)
              /___
*/

/**
 SoP(2,4,5,7) = x'.y.z' + x.y'.z' + x.y'.z +x.y.z
 */
module SoP (output s,
            input  x, y, z);
   assign s = (~x &  y & ~z)  // 2
            | ( x & ~y & ~z)  // 4
            | ( x & ~y &  z)  // 6
            | ( x &  y &  z); // 7
endmodule // SoP

/**
 SoP(2,4,5,7)_Simplificado = x.y' + x.z + x'.y.z'
 */
module SoP_simple (output s,
                   input  x, y, z);
   assign s = ( x & ~y     )
            | ( x &       z)
            | (~x &  y & ~z);
endmodule // SoP_simple

/**
  Guia_0601c.v
 */
module Guia_0601c;
   reg  x, y, z;
   wire s1, s2;
   
   // instancias
   SoP        SOP1 (s1, x, y, z);
   SoP_simple SOP2 (s2, x, y, z);
   
   // valores iniciais
   initial begin: start
      x=1'bx; y=1'bx; z=1'bx;
   end

   // parte principal
   initial begin: main
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Guia_06");
       $display("\n01.c) SoP (2, 4, 5, 7)\n");

       // monitoramento
       $display(" x  y  z  s1  s2");
       $monitor("%2b %2b %2b %2b %3b", x,  y,  z,  s1, s2);

       // sinalizacao
          x=0; y=0; z=0;
       #1           z=1;
       #1      y=1; z=0;
       #1           z=1;
       #1 x=1; y=0; z=0;
       #1           z=1;
       #1      y=1; z=0;
       #1           z=1;
   end
endmodule // Guia_0601c

/*
C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia06>vvp Guia_0601c.vvp
Gabriel Vargas Bento de Souza - 778023
Guia_06

01.c) SoP (2, 4, 5, 7)

 x  y  z  s1  s2
 0  0  0  0   0
 0  0  1  0   0
 0  1  0  1   1
 0  1  1  0   0
 1  0  0  1   1
 1  0  1  1   1
 1  1  0  0   0
 1  1  1  1   1
*/
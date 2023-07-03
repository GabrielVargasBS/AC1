/*
 Guia_0603d.v - v0.0. - 28 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
 Soma dos produtos
                  ___
f(x, y, w, z) =  \   m (2,4,5,6,10,12,14)  = SoP(2,4,5,6,10,12,14)
                 /___
*/ 

/**
 SoP(2,4,5,6,10,12,14)
 */
module SoP (output s,
            input  x, y, w, z);
   assign s = (~x & ~y &  w & ~z)  // 2
            | (~x &  y & ~w & ~z)  // 4
            | (~x &  y & ~w &  z)  // 5
            | (~x &  y &  w & ~z)  // 6
            | ( x & ~y &  w & ~z)  // 10
            | ( x &  y & ~w & ~z)  // 12
            | ( x &  y &  w & ~z); // 14
endmodule // SoP

/**
 SoP(2,4,5,6,10,12,14)_Simplificado = w .z' + x'.y .w' + y.z'
 */
module SoP_simple (output s,
                   input  x, y, w, z);
   assign s = ( w & ~z)
            | (~x &  y & ~w)
            | (y & ~z);
endmodule // SoP_simple

/**
  Guia_0603d.v
 */
module Guia_0603d;
   reg  x, y, w, z;
   wire s1, s2;
   
   // instancias
   SoP        SOP1 (s1, x, y, w, z);
   SoP_simple SOP2 (s2, x, y, w, z);
   
   // valores iniciais
   initial begin: start
      x=1'bx; y=1'bx; w=1'bx; z=1'bx;
   end

   // parte principal
   initial begin: main
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Guia_06");
       $display("\n03.d) SoP (2,4,5,6,10,12,14)\n");

       // monitoramento
       $display(" x  y  w  z  s1  s2");
       $monitor("%2b %2b %2b %2b %2b %3b", x,  y, w, z,  s1, s2);

       // sinalizacao
          x=0; y=0; w=0; z=0;
       #1                z=1;
       #1           w=1; z=0;
       #1                z=1;
       #1      y=1; w=0; z=0;
       #1                z=1;
       #1           w=1; z=0;
       #1                z=1;
       #1 x=1; y=0; w=0; z=0;
       #1                z=1;
       #1           w=1; z=0;
       #1                z=1;
       #1      y=1; w=0; z=0;
       #1                z=1;
       #1           w=1; z=0;
       #1                z=1;
   end
endmodule // Guia_0603d

/*
C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia06>vvp Guia_0603d.vvp
Gabriel Vargas Bento de Souza - 778023
Guia_06

03.d) SoP (2,4,5,6,10,12,14)

 x  y  w  z  s1  s2
 0  0  0  0  0   0
 0  0  0  1  0   0
 0  0  1  0  1   1
 0  0  1  1  0   0
 0  1  0  0  1   1
 0  1  0  1  1   1
 0  1  1  0  1   1
 0  1  1  1  0   0
 1  0  0  0  0   0
 1  0  0  1  0   0
 1  0  1  0  1   1
 1  0  1  1  0   0
 1  1  0  0  1   1
 1  1  0  1  0   0
 1  1  1  0  1   1
 1  1  1  1  0   0

*/
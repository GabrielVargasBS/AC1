/*
 Guia_0603b.v - v0.0. - 28 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
 Soma dos produtos
                  ___
f(x, y, w, z) =  \   m (0,1,3,5,8,9,13)  = SoP(0,1,3,5,8,9,13)
                 /___
*/ 

/**
 SoP(0,1,3,5,8,9,13)
 */
module SoP (output s,
            input  x, y, w, z);
   assign s = (~x & ~y & ~w & ~z)  // 0
            | (~x & ~y & ~w &  z)  // 1
            | (~x & ~y &  w &  z)  // 3
            | (~x &  y & ~w &  z)  // 5
            | ( x & ~y & ~w & ~z)  // 8
            | ( x & ~y & ~w &  z)  // 9
            | ( x &  y & ~w &  z); // 13
endmodule // SoP

/**
 SoP(0,1,3,5,8,9,13)_Simplificado = w'.z + y'.w'.z' + x'.y'.z
 */
module SoP_simple (output s,
                   input  x, y, w, z);
   assign s = (~w & z)
            | (~y & ~w & ~z)
            | (~x & ~y &  z);
endmodule // SoP_simple

/**
  Guia_0603b.v
 */
module Guia_0603b;
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
       $display("\n03.b) SoP (0,1,3,5,8,9,13)\n");

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
endmodule // Guia_0603b

/*
C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia06>vvp Guia_0603b.vvp
Gabriel Vargas Bento de Souza - 778023
Guia_06

03.b) SoP (0,1,3,5,8,9,13)

 x  y  w  z  s1  s2
 0  0  0  0  1   1
 0  0  0  1  1   1
 0  0  1  0  0   0
 0  0  1  1  1   1
 0  1  0  0  0   0
 0  1  0  1  1   1
 0  1  1  0  0   0
 0  1  1  1  0   0
 1  0  0  0  1   1
 1  0  0  1  1   1
 1  0  1  0  0   0
 1  0  1  1  0   0
 1  1  0  0  0   0
 1  1  0  1  1   1
 1  1  1  0  0   0
 1  1  1  1  0   0
*/
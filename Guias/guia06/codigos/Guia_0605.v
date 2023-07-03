/*
 Guia_0605.v - v0.0. - 28 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/**
 Logisim = (((x.y)+x')')+(((x'+y')').(x.y)')
 */
module Logisim (output s,
            input  x, y, z);
   assign s = ((~(~x|~y))&(~(x&y))) | (~((x&y)|~x));
endmodule // Logisim

/**
 SoP(4,5,6) = x.y'.z' + x.y'.z + x.y.z'
 */
module SoP (output s,
            input  x, y, z);
   assign s = ( x & ~y & ~z)  // 4
            | ( x & ~y &  z)  // 5
            | ( x &  y & ~z); // 6
endmodule // SoP

/**
 SoP(4,5,6)_Simplificado = x.y' + x.z'
 */
module SoP_simple (output s,
                   input  x, y, z);
   assign s = ( x & ~y)
            | ( x & ~z);
endmodule // SoP_simple

/**
  Guia_0605.v
 */
module Guia_0605;
   reg  x, y, z;
   wire s1, s2;
   
   // instancias
   Logisim    LOG1 (s1, x, y, z);
   SoP        SOP1 (s2, x, y, z);
   SoP_simple SOP2 (s3, x, y, z);
   
   // valores iniciais
   initial begin: start
      x=1'bx; y=1'bx; z=1'bx;
   end

   // parte principal
   initial begin: main
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Guia_06");
       $display("\n05) SoP (4,5,6)\n");

       // monitoramento
       $display(" x  y  z  s1  s2  s3");
       $monitor("%2b %2b %2b %2b %3b %3b", x,  y,  z,  s1, s2, s3);

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
endmodule // Guia_0605

/*
C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia06>vvp Guia_0605.vvp
Gabriel Vargas Bento de Souza - 778023
Guia_06

05) SoP (4,5,6)

 x  y  z  s1  s2  s3
 0  0  0  0   0   0
 0  0  1  0   0   0
 0  1  0  0   0   0
 0  1  1  0   0   0
 1  0  0  1   1   1
 1  0  1  1   1   1
 1  1  0  0   1   1
 1  1  1  0   0   0
*/
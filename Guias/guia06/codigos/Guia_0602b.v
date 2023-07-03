/*
 Guia_0602b.v - v0.0. - 28 / 08 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/* 
 Produto das somas
               ____
F(X, Y, Z) =   | |  M (1, 6, 7) = PoS(1, 6, 7)
*/

/**
 PoS (1, 6, 7) = X+Y+Z' . X'+Y'+Z . X'+Y'+Z'
 */
module PoS (output S,
            input  X, Y, Z);
   assign S = ( X |  Y | ~Z)  // 1  
            & (~X | ~Y |  Z)  // 6
            & (~X | ~Y | ~Z); // 7
endmodule // PoS 

/**
 PoS(1,6,7)_Simplificado = X'+Y' . X+Y+Z'
 */
module PoS_simple (output S,
                   input  X, Y, Z);
   assign S = (~X | ~Y     )
            & ( X |  Y | ~Z);
endmodule // PoS_simple

/**
  Guia_0602b.v
 */
module Guia_0602b;
   reg  X, Y, Z;
   wire S1, S2;
   
   // instancias
   PoS        POS1 (S1, X, Y, Z);
   PoS_simple POS2 (S2, X, Y, Z);
   
   // valores iniciais
   initial begin: start
      X=1'bx; Y=1'bx; Z=1'bx;
   end

   // parte principal
   initial begin: main
       $display("Gabriel Vargas Bento de Souza - 778023");
       $display("Guia_06");
       $display("\n02.b) PoS (1, 6, 7)\n");

       // monitoramento
       $display(" X  Y  Z  S1  S2");
       $monitor("%2b %2b %2b %2b %3b", X,  Y,  Z,  S1, S2);

       // sinalizacao
          X=0; Y=0; Z=0;
       #1           Z=1;
       #1      Y=1; Z=0;
       #1           Z=1;
       #1 X=1; Y=0; Z=0;
       #1           Z=1;
       #1      Y=1; Z=0;
       #1           Z=1;
   end
endmodule // Guia_0602b

/*
C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia06>vvp Guia_0602b.vvp
Gabriel Vargas Bento de Souza - 778023
Guia_06

02.b) PoS (1, 6, 7)

 X  Y  Z  S1  S2
 0  0  0  1   1
 0  0  1  0   0
 0  1  0  1   1
 0  1  1  1   1
 1  0  0  1   1
 1  0  1  1   1
 1  1  0  0   0
 1  1  1  0   0
*/
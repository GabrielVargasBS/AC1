/*
 * Exemplo_0803 - GATES
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
*/

// -------------------------
// is equals
// -------------------------
module isEquals ( output s,
                  input  a, b,
                  input  carryIn );

   // temporario
   wire tmp;

   // descrever por portas e/ou modulos
   xnor XNOR1 (tmp, a, b);
   and  AND1  (s, tmp, carryIn);

endmodule // isEquals

// -------------------------
// main
// -------------------------
module test_isEquals;
   
   // definir dados
   reg  [4:0] x;
   reg  [4:0] y;
   wire [4:0] igualdade;
   wire result;

   //           ( s,            a,    b,    carryIn  );
   isEquals IE0 ( igualdade[0], x[0], y[0], 1'b1 );
   isEquals IE1 ( igualdade[1], x[1], y[1], igualdade[0] );
   isEquals IE2 ( igualdade[2], x[2], y[2], igualdade[1] );
   isEquals IE3 ( igualdade[3], x[3], y[3], igualdade[2] );
   isEquals IE4 ( igualdade[4], x[4], y[4], igualdade[3] );

   or OR1 (result, igualdade[4], 0);
   
   // parte principal
   initial
   begin : main
      $display("Exemplo_0803 - Gabriel Vargas Bento de Souza - 778023");
      $display("ALU's is Equals\n");
      $display("  x       y     isEqual(x,y)  ");

      // projetar testes de igualdades
         $monitor("%5b %7b %8b", x, y, result);
         x = 5'b00111; y = 5'b00111;
      #1 x = 5'b11001; y = 5'b01101;
      #1 x = 5'b00001; y = 5'b00001;
      #1 x = 5'b01000; y = 5'b10101;
      #1 x = 5'b00000; y = 5'b01011;
   end
endmodule // test_isEquals

// -------------------------
// test
// -------------------------
/*
---------- previsao ----------

    x        y      igual?
  00111    00111      1
  11001    01101      0
  00001    00001      1
  01000    10101      0
  00000    01011      0

---------- execucao ----------

C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia08>vvp Exemplo_0803.vvp
Exemplo_0803 - Gabriel Vargas Bento de Souza - 778023
ALU's is Equals

  x       y     isEqual(x,y)
00111   00111        1
11001   01101        0
00001   00001        1
01000   10101        0
00000   01011        0
*/
/*
 * Exemplo_0804 - GATES
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
*/

// -------------------------
// is Different
// -------------------------
module isDifferent ( output s,
                     input  a, b,
                     input  carryIn );

   // temporario
   wire tmp;

   // descrever por portas e/ou modulos
   xor XOR1 (tmp, a, b);
   or  OR1  (s, tmp, carryIn);

endmodule // isDifferent

// -------------------------
// main
// -------------------------
module test_isDifferent;
   
   // definir dados
   reg  [4:0] x;
   reg  [4:0] y;
   wire [4:0] diferenca;
   wire result;

   //              ( s,            a,    b,    carryIn  );
   isDifferent IE0 ( diferenca[0], x[0], y[0], 1'b0 );
   isDifferent IE1 ( diferenca[1], x[1], y[1], diferenca[0] );
   isDifferent IE2 ( diferenca[2], x[2], y[2], diferenca[1] );
   isDifferent IE3 ( diferenca[3], x[3], y[3], diferenca[2] );
   isDifferent IE4 ( diferenca[4], x[4], y[4], diferenca[3] );

   or OR1 (result, diferenca[4], 0);
   
   // parte principal
   initial
   begin : main
      $display("Exemplo_0804 - Gabriel Vargas Bento de Souza - 778023");
      $display("ALU's is Different\n");
      $display("  x       y     isDifferent(x,y)  ");

      // projetar testes de diferencas
         $monitor("%5b %7b %10b", x, y, result);
         x = 5'b00111; y = 5'b00111;
      #1 x = 5'b11001; y = 5'b01101;
      #1 x = 5'b00001; y = 5'b00001;
      #1 x = 5'b01000; y = 5'b10101;
      #1 x = 5'b00000; y = 5'b01011;
   end
endmodule // test_isDifferent

// -------------------------
// test
// -------------------------
/*
---------- previsao ----------

    x        y      diferente?
  00111    00111        0
  11001    01101        1
  00001    00001        0
  01000    10101        1
  00000    01011        1

---------- execucao ----------

C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia08>vvp Exemplo_0804.vvp
Exemplo_0804 - Gabriel Vargas Bento de Souza - 778023
ALU's is Different

  x       y     isDifferent(x,y)
00111   00111          0
11001   01101          1
00001   00001          0
01000   10101          1
00000   01011          1
*/
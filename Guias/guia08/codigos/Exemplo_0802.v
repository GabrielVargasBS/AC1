/*
 * Exemplo_0802 - GATES
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
*/

// -------------------------
// half difference
// -------------------------
module halfDifference (output s1, s0,
                       input  a, b);
   
   // descrever por portas
   wire not_a;
   not NOT1 (not_a, a);
   xor XOR1 (s0, a, b);
   and AND1 (s1, not_a, b);

endmodule // halfDifference

// -------------------------
// full difference
// -------------------------
module fullDifference ( output s1, s0,
                        input a, b,
                        input carryIn );
   
   // temporario
   wire temp_s0, temp_s1a, temp_s1b;

   // descrever por portas e/ou modulos
   halfDifference HD1 (temp_s1a, temp_s0, a, b);
   halfDifference HD2 (temp_s1b, s0, temp_s0, carryIn);

   or        OR1 (s1, temp_s1a, temp_s1b);

endmodule // fullDifference

// -------------------------
// main
// -------------------------
module test_fullDifference;
   
   // definir dados
   reg  [4:0] x;
   reg  [4:0] y;
   wire [4:0] carry; // “vai-um”
   wire [5:0] diferenca;

   //                 ( s1,       s0,           a,    b,    carryIn  );
   fullDifference FD0 ( carry[0], diferenca[0], x[0], y[0], 1'b0 );
   fullDifference FD1 ( carry[1], diferenca[1], x[1], y[1], carry[0] );
   fullDifference FD2 ( carry[2], diferenca[2], x[2], y[2], carry[1] );
   fullDifference FD3 ( carry[3], diferenca[3], x[3], y[3], carry[2] );
   fullDifference FD4 ( carry[4], diferenca[4], x[4], y[4], carry[3] );

   or OR1 (diferenca[5], carry[4], 0);
   
   // parte principal
   initial
   begin : main
      $display("Exemplo_0802 - Gabriel Vargas Bento de Souza - 778023");
      $display("ALU's Full Difference\n");
      $display("  x       y     carry     menos  ");

      // projetar testes do subtrator completo
         $monitor("%5b %7b %7b %9b", x, y, carry, diferenca);
         x = 5'b01011; y = 5'b00111;
      #1 x = 5'b11001; y = 5'b01101;
      #1 x = 5'b00001; y = 5'b00001;
      #1 x = 5'b01000; y = 5'b10101;
      #1 x = 5'b00000; y = 5'b01011;
   end
endmodule // test_fullDifference

// -------------------------
// test
// -------------------------
/*
---------- previsao ----------

  x     y     x - y    -->    x        y      x - y
(11) - (7)    ( 4)     -->  01011    00111    000100
(25) - (13)   (12)     -->  11001    01101    001100
( 1) - ( 1)   ( 0)     -->  00001    00001    000000
( 8) - (21)  -(13)     -->  01000    10101    110011
( 0) - (11)  -(11)     -->  00000    01011    110101

---------- execucao ----------

C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia08>vvp Exemplo_0802.vvp
Exemplo_0802 - Gabriel Vargas Bento de Souza - 778023
ALU's Full Difference

  x       y     carry     menos
01011   00111   00100    000100
11001   01101   01100    001100
00001   00001   00000    000000
01000   10101   10111    110011
00000   01011   11111    110101
*/
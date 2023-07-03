/*
 * Exemplo_0801 - GATES
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
*/

// -------------------------
// half adder
// -------------------------
module halfAdder (output s1, s0,
                  input  a, b);
   
   // descrever por portas
   xor XOR1 (s0, a, b);
   and AND1 (s1, a, b);

endmodule // halfAdder

// -------------------------
// full adder
// -------------------------
module fullAdder ( output s1, s0,
                   input a, b,
                   input carryIn );
   
   // temporario
   wire temp_s0, temp_s1a, temp_s1b;

   // descrever por portas e/ou modulos
   halfAdder HA1 (temp_s1a, temp_s0, a, b);
   halfAdder HA2 (temp_s1b, s0, temp_s0, carryIn);

   or        OR1 (s1, temp_s1a, temp_s1b);

endmodule // fullAdder

// -------------------------
// main
// -------------------------
module test_fullAdder;
   
   // definir dados
   reg  [4:0] x;
   reg  [4:0] y;
   wire [4:0] carry; // “vai-um”
   wire [5:0] soma;

   //            ( s1,       s0,      a,    b,    carryIn  );
   fullAdder FA0 ( carry[0], soma[0], x[0], y[0], 1'b0 );
   fullAdder FA1 ( carry[1], soma[1], x[1], y[1], carry[0] );
   fullAdder FA2 ( carry[2], soma[2], x[2], y[2], carry[1] );
   fullAdder FA3 ( carry[3], soma[3], x[3], y[3], carry[2] );
   fullAdder FA4 ( carry[4], soma[4], x[4], y[4], carry[3] );

   or OR1 (soma[5], carry[4], 0);
   
   // parte principal
   initial
   begin : main
      $display("Exemplo_0801 - Gabriel Vargas Bento de Souza - 778023");
      $display("ALU's Full Adder\n");
      $display("  x       y     carry     soma  ");

      // projetar testes do somador completo
         $monitor("%5b %7b %7b %9b", x, y, carry, soma);
         x = 5'b01011; y = 5'b00111;
      #1 x = 5'b11001; y = 5'b01101;
      #1 x = 5'b00001; y = 5'b00001;
      #1 x = 5'b01000; y = 5'b10101;
      #1 x = 5'b00000; y = 5'b01011;
   end
endmodule // test_fullAdder

// -------------------------
// test
// -------------------------
/*
---------- previsao ----------

  x     y    x + y    -->    x        y      x + y
(11) + (7)   (18)     -->  01011    00111    010010
(25) + (13)  (38)     -->  11001    01101    100110
( 1) + ( 1)  ( 2)     -->  00001    00001    000010
( 8) + (21)  (29)     -->  01000    10101    011101
( 0) + (11)  (11)     -->  00000    01011    001011

---------- execucao ----------

C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia08>vvp Exemplo_0801.vvp
Exemplo_0801 - Gabriel Vargas Bento de Souza - 778023
ALU's Full Adder

  x       y     carry     soma
01011   00111   01111    010010
11001   01101   11001    100110
00001   00001   00001    000010
01000   10101   00000    011101
00000   01011   00000    001011
*/
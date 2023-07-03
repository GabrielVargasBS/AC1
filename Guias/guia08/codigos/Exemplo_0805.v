/*
 * Exemplo_0805 - GATES
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
   wire [5:0] c1;
   wire [5:0] c2;
   wire [4:0] carry; // “vai-um”


   not NOT0 (c1[0], x[0]);
   not NOT1 (c1[1], x[1]);
   not NOT2 (c1[2], x[2]);
   not NOT3 (c1[3], x[3]);
   not NOT4 (c1[4], x[4]);
   not NOT6 (c1[5], 0);

   fullAdder FA0 ( carry[0], c2[0], c1[0], 1'b1, 1'b0 );
   fullAdder FA1 ( carry[1], c2[1], c1[1], 1'b0, carry[0] );
   fullAdder FA2 ( carry[2], c2[2], c1[2], 1'b0, carry[1] );
   fullAdder FA3 ( carry[3], c2[3], c1[3], 1'b0, carry[2] );
   fullAdder FA4 ( carry[4], c2[4], c1[4], 1'b0, carry[3] );

   not NOT7 (c2[5], 0);
   
   // parte principal
   initial
   begin : main
      $display("Exemplo_0805 - Gabriel Vargas Bento de Souza - 778023");
      $display("ALU's c1 e c2\n");
      $display("  x        c1        c2");

      // projetar testes de diferencas
         $monitor("%5b %9b %9b", x, c1, c2);
         x = 5'b10010;
      #1 x = 5'b00000;
      #1 x = 5'b11111;
      #1 x = 5'b01001;
      #1 x = 5'b10101;
      #1 x = 5'b00001;
   end
endmodule // test_isDifferent

// -------------------------
// test
// -------------------------
/*
---------- previsao ----------

   x       c1             c2
 10010   101101  +1  =  101110
 00000   111111  +1  =  100000  // o ultimo "vai um" sera' desconsiderado
 11111   100000  +1  =  100001
 01001   110110  +1  =  110111
 10101   101010  +1  =  101011
 00001   111110  +1  =  111111

---------- execucao ----------

C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia08>vvp Exemplo_0805.vvp
Exemplo_0805 - Gabriel Vargas Bento de Souza - 778023
ALU's c1 e c2

  x        c1        c2
10010    101101    101110
00000    111111    100000
11111    100000    100001
01001    110110    110111
10101    101010    101011
00001    111110    111111
*/
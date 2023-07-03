/*
 * Exemplo_0700 - GATES
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
*/

// -------------------------
// f7_gate
// -------------------------
module f7 (output s,
           input  a, 
           input  b);

   // descrever por portas

endmodule // f7

// -------------------------
// multiplexer
// -------------------------
module mux (output s,
            input  a,
            input  b,
            input  select);

   // definir dados locais
   wire not_select;
   wire sa;
   wire sb;

   // descrever por portas
   not NOT1 (not_select, select);
   
   and AND1 (sa, a, not_select);
   and AND2 (sb, b, select);

   or  OR1  (s , sa, sb);
endmodule // mux

// -------------------------
// main
// -------------------------
module test_f7;
   
   // definir dados
   reg  x, y, s;
   wire w, z;

   f7  modulo (w, x, y);
   mux MUX1   (z, x, y, s);
   
   // parte principal
   initial
   begin : main
      $display("Exemplo_0700 - Gabriel Vargas Bento de Souza - 778023");
      $display("Test LU's module");
      $display(" x  y  s  z");

      x = 1'b0; y = 1'b1; s = 1'b0;

      // projetar testes do modulo
      #1 $monitor("%2b %2b %2b %2b", x, y, s, z);
      #1 s = 1'b1;
   end
endmodule // test_f7

// -------------------------
// test
// -------------------------
/*
---------- previsao ----------

  x   y   mult(s)         out(z)
  0   1     0         0.0 + 1.0 = 0
  0   1     1         0.1 + 1.1 = 1

---------- execucao ----------

C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia07>vvp Exemplo_0700.vvp
Exemplo_0700 - Gabriel Vargas Bento de Souza - 778023
Test LU's module
 x  y  s  z
 0  1  0  0
 0  1  1  1
*/
// ----------------------------------------------------------------------------
/**
 Exemplo_0506 - GATES
 Nome: Gabriel Vargas Bento de Souza
 Matricula: 778023
 */
// ----------------------------------------------------------------------------
/*
 f5_gate (a^b) = xor(a,b)
 m a b s
 0 0 0 0
 1 0 1 1
 2 1 0 1
 3 1 1 0

a'.b + a.b'
or( and(not(a),b), and(a,not(b)) )

or( and(nor(a,a),b), and(a,nor(b,b)) )
or( nor(a,nor(b,b)), nor(nor(a,a),b) )
nor( nor( (a,nor(b,b) ) , (nor(a,a),b) ) ) 

*/
// ----------------------------------------------------------------------------
module f5a (output s,
            input  a,
            input  b);

 // definir dado local
    wire not_a, not_b, w1, w2, nor_w1w2;

 // descrever por portas
    nor NOR1 (not_a, a, a);
    nor NOR2 (not_b, b, b);
    nor NOR3 (w1, not_a, b);
    nor NOR4 (w2, not_b, a);
    nor NOR5 (nor_w1w2, w1, w2);
    nor NOR6 (s, nor_w1w2, nor_w1w2);
endmodule // f5a
// ----------------------------------------------------------------------------
/*
 f5_gate (a^b) = xor(a,b)
 m a b s
 0 0 0 0
 1 0 1 1
 2 1 0 1
 3 1 1 0
*/
// ----------------------------------------------------------------------------
module f5b (output s,
            input  a,
            input  b);

 // descrever por expressao
    assign s = ~a &  b
             |  a & ~b;
endmodule // f5b

module test_f5;
// -------------------------------------------------------------- definir dados
    reg x; reg y;
    wire a, b;

    f5a moduloA (a, x, y);
    f5b moduloB (b, x, y);
// ------------------------------------------------------------ parte principal
initial
 begin : main
   $display("Exemplo_0506 - Gabriel Vargas Bento de Souza - 778023");
   $display("Test module  - (a ^ b)");
   $display(" x  y  a  b");
 
   // projetar testes do modulo
   $monitor("%2b %2b %2b %2b", x, y, a, b);
      x = 1'b0; y = 1'b0;
   #1 x = 1'b0; y = 1'b1;
   #1 x = 1'b1; y = 1'b0;
   #1 x = 1'b1; y = 1'b1;
 end
endmodule // test_f5

// --------------------------------------------------------------------- testes
/*
C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia05>vvp Exemplo_0506.vvp
Exemplo_0506 - Gabriel Vargas Bento de Souza - 778023
Test module  - (a ^ b)
 x  y  a  b
 0  0  0  0
 0  1  1  1
 1  0  1  1
 1  1  0  0
*/
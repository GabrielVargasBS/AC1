// ----------------------------------------------------------------------------
/**
 Exemplo_0505 - GATES
 Nome: Gabriel Vargas Bento de Souza
 Matricula: 778023
 */
// ----------------------------------------------------------------------------
/*
 f5_gate (a xnor b)
 m a b s
 0 0 0 1
 1 0 1 0
 2 1 0 0
 3 1 1 1

 ~( (~a.b) +  (a.~b) )     // De Morgan
   ~(~a.b) . ~(a.~b)

not( and(not(a),b) )    . not( and(a,not(b)) )
not( and(nand(a,a),b) ) . not( and(a,nand(b,b)) )

A = nand( (nand((nand(a,a), nand(a,a)) )), (nand( (b,b) )) )
A = nand( a, (nand(b,b) )

B = nand( (nand((nand(b,b), nand(b,b)) )), (nand( (a,a) )) )
B = nand( b, nand(a,a) )

A . B = nand(nand(A,B), nand(A,B))

*/
// ----------------------------------------------------------------------------
module f5a (output s,
            input  a,
            input  b);

 // definir dado local
    wire not_a, not_b, w1, w2, nand_w1w2;

 // descrever por portas
    nand NAND1 (not_a, a, a);
    nand NAND2 (not_b, b, b);
    nand NAND3 (w1, not_a, b);
    nand NAND4 (w2, not_b, a);
    nand NAND5 (nand_w1w2, w1, w2);
    nand NAND6 (s, nand_w1w2, nand_w1w2);
endmodule // f5a
// ----------------------------------------------------------------------------
/*
 f5_gate (a xnor b)  ==  (~ (a ^ b) )  ==  (~ ( (~a.b) + (a.~b) ) )
 m a b s
 0 0 0 1
 1 0 1 0
 2 1 0 0
 3 1 1 1
*/
// ----------------------------------------------------------------------------
module f5b (output s,
            input  a,
            input  b);

 // descrever por expressao
    assign s = ~( (~a &  b) | 
                  ( a & ~b) );
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
   $display("Exemplo_0505 - Gabriel Vargas Bento de Souza - 778023");
   $display("Test module  - (~(a^b))");
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
C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia05>vvp Exemplo_0505.vvp
Exemplo_0505 - Gabriel Vargas Bento de Souza - 778023
Test module  - (~(a^b))
 x  y  a  b
 0  0  1  1
 0  1  0  0
 1  0  0  0
 1  1  1  1
*/
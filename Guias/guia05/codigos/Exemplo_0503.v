// ----------------------------------------------------------------------------
/**
 Exemplo_0503 - GATES
 Nome: Gabriel Vargas Bento de Souza
 Matricula: 778023
 */
// ----------------------------------------------------------------------------
/*
 f5_gate (a | ~b)
 m a b s
 0 0 0 1
 1 0 1 0
 2 1 0 1
 3 1 1 1
*/
// ----------------------------------------------------------------------------
module f5a (output s,
            input  a,
            input  b);

 // definir dado local
    wire nand_a;

 // descrever por portas
    nand NAND1 (nand_a, a, a);
    nand NAND2 (s, nand_a, b);
endmodule // f5a
// ----------------------------------------------------------------------------
/*
 f5_gate (a | ~b)
 m a b s
 0 0 0 1
 1 0 1 0
 2 1 0 1
 3 1 1 1
*/
// ----------------------------------------------------------------------------
module f5b (output s,
            input  a,
            input  b);

 // descrever por expressao
    assign s = a | ~b;
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
   $display("Exemplo_0503 - Gabriel Vargas Bento de Souza - 778023");
   $display("Test module  - (a | ~b)");
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
C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia05>vvp Exemplo_0503.vvp
Exemplo_0503 - Gabriel Vargas Bento de Souza - 778023
Test module  - (a | ~b)
 x  y  a  b
 0  0  1  1
 0  1  0  0
 1  0  1  1
 1  1  1  1
*/
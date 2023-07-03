/*
 * Exemplo_0903 - CLOCK
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
*/

// -------------------------
// test clock generator (3)
// -------------------------

`include "clock.v"

module pulse1 (signal, clock);
   input  clock;
   output signal;
   reg    signal;

   always @ (posedge clock)
   begin
          signal = 1'b1;
       #4 signal = 1'b0;
       #4 signal = 1'b1;
       #4 signal = 1'b0;
       #4 signal = 1'b1;
       #4 signal = 1'b0;
   end
endmodule // pulse1 ()

module pulse2 (signal, clock);
   input  clock;
   output signal;
   reg    signal;

   always @ (posedge clock)
   begin
          signal = 1'b1;
       #5 signal = 1'b0;
   end
endmodule // pulse2 ()

module pulse3 (signal, clock);
   input  clock;
   output signal;
   reg    signal;

   always @ (negedge clock)
   begin
           signal = 1'b1;
       #15 signal = 1'b0;
       #15 signal = 1'b1;
   end
endmodule // pulse3 ()

module pulse4 (signal, clock);
   input  clock;
   output signal;
   reg    signal;

   always @ (negedge clock)
   begin
           signal = 1'b1;
       #20 signal = 1'b0;
       #20 signal = 1'b1;
       #20 signal = 1'b0;
   end
endmodule // pulse4 ()

// -------------------------
// main
// -------------------------
module Exemplo_0903;
   
   wire clock;
   wire p1, p2, p3, p4;

   clock   clk   (clock);

   pulse1  pls1  (p1, clock);
   pulse2  pls2  (p2, clock);
   pulse3  pls3  (p3, clock);
   pulse4  pls4  (p4, clock);

   initial
   begin
      $dumpfile ( "Exemplo_0903.vcd" );
      $dumpvars ( 1, clock, p1, p2, p3, p4 );
      #480 $finish;
   end
endmodule // Exemplo_0903 ()

// -------------------------
// test
// -------------------------
/*
---------- previsao ----------

pls1 e pls2 espram a subida   do clock (posedge)
pls3 e pls4 esperam a descida do clock (negedge)

pulse 1: varia a cada 4 u.t.
pulse 2: liga durante 5 u.t. e desliga o restante
pulse 3: 30u.t. ligado e 15u.t. desligado
pulse 4: 20u.t. ligado / 20u.t. desligado

---------- execucao ----------

C:\Users\Gabriel\Desktop\CC-PUC\2Periodo\ARQ1\Tarefas\Guia09>vvp Exemplo_0903.vvp
VCD info: dumpfile Exemplo_0903.vcd opened for output.
Exemplo_0903.v:87: $finish called at 480 (1s)

*/
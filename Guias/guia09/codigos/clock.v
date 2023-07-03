/*
 * clock.v - CLOCK
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
*/

// -----------------------------
// ------ clock generator ------
// -----------------------------
module clock ( output clk );
   reg clk;
   
   initial
   begin
      clk = 1'b0;
   end

   always
   begin
      #12 clk = ~clk;
   end
endmodule // clock ()
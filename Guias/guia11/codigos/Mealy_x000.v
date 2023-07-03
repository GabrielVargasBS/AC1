/*
 * Mealy_x000 - MEALY
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
 */

/*
 -----------------
 --- Mealy FSM ---
 -----------------
*/

// constant definitions
`define found    1
`define notfound 0

// FSM by Mealy
module mealy_x000 ( y, x, clk, reset );
   output y;
   input  x;
   input  clk;
   input  reset;

   reg    y;

   parameter          // state identifiers
     start = 4'bxxxx,
     id0   = 4'bxxx0,
     id00  = 4'bxx00,
     id000 = 4'bx000;

     reg [3:0] E1;    // current state variables
     reg [3:0] E2;    // next state logic output
     
   // next state logic
   always @( x or E1 )
     begin
        y = `notfound;
        case ( E1 )
          start:
            if ( x )
              E2 = start;
            else
              E2 = id0;
          id0:
            if ( x )
              E2 = start;
            else
              E2 = id00;
          id00:
            if ( x )
              E2 = start;
            else
              E2 = id000;
          id000:
            if ( x )
              begin
                E2 = start;
                y  = `found;
              end
            else
              begin
                E2 = id000;
                y  = `found;
              end

          default:     // undefined state
            E2 = 4'bxxxx;
        endcase
     end  // always at signal or state changing

   // state variables
   always @( posedge clk or negedge reset )
     begin
        if ( reset )
          E1 = E2;  // updates current state
        else
          E1 = 0;   // reset
     end // always at signal changing

endmodule // Mealy_x000   
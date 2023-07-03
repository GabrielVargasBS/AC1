/*
 * Moore_x000 - MOORE
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
 */

/*
 -----------------
 --- Moore FSM ---
 -----------------
*/

// FSM by Moore
module moore_x000 ( y, x, clk, reset );
   output y;
   input  x;
   input  clk;
   input  reset;

   reg    y;

   parameter         // state identifiers
                     // considerar o bit = 1 caso identificado corretamente = 0
     start  = 4'b0000,
     id0    = 4'b0001,
     id00   = 4'b0011,
     id000  = 4'b0111,
     id1000 = 4'b1110, // signal found
     id0000 = 4'b1111; // signal found

     reg [3:0] E1;    // current state variables
     reg [3:0] E2;    // next state logic output
     
   // next state logic
   always @( x or E1 )
     begin
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
                E2 = id1000;
            else
                E2 = id0000;
          id1000:
            if ( x )
                E2 = start;
            else
                E2 = id0;
          id0000:
            if ( x )
                E2 = id1000;
            else
                E2 = id0000;
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

   // output logic
   always @ ( E1 )
     begin
        y = E1[3]; // first bit of state value (MOORE indicator)
     end // always at state changing

endmodule // moore_x000   
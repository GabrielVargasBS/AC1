/*
 * Mealy_010_or_101 - MEALY
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
module mealy_010_or_101 ( y, x, clk, reset );
   output y;
   input  x;
   input  clk;
   input  reset;

   reg    j, k, y;

   parameter          // state identifiers
     start = 3'bxxx,

     idxx1 = 3'bxx1,
     idx01 = 3'bx01,

     idxx0 = 3'bxx0,
     idx10 = 3'bx10;

     reg [2:0] E1a;    // current state variables
     reg [2:0] E1b;    // current state variables
     reg [2:0] E2a;    // next state logic output
     reg [2:0] E2b;    // next state logic output
     
   // next state logic
   always @( x or E1a or E1b )
     begin
        y = `notfound;
        j = 1'b0;
        k = 1'b0;

        // case 101
        case ( E1a )
          start:
            if ( x )
              E2a = idxx1;
            else
              E2a = start;
          idxx1:
            if ( x )
              E2a = idxx1;
            else
              E2a = idx01;
          idx01:
            if ( x )
              begin
                E2a = idxx1;
                j   = 1'b1;
              end
            else
              begin
                E2a = start;
                j   = 1'b0;
              end
          default:     // undefined state
            E2a = 3'bxxx;
        endcase

        // case 010
        case ( E1b )
          start:
            if ( x )
              E2b = start;
            else
              E2b = idxx0;
          idxx0:
            if ( x )
              E2b = idx10;
            else
              E2b = idxx0;
          idx10:
            if ( x )
              begin
                E2b = start;
                k   = 1'b0;
              end
            else
              begin
                E2b = idxx0;
                k   = 1'b1;
              end
          default:     // undefined state
            E2b= 3'bxxx;
        endcase

        if ( j | k )
           y = `found;
        else
           y = `notfound;

     end  // always at signal or state changing

   // state variables
   always @( posedge clk or negedge reset )
     begin
        if ( reset )
          begin
             E1a = E2a;  // updates current state
             E1b = E2b;  // updates current state
          end
        else
          begin
             E1a = 0;   // reset
             E1b = 0;   // reset
          end
     end // always at signal changing

endmodule // mealy_010_or_101   
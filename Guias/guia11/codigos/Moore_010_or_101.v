/*
 * Moore_010_or_101 - MOORE
 * Nome Gabriel Vargas Bento de Souza
 * Matricula: 778023
 */

/*
 -----------------
 --- Moore FSM ---
 -----------------
*/

// constant definitions
`define found    1
`define notfound 0

// FSM by Moore
module moore_010_or_101 ( y, x, clk, reset );
   output y;
   input  x;
   input  clk;
   input  reset;

   reg    y;

   parameter            // state identifiers
     start  = 4'b0xxx, 

     id1    = 4'b0xx1,
     id01   = 4'b0x01,
     id101  = 4'b1101,  // signal found 101

     id0    = 4'b0xx0,
     id10   = 4'b0x10,
     id010  = 4'b1010;  // signal found 010

     reg [3:0] E1a;     // current state variables
     reg [3:0] E1b;     // current state variables
     reg [3:0] E2a;     // next state logic output
     reg [3:0] E2b;     // next state logic output
     
   // next state logic
   always @( x or E1a or E1b )
     begin

        // case 101
        case ( E1a )
          start:
            if ( x )
              E2a = id1;
            else
              E2a = start;
          id1:
            if ( x )
              E2a = id1;
            else
              E2a = id01;
          id01:
            if ( x )
              E2a = id101;
            else
              E2a = start;
          id101:
            if ( x )
                E2a = id1;
            else
                begin
                  E2a = start;
                  E1a = id010;
                end
          default:     // undefined state
            E2a = 4'b0xxx;
        endcase

        // case 010
        case ( E1b )
          start:
            if ( x )
              E2b = start;
            else
              E2b = id0;
          id0:
            if ( x )
              E2b = id10;
            else
              E2b = id0;
          id10:
            if ( x )
              E2b = start;
            else
              E2b = id010;
          id010:
            if ( x )
                begin
                  E2b = start;
                  E2a = id101;
                end
            else
                E2b = id0;
          default:     // undefined state
            E2b = 4'b0xxx;
        endcase

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

   // output logic
   always @ ( E1a or E2b )
     begin
        if ( E1a[3] == 1'b1 )
           y = E1a[3]; // first bit of state value (MOORE indicator)
        else
           y = E1b[3];
     end // always at state changing

endmodule // moore_010_or_101
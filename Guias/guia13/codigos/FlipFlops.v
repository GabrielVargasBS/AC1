/*
 FlipFlops.v - v0.0. - 30 / 10 / 2022
 Autor    : Gabriel Vargas Bento de Souza
 Matricula: 778023
 */

/**
 * FlipFlop - Tipo D
 */
module dff ( output q, output qnot,
             input  d, input  clk );
   
   reg q, qnot;
   
   always @( posedge clk )
      begin
         q    <=  d;
         qnot <= ~d;
      end
endmodule // dff

/**
 * FlipFlop - Tipo JK
 */
module jkff ( output q,   output qnot,
              input  j,   input  k,
              input  clk, input  preset, input clear );
   
   reg q, qnot;

   always @( posedge clk or preset or clear )
      begin
         if ( clear )
            begin 
               q    <= 0;
               qnot <= 1; 
            end
         else
            if ( preset ) 
               begin 
                  q    <= 1;
                  qnot <= 0;
               end
            else
               if ( j & ~k )
                  begin 
                     q    <= 1;
                     qnot <= 0;
                  end
               else 
                  if ( ~j & k )
                     begin
                        q    <= 0;
                        qnot <= 1;
                     end
                  else
                     if ( j & k )
                        begin
                           q    <= ~q;
                           qnot <= ~qnot;
                        end
      end
endmodule // jkff

/**
 * FlipFlop - Tipo T
 */
module tff ( output q,      output qnot,
             input  t,      input  clk,
             input  preset, input  clear );

   reg q, qnot;

   always @( posedge clk or ~preset or ~clear)
      begin
         if ( ~clear )
            begin
               q    <= 0;
               qnot <= 1;
            end
         else
            if ( ~preset )
               begin
                  q    <= 1;
                  qnot <= 0;
               end
            else
               begin
                  if ( t )
                     begin 
                        q    <= ~q;
                        qnot <= ~qnot;
                     end
               end
      end
endmodule // tff

/**
 * FlipFlop - Tipo SR
 */
module srff ( output q, output qnot,
              input  s, input  r,    input clk );

   reg q, qnot;

   always @( posedge clk )
      begin
         if ( s & ~r )
            begin
               q    <= 1;
               qnot <= 0;
            end
         else
            if ( ~s & r )
               begin
                  q    <= 0;
                  qnot <= 1;
               end
            else
               if ( s & r )
                  begin
                     q    <= 0;
                     qnot <= 0;
                  end // arbitrary
      end
endmodule // srff
`timescale 1ns/1ns
module Multiplier( clk, dataA, dataB, Signal, dataOut, reset );
input clk ;
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input Signal ;
output [63:0] dataOut ;

reg temp ;
reg [31:0] tempA ;
reg [6:0] counter = 0 ;
reg [63:0] prod ;

parameter MULTU = 6'b011001;
parameter OUT = 6'b111111;

always@( posedge clk or reset )
begin
        if ( reset )
        begin
            prod = 32'b0 ;
        end
        else if ( Signal == 1'b1 )
        begin
			if ( counter == 0 ) 
			begin
				prod[31:0] = dataB ;
				tempA = dataA ;
				counter++ ;
			end
			else
			begin
				if ( counter <= 32 )
				begin
					temp = prod[0:0] ;
					if ( temp )
					begin
						prod[63:32] = prod[63:32] + tempA ;
					end
					prod = prod >> 1 ;
					counter++ ;
				end
				else 
				begin
					counter = 0 ;
				end
			end
        end

end
assign dataOut = prod ;

endmodule
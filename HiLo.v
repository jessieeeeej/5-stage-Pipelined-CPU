`timescale 1ns/1ns
module HiLo( clk, MultuAns, Signal, HiOut, LoOut, reset );
input clk ;
input reset ;
input [1:0] Signal ;
input [63:0] MultuAns ;
output [31:0] HiOut ;
output [31:0] LoOut ;

reg [63:0] HiLo ;

always@( posedge clk or reset )

	begin
	  if ( reset )
	  begin
		HiLo = 64'b0 ;
	  end
	  else if ( Signal == 2'b01 | Signal == 2'b10 )
	  begin
		HiLo = MultuAns ;
	  end
	  
	end

assign HiOut = HiLo[63:32] ;
assign LoOut = HiLo[31:0] ;

endmodule
`timescale 1ns/ 1ns
module ALU(dataA, dataB, Signal, dataOut, reset);
	input reset;
	input [31:0] dataA;
	input [31:0] dataB;
	input [2:0] Signal;
	output [31:0] dataOut;
	  
	wire [31:0] temp;
	wire [31:0] cout;
	wire less;  
	  
	parameter AND = 3'b000; 
	parameter OR  = 3'b001; 
	parameter ADD = 3'b010; 
	parameter SUB = 3'b110;
	parameter SLT = 3'b111; 
	  

	oneALU ALU0( .dataA(dataA[0]), .dataB(dataB[0]), .Signal(Signal), .carryin(Signal[2]), .carryout(cout[0]), .less(less), .Set(), .dataOut(dataOut[0]) );
	oneALU ALU1( .dataA(dataA[1]), .dataB(dataB[1]), .Signal(Signal), .carryin(cout[0]), .carryout(cout[1]), .less(1'b0), .Set(), .dataOut(dataOut[1]) );
	oneALU ALU2( .dataA(dataA[2]), .dataB(dataB[2]), .Signal(Signal), .carryin(cout[1]), .carryout(cout[2]), .less(1'b0), .Set(), .dataOut(dataOut[2]) );
	oneALU ALU3( .dataA(dataA[3]), .dataB(dataB[3]), .Signal(Signal), .carryin(cout[2]), .carryout(cout[3]), .less(1'b0), .Set(), .dataOut(dataOut[3]) );
	oneALU ALU4( .dataA(dataA[4]), .dataB(dataB[4]), .Signal(Signal), .carryin(cout[3]), .carryout(cout[4]), .less(1'b0), .Set(), .dataOut(dataOut[4]) );
	oneALU ALU5( .dataA(dataA[5]), .dataB(dataB[5]), .Signal(Signal), .carryin(cout[4]), .carryout(cout[5]), .less(1'b0), .Set(), .dataOut(dataOut[5]) );
	oneALU ALU6( .dataA(dataA[6]), .dataB(dataB[6]), .Signal(Signal), .carryin(cout[5]), .carryout(cout[6]), .less(1'b0), .Set(), .dataOut(dataOut[6]) );
	oneALU ALU7( .dataA(dataA[7]), .dataB(dataB[7]), .Signal(Signal), .carryin(cout[6]), .carryout(cout[7]), .less(1'b0), .Set(), .dataOut(dataOut[7]) );
	oneALU ALU8( .dataA(dataA[8]), .dataB(dataB[8]), .Signal(Signal), .carryin(cout[7]), .carryout(cout[8]), .less(1'b0), .Set(), .dataOut(dataOut[8]) );
	oneALU ALU9( .dataA(dataA[9]), .dataB(dataB[9]), .Signal(Signal), .carryin(cout[8]), .carryout(cout[9]), .less(1'b0), .Set(), .dataOut(dataOut[9]) );
	oneALU ALU10( .dataA(dataA[10]), .dataB(dataB[10]), .Signal(Signal), .carryin(cout[9]), .carryout(cout[10]), .less(1'b0), .Set(), .dataOut(dataOut[10]) );
	oneALU ALU11( .dataA(dataA[11]), .dataB(dataB[11]), .Signal(Signal), .carryin(cout[10]), .carryout(cout[11]), .less(1'b0), .Set(), .dataOut(dataOut[11]) );
	oneALU ALU12( .dataA(dataA[12]), .dataB(dataB[12]), .Signal(Signal), .carryin(cout[11]), .carryout(cout[12]), .less(1'b0), .Set(), .dataOut(dataOut[12]) );
	oneALU ALU13( .dataA(dataA[13]), .dataB(dataB[13]), .Signal(Signal), .carryin(cout[12]), .carryout(cout[13]), .less(1'b0), .Set(), .dataOut(dataOut[13]) );
	oneALU ALU14( .dataA(dataA[14]), .dataB(dataB[14]), .Signal(Signal), .carryin(cout[13]), .carryout(cout[14]), .less(1'b0), .Set(), .dataOut(dataOut[14]) );
	oneALU ALU15( .dataA(dataA[15]), .dataB(dataB[15]), .Signal(Signal), .carryin(cout[14]), .carryout(cout[15]), .less(1'b0), .Set(), .dataOut(dataOut[15]) );
	oneALU ALU16( .dataA(dataA[16]), .dataB(dataB[16]), .Signal(Signal), .carryin(cout[15]), .carryout(cout[16]), .less(1'b0), .Set(), .dataOut(dataOut[16]) );
	oneALU ALU17( .dataA(dataA[17]), .dataB(dataB[17]), .Signal(Signal), .carryin(cout[16]), .carryout(cout[17]), .less(1'b0), .Set(), .dataOut(dataOut[17]) );
	oneALU ALU18( .dataA(dataA[18]), .dataB(dataB[18]), .Signal(Signal), .carryin(cout[17]), .carryout(cout[18]), .less(1'b0), .Set(), .dataOut(dataOut[18]) );
	oneALU ALU19( .dataA(dataA[19]), .dataB(dataB[19]), .Signal(Signal), .carryin(cout[18]), .carryout(cout[19]), .less(1'b0), .Set(), .dataOut(dataOut[19]) );
	oneALU ALU20( .dataA(dataA[20]), .dataB(dataB[20]), .Signal(Signal), .carryin(cout[19]), .carryout(cout[20]), .less(1'b0), .Set(), .dataOut(dataOut[20]) );
	oneALU ALU21( .dataA(dataA[21]), .dataB(dataB[21]), .Signal(Signal), .carryin(cout[20]), .carryout(cout[21]), .less(1'b0), .Set(), .dataOut(dataOut[21]) );
	oneALU ALU22( .dataA(dataA[22]), .dataB(dataB[22]), .Signal(Signal), .carryin(cout[21]), .carryout(cout[22]), .less(1'b0), .Set(), .dataOut(dataOut[22]) );
	oneALU ALU23( .dataA(dataA[23]), .dataB(dataB[23]), .Signal(Signal), .carryin(cout[22]), .carryout(cout[23]), .less(1'b0), .Set(), .dataOut(dataOut[23]) );
	oneALU ALU24( .dataA(dataA[24]), .dataB(dataB[24]), .Signal(Signal), .carryin(cout[23]), .carryout(cout[24]), .less(1'b0), .Set(), .dataOut(dataOut[24]) );
	oneALU ALU25( .dataA(dataA[25]), .dataB(dataB[25]), .Signal(Signal), .carryin(cout[24]), .carryout(cout[25]), .less(1'b0), .Set(), .dataOut(dataOut[25]) );
	oneALU ALU26( .dataA(dataA[26]), .dataB(dataB[26]), .Signal(Signal), .carryin(cout[25]), .carryout(cout[26]), .less(1'b0), .Set(), .dataOut(dataOut[26]) );
	oneALU ALU27( .dataA(dataA[27]), .dataB(dataB[27]), .Signal(Signal), .carryin(cout[26]), .carryout(cout[27]), .less(1'b0), .Set(), .dataOut(dataOut[27]) );
	oneALU ALU28( .dataA(dataA[28]), .dataB(dataB[28]), .Signal(Signal), .carryin(cout[27]), .carryout(cout[28]), .less(1'b0), .Set(), .dataOut(dataOut[28]) );
	oneALU ALU29( .dataA(dataA[29]), .dataB(dataB[29]), .Signal(Signal), .carryin(cout[28]), .carryout(cout[29]), .less(1'b0), .Set(), .dataOut(dataOut[29]) );
	oneALU ALU30( .dataA(dataA[30]), .dataB(dataB[30]), .Signal(Signal), .carryin(cout[29]), .carryout(cout[30]), .less(1'b0), .Set(), .dataOut(dataOut[30]) );
	oneALU ALU31( .dataA(dataA[31]), .dataB(dataB[31]), .Signal(Signal), .carryin(cout[30]), .carryout(cout[31]), .less(1'b0), .Set(less), .dataOut(dataOut[31]) );


	assign dataOut = reset?32'b0:temp ;

endmodule
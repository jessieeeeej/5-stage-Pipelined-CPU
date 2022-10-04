 `timescale 1ns/1ns
module oneALU( dataA, dataB, Signal, carryin, carryout, less, Set, dataOut );
	input dataA, dataB;
	input [2:0] Signal;
	input carryin;
	output carryout;
	input less;
	output Set;
	output dataOut;
	wire ANDOut;
	wire OROut;
	wire XOROut;
	wire sum;

	and(ANDOut, dataA, dataB);
	or(OROut, dataA, dataB);
	xor(XOROut, dataB, Signal[2]);
	FA fa (.a(dataA), .b(XOROut), .c(carryin), .cout(carryout), .sum(sum));

	assign Set = sum;

	parameter AND = 3'b000; 
	parameter OR  = 3'b001; 
	parameter ADD = 3'b010; 
	parameter SUB = 3'b110;
	parameter SLT = 3'b111;

	assign dataOut = (Signal == AND) ? ANDOut : (Signal == OR) ? OROut : (Signal == ADD) ? sum : (Signal == SUB) ? sum : (Signal == SLT) ? less : 1'bx;    
                  


endmodule
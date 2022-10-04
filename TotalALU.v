`timescale 1ns/1ns
module TotalALU( clk, ALUOp, dataA, dataB, Funct, Output, reset, total, extend_SHT);
input reset ;
input clk ;
input [1:0] ALUOp;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Funct ;
input [6:0] total ;
input [4:0] extend_SHT ;
output [31:0] Output ;

wire [31:0] temp ;

parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;
parameter SLL = 6'b000000;
parameter MULTU = 6'b011001;
parameter MFHI= 6'b010000;
parameter MFLO= 6'b010010;
/*
定義各種訊號
*/
//============================
wire en_MULTU ;
wire [2:0]  SignaltoALU ;
wire [2:0]  SignaltoSHT ;
wire [1:0]  SignaltoMUX ;
wire [31:0] ALUOut, HiOut, LoOut, ShifterOut ;
wire [31:0] dataOut ;
wire [63:0] MultuAns ;
/*
定義各種接線
*/
//============================
//( clk, ALUOp, Funct, SignaltoALU, SignaltoSHT, SignaltoMULTU, SignaltoMUX );
alu_ctl alu_ctl( .clk(clk), .ALUOp(ALUOp), .Funct(Funct), .SignaltoALU(SignaltoALU), .SignaltoSHT(SignaltoSHT), .SignaltoMULTU(en_MULTU), .SignaltoMUX(SignaltoMUX), .total(total) );
ALU ALU( .dataA(dataA), .dataB(dataB), .Signal(SignaltoALU), .dataOut(ALUOut), .reset(reset) );
Multiplier Multiplier( .clk(clk), .dataA(dataA), .dataB(dataB), .Signal(en_MULTU), .dataOut(MultuAns), .reset(reset) );
Shifter Shifter( .dataA(dataB), .dataB(extend_SHT), .Signal(SignaltoSHT), .dataOut(ShifterOut), .reset(reset) );
HiLo HiLo( .clk(clk), .MultuAns(MultuAns), .Signal(SignaltoMUX), .HiOut(HiOut), .LoOut(LoOut), .reset(reset) );
MUX MUX( .ALUOut(ALUOut), .HiOut(HiOut), .LoOut(LoOut), .Shifter(ShifterOut), .Signal(SignaltoMUX), .dataOut(dataOut) );
/*
建立各種module
*/
assign Output = dataOut ;

endmodule
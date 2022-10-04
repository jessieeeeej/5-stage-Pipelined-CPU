 /*
	Title:	ALU Control Unit
	Author: Garfield (Computer System and Architecture Lab, ICE, CYCU)
	Input Port
		1. ALUOp: 控制alu是要用+還是-或是其他指令
		2. Funct: 如果是其他指令則用這邊6碼判斷
	Output Port
		1. ALUOperation: 最後解碼完成之指令
*/

module alu_ctl( clk, ALUOp, Funct, SignaltoALU, SignaltoSHT, SignaltoMULTU, SignaltoMUX, total );
	input clk ;
    input [1:0] ALUOp;
    input [5:0] Funct;
	input [6:0] total ;
	reg [2:0] ALUOperation ;
	reg [1:0] MUXOperation ;
	reg MULTUOperation ;
	reg [6:0] counter ;
	output [2:0] SignaltoALU ;
	output SignaltoMULTU ;
	output [1:0] SignaltoMUX ;
	output [2:0] SignaltoSHT ;

    // symbolic constants for instruction function code
	parameter AND = 6'b100100;
	parameter OR  = 6'b100101;
	parameter ADD = 6'b100000;
	parameter SUB = 6'b100010;
	parameter SLT = 6'b101010;
	parameter SLL = 6'b000000;
	parameter MULTU = 6'b011001;
	parameter MFHI = 6'b010000;
	parameter MFLO = 6'b010010;
	
    // symbolic constants for ALU Operations	
    parameter ALU_and = 3'b000;
    parameter ALU_or  = 3'b001;
    parameter ALU_add = 3'b010;
    parameter ALU_sub = 3'b110;
    parameter ALU_slt = 3'b111;
    parameter SHT_sll = 3'b011;
	parameter MUL_mfhi= 3'b100;
	parameter MUL_mflo = 3'b101;
	
	always @( Funct )
	  begin
		if ( Funct == MULTU )
		begin
		  counter = 0 ;
		end
	end
	
    always @( ALUOp or Funct or posedge clk )
    begin
		MUXOperation = 2'b00 ;
        case ( ALUOp ) 
            2'b00 : ALUOperation = ALU_add;
            2'b01 : ALUOperation = ALU_sub;
            2'b10 : case (Funct) 
                        ADD : ALUOperation = ALU_add;
                        SUB : ALUOperation = ALU_sub;
                        AND : ALUOperation = ALU_and;
                        OR  : ALUOperation = ALU_or;
                        SLT : ALUOperation = ALU_slt;
                        SLL : begin
								if ( total > 0 ) begin
									ALUOperation = ALU_add ;
								end
								else begin
									ALUOperation = SHT_sll;
									MUXOperation = 2'b11 ;
								end
							end
                        MFHI : begin 
								ALUOperation = MUL_mfhi;
								MUXOperation = 2'b01 ;
								end
                        MFLO : begin
								ALUOperation = MUL_mflo;
								MUXOperation = 2'b10 ;
								end
						MULTU : MULTUOperation = 1'b1;
                        default begin
							ALUOperation = 3'bxxx;
							MULTUOperation = 1'b0;
						end
                    endcase
            default begin
				ALUOperation = 3'bxxx;
				MULTUOperation = 1'b0;
			end
        endcase
		
    end
	
	always @( posedge clk )
	begin
				
		if ( MULTUOperation == 1'b1 )
	    begin
			counter = counter + 1 ;
			
			if ( counter == 34 )
			begin
				MULTUOperation = 1'b0; 
				counter = 0 ;
			end
		end
		
	end
	
	assign SignaltoALU = ALUOperation ;
	assign SignaltoMULTU = MULTUOperation ;
	assign SignaltoMUX = MUXOperation ;
	assign SignaltoSHT = ALUOperation ;
	
endmodule


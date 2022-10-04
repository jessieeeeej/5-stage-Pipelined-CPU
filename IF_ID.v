module IF_ID( clk, rst, pc, instr, total, pc_Reg, instr_Reg, total_Reg );

	input [31:0] pc, instr;
	input clk, rst ;
	input [6:0] total ;
	output reg [6:0] total_Reg ;
	output reg [31:0] instr_Reg, pc_Reg;

	always@( posedge clk )
	begin
		if ( rst )
		begin
			instr_Reg <= 0;
			pc_Reg <= 0;
			total_Reg <= 0;
		end
		else
		begin
			instr_Reg <= instr;
			pc_Reg <= pc;
			total_Reg <= total ;
		end
	end
	
endmodule 

module MEM_WB( clk, rst, WB, RD, pc, ADDR, rd_rt, WB_Reg, RD_Reg, pc_Reg, ALU_Reg, rd_rt_Reg );

	input clk, rst;

	input [2:0] WB;

	input [4:0] rd_rt ;
	input [31:0] RD, pc, ADDR;

	output reg [2:0] WB_Reg;

	output reg [31:0] RD_Reg, pc_Reg, ALU_Reg;
	output reg [4:0] rd_rt_Reg;

	always@( posedge clk )
	begin
		if ( rst )
		begin
			WB_Reg <= 0;
			RD_Reg <= 0;
			pc_Reg <= 0;
			ALU_Reg <= 0;
			rd_rt_Reg <= 0;
		end
		else
		begin
			WB_Reg <= WB;
			RD_Reg <= RD;
			pc_Reg <= pc;
			ALU_Reg <= ADDR;
			rd_rt_Reg <= rd_rt ;		
		end
	end

endmodule

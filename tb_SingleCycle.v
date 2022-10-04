/*
	Title: MIPS Single Cycle CPU Testbench
	Author: Selene (Computer System and Architecture Lab, ICE, CYCU) 
*/
module tb_SingleCycle();
	reg clk, rst;
	
	// 設定要執行多少cycle 若執行不完請自行調整
	parameter cycle_count = 9 ;
	
	// 產生時脈，週期：10單位時間
	initial begin
		clk = 1;
		forever #1 clk = ~clk;
	end

	initial begin
		$dumpfile("mips_single.vcd");
		$dumpvars(0,tb_SingleCycle);
		rst = 1'b1;
		/*
			指令資料記憶體，檔名"instr_mem.txt, data_mem.txt"可自行修改
			每一行為1 Byte資料，以兩個十六進位數字表示
			且為Little Endian編碼
		*/
		$readmemh("instr_mem.txt", CPU.InstrMem.mem_array );
		$readmemh("data_mem.txt", CPU.DatMem.mem_array );
		// 設定暫存器初始值，每一行為一筆暫存器資料
		$readmemh("reg.txt", CPU.RegFile.file_array );
		#2;
		rst = 1'b0;
		
	end
	initial begin
		// 一個cycle 10單位時間
		# (100);
		$display( "%d, End of Simulation\n", $time/2-1 );
		$finish;
	end
	
	always @( posedge clk ) begin
		$display( "%d, PC:", $time/2-1, CPU.pc );
		if ( CPU.opcode == 6'd0 && CPU.jumpoffset == 26'd0 && CPU.total_EX == 0 && ($time/2-1) != 0 ) 
			$display( "%d, NOP", $time/2-1 );
		else if ( CPU.opcode == 6'd0 ) 
		begin 
			$display( "%d, wd: %d", $time/2-1, CPU.rfile_wd );
			if ( CPU.funct == 6'd32 ) $display( "%d, ADD", $time/2-1 );
			else if ( CPU.funct == 6'd34 ) $display( "%d, SUB", $time/2-1 );
			else if ( CPU.funct == 6'd36 ) $display( "%d, AND", $time/2-1 );
			else if ( CPU.funct == 6'd37 ) $display( "%d, OR", $time/2-1 );
			else if ( CPU.funct == 6'd42 ) $display( "%d, SLT", $time/2-1 );
			else if ( CPU.funct == 6'd25 ) $display( "%d, MULTU", $time/2-1 );
			else if ( CPU.funct == 6'd16 ) $display( "%d, MFHI", $time/2-1 );
			else if ( CPU.funct == 6'd18 ) $display( "%d, MFLO", $time/2-1 );
			else if ( CPU.funct == 6'd0 && ($time/2-1) != 0 )
			begin
				if ( CPU.total_EX > 0 )
					$display( "%d, //BUBBLE//", $time/2-1 );
				else
					$display( "%d, SLL", $time/2-1 );
			end
		end
		else if ( CPU.opcode == 6'd35 ) $display( "%d, LW", $time/2-1 );
		else if ( CPU.opcode == 6'd43 ) $display( "%d, SW", $time/2-1 );
		else if ( CPU.opcode == 6'd4 ) $display( "%d, BEQ", $time/2-1 );
		else if ( CPU.opcode == 6'd3 ) $display( "%d, JAL", $time/2-1 );
		else if ( CPU.opcode == 6'd2 ) $display( "%d, J", $time/2-1 );
		else if ( CPU.opcode == 6'd9 ) $display( "%d, ADDIU", $time/2-1 );
		
		$display( "\n" );
	end
	
	mips_pipeline CPU( clk, rst );
	
endmodule

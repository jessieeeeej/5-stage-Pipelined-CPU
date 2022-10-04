module bra_equ( RD1, RD2, Zero );

	input [31:0] RD1, RD2;
	output Zero;
	assign Zero = (RD1 == RD2);

endmodule
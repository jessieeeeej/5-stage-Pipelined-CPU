`timescale 1ns/1ns
module m21( dataA,dataB,S,dataOut);

output dataOut ;
input dataA, dataB, S ;

assign dataOut = (S) ? dataB : dataA ;

endmodule 
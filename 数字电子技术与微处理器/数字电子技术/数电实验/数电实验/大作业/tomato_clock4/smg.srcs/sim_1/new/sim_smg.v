`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/08 16:52:52
// Design Name: 
// Module Name: sim_smg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sim_smg;

reg clk = 1;
always 
#1 clk=~clk;

tomatoclock uut(
.clk(clk),
.rst(1)
);
endmodule

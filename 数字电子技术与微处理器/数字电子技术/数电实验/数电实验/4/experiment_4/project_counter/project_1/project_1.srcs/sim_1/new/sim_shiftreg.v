`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/26 01:25:21
// Design Name: 
// Module Name: sim_trans38
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


module sim_shiftreg;
reg rst,clk;
integer max;

initial begin
rst = 1;
clk = 0;
rst =0;
max = 100;
end

always
begin
  #1 clk = ~clk;
end

always
begin
  #350 rst = ~rst;
end

initial
#800 $finish;


counter uut(
.clk(clk),
.rst(rst),
.max(max));

//always
//begin
//  #5 $display("%d, %d", uut.q, uut.qbar);
//end

endmodule

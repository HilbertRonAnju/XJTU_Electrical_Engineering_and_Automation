`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/03 19:14:48
// Design Name: 
// Module Name: sim_sec
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


module sim_sec;
parameter PERIOD=10;
reg rst,clk,sec;
initial begin
sec=0;
rst=0;
end
initial begin 
clk=0;
forever #(PERIOD/2) clk=~clk;
end
sec uut
(
.clk(clk),
.rst(rst),
.sec(sec)
);
endmodule

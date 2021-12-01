`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/03 19:28:00
// Design Name: 
// Module Name: top_file
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


module top_file(
input  wire clk,
input wire rst_n,
output wire [7:0]out
//output wire [3:0]out_h
);
wire connection;
sec u1(
.clk(clk),
.rst(rst_n),
.sec(connection)
);
m60_counter u2(
.clk(clk),
.rst_n(rst_n),
.pulse_in(connection),
.cnt(out[7:0])
);
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/11 00:29:52
// Design Name: 
// Module Name: ding
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


module ding(
    input rst_n,
    input clk,
    output [7:0] y
    );wire I;
    mai u1(
    .clk(clk),
   . rst_n(rst_n),
    .sec_pule(I));
    daoji6 u2(
    .rst_n(rst_n),
    .pul_in(I),
    .y(y));
    
endmodule

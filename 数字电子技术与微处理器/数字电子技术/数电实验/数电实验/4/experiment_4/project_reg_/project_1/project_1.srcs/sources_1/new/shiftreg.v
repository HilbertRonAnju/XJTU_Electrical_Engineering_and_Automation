`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/01 10:55:18
// Design Name: 
// Module Name: shiftreg
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


module shiftreg(
output wire [dig-1:0] out,
input in,
input clk,
input rst,
input en
    );
    parameter dig = 8;
    dbar regs[dig-1:0](.q({out}),.d({out[dig-2:0], in}), .cp(clk), .en(en),.rst(rst));
     
endmodule

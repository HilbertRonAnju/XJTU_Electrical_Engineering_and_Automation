`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/03 18:59:15
// Design Name: 
// Module Name: sec
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


module pwmctrl
(
input wire clk,
input linein,
output lineout,
input [7:0] pwmctrl
);
    reg [7:0]count = 0;
    always@(posedge clk) count = count + 1;
    assign lineout = count < pwmctrl?linein:1'bz;

endmodule


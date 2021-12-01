`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/22 00:23:52
// Design Name: 
// Module Name: clkdiv
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


module clkdiv(
    input clk,
    input rst,
    output [2:0] bitcnt
    );
    reg [19:0]clkdiv=0;
    always@(posedge clk or posedge rst)
    begin
    if(rst==1)
    clkdiv<=0;
    
    else
    clkdiv<=clkdiv+1;
    end
    assign bitcnt=clkdiv[19:17];
endmodule

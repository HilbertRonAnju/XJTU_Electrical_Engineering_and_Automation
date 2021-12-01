`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/09 17:54:21
// Design Name: 
// Module Name: muldisp
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

module muldisp #(parameter LEN = 2)
(
input clkin,
input [4*LEN-1:0] num,
input [LEN-1:0]dotlist,
output [7:0] disp,
output reg [LEN-1:0] en
    );
    wire clk;
    reg dot;
    reg [3:0] number=0;
    reg [3:0] count=0;
    
    smg dispout(
    .number(number),
    .dot(dot),
    .display(disp[7:0])
    );
    sec clock(
    .clk(clkin),
    .rst(1),
    .sec(clk)
    );
    
    always@(posedge clk) begin
    count = count + 1;
    if(count > 8) count = 0;
    number = num[4*count+3-:4];
    dot = dotlist[count];
    en = 1 << count;
    end
    
endmodule

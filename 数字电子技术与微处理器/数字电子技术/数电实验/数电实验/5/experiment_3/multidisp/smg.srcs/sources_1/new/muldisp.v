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

module muldisp #(parameter LEN = 8,
parameter [31:0] NUM = 32'h12345678)
(
input clkin,
output [15:0] disp,
output reg [LEN-1:0] en
    );
    wire clk;
    reg [3:0] number=0;
    reg [3:0] count=0;
    
    assign disp[15:8] = disp[7:0];
    
    smg dispout(
    .number(number),
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
    number = NUM[4*count+3-:4];
    en = 1 << (LEN-1-count);
    end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/22 00:23:06
// Design Name: 
// Module Name: select
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


module select(
    input rst,
    input clk,
    input [2:0] bitcnt,
    output reg [3:0] en
    );
    always @(posedge clk or posedge rst)
    begin
    if(rst==1)
    en<=0;
    else
      case(bitcnt)
      3'b000: en=4'b0001;
      3'b001: en=4'b0010;
      3'b010: en=4'b0100;
      3'b011: en=4'b1000;
      default: en=4'b0000;
      endcase
     end
endmodule

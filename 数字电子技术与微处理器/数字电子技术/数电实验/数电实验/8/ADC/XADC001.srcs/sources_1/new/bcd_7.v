`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/22 00:23:26
// Design Name: 
// Module Name: bcd_7
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


module bcd_7(
    input [3:0] a,
    input clk,
    input rst,
    output reg [6:0] y
    );
    always @(posedge clk)
    begin
    if (rst==1)
       y=7'b1111111;
    else
      case(a)
      4'b0000:y=7'b1111110;
      4'b0001:y=7'b0110000;
      4'b0010:y=7'b1101101;
      4'b0011:y=7'b1111001;
      4'b0100:y=7'b0110011;
      4'b0101:y=7'b1011011;
      4'b0110:y=7'b1011111;
      4'b0111:y=7'b1110000;
      4'b1000:y=7'b1111111;
      4'b1001:y=7'b1111011;
      4'b1010:y=7'b1110111;
      4'b1011:y=7'b0011111;
      4'b1100:y=7'b0001101;
      4'b1101:y=7'b0111101;
      4'b1110:y=7'b1001111;
      4'b1111:y=7'b1000111;
      default:y=7'b0000000;
      endcase
      
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/29 00:22:05
// Design Name: 
// Module Name: edgecounter
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


module edgecounter(
input rst_n,
input ena,
input clk,
input in,
output reg [6:0] a_to_g,
output reg [1:0] an
);

reg [7:0] count = 0;
reg [7:0] x = 0;
always @(negedge in or negedge rst_n)
if(!rst_n) count <= 0;
else if(ena) count = count + 1;

function [7:0] binary2bcd(input [7:0] b);
begin
    binary2bcd[3:0] = b % 10;
    binary2bcd[7:4] = b / 10;
 end
endfunction

always@(count) x = binary2bcd(count);

reg[17:0]clkdiv;
always @(posedge clk or negedge rst_n)begin
   if(!rst_n)
      clkdiv<=19'd0;
    else
      clkdiv<=clkdiv+1;
end
wire bitcnt;
assign bitcnt=clkdiv[17];
always @* begin
    if(!rst_n)
        an=2'd0;
     else
        an=2'd0;
        an[bitcnt]=1;
end
reg [3:0]digit;     
always@(*)begin
   if(!rst_n)
      digit=4'd0;
   else
      case(bitcnt)
        2'd0:digit=x[3:0];
        2'd1:digit=x[7:4];
        2'd2:digit=x[11:8];
        2'd3:digit=x[15:12];
      default:digit=4'd0;
      endcase
end

always @(*)
     if(!rst_n)
        a_to_g=7'b1111111;
     else
        case(digit)
        0:a_to_g=7'b1111110;
        1:a_to_g=7'b0110000;
        2:a_to_g=7'b1101101;
        3:a_to_g=7'b1111001;
        4:a_to_g=7'b0110011;
        5:a_to_g=7'b1011011;
        6:a_to_g=7'b1011111;
        7:a_to_g=7'b1110000;
        8:a_to_g=7'b1111111;
        9:a_to_g=7'b1111011;
        10:a_to_g=7'b1111111;
        4'b1111:a_to_g=7'b0000000;
        default a_to_g=7'b1111110;
        endcase 
    
endmodule

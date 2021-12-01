`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/24 17:40:32
// Design Name: 
// Module Name: LCD
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


module LCD(
    input rst_n,
    input [3:0] x_one,
    input [3:0] x_tow,
    input [3:0] x_three,
    input [3:0] x_four,
    input [3:0] x_five,
    input [3:0] x_six,
    input [3:0] x_seven,
    input [3:0] x_eight,
    input clk,
    output reg [7:0] an,
    output reg [13:0] a_to_g
    );
reg[18:0]clkdiv;
assign rst_n = 1;
always @(posedge clk or negedge rst_n)begin
   if(!rst_n)
      clkdiv<=19'd0;
    else
      clkdiv<=clkdiv+1;
end
wire [2:0]bitcnt;
assign bitcnt=clkdiv[18:16];
always @* begin
    if(!rst_n)
        an=8'd0;
     else
        an=8'd0;
        an[bitcnt]=1;
end
reg [3:0]digit;     
always@(*)begin
   if(!rst_n)
      digit=4'd0;
   else
      case(bitcnt)
        3'd0:digit=x_one[3:0];
        3'd1:digit=x_tow[3:0];
        3'd2:digit=x_three[3:0];
        3'd3:digit=x_four[3:0];
        3'd4:digit=x_five[3:0];
        3'd5:digit=x_six[3:0];
        3'd6:digit=x_seven[3:0];
        3'd7:digit=x_eight[3:0];
      default:digit=4'd0;
      endcase
end
always @(*) begin
     if(!rst_n)
        a_to_g=7'b1111111;
     else
        case(digit)
        0:a_to_g=14'b11111101111110;
        1:a_to_g=14'b01100000110000;
        2:a_to_g=14'b11011011101101;
        3:a_to_g=14'b11110011111001;
        4:a_to_g=14'b01100110110011;
        5:a_to_g=14'b10110111011011;
        6:a_to_g=14'b10111111011111;
        7:a_to_g=14'b11100001110000;
        8:a_to_g=14'b11111111111111;
        9:a_to_g=14'b11110111111011;
        4'b1111:a_to_g=14'b00000000000000;
        default a_to_g=14'b11111101111110;
        endcase 
end
endmodule

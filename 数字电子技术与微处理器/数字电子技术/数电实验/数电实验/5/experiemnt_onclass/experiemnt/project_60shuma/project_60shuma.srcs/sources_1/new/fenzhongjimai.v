`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/11 08:18:18
// Design Name: 
// Module Name: fenzhongjimai
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


module fenzhongjimai(
    input clk,
    input rst_n,
    output reg [1:0] wx,
    output reg [6:0] y
    );wire [7:0] I;

ding u5(
.rst_n(rst_n),
.clk(clk),
.y(I));

initial
begin
y=0;
wx=0;

end

reg [19:0] clkdiv;
initial
begin
clkdiv=0;
end
always @(posedge clk or negedge rst_n)
begin
if (!rst_n)
clkdiv<=0;
else
clkdiv<=clkdiv+1;
end

wire bitcnt;
assign bitcnt=clkdiv[19];

always @(*)
begin
if(!rst_n)
wx=0;
else
wx=0;
wx[bitcnt]=1;
end

reg [3:0]digit;
always@*
begin
if(!rst_n)
digit=0;
else 
case (bitcnt)
1'd0:digit=I[3:0];
1'd1:digit=I[7:4];

default:digit=4'd0;
endcase
end

always@(*)begin
if (!rst_n)
begin
y=7'b1111111;

end
else 
case(digit)
0:y=7'b1111110;
1:y=7'b0110000;
2:y=7'b1101101;
3:y=7'b1111001;
4:y=7'b0110011;
5:y=7'b1011011;
6:y=7'b1011111;
7:y=7'b1110000;
8:y=7'b1111111;
9:y=7'b1111011;
default:y=7'b1111110;
endcase

end
endmodule

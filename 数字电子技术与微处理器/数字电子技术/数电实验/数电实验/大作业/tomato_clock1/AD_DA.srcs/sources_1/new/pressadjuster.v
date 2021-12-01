`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/01 01:20:40
// Design Name: 
// Module Name: pressadjuster
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


module pressadjuster(
input minadj,
input secadj,
input timerst,
input en,
input clk,
output wire[15:0] numout
    );

reg [6:0] min = 0, sec = 0;
function [7:0] binary2bcd(input [7:0] b);
begin
    binary2bcd[3:0] = b % 10;
    binary2bcd[7:4] = b / 10;
 end
endfunction
assign numout = {binary2bcd(min), binary2bcd(sec)};

always@(posedge clk)
if(en)

if(timerst)
if(min == 0 && sec == 0) min = 25;
else
begin
min = 0;
sec = 0;
end

else if(minadj)
if(min > 99) min = 0;
else min = min + 1;

else if(secadj)
if(min > 99) sec = 0;
else sec = sec + 1;

endmodule

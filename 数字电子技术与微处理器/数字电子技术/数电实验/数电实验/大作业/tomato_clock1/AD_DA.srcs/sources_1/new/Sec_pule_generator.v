`timescale 1ns / 1ps
module Sec_pule_generator#(parameter N = 1000000)(
input clk,
output reg sec_pule
    );
parameter M=19;
reg [M:0] cnt;
initial cnt=20'b0;
always@(posedge clk)
begin
if(cnt==N)
cnt<=0;
else
cnt<=cnt+1;
end
always@(posedge clk)
begin
if(cnt==N)
sec_pule<=1;
else
sec_pule<=0;
end
endmodule


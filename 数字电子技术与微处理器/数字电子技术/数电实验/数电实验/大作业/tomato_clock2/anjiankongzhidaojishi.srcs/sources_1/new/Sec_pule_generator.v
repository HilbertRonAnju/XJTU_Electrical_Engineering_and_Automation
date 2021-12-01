`timescale 1ns / 1ps
module Sec_pule_generator(
input clk,
output reg sec_pule
    );
parameter M=24;
reg [M:0] cnt;
initial cnt=25'b0;
always@(posedge clk)
begin
if(cnt==10000000)
cnt<=0;
else
cnt<=cnt+1;
end
always@(posedge clk)
begin
if(cnt==10000000)
sec_pule<=1;
else
sec_pule<=0;
end
endmodule

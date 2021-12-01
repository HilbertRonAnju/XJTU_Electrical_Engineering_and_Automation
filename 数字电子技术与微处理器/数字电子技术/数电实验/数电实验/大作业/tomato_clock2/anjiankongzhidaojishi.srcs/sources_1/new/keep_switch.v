`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/24 18:43:18
// Design Name: 
// Module Name: keep_switch
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


module keep_switch(
//    input pluse,
//    input jian,
    input key1,
    input key2,
    input min_to_sec,
    input w_to_r,
    input clk,
    input AdjustTime,
    output Key1,
    output Key2,
    output Min,
    output Sec,
    output W_to_R,
    output m_to_s,
//    output pp,
//    output jj,
    output AdT
    );
reg clk1_0,clk1_1;
reg clk2_0,clk2_1;
reg clk3_0,clk3_1;
reg clk4_0,clk4_1;
reg clk5_0,clk5_1;
reg clk6_0,clk6_1;
reg clk7_0,clk7_1;
initial begin
clk1_0=1;clk1_1=0;
clk2_0=1;clk2_1=0;
clk3_0=1;clk3_1=0;
clk4_0=0;clk4_1=0;
clk5_0=1;clk5_1=0;
clk6_0=1;clk6_1=0;
clk7_0=1;clk7_1=0;
end
always@(posedge clk)begin
   clk1_0<=key1;
   clk1_1<=clk1_0;
   clk2_0<=key2;
   clk2_1<=clk2_0;
   clk3_0<=min_to_sec;
   clk3_1<=clk3_0;
   clk4_0<=AdjustTime;
   clk4_1<=clk4_0;
   clk5_0<=w_to_r;
   clk5_1<=clk5_0;
//   clk6_0<=pluse;
//   clk6_1<=clk6_0;
//   clk7_0<=jian;
//   clk7_1<=clk7_0;
end
assign Key1=clk1_0&(~clk1_1);
assign Key2=clk2_0&(~clk2_1);
assign m_to_s=clk3_0&(~clk3_1);
assign AdT=clk4_0&(~clk4_1);
assign W_to_R=clk5_0&(~clk5_1);
//assign pp=clk6_0&(~clk6_1);
//assign jj=clk7_0&(~clk7_1);
endmodule

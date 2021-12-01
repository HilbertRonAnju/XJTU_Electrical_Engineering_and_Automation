`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/01 03:03:22
// Design Name: 
// Module Name: simd
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/26 01:25:21
// Design Name: 
// Module Name: sim_trans38
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


module simd;
reg d,clk,rd;

initial begin
d = 1;
clk = 1;
rd = 1;
#1 rd = 0;
end

always
begin
  #12 d = ~d;
end

always
begin
  #10 clk = ~clk;
end

initial
#400 $finish;


d uut(
.d(d),
.cp(clk),
.rd(rd));

always
begin
  #5 $display("%d, %d", uut.q, uut.qbar);
end


endmodule

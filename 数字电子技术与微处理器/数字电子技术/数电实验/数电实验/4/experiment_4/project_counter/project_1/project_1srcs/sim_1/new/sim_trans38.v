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


module sim_trans38;
reg d,clk,rst,en;

initial begin
d = 1;
clk = 1;
rst = 1;
en = 1;
end

always
begin
  #12 d = ~d;
end

always
begin
  #10 clk = ~clk;
end


always
begin
  #105 rst = ~rst;
end

always
begin
  #200 en = ~en;
end

initial
#800 $finish;


dbar uut(
.d(d),
.cp(clk),
.rst(rst),
.en(en));

always
begin
  #5 $display("%d, %d", uut.q, uut.qbar);
end

endmodule

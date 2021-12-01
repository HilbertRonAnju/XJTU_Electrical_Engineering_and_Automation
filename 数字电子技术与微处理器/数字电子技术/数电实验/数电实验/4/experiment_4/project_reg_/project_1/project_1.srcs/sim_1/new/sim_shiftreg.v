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


module sim_shiftreg;
reg d,clk,rst,en;

initial begin
d = 1;
clk = 1;
rst = 1;
en = 1;
end

always
begin
  #10 d = ~d;
end

initial
begin
#5
while(1)
  #10 clk = ~clk;
end


always
begin
  #105 rst = ~rst;
end

initial
#800 $finish;


shiftreg uut(
.in(d),
.clk(clk),
.rst(rst),
.en(en));

//always
//begin
//  #5 $display("%d, %d", uut.q, uut.qbar);
//end

endmodule

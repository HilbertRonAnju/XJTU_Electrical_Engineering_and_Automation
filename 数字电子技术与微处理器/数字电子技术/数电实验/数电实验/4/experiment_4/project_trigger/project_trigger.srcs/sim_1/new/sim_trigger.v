`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/01 22:06:25
// Design Name: 
// Module Name: sim_trigger
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


module sim_trigger;
reg d,clk,rst,en;

initial begin
d = 1;
clk = 1;
rst = 1;
en = 1;
end

always
begin
  #120 en = ~en;
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


trigger uut(
.d(d),
.cp(clk),
.rst(rst),
.en(en));

endmodule

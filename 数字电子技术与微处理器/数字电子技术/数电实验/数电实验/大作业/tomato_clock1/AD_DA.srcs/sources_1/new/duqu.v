`timescale 1ns / 1ps
module duqu(
input clk,
input rst,
input [15:0]do_out,
input drdy_out,
output reg [7:0]led
    );
always @(posedge clk or posedge rst)
if(rst)
     led<=12'b0;
else if(drdy_out==1)
     led<=do_out[15:8];
endmodule

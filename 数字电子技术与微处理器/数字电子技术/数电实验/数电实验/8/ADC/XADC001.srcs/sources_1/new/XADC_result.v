`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/28 09:33:01
// Design Name: 
// Module Name: XADC_result
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


module XADC_result(
    input clk,
    input [15:0] do_out,
    input drdy_out,
    input rst,
    output reg [19:0] v_out=20'd0
    );
    always @ (posedge clk)
    begin
    if (drdy_out==1)
        begin
        v_out [15:0]<=do_out[15:0];
        end
    else if (rst==1)
        v_out<=0;
    else 
        v_out<=v_out;
    end
    
endmodule

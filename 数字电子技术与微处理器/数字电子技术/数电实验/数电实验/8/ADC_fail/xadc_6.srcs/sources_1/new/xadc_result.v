`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/30 21:15:13
// Design Name: 
// Module Name: xadc_result
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


module xadc_result(
    input clk,
    input rst_n,
    
    input [15:0]do_out,
    input drdy_out,
    
    output reg [11:0]led
    );
    
    always@(posedge clk or negedge rst_n)
    begin
        if(rst_n==0)
        begin
            led<=12'b0;
        end
        else
        begin
            led<= do_out[15:4];
        end
    end
    
endmodule

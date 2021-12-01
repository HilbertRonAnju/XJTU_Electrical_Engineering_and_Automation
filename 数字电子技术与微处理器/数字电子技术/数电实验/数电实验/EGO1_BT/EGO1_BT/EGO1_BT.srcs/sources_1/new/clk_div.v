`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/31 09:55:21
// Design Name: 
// Module Name: clk_div
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
//时钟分频模块，按照波特率输出时钟信号
module clk_div(
    input clk,
    output reg clk_out
    );
    localparam Baud_Rate=9600;
    localparam div_num='d100_000_000/Baud_Rate;
    reg[15:0]num;
    
    always @(posedge clk)
    begin
        if(num==div_num)
        begin
            num<=0;
            clk_out<=1;
        end
        else
        begin
            num<=num+1;
            clk_out<=0;
        end
    end
endmodule

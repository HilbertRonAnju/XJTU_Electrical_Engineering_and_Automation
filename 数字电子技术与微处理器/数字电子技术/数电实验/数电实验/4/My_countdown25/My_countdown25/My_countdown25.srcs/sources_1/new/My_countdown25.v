`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/04 09:26:28
// Design Name: 
// Module Name: My_countdown25
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


module My_countdown25(
    input clk,
    input rst_n,
    output reg [7:4]Y2,
    output reg [3:0]Y1
    );
    
    wire clko;
    
    My_clkdiv(
    .clk(clk),
    .rst(),
    .clko(clko)
    );
    
    parameter N=100000000;
    integer cnt;
    always @(posedge clko or negedge rst_n)
    begin
    if(rst_n==0)
    begin
    Y1=5;
    Y2=2;
    end
    else if(Y2==0&&Y1==0)
    begin
    Y1=5;Y2=2;
    end
    else if(Y1==0)
        begin
        Y2=Y2-1;
        Y1=9;
        end
    else
    Y1=Y1-1;
    end
endmodule

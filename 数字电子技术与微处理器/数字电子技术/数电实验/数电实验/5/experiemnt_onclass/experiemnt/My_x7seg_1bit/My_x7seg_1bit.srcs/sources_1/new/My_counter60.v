`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/11 09:51:55
// Design Name: 
// Module Name: My_counter60
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


module My_counter60(
    input clk,
    input rst_n,
    output reg [7:4]Y3,
    output reg [3:0]Y2,
    output reg [3:0]Y1,
    output reg [3:0]Y0
    );
    
    wire clkk;
    
    My_clkd u00(
    .clk(clk),
    .rst(),
    .clko(clkk)
    );
    
    integer cnt;
    always @(posedge clkk or negedge rst_n)
    begin
    if(rst_n==0)
    begin
    Y3<=2;
    Y2<=4;
    Y1<=5;
    Y0<=9;
    end
    else if(Y1==0&&Y0==0)
    begin
    if(Y3==0&&Y2==0)
    begin
    Y3<=2;
    Y2<=4;
    Y1<=5;
    Y0<=9;
    end
    else if(Y2==0)
        begin
        Y3=Y3-1;
        Y2=9;
        Y1=5;
        Y0=9;
        end
    else
    Y2=Y2-1;
    Y1=5;
    Y0=9;
    end
    else if(Y0==0)
        begin
        Y1<=Y1-1;
        Y0<=9;
        end
    else
    Y0<=Y0-1;
    end
endmodule
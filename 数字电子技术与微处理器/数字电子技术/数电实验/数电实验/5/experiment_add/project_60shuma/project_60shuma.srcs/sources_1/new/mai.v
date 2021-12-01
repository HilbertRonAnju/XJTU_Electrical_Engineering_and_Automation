`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/01 12:42:18
// Design Name: 
// Module Name: mai
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


module mai(
    input clk,
    input rst_n,
    output reg sec_pule
    );
    reg [25:0] n;
    initial n=0;
   initial  sec_pule=0;
    always@(posedge clk or negedge rst_n)
    begin
    if(!rst_n)
    n<=0;
    else if(n==50000001)
    n<=1;
    else
    n<=n+1;
    end
    always@(posedge clk)
    begin
    if (n==50000000)
    sec_pule<=!sec_pule;
    else
    sec_pule<=sec_pule;
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/03 18:59:15
// Design Name: 
// Module Name: sec
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


module sec#(parameter WIDTH=27)
(
input wire clk,
input wire rst,
output reg sec
);
    reg [26:0]count;
    initial begin 
    count=0;
    sec=0;
    end
    always@(posedge clk or negedge rst) 
    begin
    if(!rst)count<=0;
    else if(count==50000000)
           begin
           count<=0;
           sec<=~sec;
           end
    else count<=count+1;
    end
endmodule

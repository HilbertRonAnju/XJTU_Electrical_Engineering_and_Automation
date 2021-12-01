`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/01 02:39:49
// Design Name: 
// Module Name: dbar
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




module counter(
input clk,
    input rst,
    input [WIDTH-1:0] max,
    output reg sec
    );
    parameter WIDTH = 31;
    reg [WIDTH-1:0] count;
    initial
    sec = 0;
    
    always
    @(negedge clk) 
    begin
    count = count + 1;
     if(count > max)
     begin
        count <= 0;
        sec <= 1;
        #1 sec = 0;
        end
     end
    
    always
      @(negedge rst) count = 0;
    
endmodule

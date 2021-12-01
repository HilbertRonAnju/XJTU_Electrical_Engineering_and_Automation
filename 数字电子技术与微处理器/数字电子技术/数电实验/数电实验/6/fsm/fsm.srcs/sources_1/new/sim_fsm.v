`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/16 21:36:32
// Design Name: 
// Module Name: sim_fsm
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


module sim_fsm(
output reg clk = 0,
output reg [1:0] key = 0
    );
    
    fsm u1(
    .clk(clk),
    .key1(key[0]),
    .key2(key[1]));
    
    always
    #1 clk = !clk;
    
    initial
    #0.5
    while(1)
    begin
    #2 key[0] = $random;
    key[1] = !key[0];
    end
    
    initial
    #100 $stop;
endmodule

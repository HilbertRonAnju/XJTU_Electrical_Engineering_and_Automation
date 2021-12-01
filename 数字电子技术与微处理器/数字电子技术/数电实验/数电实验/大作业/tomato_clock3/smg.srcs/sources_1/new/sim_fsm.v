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
output reg keyIn = 0
    );
    
    top #(1)
    u1(
    .clk(clk),
    .keyIn(keyIn));
    
    always
    #1 clk = !clk;
    
    always begin
    #(200 + $random %200)
    repeat(20) #1 keyIn = $random;
    keyIn = 1;
    #(200 + $random %100)
    repeat(20) #1 keyIn = $random;
    keyIn = 0;
    end
    
    initial
    #10000 $stop;
endmodule

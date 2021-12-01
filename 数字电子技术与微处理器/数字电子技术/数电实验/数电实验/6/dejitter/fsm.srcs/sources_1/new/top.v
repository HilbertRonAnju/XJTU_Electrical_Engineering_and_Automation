`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/16 22:30:39
// Design Name: 
// Module Name: top
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


module top#(parameter DEBUG = 0) (
input clk,
input keyIn,
input keyOut
    );
    wire clk100ms, keyDejitter;
    
     sec
     #(.MAX((DEBUG == 1)?50:5_000_000)) clklow
     (
     .clk(clk),
     .rst(1),
     .sec(clk100ms));
    
    fsm trigger(
    .clk(clk),
    .clk100ms(clk100ms),
    .keyIn(keyIn),
    .keyOut(keyDejitter));
    
    differenciator diff(
    .clk(clk),
    .NumIn(keyDejitter),
    .NumOut(keyOut));
    
endmodule

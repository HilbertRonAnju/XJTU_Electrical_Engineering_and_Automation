`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/16 20:20:45
// Design Name: 
// Module Name: fsm
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


module fsm#(parameter DEBUG = 0) 
(
input clk,
input clk100ms,
input keyIn,
output keyOut
    );
    
    parameter [1:0] IDLE = 0, RESPOND = 1,PRESSED = 2;
    reg [1:0] cstate = IDLE, nstate = IDLE;
    wire keyHold;
    
    always @(posedge clk)
    cstate = nstate;
    
    always @(posedge clk100ms)
    if(keyIn == 1)
    if(cstate == IDLE) nstate = RESPOND;
     else nstate = PRESSED;
    else nstate = IDLE;
    
    assign keyOut = (cstate == RESPOND)?1:0;
endmodule

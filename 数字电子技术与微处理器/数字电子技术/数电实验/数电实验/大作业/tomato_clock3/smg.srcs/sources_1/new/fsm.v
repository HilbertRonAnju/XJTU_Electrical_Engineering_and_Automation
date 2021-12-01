`timescale 1ns / 1ps
// °´¼üÏû¶¶Ä£¿é
module ButtonEdgeDetect#(parameter DEBUG = 0) 
(
    input clk,
    input clk100ms,
    input keyIn,
    output keyOut
    );
    
    parameter IDLE = 0, PRESSED = 1;
    reg [1:0] cstate = IDLE, nstate = IDLE;
    wire keyHold;
    
    always @(posedge clk)
    cstate <= nstate;
    
    always @(posedge clk100ms)
    if(keyIn == 1) 
        nstate <= PRESSED;
    else 
        nstate <= IDLE;
    
    assign keyOut = (cstate == PRESSED)?1:0;
endmodule

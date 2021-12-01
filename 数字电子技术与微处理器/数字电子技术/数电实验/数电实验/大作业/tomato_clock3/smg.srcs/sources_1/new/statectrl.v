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


module statectrl(
input clk,
input key1,
input key2,
input interrupt,
output cnt_en,load
    );
    parameter IDLE = 2'b00,
    S1 = 2'b01,
    S2 = 2'b10;
    reg [1:0] cstate = IDLE, nstate = IDLE;
    
    always @(posedge clk)
    cstate <= nstate;
    
    always @(key1, key2, interrupt)
    if((cstate == IDLE) && (key1 == 1)) nstate = S1;
    else if((cstate == S1) && (key1 == 1)) nstate = S2;
    else if((cstate == S2) && (key1 == 1)) nstate = S1;
    else if((cstate == S2) && (key2 == 1)) nstate = IDLE;
    else if(interrupt == 1) nstate = IDLE;
    else nstate = cstate;
    
    assign cnt_en = (cstate == S1)?1:0;
    assign load = (cstate == IDLE)?1:0;
endmodule

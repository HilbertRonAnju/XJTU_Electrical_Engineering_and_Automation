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


module differenciator(
input clk,
input NumIn,
input NumOut
    );
    
    reg cstate = 0, nstate = 0;
    always @(posedge clk)
    cstate = nstate;
    
    always @(posedge clk)
    nstate = NumIn;
    
    assign NumOut = (cstate == 0) && (nstate == 1)?1:0;
    
endmodule

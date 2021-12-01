`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/28 10:03:58
// Design Name: 
// Module Name: BCD_16
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


module BCD_16(
    input [19:0] v_out,
    output reg [15:0] bcd=0
    );
    always @ (*)
    begin
    bcd<=v_out[19:4];
    end
    
endmodule

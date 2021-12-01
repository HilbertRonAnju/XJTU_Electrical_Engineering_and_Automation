`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/16 14:04:48
// Design Name: 
// Module Name: tomatoclock
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


module tomatoclock(
    input clk,
    input rst,
    input [5:0] switches,
    output [15:0] disp,
    output [7:0] en
    );
    
    wire [7:0] workinitial, idleinitial;
    timeadjust #(.at256(128), .b(0))
    idleajust(
    .switchset(switches[5:3]),
    .return(idleinitial)
    );
    
    timeadjust  #(.at256(640), .b(14))
    workadjust(
    .switchset(switches[2:0]),
    .return(workinitial)
    );
    
 m60_counter work(
    .COUNTDOWN(workinitial),
    .clk(clk),
    .rst(rst),
    .disp(disp[7:0]),
    .en(en[3:0])
    );
    
  m60_counter idle(
    .COUNTDOWN(idleinitial),
    .clk(clk),
    .rst(!rst),
    .disp(disp[15:8]),
    .en(en[7:4])
    );
    
endmodule

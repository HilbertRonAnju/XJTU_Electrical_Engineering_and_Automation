`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/01 22:05:34
// Design Name: 
// Module Name: trigger
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


module trigger(

    output reg q,
    output qbar,
    input d,
    input cp,
    input rst,
    input en
    );
    assign qbar = ~q;
    always
    @(posedge cp) 
     if(en == 1)
        q = d;
    always
      @(negedge rst) q = 0;
    
endmodule

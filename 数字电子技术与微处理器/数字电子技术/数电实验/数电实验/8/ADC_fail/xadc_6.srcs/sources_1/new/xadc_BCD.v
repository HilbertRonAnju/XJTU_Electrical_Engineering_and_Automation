`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/30 21:15:57
// Design Name: 
// Module Name: xadc_BCD
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


module xadc_BCD(
    input [11:0]led,
    input clk,
    input rst_n,
    output reg [3:0]Y2,
    output reg [3:0]Y1,
    output reg [3:0]Y0
    );
    
    integer cnt=0;
    always@*
    begin
        if(rst_n==0)
        begin
            Y2=0;
            Y1=0;
            Y0=0;
        end
        else
        begin
            cnt=led;
            Y0=cnt%10;
            cnt=cnt/10;
            Y1=cnt%10;
            cnt=cnt/10;
            Y2=cnt%10;
        end
    end
    
endmodule

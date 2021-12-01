`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/16 17:29:06
// Design Name: 
// Module Name: timeadjust
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


module timeadjust #(parameter [3:0] LEN = 3, parameter [13:0] at256 = 256, b = 1)(
input [LEN-1:0] switchset,
output [7:0] return
    );
    assign return = binary2bcd((switchset * at256 >> 8)+ b);
    
function [7:0] binary2bcd(input [7:0] b);
begin
    binary2bcd[3:0] = b % 10;
    binary2bcd[7:4] = b / 10;
 end
endfunction

endmodule

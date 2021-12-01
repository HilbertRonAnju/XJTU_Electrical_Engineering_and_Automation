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


module timereverse(
input [15:0] reversedtime,
input [15:0] maxtime,
output [15:0] timertn
    );
    wire [15:0] timetogo;
    assign timetogo = (60 * bcd2binary(maxtime[15:8]) + bcd2binary(maxtime[7:0])) - (60 * bcd2binary(reversedtime[15:8]) + bcd2binary(reversedtime[7:0]));
    assign timertn = {binary2bcd(timetogo / 60), binary2bcd(timetogo % 60)};
    

    
function [7:0] binary2bcd(input [7:0] b);
begin
    binary2bcd[3:0] = b % 10;
    binary2bcd[7:4] = b / 10;
 end
endfunction

function [7:0] bcd2binary(input [7:0] b);
begin
    bcd2binary = b[3:0] + b[7:4] * 10;
 end
endfunction

endmodule

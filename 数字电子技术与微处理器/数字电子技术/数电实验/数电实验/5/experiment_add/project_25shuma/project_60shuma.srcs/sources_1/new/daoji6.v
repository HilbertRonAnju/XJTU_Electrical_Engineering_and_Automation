`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/11 00:33:51
// Design Name: 
// Module Name: daoji6
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


module daoji6(
    input rst_n,
    input pul_in,
    output reg [7:0] y
    );initial y=7'b00100101;
    always @(posedge pul_in,negedge rst_n )

    begin
      if(!rst_n)

begin
y[7:4]<=2;
y[3:0]<=5;
end
else 
begin
if (y[3:0]==0&&y[7:4]==0)
begin
y[7:4]<=2;
y[3:0]<=5;
end
else
if(y[3:0]==0)
begin
y[3:0]<=9;
y[7:4]<=y[7:4]-1;
end
else y[3:0]<=y[3:0]-1;
end
end
endmodule

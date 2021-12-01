`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/08 16:39:35
// Design Name: 
// Module Name: smg
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


module smg(
input [3:0]number,
output wire [7:0]display
);
reg [7:0] nummap[10:0];
initial
begin
nummap[0]= 8'b01111110;
nummap[1]= 8'b00110000;
nummap[2]= 8'b01101101;
nummap[3]= 8'b01111001;
nummap[4]= 8'b00110011;
nummap[5]= 8'b01011011;
nummap[6]= 8'b01011111;
nummap[7]= 8'b01110000;
nummap[8]= 8'b01111111;
nummap[9]= 8'b01110011;
nummap[10]= 8'b00000000;
end

assign display = nummap[number];
endmodule

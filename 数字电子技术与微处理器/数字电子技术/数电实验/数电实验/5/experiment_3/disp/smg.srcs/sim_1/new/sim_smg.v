`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/08 16:52:52
// Design Name: 
// Module Name: sim_smg
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


module sim_smg;
reg [3:0]number;
wire [7:0]display;
initial begin 
number[3:0]=0;
forever #(50) number=number+1;
end
smg uut(
.number(number),
.display(display)
);
endmodule

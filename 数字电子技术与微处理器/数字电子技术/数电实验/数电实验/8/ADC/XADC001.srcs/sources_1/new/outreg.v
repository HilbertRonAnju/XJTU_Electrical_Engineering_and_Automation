`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/22 00:22:48
// Design Name: 
// Module Name: outreg
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


module outreg(
    input [15:0] bcd,
    input [2:0] bitcnt,
    input clk,
    input rst,
    output reg [3:0] dlight1=0
    );
 always @(posedge clk or posedge rst)
  begin
   if (rst==1)
     begin
     dlight1<=0;
     end
     
     else
     begin
      case (bitcnt)
      3'b000: dlight1=bcd[15:12];
      3'b001: dlight1=bcd[11:8];
      3'b010: dlight1=bcd[7:4];
      3'b011: dlight1=bcd[3:0];
      default begin dlight1=4'b0000;end
      endcase
      end
      
   end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/03 18:59:15
// Design Name: 
// Module Name: sec
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


module sec#(parameter WIDTH=32, MAX=5_000_000)
(
input wire clk,
input wire rst,
output reg sec
);
    reg [WIDTH-1:0]count;
    initial begin 
    count=0;
    sec=0;
    end
    always@(posedge clk or negedge rst) 
    begin
    if(!rst)count=0;
    else if(count==MAX/2)
           begin
           count=0;
           sec=~sec;
           end
    else count=count+1;
    end
endmodule

//module sec#(parameter WIDTH=32, MAX=100000000)
//(
//input wire clk,
//input wire rst,
//output reg sec
//);
//    reg [WIDTH-1:0]count;
//    initial begin 
//    count=0;
//    sec=0;
//    end
    
//    always@(posedge clk or negedge rst) 
//    begin
//    if(!rst)count=0;
//    else if(count<=MAX/2)
//           begin
//           count = count +1;
//           sec=1;
//           end
//    else if(count==MAX)
//           begin
//           count=0;
//           sec=0;
//           end
//    else
//    begin
//    count=count+1;
//    sec = 0;
//    end
//    end
//endmodule


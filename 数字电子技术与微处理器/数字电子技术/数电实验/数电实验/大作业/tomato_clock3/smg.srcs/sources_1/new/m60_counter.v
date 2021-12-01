`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/03 19:24:49
// Design Name: 
// Module Name: m60_counter
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

module counter(
    input [7:0] COUNTDOWN,
    input  clk,
    input rst,
    input sec,
    input pause,
    input load,
    output reg [3:0] dot,
    output [15:0] num,
    output reg minoverflow = 0
    );
    
    reg [7:0] secnum = 0, minnum;
    initial minnum = COUNTDOWN;
    reg secoverflow = 0;
    assign num = {minnum, secnum};
    
    always@(posedge clk or negedge rst)
       if(!rst || load == 1)begin
        secnum <=  0;
        dot <= 0;
       end
       else if(sec == 1 && pause == 1)
       begin
       secoverflow = 0;
       if(secnum[3:0]==0&&secnum[7:4]==0) begin
               if(minnum > 0)
               begin
                   secnum <= 8'h59;
                   secoverflow = 1;
               end
               else if(dot[2] != dot[1])
                dot = 4'b1111;
                else
                dot = ~dot;
               end 
        else if(secnum[3:0]==0)
               begin 
                secnum[3:0]<=9;
               secnum[7:4]<=secnum[7:4]-1;
                   dot[2] = !dot[2];
               end
        else
        begin
        secnum[3:0]<=secnum[3:0]-1;
        dot[2] = !dot[2];
        end
        end
        else secoverflow = 0;
    
    always@(posedge clk or negedge rst)
    if(!rst || load == 1) minnum <= COUNTDOWN;
   else if(secoverflow == 1 && pause == 1)
   begin
   minoverflow = 0;
   if(minnum[3:0]==0&&minnum[7:4]==0) begin
           minoverflow = 1;
           end 
    else if(minnum[3:0]==0)
           begin 
            minnum[3:0]<=9;
           minnum[7:4]<=minnum[7:4]-1;
           end
    else minnum[3:0]<=minnum[3:0]-1;
    end
    else minoverflow = 0;
    
endmodule

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

module m60_counter(
input [7:0] COUNTDOWN,
    input  clk,
    input rst,
    output [7:0] disp,
    output [3:0] en
    );
    
    reg [7:0] secnum = 8'h59, minnum = 4;
    wire sec;
    reg [3:0] dot = 4'b0;
    reg secoverflow = 0, minoverflow = 0;
    sec #(.MAX(100_000_000))
    secgen(
    .clk(clk),
    .rst(1),
    .sec(sec));
    
    muldisp #(.LEN(4)) shownum (
.clkin(clk),
.num({minnum, secnum}),
.disp(disp),
.dotlist(dot),
.en(en)
    );
    
    always@(posedge sec or negedge rst)
    begin
    if(!rst)begin
    secnum <=  8'h59;
    dot <= 0;
    end
   else
   begin
   secoverflow = 0;
   if(secnum[3:0]==0&&secnum[7:4]==0) begin
           if(minnum > 0)
           begin
               secnum <= 8'h59;
               secoverflow = 1;
           end
           else
           if(dot[2] != dot[1])
            dot = 4'b1111;
            else
            dot = ~dot;
           end 
    else if(secnum[3:0]==0)
           begin 
            secnum[3:0]<=9;
           secnum[7:4]<=secnum[7:4]-1;
           end
    else
    begin
    secnum[3:0]<=secnum[3:0]-1;
    dot[2] = !dot[2];
    end
    end
    end
    
    always@(posedge secoverflow or negedge rst)
    begin
    if(!rst) minnum <= COUNTDOWN;
   else
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
    end
endmodule

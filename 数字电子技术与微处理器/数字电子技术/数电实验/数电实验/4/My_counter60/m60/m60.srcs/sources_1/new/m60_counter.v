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
    input  clk,
    input pulse_in,
    input  rst_n,
    output reg [7:0]cnt
    );
    initial begin
    cnt[3:0]=0;
    cnt[7:4]=0;
        end
    always@(posedge pulse_in or negedge rst_n)
    if(!rst_n)begin 
    cnt[3:0]=0;
    cnt[7:4]=0;
    end
    else if(pulse_in==1)
           begin
           if(cnt[3:0]==9&&cnt[7:4]==5)
                   begin
                   cnt[3:0]<=0;
                   cnt[7:4]<=0;
                   end 
            else if(cnt[3:0]==9)
                   begin 
                    cnt[3:0]<=0;
                   cnt[7:4]<=cnt[7:4]+1;
                   end
            else cnt[3:0]<=cnt[3:0]+1;
            end
endmodule

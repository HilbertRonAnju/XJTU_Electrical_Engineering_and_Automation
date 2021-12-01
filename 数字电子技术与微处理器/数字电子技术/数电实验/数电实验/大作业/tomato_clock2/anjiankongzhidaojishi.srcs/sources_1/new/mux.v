`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/24 20:56:52
// Design Name: 
// Module Name: mux
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


module mux(
    input ad,
    input clk,
    input [3:0] work_sec_L,
    input [3:0] work_sec_H,
    input [3:0] work_min_L,
    input [3:0] work_min_H,
    input [3:0] ralex_sec_L,
    input [3:0] ralex_sec_H,
    input [3:0] ralex_min_L,
    input [3:0] ralex_min_H,
    input [3:0] WorkTime_sec_L,
    input [3:0] WorkTime_sec_H,
    input [3:0] WorkTime_min_L,
    input [3:0] WorkTime_min_H,
    output reg[3:0] x_one,
    output reg[3:0] x_tow,
    output reg[3:0] x_three,
    output reg[3:0] x_four,
    output reg[3:0] x_five,
    output reg[3:0] x_six,
    output reg[3:0] x_seven,
    output reg[3:0] x_eight,
    input [3:0] cycle
    );
    always@(*)begin
        if(ad==1)begin
            x_one[3:0]=WorkTime_sec_L[3:0];
            x_tow[3:0]=WorkTime_sec_H[3:0] ;
            x_three[3:0]=WorkTime_min_L[3:0] ;
            x_four[3:0]=WorkTime_min_H[3:0] ;
            x_five[3:0]=cycle[3:0];
            x_six[3:0]= 4'b1111;
            x_seven[3:0]=4'b1111;
            x_eight[3:0]=4'b1111;
        end
        else begin
            x_one[3:0]=work_sec_L[3:0];
            x_tow[3:0]=work_sec_H[3:0] ;
            x_three[3:0]=work_min_L[3:0] ;
            x_four[3:0]=work_min_H[3:0] ;
            x_five[3:0]=ralex_sec_L[3:0];
            x_six[3:0]= ralex_sec_H[3:0];
            x_seven[3:0]=ralex_min_L[3:0];
            x_eight[3:0]=ralex_min_H[3:0];
        end
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/30 21:18:01
// Design Name: 
// Module Name: x7seg_4bit
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


module my_x7seg_4bit(
    input clk,
    input rst_n,
    
    input [3:0]x3,
    input [3:0]x2,
    input [3:0]x1,
    input [3:0]x0,
    
    output reg [6:0]a_to_g0,
    output reg [3:0]an
    );
    
    integer clkdiv;
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            clkdiv<=0;
        else if(clkdiv==500000)
            clkdiv<=0;
        else
            clkdiv<=clkdiv+1;
    end
    
    reg [1:0]bitcnt;
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            bitcnt<=0;
        else if(clkdiv==500000)
            bitcnt<=bitcnt+1;
    end
    
    always@*
    begin
        if(!rst_n)
            an=0;
        else
        begin
            an=4'd0;
            an[bitcnt]=1;
        end
    end
    
    reg[3:0]digit0;
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            digit0<=0;
        else
            case(bitcnt)
                2'd0:digit0<=x0[3:0];
                2'd1:digit0<=x1[3:0];
                2'd2:digit0<=x2[3:0];
                2'd3:digit0<=x3[3:0];
            endcase
    end
    
    always@*
    begin
    if(!rst_n)
    begin
        a_to_g0<=7'b1111111;
    end
    else
        case(digit0)
        0:a_to_g0<=7'b1111110;
        1:a_to_g0<=7'b0110000;
        2:a_to_g0<=7'b1101101;
        3:a_to_g0<=7'b1111001;
        4:a_to_g0<=7'b0110011;
        5:a_to_g0<=7'b1011011;
        6:a_to_g0<=7'b1011111;
        7:a_to_g0<=7'b1110000;
        8:a_to_g0<=7'b1111111;
        9:a_to_g0<=7'b1111011;
        10:a_to_g0<=7'b1110111;
        11:a_to_g0<=7'b1111111;
        12:a_to_g0<=7'b1001110;
        13:a_to_g0<=7'b1111110;
        14:a_to_g0<=7'b1001111;
        15:a_to_g0<=7'b1000111;
        default:a_to_g0<=7'b1111110;
        endcase
    end
    
endmodule

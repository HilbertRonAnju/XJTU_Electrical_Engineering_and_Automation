`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/30 20:18:43
// Design Name: 
// Module Name: disp
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


module disp(
    input wire clk,
    input [3:0] led0,
    input [3:0] led1,
    input [3:0] led2,
    input [3:0] led3,
    output reg[6:0] a_to_g,
    output reg[3:0] an
    );
    reg[1:0]s;
    reg[3:0]digit;
    reg[16:0]clkdiv;
    always@(*)
        begin
            an = 4'b1111;
            s = clkdiv[16:15];
            an[s] = 0;
        end
    always@(*)
        case(s)
            0:digit = led0[3:0];
            1:digit = led1[3:0];
            2:digit = led2[3:0];
            3:digit = led3[3:0];
            default:digit = led3[3:0];
        endcase
    always@(*)
        case(digit)
            0:a_to_g = 7'b0000001;
            1:a_to_g = 7'b1001111;
            2:a_to_g = 7'b0010010;
            3:a_to_g = 7'b0000110;
            4:a_to_g = 7'b1001100;
            5:a_to_g = 7'b0100100;
            6:a_to_g = 7'b0100000;
            7:a_to_g = 7'b0001111;
            8:a_to_g = 7'b0000000;
            9:a_to_g = 7'b0000100;
            'hA:a_to_g = 7'b0000100;
            'hB:a_to_g = 7'b1100000;
            'hC:a_to_g = 7'b0110001;
            'hD:a_to_g = 7'b1000010;
            'hE:a_to_g = 7'b0111000;
            'hF:a_to_g = 7'b0000001;
            default:a_to_g = 7'b0000001;
        endcase
  always@(posedge clk)
    clkdiv <= clkdiv+1;
endmodule

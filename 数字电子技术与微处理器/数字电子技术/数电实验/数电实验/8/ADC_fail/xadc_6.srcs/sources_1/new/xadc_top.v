`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/30 21:14:48
// Design Name: 
// Module Name: xadc_top
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


module xadc_top(
    input clk,
    input rst_n,
    input vauxp1,vauxn1,
    output [11:0]led,
    output [6:0]a_to_g,
    output [3:0]an
    );
    
    wire [15:0]do_out;
    wire drdy_out;
    
    xadc_channel1 U0(
    .dclk_in(clk),
    .reset_in(rst_n),
    .vauxp1(vauxp1),
    .vauxn1(vauxn1),
    .do_out(do_out),
    .drdy_out(drdy_out)
    );
    
    xadc_result U3(
   .clk(clk),
   .rst_n(rst_n),
   .do_out(do_out),
   .drdy_out(drdy_out),
   .led(led)
    );
    
    wire [3:0]Y2;
    wire [3:0]Y1;
    wire [3:0]Y0;
    
    xadc_BCD U4(
    .led(led),
    .clk(clk),
    .rst_n(rst_n),
    .Y2(Y2),
    .Y1(Y1),
    .Y0(Y0)
    );
    
    my_x7seg_4bit U5(
    .clk(clk),
    .rst_n(rst_n),
    .x3(0),
    .x2(led[11:8]),
    .x1(led[7:4]),
    .x0(led[3:0]),
    
    .a_to_g0(a_to_g),
    .an(an)
    );
    
endmodule

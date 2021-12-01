`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/28 10:11:57
// Design Name: 
// Module Name: wdnmd
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


module wdnmd(
    input clk,
    input rst,
    input vauxn1,
    input vauxp1,
    output [3:0] en,
    output [6:0] y
    );
    wire [15:0] a1;//do_out
    wire a2;//drdy_out
    wire [19:0] a3;//v_out
    wire [15:0] a4;//bcd
    wire [2:0] a5;//bitcnt
    wire [3:0] a6;//dlight1
    
    XADC_channel_1 utt1(
    .dclk_in(clk),
    .reset_in(rst),
    .vauxp1(vauxp1),
    .vauxn1(vauxn1),
    .do_out(a1),
    .drdy_out(a2)
    );
    
    XADC_result utt2(
    .clk(clk),
    .do_out(a1),
    .drdy_out(a2),
    .rst(rst),
    .v_out(a3)
    );
    
    BCD_16 utt3(
    .v_out(a3),
    .bcd(a4)
    );
    
    outreg utt4(
    .bcd(a4),
    .bitcnt(a5),
    .clk(clk),
    .rst(rst),
    .dlight1(a6)
    );
    
    clkdiv utt5(
    .clk(clk),
    .rst(rst),
    .bitcnt(a5)
    );
    
    select utt6(
    .rst(rst),
    .clk(clk),
    .bitcnt(a5),
    .en(en)
    );
    
    bcd_7 utt7(
    .a(a6),
    .clk(clk),
    .rst(rst),
    .y(y)
    );
endmodule

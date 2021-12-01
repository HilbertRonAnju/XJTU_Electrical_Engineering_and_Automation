`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/08/31 08:27:09
// Design Name: 
// Module Name: top_piano
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
module top_piano(
    input wire clk,
    input wire reset,
    input wire ps2d,ps2c,
    output wire hsync,               //hdmi_hsync,
    output wire vsync,               //hdmi_vsync,
    output [11:0] rgb,
    output wire SUDIO_SD,
    output wire piano,
    output wire piano_1    
      );
wire piano1,piano2;
// wire light11,light22,light33;
wire left,right,enter,key_release;
wire [7:0] keydata000;
//assign light = keydata000 [3:0];

wire video_en;
wire  rst;    
wire pixclk;
wire pixclk_90;
wire i2c_clk;
wire lock;  
wire [7:0] musickey;
wire [7:0] keysum;
assign keysum=keydata000+musickey;
assign rst =~reset;    
// assign piano=piano1+piano2;

keyboard u0(
.clk(clk),
.reset(reset),
.ps2d(ps2d), 
.ps2c(ps2c),
.left(left),
.right(right), 
.enter(enter), 
.key_relese(key_release),
.keydata(keydata000)
);

dcm_clk u_clk
   (
    // Clock out ports
    .clk_out1(pixclk),     // output clk_out1
    // Status and control signals
    .reset(rst), // input reset
   // Clock in ports
    .clk_in1(clk));

vga_draw vga1(
       .sys_clk(pixclk),
       .sys_rst_n(rst),
       .keydata(keysum),
       .hsync(hsync),
       .vsync(vsync),
       .rgb(rgb),
       .video_en(video_en)
         );

sound(
            .clk(clk),
            .keydata(keydata000),
            .piano(piano1),
            .musickey(musickey)
             );
play(
            .clk(clk),
            .keydata(keydata000),
            .piano(piano2)
                 );
assign piano=piano1+piano2;
assign piano_1 = piano1 + piano2;
assign SUDIO_SD = 1'b0;
endmodule

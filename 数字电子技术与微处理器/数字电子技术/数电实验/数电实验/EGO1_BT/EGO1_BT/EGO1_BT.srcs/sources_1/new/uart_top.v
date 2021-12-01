`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/31 08:11:21
// Design Name: 
// Module Name: uart_top
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

//手机APP与EGO1蓝牙通信实验顶层程序
module uart_top(
    output txd,
    input rxd,
    input clk,
    output bt_pw_on,
    output bt_master_slave,
    output bt_sw_hw,
    output bt_rst_n,
    output bt_sw,
    input [5:0] sw_pin
    );
    wire clk_9600;
    wire receive_ack;
    wire [7:0] data;
    uart_tx uart_tx(
        .clk(clk_9600),
        .txd(txd),
//        .rst(1),
        .data_o(data),
        .receive_ack(receive_ack)
        );
    uart_rx uart_rx(
        .clk(clk_9600),
        .rxd(rxd),
        .data_i(data),
        .receive_ack(receive_ack)
        );
    clk_div clk_div(
        .clk(clk),
        .clk_out(clk_9600)
        );
     assign bt_master_slave=sw_pin[0];
     assign bt_sw_hw=sw_pin[1];
     assign bt_rst_n=sw_pin[2];
     assign bt_sw=sw_pin[3];
     assign bt_pw_on=sw_pin[4];
endmodule

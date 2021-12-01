`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/31 08:39:52
// Design Name: 
// Module Name: uart_tx
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
//串口发送模块程序
module uart_tx(
    input [7:0] data_o,
    output reg txd,
    input clk,
    input receive_ack
    );
//串口发送状态机分为四个状态：等待、发送起始位、发送数据、发送完成
    localparam IDLE = 0,
               SEND_START = 1,
               SEND_DATA = 2,
               SEND_END = 3;
    
    reg [3:0] current_state, next_state;
    reg [4:0] count;
    reg [7:0] data_o_tmp;
    
    always @(posedge clk)
        current_state <= next_state;
    
    always @(*)
    begin
//        next_state<=current_state;           //不能在组合逻辑中使用非阻塞赋值    
        next_state = current_state;
        case (current_state)
            IDLE: if (receive_ack) next_state = SEND_START;
            SEND_START: next_state = SEND_DATA;
            SEND_DATA: if (count == 7) next_state = SEND_END;
            SEND_END: if (receive_ack) next_state = SEND_START;
            default: next_state = IDLE;
        endcase
    end
    
    always @(posedge clk)
    begin
        if (current_state == SEND_DATA)
            count <= count + 1;
        else if (current_state == IDLE | current_state == SEND_END)
            count <= 0;
    end
    
    always @(posedge clk)
        if (current_state == SEND_START)
            data_o_tmp <= data_o;
        else if (current_state == SEND_DATA)
            data_o_tmp[6:0] <= data_o_tmp[7:1];         //将要发送的数据位放在 data_o_tmp[0]
    
    always @(posedge clk)
        if (current_state == SEND_START)
            txd <= 0;                                   //发送起始位
        else if (current_state == SEND_DATA)
            txd <= data_o_tmp[0];                       //发送数据低位在先，高位在后
        else if (current_state == SEND_END)
            txd <= 1;                                    //发送停止位
endmodule

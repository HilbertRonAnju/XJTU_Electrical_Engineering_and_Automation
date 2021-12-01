`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/31 09:29:15
// Design Name: 
// Module Name: uart_rx
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
//串口接收模块程序
module uart_rx(
    input rxd,
    input clk,
    output receive_ack,
    output reg[7:0] data_i
    );
    //串口接收状态机分为三个状态：等待、接收、接收完成
    localparam IDLE = 0,
               RECEIVE = 1,
               RECEIVE_END = 2;
    
    reg[3:0] current_state, next_state;  // 状态机变量
    reg[4:0] count;
    
    always @(posedge clk)
        current_state <= next_state;
    
    always @(*) 
    begin
//        next_state<=current_state;           //不能在组合逻辑中使用非阻塞赋值    
        next_state = current_state;
        case(current_state)
            IDLE: if (!rxd) next_state = RECEIVE;
            RECEIVE: if (count == 7) next_state = RECEIVE_END;
//            RECEIVE_END:if(receive_ack)next_state=IDLE;       //不能对输出信号做判断，这样可能会引入反馈
            RECEIVE_END: next_state = IDLE;
            default: next_state = IDLE;
        endcase    
    end
    
    always @(posedge clk) 
    begin
        if (current_state == RECEIVE)
            count <= count + 1;
        else if (current_state == IDLE | current_state == RECEIVE_END)
            count <= 0;
    end
    
    always @(posedge clk)
    begin
        if (current_state == RECEIVE)
        begin
            data_i[6:0] <= data_i[7:1];
            data_i[7] <= rxd;
        end 
    end
    
    assign receive_ack = (current_state == RECEIVE_END)?1:0;
endmodule
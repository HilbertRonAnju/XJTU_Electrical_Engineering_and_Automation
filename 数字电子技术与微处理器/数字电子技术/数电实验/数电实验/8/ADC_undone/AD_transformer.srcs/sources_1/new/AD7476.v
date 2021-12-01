`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/30 19:47:04
// Design Name: 
// Module Name: AD7476
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


module AD7476(
    input clk,
    input wire sdata,
    input wire rst,
    output wire sclk,
    output regcs,
    output[6:0]a_to_g,
    output[3:0]an
    );
    reg[2:0]cntdiv;
    reg[4:0]j;
    reg[15:0]data;
    reg[15:0]data1;
    reg[27:0]cntdiv1;
    reg[3:0]led0;
    reg[3:0]led1;
    reg[3:0]led2;
    reg[3:0]led3;
    reg[1:0]state;
    assign sclk = cntdiv[2];
    initial
        begin
            j<=0;
            cntdiv<=0;
            data<=0;
            data1<=0;
            state<=2'b00;
        end
    always@(posedge clk)
        begin
            if(cntdiv == 1250000)
                begin
                    led0[3:0] <= data1[3:0];
                    led1[3:0] <= data1[7:4];
                    led2[3:0] <= data1[11:8];
                    led3[3:0] <= data1[15:12];
                    cntdiv <= 0;
                end
            else
                cntdiv <= cntdiv + 1;
        end
    always@(posedge clk)
        begin
            cntdiv <= cntdiv+1;
        end
    always@(negedge sclk)
        begin
            if(rst == 1)
                begin
                    state <= 2'b00;
                    cs <= 1;
                    data[0] <=0;
                    j <= 0;
                end
            else if(state == 2'b00)
                begin
                    state <= 2'b01;
                    cs <= 0;
                    data[0]<=sdata;
                    data[15:1]<=data[14:0];
                    j<=0;
                end
            else if (state == 2'b01)
                begin
                    data[0] <= sdata;
                    data[15:1] <= data[14:0];
                    j <= j+1;
                    if(j == 15)
                        state <= 2'b11;
                    else
                        state <= 2'b01;
                end
            else
                begin
                    cs <= 1;
                    data1[15:0] <= data[15:0];
                    j <=0;
                    state <= 2'b00;
                end
            end

disp disp1(
    .clk(clk),
    .led0(led0),
    .led1(led1),
    .led2(led2),
    .led3(led3),
    .a_to_g(a_to_g),
    .an(an)
    );
     
            
endmodule

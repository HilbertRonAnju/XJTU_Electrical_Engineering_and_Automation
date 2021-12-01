`timescale 1ns / 1ps
//时钟分频模块
module clk_control(
  input sys_clk,//100MHZ
  input [2:0] sel,//歌曲选择
  output reg clk_100,//矩阵键盘时钟100HZ
  output reg clk_select//节拍时钟，不同歌曲可能不同
    );
    
  reg [19:0] count1;//键盘时钟分频计数变量
  reg [25:0] count2;//节拍时钟分频计数变量
  reg [25:0] COUNT;//节拍分频预置数变量
  //寄存器类型变量初始化
  initial 
    begin
      clk_100<=1'b0;
      clk_select<=1'b0;
      count1<=1'b0;
      count2<=1'b0;
      COUNT<=1'b0;
    end
  //100HZ时钟分频
  always @(posedge sys_clk)
    begin
      if(count1>=20'd500000)
        begin
          count1<=20'b0;
          clk_100<=~clk_100;
        end
      else
        begin
          count1<=count1+1'b1;
        end
    end
  //歌曲节拍选择
  always @(sel)
    begin
      case(sel)
        3'b100:COUNT<=26'd3125000;
        3'b010:COUNT<=26'd12500000;
        default:COUNT<=26'd12500000;
      endcase
    end
  //节拍时钟分频  
  always @(posedge sys_clk)
    begin
      if(count2>=COUNT)
        begin
          count2<=1'b0;
          clk_select<=~clk_select;
        end
      else
        begin
          count2<=count2+1'b1;
        end
    end
endmodule

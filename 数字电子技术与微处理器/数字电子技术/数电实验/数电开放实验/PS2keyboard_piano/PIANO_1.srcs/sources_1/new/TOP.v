`timescale 1ns / 1ps
//顶层模块
module TOP(
  input sys_clk,//100MHZ
  input rst,//复位键
  input keyboard_select,//键盘选择矩阵键盘orPS2键盘
  input ps2_clk,//ps2键盘时钟
  input ps2_data, //ps2键盘数据线
  input [3:0] col,//矩阵键盘列输入
  input auto_en,//自动放音使能
  input [2:0] song_num,//歌曲选择
  input SD,//低通滤波器使能
  output sd,//低通滤波器使能
  output audio_out,//音频输出
  output [3:0] scan,//矩阵键盘行扫描
  output reg [15:0] led,//LED输出
  output [1:0] digital_en,//数码管片选
  output [7:0] digital_data//数码管段选
    );
  
  wire clk_100;//100HZ
  wire clk_sel;//节拍时钟
  wire [4:0] value1;//最终键盘键值
  wire [4:0] value2;//曲谱生成模块输出键值
  wire [4:0] value;//最终输出键值
  wire [4:0] key1;//矩阵键盘键值
  wire [4:0] key2;//ps2键盘键值
  assign value1=keyboard_select?key2:key1;//键盘使能控制
  assign value=auto_en?value2:value1;//人工or自动模式控制
  //实例化
  clk_control clk1(sys_clk,song_num,clk_100,clk_sel);
  keyboard k1(clk_100,col,scan,key1);
  ps2_keyboard ps2_1(rst,ps2_clk,ps2_data,sys_clk,key2);
  audio_port a1(sys_clk,SD,value,sd,audio_out);
  auto_display auto1(clk_sel,auto_en,song_num,value2);
  scan_led_hex_disp d1(sys_clk,rst,value,digital_en,digital_data);
  //LED控制
  always @(value)
    begin
      case(value)
        5'd0:led<=16'b1;
        5'd1:led<=16'b10;
        5'd2:led<=16'b100;
        5'd3:led<=16'b1000;
        5'd4:led<=16'b10000;
        5'd5:led<=16'b100000;
        5'd6:led<=16'b1000000;
        5'd7:led<=16'b10000000;
        5'd8:led<=16'b100000000;
        5'd9:led<=16'b1000000000;
        5'd10:led<=16'b10000000000;
        5'd11:led<=16'b100000000000;
        5'd12:led<=16'b1000000000000;
        5'd13:led<=16'b10000000000000;
        5'd14:led<=16'b100000000000000;
        5'd15:led<=16'b1000000000000000;
        default:led<=16'b0;
      endcase
    end 
endmodule

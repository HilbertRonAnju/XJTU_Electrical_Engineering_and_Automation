`timescale 1ns / 1ps
//矩阵键盘模块
module keyboard(
  input clk_100,//键盘时钟100HZ
  input [3:0] col,//列信号
  output reg [3:0] row_scan,//行扫描信号
  output reg [4:0] key_value//键值输出限号
    );
   
 
  wire key_pressed;//0为有键按下
  wire [7:0] data;//键盘行列状态编码
  reg [3:0] col_filter;//去抖后的列信号
  assign data={row_scan[3:0],col_filter[3:0]};
  assign key_pressed=col_filter[3]&col_filter[2]&col_filter[1]&col_filter[0];//列信号的归与
  //寄存器变量的初始化
  initial
    begin
      col_filter<=4'b1111;//初始化为无键按下
      row_scan<=4'b1111;//初始化不扫描
      key_value<=5'd22;//初始化为无效键值     
    end
      
  //键盘扫描模块(去抖)
  //列信号去抖
  always @(posedge clk_100)
    begin
      col_filter<=col;    
    end
  //行扫描  
  always @(negedge clk_100)
    begin
      if(key_pressed)
        begin
          case(row_scan)
            4'b1110:row_scan<=4'b1101;
            4'b1101:row_scan<=4'b1011;
            4'b1011:row_scan<=4'b0111;
            4'b0111:row_scan<=4'b1110;
            default:row_scan<=4'b1110;
          endcase
        end
    end
    
  //键值译码模块
  always @(posedge clk_100)
    begin
      case(data)
        8'b1110_1110:key_value<=5'd0;
        8'b1110_1101:key_value<=5'd1;
        8'b1110_1011:key_value<=5'd2;
        8'b1110_0111:key_value<=5'd3;
        8'b1101_1110:key_value<=5'd4;
        8'b1101_1101:key_value<=5'd5;
        8'b1101_1011:key_value<=5'd6;
        8'b1101_0111:key_value<=5'd7;
        8'b1011_1110:key_value<=5'd8;
        8'b1011_1101:key_value<=5'd9;
        8'b1011_1011:key_value<=5'd10;
        8'b1011_0111:key_value<=5'd11;
        8'b0111_1110:key_value<=5'd12;
        8'b0111_1101:key_value<=5'd13;
        8'b0111_1011:key_value<=5'd14;
        8'b0111_0111:key_value<=5'd15;
        default:key_value<=5'd22;
      endcase
    end
endmodule

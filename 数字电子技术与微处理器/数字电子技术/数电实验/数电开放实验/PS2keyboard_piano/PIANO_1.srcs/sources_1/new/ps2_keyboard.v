`timescale 1ns / 1ps
//ps2键盘
module ps2_keyboard(
    input rst,//复位键
    input ps2_clk,//键盘时钟线
    input ps2_data,//键盘数据线
    input sys_clk,//FPGA时钟
    output reg[4:0] key_out//键值输出
    );
    
    reg [1:0] key_loosen;//1、2表示待按键松开，0表示待按下
    reg PS2CF,PS2DF;//滤波后的键盘时钟和数据
    reg [7:0] ps2c_filter,ps2d_filter;//键盘时钟和数据滤波器
    reg [7:0] data_temp;//当前接受的数据
    reg [3:0] num;//移位控制
    reg [7:0] key_value;//有效键值   
    reg [1:0] error;//1、2、3为键盘发送数据乱码
    wire flag;//1为键盘时钟上升沿标记
    
    assign flag=(ps2c_filter[1])&(~ps2c_filter[0]);
    //寄存器类型变量初始化
    initial
      begin
        key_out<=5'd22;//初始化为无效键值
        key_loosen<=1'b0;//初始化为待键按下
        PS2CF<=1'b1;
        PS2DF<=1'b1;
        ps2c_filter<=8'b11111111;
        ps2d_filter<=8'b11111111;
        data_temp<=8'b00000000;     
        num<=4'b0;
        key_value<=5'd0;
        error<=1'b0;//初始化为无数据错误      
      end
      
   //键盘时钟和数据滤波
    always @(posedge sys_clk or posedge rst)
      begin
        if(rst==0)
          begin    
            ps2c_filter<=8'b11111111;
            ps2d_filter<=8'b11111111;
            PS2CF<=0;
            PS2DF<=0;
          end
        else 
          begin
            ps2c_filter[7]<=ps2_clk;
            ps2c_filter[6:0]<=ps2c_filter[7:1];
            ps2d_filter[7]<=ps2_data;
            ps2d_filter[6:0]<=ps2d_filter[7:1];
            if(ps2c_filter==8'b11111111)
              begin
                PS2CF<=1;//去时钟毛刺
              end
            else if(ps2c_filter==8'b00000000)
              begin
                PS2CF<=0;
              end
            if(ps2d_filter==8'b11111111)
              begin
                PS2DF<=1;//去数据毛刺
              end
            else if(ps2d_filter==8'b00000000)
              begin
                PS2DF<=0;
              end
          end
      end
    //数据接收  
    always @(negedge PS2CF or posedge rst)
      begin
        if(rst==0)
          begin
            num<=4'd0;
            data_temp<=8'd0;
          end
        else 
          begin
            if(num==0) 
              begin
                num<=num+1'b1;//跳过起始位
              end         
            else if(num<=8)//数据位赋值
              begin
                data_temp[num-1]<=PS2DF;
                num<=num+1'b1;   
              end
            else if(num==9)
              begin
                num<=num+1'b1;//跳过校验位
              end
            else 
              begin
                num<=4'd0;  //停止位清零         
              end
          end
      end
    //按键处理（按下，松开），键值输出  
    always @(posedge sys_clk or posedge rst)
      begin
        if(rst==0) 
          begin
            key_loosen<=2'b0;
          end
        else if(num==4'd10)//每接受到完整的数据包
          begin
            if(data_temp==8'hF0)//判断是否为断码
              begin
                if(error==1)
                  begin
                    error<=2'd2;
                  end
                else if(error==3)
                  begin
                    error<=2'd1;
                  end
                else
                  begin
                    key_loosen<=2'b1;//断码标识符
                  end
              end
            else
              begin
                if(key_loosen==2'b1)//判断是否松开响应按键
                  begin
                    if(data_temp==key_value&&flag==1)
                      begin
                        key_loosen<=2'b0;
                        key_out<=5'd22;
                      end
                  end
               else if(key_loosen==2'b0&&flag==1&&(error==2'b00||error==2'b11))
                 begin
                   case(data_temp)//判断是否有效键值
                     8'h15:error=0;
                     8'h1D:error=0;
                     8'h24:error=0;
                     8'h2D:error=0;
                     8'h2C:error=0;
                     8'h35:error=0;
                     8'h3C:error=0;
                     8'h1C:error=0;
                     8'h1B:error=0;
                     8'h23:error=0;
                     8'h2B:error=0;
                     8'h34:error=0;
                     8'h33:error=0;
                     8'h3B:error=0;
                     8'h1A:error=0;
                     8'h22:error=0;
                     8'h21:error=0;
                     8'h2A:error=0;
                     8'h32:error=0;
                     8'h31:error=0;
                     8'h3A:error=0;
                     default:error=2'b01;
                   endcase
                   if(error==0)//有效键值转换输出
                     begin
                       key_value=data_temp;             
                       case(key_value)
                         8'h15:key_out<=5'd0;
                         8'h1D:key_out<=5'd1;
                         8'h24:key_out<=5'd2;
                         8'h2D:key_out<=5'd3;
                         8'h2C:key_out<=5'd4;
                         8'h35:key_out<=5'd5;
                         8'h3C:key_out<=5'd6;
                         8'h1C:key_out<=5'd7;
                         8'h1B:key_out<=5'd8;
                         8'h23:key_out<=5'd9;
                         8'h2B:key_out<=5'd10;
                         8'h34:key_out<=5'd11;
                         8'h33:key_out<=5'd12;
                         8'h3B:key_out<=5'd13;
                         8'h1A:key_out<=5'd14;
                         8'h22:key_out<=5'd15;
                         8'h21:key_out<=5'd16;
                         8'h2A:key_out<=5'd17;
                         8'h32:key_out<=5'd18;
                         8'h31:key_out<=5'd19;
                         8'h3A:key_out<=5'd20;
                         default:key_out<=5'd22;
                       endcase  
                     end           
                 end
               else if(error==2'd2)
                 begin
                   error<=2'd3;
                 end
             end 
           end
      end
endmodule
    
    
    

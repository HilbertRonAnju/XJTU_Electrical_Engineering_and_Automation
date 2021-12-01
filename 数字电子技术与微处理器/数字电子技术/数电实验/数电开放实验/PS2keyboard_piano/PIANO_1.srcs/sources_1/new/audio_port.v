`timescale 1ns / 1ps
//放音模块
module audio_port(
    input clk,//100MHZ时钟
    input SD,//低通滤波器使能
    input [4:0] tone,//音调指令接收
    output sd,//低通滤波器使能    
    output reg audio_out//音调输出
    );
 
    reg [20:0] count,COUNT;//分频计数器和预置数变量
    reg [20:0] buffer[20:0];//保存相应频率的预置数
    assign sd=SD;
    //寄存器类型变量初始化
    initial
      begin 
        buffer[0]=21'd191110;
        buffer[1]=21'd170259;
        buffer[2]=21'd151685;
        buffer[3]=21'd143172;
        buffer[4]=21'd127554;
        buffer[5]=21'd113636;
        buffer[6]=21'd101239;
        buffer[7]=21'd95557;
        buffer[8]=21'd85131;
        buffer[9]=21'd75844;
        buffer[10]=21'd71689;
        buffer[11]=21'd63776;
        buffer[12]=21'd56818;
        buffer[13]=21'd50620;
        buffer[14]=21'd47778;
        buffer[15]=21'd42566;
        buffer[16]=21'd37951;
        buffer[17]=21'd35793;
        buffer[18]=21'd31888;
        buffer[19]=21'd28409;
        buffer[20]=21'd25310;
      end
    //分频输出    
    always @ (posedge clk)          
          begin
            if(count>=COUNT&&COUNT!=1)
                begin
                count<=0;
                audio_out<=~audio_out;                  
                end
            else if(COUNT==1)
                audio_out<=0;
            else
                count<=count+1'b1;
          end
    //音调指令接收，预置数变化      
    always @(tone)
      if(tone>=0&&tone<=20)
         COUNT=buffer[tone];
      else
         COUNT=1;
endmodule

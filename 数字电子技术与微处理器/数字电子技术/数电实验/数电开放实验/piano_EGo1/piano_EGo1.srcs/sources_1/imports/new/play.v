`timescale 1ns / 1ps
module play(
    input  wire clk,
    input  wire [7:0] keydata,
    output reg piano
    //output reg light1,
    //output reg light2,
    //output reg light3
    );

  reg clk_2hz;
  reg [31:0] couter,couter2,couter4;//32位计数器
  reg [7:0] couter3;
  reg clk_8hz;
  reg [7:0] yinfu;//用来判断音符,直接赋初值，便于输出
  reg piano_change=1'd0;//用来切换模式
  parameter zero=8'd0;//一个音阶的特征值
  parameter d21=8'd16;
  parameter d22=8'd18;
  parameter d23=8'd20;
  parameter d24=8'd21;
  parameter d25=8'd23;
  parameter d26=8'd25;
  parameter d27=8'd27; 
  
  parameter d11=8'd28;
  parameter d12=8'd30;
  parameter d13=8'd32;
  parameter d14=8'd33;
  parameter d15=8'd35;
  parameter d16=8'd37;
  parameter d17=8'd39; 
  
  parameter d51=8'd29;
  parameter d52=8'd31;
  parameter d53=8'd34;
  parameter d54=8'd36;
  parameter d55=8'd38;
  
  parameter m01=8'd40;
  parameter m02=8'd42;
  parameter m03=8'd44;
  parameter m04=8'd45;
  parameter m05=8'd47;
  parameter m06=8'd49;
  parameter m07=8'd51;
  
   parameter m51=8'd41;
   parameter m52=8'd43;
   parameter m53=8'd46;
   parameter m54=8'd48;
   parameter m55=8'd50; 
  
  parameter h11=8'd52;
  parameter h12=8'd54;
  parameter h13=8'd56;
  parameter h14=8'd57;
  parameter h15=8'd59;
  parameter h16=8'd61;
  parameter h17=8'd63;
  
  parameter h51=8'd53;
  parameter h52=8'd55;
  parameter h53=8'd58;
  parameter h54=8'd60;
  parameter h55=8'd62;
  
  parameter h21=8'd64;
  parameter h22=8'd66;
  parameter h23=8'd68;
  parameter h24=8'd69;
  parameter h25=8'd71;
  parameter h26=8'd73;
  parameter h27=8'd75;
  
  
  //always @ (posedge clk)//键盘处理模块
  //begin
   //   if (keydata==8'h5A)
   //   piano_change<=~piano_change;
 //end  
 
   always @ (posedge clk) begin  //产生8HZ时钟，16分音符时长
  if(couter4>=15625000) begin
  clk_2hz<=~clk_2hz;//reg定义下可以这样使用
  couter4<=0;
  end else
  couter4<=couter4+1;
  end
  
  always @ (posedge clk)  //接受键盘信息，处理piano_change
  begin
  if(keydata==8'h5A)
  piano_change<=1;
  else if (keydata==8'h29) begin
  piano_change<=0;
  end
  end
  
  always @ (posedge clk)//键盘处理模块,通过keydata生成
      begin
      if (piano_change==1) begin//这里增加了模式控制按钮（不知道行不行，需要测试一下）
        case(keydata)
        //8'h015:begin light1<=1'b1;yinfu<=d11;end//Q
        //8'h01D:begin light2<=1'b1;yinfu<=d12;end//W
        //8'h024:begin light3<=1'b1;yinfu<=d13;end//E
        8'h015:yinfu<=d11;//Q
        8'h01D:yinfu<=d12;//W
        8'h024:yinfu<=d13;//E
        8'h02D:yinfu<=d14;//R
        8'h02C:yinfu<=d15;//T
        8'h035:yinfu<=d16;//Y
        8'h03C:yinfu<=d17;//U
        
        8'h043:yinfu<=d51;//
        8'h044:yinfu<=d52;//
        8'h04D:yinfu<=d53;//
        8'h054:yinfu<=d54;//
        8'h05B:yinfu<=d55;//
        
        8'h01C:yinfu<=m01;//A
        8'h01B:yinfu<=m02;//S
        8'h023:yinfu<=m03;//D
        8'h02B:yinfu<=m04;//F
        8'h034:yinfu<=m05;//G
        8'h033:yinfu<=m06;//H
        8'h03B:yinfu<=m07;//J
        
         8'h005:yinfu<=m51;//F1
         8'h006:yinfu<=m52;//F2
         8'h004:yinfu<=m53;//F3
         8'h00C:yinfu<=m54;//F4
         8'h003:yinfu<=m55;//F5
        
        8'h01A:yinfu<=h11;//Z
        8'h022:yinfu<=h12;//X
        8'h021:yinfu<=h13;//C
        8'h02A:yinfu<=h14;//V
        8'h032:yinfu<=h15;//B
        8'h031:yinfu<=h16;//N
        8'h03A:yinfu<=h17;//M
        
        8'h00B:yinfu<=h51;//
        8'h083:yinfu<=h52;//
        8'h00A:yinfu<=h53;//
        8'h001:yinfu<=h54;//
        8'h009:yinfu<=h55;//
        
        
        
        default:
        begin
        //light1<=0;
        //light2<=0;
        //light3<=0;
        yinfu<=zero;
        end
      endcase 
      end
      else yinfu<=zero;
   end
   
  always @ (posedge clk) begin
  case(yinfu)
  zero:
       begin
       piano<=0;
       couter<=0;
       end
  d21:
       begin
       if(couter>=955564) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
   d22:
       begin
       if(couter>=851311) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
   d23:
       begin
       if(couter>=758432) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
   d24:
       begin
       if(couter>=715864) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
   d25:
       begin
       if(couter>=637762) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
   d26:
       begin
       if(couter>=568182) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
   d27:
       begin
       if(couter>=506192) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
               
   d11://28 130.813
       begin
       if(couter>=477781) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
   d12:// 30 146.82
       begin
       if(couter>=425691) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
   d13://32 164.814
       begin
       if(couter>=379215) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
   d14://33 174.614
       begin
       if(couter>=357932) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
   d15://35 195.998
       begin
       if(couter>=318881) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
    d16://37 220
       begin
       if(couter>=284090) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
    d17://39 246.942
       begin
       if(couter>=253096) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
       
  m01:
      begin
      if(couter>=238891) begin  //238891*2次分频，261HZ
      piano<=~piano;
      couter<=0;
      end else 
      couter<=couter+1;
      end
  m02:
      begin
      if(couter>=212828) begin  
      piano<=~piano;
      couter<=0;
      end else 
      couter<=couter+1;
      end
  m03:
      begin
      if(couter>=189608) begin  
      piano<=~piano;
      couter<=0;
      end else 
      couter<=couter+1;
      end
  m04:
      begin
      if(couter>=178966) begin  
      piano<=~piano;
      couter<=0;
      end else 
      couter<=couter+1;
      end
   m05:
      begin
      if(couter>=159441) begin  
      piano<=~piano;
      couter<=0;
      end else 
      couter<=couter+1;
      end
   m06:
      begin
      if(couter>=142045) begin  
      piano<=~piano;
      couter<=0;
      end else 
      couter<=couter+1;
      end
   m07:
      begin
      if(couter>=126548) begin  
      piano<=~piano;
      couter<=0;
      end else 
      couter<=couter+1;
      end
      
   h11:
      begin
      if(couter>=119446) begin  
      piano<=~piano;
      couter<=0;
      end else 
      couter<=couter+1;
      end
   h12:
      begin
      if(couter>=106414) begin  
      piano<=~piano;
      couter<=0;
      end else 
      couter<=couter+1;
      end
   h13:
      begin
      if(couter>=94805) begin  
      piano<=~piano;
      couter<=0;
      end else 
      couter<=couter+1;
      end
   h14:
      begin
      if(couter>=89486) begin  
      piano<=~piano;
      couter<=0;
      end else 
      couter<=couter+1;
      end
   h15:
      begin
      if(couter>=79720) begin  
      piano<=~piano;
      couter<=0;
      end else 
      couter<=couter+1;
      end
   h16:
      begin
      if(couter>=71023) begin  
      piano<=~piano;
      couter<=0;
      end else 
      couter<=couter+1;
      end
   h17:
      begin
      if(couter>=63274) begin  
      piano<=~piano;
      couter<=0;
      end else 
      couter<=couter+1;
      end
      
   h21:
      begin
      if(couter>=59780) begin  
      piano<=~piano;
      couter<=0;
      end else 
      couter<=couter+1;
      end
    h22:
      begin
      if(couter>=53207) begin  
      piano<=~piano;
      couter<=0;
      end else 
      couter<=couter+1;
      end
    h23:
       begin
       if(couter>=47402) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
    h24:
       begin
       if(couter>=44741) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
   h25:
       begin
       if(couter>=39860) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
   h26:
       begin
       if(couter>=35511) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
   h27:
       begin
       if(couter>=31637) begin  
       piano<=~piano;
       couter<=0;
       end else 
       couter<=couter+1;
       end
     
      m51:
            begin
            if(couter>=225483) begin  //238891*2次分频，261HZ
            piano<=~piano;
            couter<=0;
            end else 
            couter<=couter+1;
            end
        m52:
            begin
            if(couter>=200883) begin  
            piano<=~piano;
            couter<=0;
            end else 
            couter<=couter+1;
            end
        m53:
            begin
            if(couter>=168922) begin  
            piano<=~piano;
            couter<=0;
            end else 
            couter<=couter+1;
            end
        m54:
            begin
            if(couter>=150492) begin  
            piano<=~piano;
            couter<=0;
            end else 
            couter<=couter+1;
            end
         m55:
            begin
            if(couter>=134073) begin  
            piano<=~piano;
            couter<=0;
            end else 
            couter<=couter+1;
            end
            
    d51:
                        begin
                        if(couter>=450967) begin  //238891*2次分频，261HZ
                        piano<=~piano;
                        couter<=0;
                        end else 
                        couter<=couter+1;
                        end
                    d52:
                        begin
                        if(couter>=401766) begin  
                        piano<=~piano;
                        couter<=0;
                        end else 
                        couter<=couter+1;
                        end
                    d53:
                        begin
                        if(couter>=337843) begin  
                        piano<=~piano;
                        couter<=0;
                        end else 
                        couter<=couter+1;
                        end
                    d54:
                        begin
                        if(couter>=300984) begin  
                        piano<=~piano;
                        couter<=0;
                        end else 
                        couter<=couter+1;
                        end
                     d55:
                        begin
                        if(couter>=268146) begin  
                        piano<=~piano;
                        couter<=0;
                        end else 
                        couter<=couter+1;
                        end     
  
                           h51:
                                    begin
                                    if(couter>=112742) begin  //238891*2次分频，261HZ
                                    piano<=~piano;
                                    couter<=0;
                                    end else 
                                    couter<=couter+1;
                                    end
                                h52:
                                    begin
                                    if(couter>=100441) begin  
                                    piano<=~piano;
                                    couter<=0;
                                    end else 
                                    couter<=couter+1;
                                    end
                                h53:
                                    begin
                                    if(couter>=84461) begin  
                                    piano<=~piano;
                                    couter<=0;
                                    end else 
                                    couter<=couter+1;
                                    end
                                h54:
                                    begin
                                    if(couter>=75246) begin  
                                    piano<=~piano;
                                    couter<=0;
                                    end else 
                                    couter<=couter+1;
                                    end
                                 h55:
                                    begin
                                    if(couter>=67036) begin  
                                    piano<=~piano;
                                    couter<=0;
                                    end else 
                                    couter<=couter+1;
                                    end     
                  
  default:
      begin
      piano<=0;
      couter<=0;
      end
  endcase
  end
  
  always @ (posedge clk) begin  //产生8HZ时钟，16分音符时长
  if(couter2>=7812500) begin
  clk_8hz<=~clk_8hz;//reg定义下可以这样使用
  couter2<=0;
  end else
  couter2<=couter2+1;
  end
 
endmodule

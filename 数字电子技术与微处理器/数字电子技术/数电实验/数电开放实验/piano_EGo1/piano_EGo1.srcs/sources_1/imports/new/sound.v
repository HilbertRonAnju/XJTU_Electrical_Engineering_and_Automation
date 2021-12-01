`timescale 1ns / 1ps
module sound(
    input  wire clk,
    input  wire [7:0] keydata,
    output reg piano,
    output reg [7:0] musickey
    );
  
  reg [31:0] couter,couter2,couter4;//32位计数器
  reg [7:0] couter3,couter5,couter7;
  reg clk_8hz;
  reg [7:0] yinfu;//用来判断音符,直接赋初值，便于输出
  reg [2:0] sound_change=3'b000;//用来切换模式
  reg [3:0] num;//歌曲序号
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
  
  parameter m01=8'd40;
  parameter m02=8'd42;
  parameter m03=8'd44;
  parameter m04=8'd45;
  parameter m05=8'd47;
  parameter m06=8'd49;
  parameter m07=8'd51; 
  
  parameter h11=8'd52;
  parameter h12=8'd54;
  parameter h13=8'd56;
  parameter h14=8'd57;
  parameter h15=8'd59;
  parameter h16=8'd61;
  parameter h17=8'd63;
  
  parameter h21=8'd64;
  parameter h22=8'd66;
  parameter h23=8'd68;
  parameter h24=8'd69;
  parameter h25=8'd71;
  parameter h26=8'd73;
  parameter h27=8'd75;
 
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
   h12://高1个八度的音符1
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
 
  always @ (posedge clk)  //接受键盘信息，处理sound_change
  begin
     case (keydata)
     8'h5A:sound_change<=3'b000;
     8'h29:sound_change<=3'b001;
     8'h16:sound_change<=3'b010;//1
     8'h1E:sound_change<=3'b011;//2
     8'h26:sound_change<=3'b100;//3
     8'h25:sound_change<=3'b101;//4
     8'h2E:sound_change<=3'b110;//5
     default:num<=0;
     endcase
 end
  
  always @ (posedge clk_8hz) begin //播放内置歌曲
  case(sound_change)
  
  3'b000:
  begin
  yinfu<=zero;
  couter3<=0;
  couter5<=0;
  couter7<=0;
  musickey<=0;
  end
  
  3'b001:
  begin 
  couter3<=0;
  couter5<=0;
  couter7<=0;
  yinfu<=zero;
  musickey<=0;
  end
  
  3'b010://天空之城开始
   begin
   couter5<=0;
   couter7<=0;
   if(couter3>=250)
   couter3<=0;
   else
   couter3<=couter3+1;
   case(couter3)
     0:begin yinfu<=zero;musickey<=8'h00; end
     1:begin yinfu<=m06;musickey<=8'h33; end
     2:begin yinfu<=m06;musickey<=8'h33; end
     3:begin yinfu<=m07;musickey<=8'h3B; end
     4:begin yinfu<=m07;musickey<=8'h3B; end
    
     5:begin yinfu<=h11;musickey<=8'h1A; end
     6:begin yinfu<=h11;musickey<=8'h1A; end
     7:begin yinfu<=h11;musickey<=8'h1A; end
     8:begin yinfu<=m07;musickey<=8'h3B; end
     9:begin yinfu<=h11;musickey<=8'h1A; end
     10:begin yinfu<=h11;musickey<=8'h1A; end
     11:begin yinfu<=h13;musickey<=8'h21; end
     12:begin yinfu<=h13;musickey<=8'h21; end
    
     13:begin yinfu<=m07;musickey<=8'h3B; end
     14:begin yinfu<=m07;musickey<=8'h3B; end
     15:begin yinfu<=m07;musickey<=8'h3B; end
     16:begin yinfu<=m07;musickey<=8'h3B; end
     17:begin yinfu<=zero;musickey<=8'h00; end
     18:begin yinfu<=zero;musickey<=8'h00; end
     19:begin yinfu<=m03;musickey<=8'h23; end
     20:begin yinfu<=m03;musickey<=8'h23; end
    
     21:begin yinfu<=m06;musickey<=8'h33; end
     22:begin yinfu<=m06;musickey<=8'h33; end
     23:begin yinfu<=m06;musickey<=8'h33; end
     24:begin yinfu<=m05;musickey<=8'h34; end
     25:begin yinfu<=m06;musickey<=8'h33; end
     26:begin yinfu<=m06;musickey<=8'h33; end
     27:begin yinfu<=h11;musickey<=8'h1A; end
     28:begin yinfu<=h11;musickey<=8'h1A; end
    
     29:begin yinfu<=m05;musickey<=8'h34; end
     30:begin yinfu<=m05;musickey<=8'h34; end
     31:begin yinfu<=m05;musickey<=8'h34; end
     32:begin yinfu<=m05;musickey<=8'h34; end
     33:begin yinfu<=zero;musickey<=8'h00; end
     34:begin yinfu<=zero;musickey<=8'h00; end
     35:begin yinfu<=m03;musickey<=8'h23; end
     36:begin yinfu<=m03;musickey<=8'h23; end
    
     37:begin yinfu<=m04;musickey<=8'h2B; end
     38:begin yinfu<=m04;musickey<=8'h2B; end
     39:begin yinfu<=m04;musickey<=8'h2B; end
     40:begin yinfu<=m03;musickey<=8'h23; end
     41:begin yinfu<=m04;musickey<=8'h2B; end
     42:begin yinfu<=m04;musickey<=8'h2B; end
     43:begin yinfu<=h11;musickey<=8'h1A; end
     44:begin yinfu<=h11;musickey<=8'h1A; end
    
     45:begin yinfu<=m03;musickey<=8'h23; end
     46:begin yinfu<=m03;musickey<=8'h23; end
     47:begin yinfu<=m03;musickey<=8'h23; end
     48:begin yinfu<=m03;musickey<=8'h23; end
     49:begin yinfu<=zero;musickey<=8'h00; end
     50:begin yinfu<=zero;musickey<=8'h00; end
     51:begin yinfu<=h11;musickey<=8'h1A; end
     52:begin yinfu<=h11;musickey<=8'h1A; end
    
     53:begin yinfu<=m07;musickey<=8'h3B; end
     54:begin yinfu<=m07;musickey<=8'h3B; end
     55:begin yinfu<=m07;musickey<=8'h3B; end
     52:begin yinfu<=m04;musickey<=8'h2B; end//(8分音符4前面有#)
     53:begin yinfu<=m04;musickey<=8'h2B; end
     54:begin yinfu<=m04;musickey<=8'h2B; end
     55:begin yinfu<=m07;musickey<=8'h3B; end
     52:begin yinfu<=m07;musickey<=8'h3B; end
    
     53:begin yinfu<=m07;musickey<=8'h3B; end
     54:begin yinfu<=m07;musickey<=8'h3B; end
     55:begin yinfu<=m07;musickey<=8'h3B; end
     56:begin yinfu<=m07;musickey<=8'h3B; end
     57:begin yinfu<=zero;musickey<=8'h00; end
     58:begin yinfu<=zero;musickey<=8'h00; end
     59:begin yinfu<=m06;musickey<=8'h33; end
     60:begin yinfu<=m07;musickey<=8'h3B; end
    
     61:begin yinfu<=h11;musickey<=8'h1A; end
     62:begin yinfu<=h11;musickey<=8'h1A; end
     63:begin yinfu<=h11;musickey<=8'h1A; end
     64:begin yinfu<=m07;musickey<=8'h3B; end
     65:begin yinfu<=h11;musickey<=8'h1A; end
     66:begin yinfu<=h11;musickey<=8'h1A; end
     67:begin yinfu<=h13;musickey<=8'h21; end
     68:begin yinfu<=h13;musickey<=8'h21; end
    
     69:begin yinfu<=m07;musickey<=8'h3B; end
     70:begin yinfu<=m07; musickey<=8'h3B; end
     71:begin yinfu<=m07;musickey<=8'h3B; end
     72:begin yinfu<=m07;musickey<=8'h3B; end
     73:begin yinfu<=m07;musickey<=8'h3B; end
     74:begin yinfu<=zero;musickey<=8'h00; end
     75:begin yinfu<=m03;musickey<=8'h23; end
     76:begin yinfu<=m03;musickey<=8'h23; end
     
     77:begin yinfu<=m06;musickey<=8'h33; end
     78:begin yinfu<=m06;musickey<=8'h33; end
     79:begin yinfu<=m06;musickey<=8'h33; end
     80:begin yinfu<=m05;musickey<=8'h34; end
     81:begin yinfu<=m06;musickey<=8'h33; end
     82:begin yinfu<=m06;musickey<=8'h33; end
     83:begin yinfu<=h11;musickey<=8'h1A; end
     84:begin yinfu<=h11;musickey<=8'h1A; end
    
    
    
     85:begin yinfu<=m05;musickey<=8'h34; end
     86:begin yinfu<=m05;musickey<=8'h34; end
     87:begin yinfu<=m05;musickey<=8'h34; end
     88:begin yinfu<=m05;musickey<=8'h34; end
     89:begin yinfu<=zero;musickey<=8'h00; end
     90:begin yinfu<=zero;musickey<=8'h00; end
     91:begin yinfu<=m02;musickey<=8'h1B; end
     92:begin yinfu<=m03;musickey<=8'h23; end
    
     93:begin yinfu<=m04;musickey<=8'h2B; end
     94:begin yinfu<=m04;musickey<=8'h2B; end
     95:begin yinfu<=h11;musickey<=8'h1A; end
     96:begin yinfu<=m07;musickey<=8'h3B; end
     97:begin yinfu<=m07;musickey<=8'h3B; end
     98:begin yinfu<=m07;musickey<=8'h3B; end
     99:begin yinfu<=h11;musickey<=8'h1A; end
     100:begin yinfu<=h11;musickey<=8'h1A; end
    
     101:begin yinfu<=h12;musickey<=8'h22; end
     102:begin yinfu<=h12;musickey<=8'h22; end
     103:begin yinfu<=h13;musickey<=8'h21; end
     104:begin yinfu<=h11;musickey<=8'h1A; end
     105:begin yinfu<=h11;musickey<=8'h1A; end
     106:begin yinfu<=h11;musickey<=8'h1A; end
     107:begin yinfu<=h11;musickey<=8'h1A; end
     108:begin yinfu<=zero;musickey<=8'h00; end
    
     109:begin yinfu<=h11;musickey<=8'h1A; end
     110:begin yinfu<=m07;musickey<=8'h3B; end
     111:begin yinfu<=m06;musickey<=8'h33; end
     112:begin yinfu<=m06;musickey<=8'h33; end
     113:begin yinfu<=m07;musickey<=8'h3B; end
     114:begin yinfu<=m07;musickey<=8'h3B; end
     115:begin yinfu<=m05;musickey<=8'h34; end//(4分音符5前面有#)
     116:begin yinfu<=m05;musickey<=8'h34; end//(4分音符5前面有#,这俩合起来是一个四分音符 基础单元是八分音符)
    
     117:begin yinfu<=m06;musickey<=8'h33; end
     118:begin yinfu<=m06;musickey<=8'h33; end
     119:begin yinfu<=m06;musickey<=8'h33; end
     120:begin yinfu<=m06;musickey<=8'h33; end
     121:begin yinfu<=m06;musickey<=8'h33; end
     122:begin yinfu<=zero;musickey<=8'h00; end
     123:begin yinfu<=zero;musickey<=8'h00; end
     124:begin yinfu<=h11;musickey<=8'h1A; end
     125:begin yinfu<=h12;musickey<=8'h22; end
    
     126:begin yinfu<=h13;musickey<=8'h21; end
     127:begin yinfu<=h13;musickey<=8'h21; end
     128:begin yinfu<=h13;musickey<=8'h21; end
     129:begin yinfu<=h12;musickey<=8'h22; end
     130:begin yinfu<=h13;musickey<=8'h21; end
     131:begin yinfu<=h13;musickey<=8'h21; end
     132:begin yinfu<=h15;musickey<=8'h32; end
     133:begin yinfu<=h15;musickey<=8'h32; end
    
    
    
    
    
     134:begin yinfu<=h12;musickey<=8'h22; end
     135:begin yinfu<=h12;musickey<=8'h22; end
     136:begin yinfu<=h12;musickey<=8'h22; end
     137:begin yinfu<=h12;musickey<=8'h22; end
     138:begin yinfu<=h12;musickey<=8'h22; end
     139:begin yinfu<=zero;musickey<=8'h00; end
     140:begin yinfu<=m05;musickey<=8'h34; end
     141:begin yinfu<=m05;musickey<=8'h34; end
    
     142:begin yinfu<=h11;musickey<=8'h1A; end
     143:begin yinfu<=h11;musickey<=8'h1A; end
     144:begin yinfu<=h11;musickey<=8'h1A; end
     145:begin yinfu<=m07;musickey<=8'h3B; end
     146:begin yinfu<=h11;musickey<=8'h1A; end
     147:begin yinfu<=h11;musickey<=8'h1A; end
     148:begin yinfu<=h13;musickey<=8'h21; end
     149:begin yinfu<=h13;musickey<=8'h21; end
     
     150:begin yinfu<=h13;musickey<=8'h21; end
     151:begin yinfu<=h13;musickey<=8'h21; end
     152:begin yinfu<=h13;musickey<=8'h21; end
     153:begin yinfu<=h13;musickey<=8'h21; end
     154:begin yinfu<=h13;musickey<=8'h21; end
     155:begin yinfu<=h13;musickey<=8'h21; end
     156:begin yinfu<=zero;musickey<=8'h00; end
     157:begin yinfu<=zero;musickey<=8'h00; end
    
     158:begin yinfu<=m06;musickey<=8'h33; end
     159:begin yinfu<=m07;musickey<=8'h3B; end
     160:begin yinfu<=h11;musickey<=8'h1A; end
     161:begin yinfu<=h11;musickey<=8'h1A; end
     162:begin yinfu<=m07;musickey<=8'h3B; end
     163:begin yinfu<=h11;musickey<=8'h1A; end
     164:begin yinfu<=h12;musickey<=8'h22; end
     165:begin yinfu<=h12;musickey<=8'h22; end
    
     166:begin yinfu<=h11;musickey<=8'h1A; end
     167:begin yinfu<=h11;musickey<=8'h1A; end
     168:begin yinfu<=h11;musickey<=8'h1A; end
     169:begin yinfu<=m05;musickey<=8'h34; end
     170:begin yinfu<=m05;musickey<=8'h34; end
     171:begin yinfu<=m05;musickey<=8'h34; end
     172:begin yinfu<=m05;musickey<=8'h34; end
     173:begin yinfu<=m05;musickey<=8'h34; end
    
     174:begin yinfu<=h14;musickey<=8'h2A; end
     175:begin yinfu<=h14;musickey<=8'h2A; end
     176:begin yinfu<=h13;musickey<=8'h21; end
     177:begin yinfu<=h13;musickey<=8'h21; end
     178:begin yinfu<=h12;musickey<=8'h22; end
     179:begin yinfu<=h12;musickey<=8'h22; end
     180:begin yinfu<=h11;musickey<=8'h1A; end
     181:begin yinfu<=h11;musickey<=8'h1A; end
    
     182:begin yinfu<=h13;musickey<=8'h21; end
     183:begin yinfu<=h13; musickey<=8'h21; end
     184:begin yinfu<=h13;musickey<=8'h21; end
     185:begin yinfu<=h13;musickey<=8'h21; end
     186:begin yinfu<=h13;musickey<=8'h21; end
     187:begin yinfu<=h13;musickey<=8'h21; end
     188:begin yinfu<=zero;musickey<=8'h00; end
     189:begin yinfu<=h13;musickey<=8'h21; end
    
     190:begin yinfu<=h16;musickey<=8'h31; end
     191:begin yinfu<=h16;musickey<=8'h31; end
     192:begin yinfu<=h16;musickey<=8'h31; end
     193:begin yinfu<=h16;musickey<=8'h31; end
     194:begin yinfu<=h15;musickey<=8'h32; end
     195:begin yinfu<=h15;musickey<=8'h32; end
     196:begin yinfu<=h15;musickey<=8'h32; end
     197:begin yinfu<=h15;musickey<=8'h32; end
    
     198:begin yinfu<=h13;musickey<=8'h21; end
     199:begin yinfu<=h12;musickey<=8'h22; end
     200:begin yinfu<=h11;musickey<=8'h1A; end
     201:begin yinfu<=h11;musickey<=8'h1A; end
     202:begin yinfu<=h11;musickey<=8'h1A; end
     203:begin yinfu<=h11;musickey<=8'h1A; end
     204:begin yinfu<=zero;musickey<=8'h00; end
     205:begin yinfu<=h11;musickey<=8'h1A; end
    
     206:begin yinfu<=h12;musickey<=8'h22; end
     207:begin yinfu<=h12;musickey<=8'h22; end
     208:begin yinfu<=h12;musickey<=8'h22; end
     209:begin yinfu<=h11;musickey<=8'h1A; end
     210:begin yinfu<=h12;musickey<=8'h22; end
     211:begin yinfu<=h12;musickey<=8'h22; end
     212:begin yinfu<=h15;musickey<=8'h32; end
     213:begin yinfu<=h15;musickey<=8'h32; end
    
     214:begin yinfu<=h13;musickey<=8'h21; end
     215:begin yinfu<=h13;musickey<=8'h21; end
     216:begin yinfu<=h13;musickey<=8'h21; end
     217:begin yinfu<=h13;musickey<=8'h21; end
     218:begin yinfu<=h13;musickey<=8'h21; end
     219:begin yinfu<=h13;musickey<=8'h21; end
     220:begin yinfu<=zero;musickey<=8'h00; end
     221:begin yinfu<=h13;musickey<=8'h21; end
    
     221:begin yinfu<=h16;musickey<=8'h31; end
     222:begin yinfu<=h16;musickey<=8'h31; end
     223:begin yinfu<=h16;musickey<=8'h31; end
     224:begin yinfu<=h16;musickey<=8'h31; end
     225:begin yinfu<=h15;musickey<=8'h32; end
     226:begin yinfu<=h15;musickey<=8'h32; end
     227:begin yinfu<=h15;musickey<=8'h32; end
     228:begin yinfu<=h15;musickey<=8'h32; end
    
     229:begin yinfu<=h13;musickey<=8'h21; end
     230:begin yinfu<=h12;musickey<=8'h22; end
     231:begin yinfu<=h11;musickey<=8'h1A; end
     232:begin yinfu<=h11;musickey<=8'h1A; end
     233:begin yinfu<=h11;musickey<=8'h1A; end
     234:begin yinfu<=h11;musickey<=8'h1A; end
     235:begin yinfu<=zero;musickey<=8'h00; end
     236:begin yinfu<=h11;musickey<=8'h1A; end
    
     237:begin yinfu<=h12;musickey<=8'h22; end
     238:begin yinfu<=h12;musickey<=8'h22; end
     239:begin yinfu<=h12;musickey<=8'h22; end
     240:begin yinfu<=h11;musickey<=8'h1A; end
     241:begin yinfu<=h12;musickey<=8'h22; end
     242:begin yinfu<=h12;musickey<=8'h22; end
     243:begin yinfu<=m07;musickey<=8'h3B; end
     244:begin yinfu<=m07;musickey<=8'h3B; end
    
     245:begin yinfu<=m06;musickey<=8'h33; end
     246:begin yinfu<=m06;musickey<=8'h33; end
     247:begin yinfu<=m06;musickey<=8'h33; end
     248:begin yinfu<=m06;musickey<=8'h33; end
     249:begin yinfu<=zero;musickey<=8'h00; end
     250:begin yinfu<=zero;musickey<=8'h00; end
   default:begin yinfu<=zero;musickey<=8'h00; end
   endcase
   end//天空之城结束
   
   3'b011://两只老虎开始
   begin
       couter3<=0;
       couter7<=0;
       if(couter5>=63)
       couter5<=0;
       else
       couter5<=couter5+1;
       case(couter5)
         0:yinfu<=h21;
         1:yinfu<=h21;
         2:yinfu<=h22;
         3:yinfu<=h22;
         4:yinfu<=h23;
         5:yinfu<=h23;
         6:yinfu<=h21;
         7:yinfu<=h21;
         
         8:yinfu<=h21;
         9:yinfu<=h21;
         10:yinfu<=h22;
         11:yinfu<=h22;
         12:yinfu<=h23;
         13:yinfu<=h23;
         14:yinfu<=h21;
         15:yinfu<=h21;
         
         16:yinfu<=h23;
         17:yinfu<=h23;
         18:yinfu<=h24;
         19:yinfu<=h24;
         20:yinfu<=h25;
         21:yinfu<=h25;
         22:yinfu<=h25;
         23:yinfu<=h25;
         
         24:yinfu<=h23;
         25:yinfu<=h23;
         26:yinfu<=h24;
         27:yinfu<=h24;
         28:yinfu<=h25;
         29:yinfu<=h25;
         30:yinfu<=h25;
         31:yinfu<=h25;
         
         32:yinfu<=h25;
         33:yinfu<=h26;
         34:yinfu<=h25;
         35:yinfu<=h24;
         36:yinfu<=h23;
         37:yinfu<=h23;
         38:yinfu<=h21;
         39:yinfu<=h21;
         
         40:yinfu<=h25;
         41:yinfu<=h26;
         42:yinfu<=h25;
         43:yinfu<=h24;
         44:yinfu<=h23;
         45:yinfu<=h23;
         46:yinfu<=h21;
         47:yinfu<=h21;
        
         48:yinfu<=h22;
         49:yinfu<=h22;
         50:yinfu<=h25;
         51:yinfu<=h25;
         52:yinfu<=h21;
         53:yinfu<=h21;
         54:yinfu<=zero;
         55:yinfu<=zero;
         
         56:yinfu<=h22;
         57:yinfu<=h22;
         58:yinfu<=h15;
         59:yinfu<=h15;
         60:yinfu<=h21;
         61:yinfu<=h21;
         62:yinfu<=zero;
         63:yinfu<=zero; 
       default:yinfu<=zero;
       endcase
       end//两只老虎结束
   
       3'b100://猪八戒开始
          begin
              couter3<=0;
              couter5<=0;
              if(couter7>=151)
              couter7<=0;
              else
              couter7<=couter7+1;
              case(couter7)
                0:begin yinfu<=m06;musickey<=8'h33; end
                1:begin yinfu<=m06;musickey<=8'h33; end
                2:begin yinfu<=m06;musickey<=8'h33; end
                3:begin yinfu<=m06;musickey<=8'h33; end
                4:begin yinfu<=h13;musickey<=8'h21; end
                5:begin yinfu<=h13;musickey<=8'h21; end
                6:begin yinfu<=h13;musickey<=8'h21; end
                7:begin yinfu<=h15;musickey<=8'h32; end
                
                8:begin yinfu<=h13;musickey<=8'h21; end
                9:begin yinfu<=h13;musickey<=8'h21; end
                10:begin yinfu<=m06;musickey<=8'h33; end
                11:begin yinfu<=m06;musickey<=8'h33; end
                12:begin yinfu<=h11;musickey<=8'h1A; end
                13:begin yinfu<=h11;musickey<=8'h1A; end
                14:begin yinfu<=h11;musickey<=8'h1A; end
                15:begin yinfu<=h11;musickey<=8'h1A; end
                
                16:begin yinfu<=m06;musickey<=8'h33; end
                17:begin yinfu<=h11;musickey<=8'h1A; end
                18:begin yinfu<=m06;musickey<=8'h33; end
                19:begin yinfu<=h11;musickey<=8'h1A; end
                20:begin yinfu<=h13;musickey<=8'h21; end
                21:begin yinfu<=h13;musickey<=8'h21; end
                22:begin yinfu<=h13;musickey<=8'h21; end
                23:begin yinfu<=h13;musickey<=8'h21; end
                
                24:begin yinfu<=h13;musickey<=8'h21; end
                25:begin yinfu<=h12;musickey<=8'h22; end
                26:begin yinfu<=h13;musickey<=8'h21; end
                27:begin yinfu<=h11;musickey<=8'h1A; end
                28:begin yinfu<=m06;musickey<=8'h33; end
                29:begin yinfu<=m06;musickey<=8'h33; end
                30:begin yinfu<=m06;musickey<=8'h33; end
                31:begin yinfu<=m06;musickey<=8'h33; end
                
                32:begin yinfu<=h13;musickey<=8'h21; end
                33:begin yinfu<=h13;musickey<=8'h21; end
                34:begin yinfu<=h13;musickey<=8'h21; end
                35:begin yinfu<=h15;musickey<=8'h32; end
                36:begin yinfu<=h16;musickey<=8'h31; end
                37:begin yinfu<=h16;musickey<=8'h31; end
                38:begin yinfu<=h16;musickey<=8'h31; end
                39:begin yinfu<=h16;musickey<=8'h31; end
                
                40:begin yinfu<=h16;musickey<=8'h31; end
                41:begin yinfu<=h16;musickey<=8'h31; end
                42:begin yinfu<=h13;musickey<=8'h21; end
                43:begin yinfu<=h13;musickey<=8'h21; end
                44:begin yinfu<=h15;musickey<=8'h32; end
                45:begin yinfu<=h15;musickey<=8'h32; end
                46:begin yinfu<=h15;musickey<=8'h32; end
                47:begin yinfu<=h15;musickey<=8'h32; end
                
                48:begin yinfu<=h13;musickey<=8'h21; end
                49:begin yinfu<=h15;musickey<=8'h32; end
                50:begin yinfu<=h13;musickey<=8'h21; end
                51:begin yinfu<=h15;musickey<=8'h32; end
                52:begin yinfu<=h16;musickey<=8'h31; end
                53:begin yinfu<=h16;musickey<=8'h31; end
                54:begin yinfu<=h16;musickey<=8'h31; end
                55:begin yinfu<=h16;musickey<=8'h31; end
               
                56:begin yinfu<=h16;musickey<=8'h31; end
                57:begin yinfu<=h16;musickey<=8'h31; end
                58:begin yinfu<=h13;musickey<=8'h21; end
                59:begin yinfu<=h13;musickey<=8'h21; end
                60:begin yinfu<=h15;musickey<=8'h32; end
                61:begin yinfu<=h15;musickey<=8'h32; end
                62:begin yinfu<=h15;musickey<=8'h32; end
                63:begin yinfu<=h15;musickey<=8'h32; end
               
                64:begin yinfu<=h15;musickey<=8'h32; end//(5前面有个东西)
                65:begin yinfu<=h15;musickey<=8'h32; end
                66:begin yinfu<=m06;musickey<=8'h33; end
                67:begin yinfu<=m06;musickey<=8'h33; end
                68:begin yinfu<=h15;musickey<=8'h32; end//(5前面有个东西)
                69:begin yinfu<=h15;musickey<=8'h32; end
                70:begin yinfu<=m06;musickey<=8'h33; end
                71:begin yinfu<=m06;musickey<=8'h33; end
               
                72:begin yinfu<=h13;musickey<=8'h21; end
                73:begin yinfu<=h13;musickey<=8'h21; end// (八分音符3后面有一个#)
                74:begin yinfu<=h12;musickey<=8'h22; end
                75:begin yinfu<=h12;musickey<=8'h22; end
                76:begin yinfu<=h13;musickey<=8'h21; end
                77:begin yinfu<=h13;musickey<=8'h21; end
                78:begin yinfu<=h11;musickey<=8'h1A; end
                79:begin yinfu<=h11;musickey<=8'h1A; end
                80:begin yinfu<=h11;musickey<=8'h1A; end
                81:begin yinfu<=h11;musickey<=8'h1A; end
               
                82:begin yinfu<=h12;musickey<=8'h22; end
                83:begin yinfu<=h12; musickey<=8'h22; end
                84:begin yinfu<=h12;musickey<=8'h22; end
                85:begin yinfu<=h12;musickey<=8'h22; end
                86:begin yinfu<=h12;musickey<=8'h22; end
                87:begin yinfu<=h12;musickey<=8'h22; end
                88:begin yinfu<=h12;musickey<=8'h22; end
                89:begin yinfu<=h12;musickey<=8'h22; end
               
                90:begin yinfu<=h12;musickey<=8'h22; end
                91:begin yinfu<=h12;musickey<=8'h22; end
                92:begin yinfu<=h11;musickey<=8'h1A; end
                93:begin yinfu<=h12;musickey<=8'h22; end
                94:begin yinfu<=h13;musickey<=8'h21; end
                95:begin yinfu<=h13;musickey<=8'h21; end
                96:begin yinfu<=h15;musickey<=8'h32; end
                97:begin yinfu<=h15;musickey<=8'h32; end
               
                98:begin yinfu<=h16;musickey<=8'h31; end
                99:begin yinfu<=h16;musickey<=8'h31; end
                100:begin yinfu<=h16;musickey<=8'h31; end
                101:begin yinfu<=h16;musickey<=8'h31; end
                102:begin yinfu<=h23;end
                103:begin yinfu<=h23;end
                104:begin yinfu<=h23;end
                105:begin yinfu<=h23;end
               
                106:begin yinfu<=h13;musickey<=8'h21; end
                107:begin yinfu<=h13;musickey<=8'h21; end
                108:begin yinfu<=h13;musickey<=8'h21; end
                109:begin yinfu<=h13;musickey<=8'h21; end
                110:begin yinfu<=h23;end
                111:begin yinfu<=h23;end
                112:begin yinfu<=h23;end
                113:begin yinfu<=h23;end
               
                114:begin yinfu<=h13;musickey<=8'h21; end
                115:begin yinfu<=h13;musickey<=8'h21; end
                116:begin yinfu<=h23;end
                117:begin yinfu<=h23;end
                118:begin yinfu<=h13;musickey<=8'h21; end
                119:begin yinfu<=h13;musickey<=8'h21; end
                120:begin yinfu<=h23;end
                121:begin yinfu<=h23;end
               
                122:begin yinfu<=h13;musickey<=8'h21; end//(八分音符3后面有一个#)
                123:begin yinfu<=h13;musickey<=8'h21; end
                124:begin yinfu<=h12;musickey<=8'h22; end
                125:begin yinfu<=h12;musickey<=8'h22; end
                126:begin yinfu<=h13;musickey<=8'h21; end
                127:begin yinfu<=h13;musickey<=8'h21; end
                128:begin yinfu<=h11;musickey<=8'h1A; end
                129:begin yinfu<=h11;musickey<=8'h1A; end
                130:begin yinfu<=h11;musickey<=8'h1A; end
                131:begin yinfu<=h11;musickey<=8'h1A; end
               
                132:begin yinfu<=h12;musickey<=8'h22; end
                133:begin yinfu<=h12;musickey<=8'h22; end
                134:begin yinfu<=h12;musickey<=8'h22; end
                135:begin yinfu<=h12;musickey<=8'h22; end
                136:begin yinfu<=h12;musickey<=8'h22; end
                137:begin yinfu<=h12;musickey<=8'h22; end
                138:begin yinfu<=h12;musickey<=8'h22; end
                139:begin yinfu<=h12;musickey<=8'h22; end
               
                140:begin yinfu<=h12;musickey<=8'h22; end
                141:begin yinfu<=h12;musickey<=8'h22; end
                142:begin yinfu<=h11;musickey<=8'h1A; end
                143:begin yinfu<=h12;musickey<=8'h22; end
                144:begin yinfu<=h13;musickey<=8'h21; end
                145:begin yinfu<=h13;musickey<=8'h21; end
                146:begin yinfu<=h15;musickey<=8'h32; end
                147:begin yinfu<=h15;musickey<=8'h32; end
               
                148:begin yinfu<=h16;musickey<=8'h31; end
                149:begin yinfu<=h16; musickey<=8'h31; end
                150:begin yinfu<=h16;musickey<=8'h31; end
                151:begin yinfu<=h16;  musickey<=8'h31; end
              default:begin yinfu<=zero;musickey<=8'h00; end
              endcase
              end//两只老虎结束
   
   default:yinfu<=zero;
   
   endcase
   
   end
  
endmodule

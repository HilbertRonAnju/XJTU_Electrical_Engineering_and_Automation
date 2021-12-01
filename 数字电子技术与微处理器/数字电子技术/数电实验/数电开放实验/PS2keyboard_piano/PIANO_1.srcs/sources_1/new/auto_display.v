`timescale 1ns / 1ps
//自动放音模块
module auto_display(
  input clk_16,//节拍时钟
  input en,//1为使能
  input [2:0] songs_num,//歌曲选择
  output reg [4:0] tone//键值输出
    );
    
  reg [19:0] count;//时间计数器
  //寄存器类型变量初始化
  initial 
    begin
      tone<=5'd22;//初始化为无效键值
      count<=1'b0;
    end
  //内置曲谱并按节拍读取输出  
  always @(posedge clk_16)
    begin
      if(en==1'b1)
        begin         
          case(songs_num)
            3'b100://千本樱
              begin
                if(count>=192)
                  begin
                    count<=1'b0;
                  end
                else
                  begin
                    count<=count+1'b1;
                  end
                case(count)
                  20'd0:tone<=5'd12;
                  20'd1:tone<=5'd12;
                  
                  20'd2:tone<=5'd12;
                  20'd3:tone<=5'd12;
                  20'd4:tone<=5'd12;  
                  20'd5:tone<=5'd12;
                  
                  20'd6:tone<=5'd11;
                  20'd7:tone<=5'd11;
                  
                  20'd8:tone<=5'd12;
                  20'd9:tone<=5'd12;
                  
                  20'd10:tone<=5'd12;
                  20'd11:tone<=5'd12;
                  20'd12:tone<=5'd12;
                  20'd13:tone<=5'd12;
                  
                  20'd14:tone<=5'd11;
                  20'd15:tone<=5'd11;
                  
                  20'd16:tone<=5'd12;
                  20'd17:tone<=5'd12;
                  
                  20'd18:tone<=5'd12;
                  20'd19:tone<=5'd12;
                  
                  20'd20:tone<=5'd11;
                  20'd21:tone<=5'd11;
                  20'd22:tone<=5'd11;
                  20'd23:tone<=5'd11;
                  
                  20'd24:tone<=5'd12;
                  20'd25:tone<=5'd12;
                  
                  20'd26:tone<=5'd15;
                  20'd27:tone<=5'd15;
                  20'd28:tone<=5'd15;
                  20'd29:tone<=5'd15;
                  
                  20'd30:tone<=5'd12;
                  20'd31:tone<=5'd12;
                  
                  20'd32:tone<=5'd12;
                  20'd33:tone<=5'd12;
                  20'd34:tone<=5'd12;
                  20'd35:tone<=5'd12;
                  
                  20'd36:tone<=5'd11;
                  20'd37:tone<=5'd11;
                  
                  20'd38:tone<=5'd12;
                  20'd39:tone<=5'd12;
                  
                  20'd40:tone<=5'd12;
                  20'd41:tone<=5'd12;
                  20'd42:tone<=5'd12;
                  20'd43:tone<=5'd12;
                  
                  20'd44:tone<=5'd11;
                  20'd45:tone<=5'd11;
                  
                  20'd46:tone<=5'd12;
                  20'd47:tone<=5'd12;
                  
                  20'd48:tone<=5'd12;
                  20'd49:tone<=5'd12;
                  
                  20'd50:tone<=5'd14;
                  20'd51:tone<=5'd14;
                  20'd52:tone<=5'd14;
                  20'd53:tone<=5'd14;
                  
                  20'd54:tone<=5'd15;
                  
                  20'd55:tone<=5'd15;
                  20'd56:tone<=5'd15;
                  20'd57:tone<=5'd15;
                  
                  20'd58:tone<=5'd16;
                  20'd59:tone<=5'd16;
                  20'd60:tone<=5'd16;
                  20'd61:tone<=5'd16;
                  
                  20'd62:tone<=5'd8;
                  
                  20'd63:tone<=5'd8;
                  
                  20'd64:tone<=5'd9;
                  20'd65:tone<=5'd9;
                  
                  20'd66:tone<=5'd5;
                  
                  20'd67:tone<=5'd4;
                  
                  20'd68:tone<=5'd5;
                  
                  20'd69:tone<=5'd4;
                  
                  20'd70:tone<=5'd8;
                  
                  20'd71:tone<=5'd8;
                  
                  20'd72:tone<=5'd9;
                  20'd73:tone<=5'd9;
                  
                  20'd74:tone<=5'd5;
                  
                  20'd75:tone<=5'd4;
                  
                  20'd76:tone<=5'd5;
                  
                  20'd77:tone<=5'd4;
                  
                  20'd78:tone<=5'd8;
                  20'd79:tone<=5'd8;
                  
                  20'd80:tone<=5'd9;
                  20'd81:tone<=5'd9;
                  
                  20'd82:tone<=5'd5;
                  
                  20'd83:tone<=5'd4;
                  
                  20'd84:tone<=5'd5;
                  
                  20'd85:tone<=5'd4;
                  
                  20'd86:tone<=5'd14;
                  20'd87:tone<=5'd14;
                  
                  20'd88:tone<=5'd13;
                  20'd89:tone<=5'd13;
                  
                  20'd90:tone<=5'd5;
                  
                  20'd91:tone<=5'd4;
                  
                  20'd92:tone<=5'd8;
                  20'd93:tone<=5'd8;
                  
                  20'd94:tone<=5'd9;
                  20'd95:tone<=5'd9;
                  
                  20'd96:tone<=5'd5;
                  
                  20'd97:tone<=5'd4;
                  
                  20'd98:tone<=5'd5;
                  
                  20'd99:tone<=5'd4;
                  
                  20'd100:tone<=5'd8;
                  20'd101:tone<=5'd8;
                  
                  20'd102:tone<=5'd9;
                  20'd103:tone<=5'd9;
                  
                  20'd104:tone<=5'd5;
                  
                  20'd105:tone<=5'd4;
                  
                  20'd106:tone<=5'd5;
                  
                  20'd107:tone<=5'd4;
                  
                  20'd108:tone<=5'd8;
                  20'd109:tone<=5'd8;
                  
                  20'd110:tone<=5'd9;
                  20'd111:tone<=5'd9;
                  
                  20'd112:tone<=5'd11;
                  
                  20'd113:tone<=5'd11;
                  
                  20'd114:tone<=5'd14;
                  20'd115:tone<=5'd14;
                  
                  20'd116:tone<=5'd13;
                  20'd117:tone<=5'd13;
                  
                  20'd118:tone<=5'd14;
                  20'd119:tone<=5'd14;
                 
                  20'd120:tone<=5'd13;
                  20'd121:tone<=5'd13;
                  
                  20'd122:tone<=5'd12;
                  20'd123:tone<=5'd12;
                  
                  20'd124:tone<=5'd11;
                  20'd125:tone<=5'd11;
                  
                  20'd126:tone<=5'd9;
                  20'd127:tone<=5'd9;
                  
                  20'd128:tone<=5'd8;
                  20'd129:tone<=5'd8;
                  
                  20'd130:tone<=5'd9;
                  20'd131:tone<=5'd9;
                  
                  20'd132:tone<=5'd5;
                  
                  20'd133:tone<=5'd4;
                  
                  20'd134:tone<=5'd5;
                  
                  20'd135:tone<=5'd4;
                  
                  20'd136:tone<=5'd8;
                  
                  20'd137:tone<=5'd8;
                  
                  20'd138:tone<=5'd9;
                  20'd139:tone<=5'd9;
                  
                  20'd140:tone<=5'd5;
                  
                  20'd141:tone<=5'd4;
                  
                  20'd142:tone<=5'd5;
                  
                  20'd143:tone<=5'd4;
                  
                  20'd144:tone<=5'd8;
                  20'd145:tone<=5'd8;
                  
                  20'd146:tone<=5'd9;
                  20'd147:tone<=5'd9;
                  
                  20'd148:tone<=5'd5;
                  
                  20'd149:tone<=5'd4;
                  
                  20'd150:tone<=5'd5;
                  
                  20'd151:tone<=5'd4;
                  
                  20'd152:tone<=5'd14;
                  20'd153:tone<=5'd14;
                  
                  20'd154:tone<=5'd13;
                  20'd155:tone<=5'd13;
                  
                  20'd156:tone<=5'd5;
                  
                  20'd157:tone<=5'd4;
                  
                  20'd158:tone<=5'd5;
                  20'd159:tone<=5'd5;
                  
                  20'd160:tone<=5'd4;
                  
                  20'd161:tone<=5'd5;
                  
                  20'd162:tone<=5'd7;
                  
                  20'd163:tone<=5'd7;
                  
                  20'd164:tone<=5'd5;
                  
                  20'd165:tone<=5'd7;
                  
                  20'd166:tone<=5'd8;
                  20'd167:tone<=5'd8;
                  
                  20'd168:tone<=5'd8;
                  
                  20'd169:tone<=5'd9;
                  
                  20'd170:tone<=5'd11;
                  
                  20'd171:tone<=5'd14;
                  
                  20'd172:tone<=5'd9;
                  
                  20'd173:tone<=5'd11;
                  
                  20'd174:tone<=5'd14;
                  20'd175:tone<=5'd14;
                  20'd176:tone<=5'd14;
                  20'd177:tone<=5'd14;
                  
                  20'd178:tone<=5'd13;
                  
                  20'd179:tone<=5'd14;
                  
                  20'd180:tone<=5'd13;
                  
                  20'd181:tone<=5'd12;
                  20'd182:tone<=5'd12;
                  
                  20'd183:tone<=5'd11;
                  20'd184:tone<=5'd11;
                  
                  20'd185:tone<=5'd12;
                  20'd186:tone<=5'd12;
                  20'd187:tone<=5'd12;
                  
                  20'd188:tone<=5'd12;
                  
                  20'd189:tone<=5'd12;
                  20'd190:tone<=5'd12;
                  
                  20'd191:tone<=5'd15;
                  20'd192:tone<=5'd15;
                endcase
              end
          3'b010://天空之城
            begin
              if(count>=195)
                begin
                  count<=1'b0;
                end
              else
                begin
                  count<=count+1'b1;
                end
              case(count)
              20'd0:tone<=5'd12;
              20'd1:tone<=5'd13;
              
              20'd2:tone<=5'd14;
              20'd3:tone<=5'd14;
              20'd4:tone<=5'd14;  
              20'd5:tone<=5'd13;
              
              20'd6:tone<=5'd14;
              20'd7:tone<=5'd14;
              
              20'd8:tone<=5'd16;
              20'd9:tone<=5'd16;
              
              20'd10:tone<=5'd13;
              20'd11:tone<=5'd13;
              20'd12:tone<=5'd13;
              20'd13:tone<=5'd13;
              
              20'd14:tone<=5'd13;
              20'd15:tone<=5'd13;
              
              20'd16:tone<=5'd9;
              20'd17:tone<=5'd9;
              
              20'd18:tone<=5'd12;
              20'd19:tone<=5'd12;
              
              20'd20:tone<=5'd12;
              20'd21:tone<=5'd11;
              20'd22:tone<=5'd12;
              20'd23:tone<=5'd12;
              
              20'd24:tone<=5'd7;
              20'd25:tone<=5'd7;
              
              20'd26:tone<=5'd11;
              20'd27:tone<=5'd11;
              20'd28:tone<=5'd11;
              20'd29:tone<=5'd11;
              
              20'd30:tone<=5'd11;
              20'd31:tone<=5'd11;
              
              20'd32:tone<=5'd9;
              20'd33:tone<=5'd9;
              20'd34:tone<=5'd10;
              20'd35:tone<=5'd10;
              
              20'd36:tone<=5'd10;
              20'd37:tone<=5'd9;
              
              20'd38:tone<=5'd10;
              20'd39:tone<=5'd14;
              
              20'd40:tone<=5'd14;
              20'd41:tone<=5'd14;
              20'd42:tone<=5'd9;
              20'd43:tone<=5'd9;
              
              20'd44:tone<=5'd9;
              20'd45:tone<=5'd14;
              
              20'd46:tone<=5'd14;
              20'd47:tone<=5'd14;
              
              20'd48:tone<=5'd13;
              20'd49:tone<=5'd13;
              
              20'd50:tone<=5'd13;
              20'd51:tone<=5'd10;
              20'd52:tone<=5'd10;
              20'd53:tone<=5'd10;
              
              20'd54:tone<=5'd13;
              
              20'd55:tone<=5'd13;
              20'd56:tone<=5'd13;
              20'd57:tone<=5'd13;
              
              20'd58:tone<=5'd13;
              20'd59:tone<=5'd13;
              20'd60:tone<=5'd13;
              20'd61:tone<=5'd13;
              
              20'd62:tone<=5'd12;
              
              20'd63:tone<=5'd13;
              
              20'd64:tone<=5'd14;
              20'd65:tone<=5'd14;
              
              20'd66:tone<=5'd14;
              
              20'd67:tone<=5'd20;
              
              20'd68:tone<=5'd14;
              
              20'd69:tone<=5'd14;
              
              20'd70:tone<=5'd16;
              
              20'd71:tone<=5'd16;
              
              20'd72:tone<=5'd13;
              20'd73:tone<=5'd13;
              
              20'd74:tone<=5'd13;
              
              20'd75:tone<=5'd9;
              
              20'd76:tone<=5'd9;
              
              20'd77:tone<=5'd12;
              
              20'd78:tone<=5'd12;
              20'd79:tone<=5'd12;
              
              20'd80:tone<=5'd11;
              20'd81:tone<=5'd12;
              
              20'd82:tone<=5'd12;
              
              20'd83:tone<=5'd7;
              
              20'd84:tone<=5'd7;
              
              20'd85:tone<=5'd11;
              
              20'd86:tone<=5'd11;
              20'd87:tone<=5'd11;
              
              20'd88:tone<=5'd11;
              20'd89:tone<=5'd11;
              
              20'd90:tone<=5'd11;
              
              20'd91:tone<=5'd9;
              
              20'd92:tone<=5'd9;
              20'd93:tone<=5'd10;
              
              20'd94:tone<=5'd10;
              20'd95:tone<=5'd14;
              
              20'd96:tone<=5'd13;
              
              20'd97:tone<=5'd13;
              
              20'd98:tone<=5'd13;
              
              20'd99:tone<=5'd14;
              
              20'd100:tone<=5'd14;
              20'd101:tone<=5'd15;
              
              20'd102:tone<=5'd15;
              20'd103:tone<=5'd16;
              
              20'd104:tone<=5'd14;
              
              20'd105:tone<=5'd14;
              
              20'd106:tone<=5'd14;
              
              20'd107:tone<=5'd14;
              
              20'd108:tone<=5'd14;
              20'd109:tone<=5'd14;
              
              20'd110:tone<=5'd13;
              20'd111:tone<=5'd12;
              
              20'd112:tone<=5'd12;
              
              20'd113:tone<=5'd13;
              
              20'd114:tone<=5'd13;
              20'd115:tone<=5'd11;
              
              20'd116:tone<=5'd11;
              20'd117:tone<=5'd12;
              
              20'd118:tone<=5'd12;
              20'd119:tone<=5'd12;
             
              20'd120:tone<=5'd12;
              20'd121:tone<=5'd12;
              
              20'd122:tone<=5'd12;
              20'd123:tone<=5'd7;
              
              20'd124:tone<=5'd7;
              20'd125:tone<=5'd15;
              
              20'd126:tone<=5'd16;
              20'd127:tone<=5'd16;
              
              20'd128:tone<=5'd16;
              20'd129:tone<=5'd15;
              
              20'd130:tone<=5'd16;
              20'd131:tone<=5'd16;
              
              20'd132:tone<=5'd18;
              
              20'd133:tone<=5'd18;
              
              20'd134:tone<=5'd15;
              
              20'd135:tone<=5'd15;
              
              20'd136:tone<=5'd15;
              
              20'd137:tone<=5'd15;
              
              20'd138:tone<=5'd15;
              20'd139:tone<=5'd15;
              
              20'd140:tone<=5'd11;
              
              20'd141:tone<=5'd11;
              
              20'd142:tone<=5'd14;
              
              20'd143:tone<=5'd14;
              
              20'd144:tone<=5'd14;
              20'd145:tone<=5'd13;
              
              20'd146:tone<=5'd14;
              20'd147:tone<=5'd14;
              
              20'd148:tone<=5'd16;
              
              20'd149:tone<=5'd16;
              
              20'd150:tone<=5'd16;
              
              20'd151:tone<=5'd16;
              
              20'd152:tone<=5'd16;
              20'd153:tone<=5'd16;
              
              20'd154:tone<=5'd16;
              20'd155:tone<=5'd16;
              
              20'd156:tone<=5'd12;
              
              20'd157:tone<=5'd12;
              
              20'd158:tone<=5'd13;
              20'd159:tone<=5'd13;
              
              20'd160:tone<=5'd14;
              
              20'd161:tone<=5'd14;
              
              20'd162:tone<=5'd14;
              
              20'd163:tone<=5'd14;
              
              20'd164:tone<=5'd13;
              
              20'd165:tone<=5'd13;
              
              20'd166:tone<=5'd14;
              20'd167:tone<=5'd14;
              
              20'd168:tone<=5'd15;
              
              20'd169:tone<=5'd15;
              
              20'd170:tone<=5'd14;
              
              20'd171:tone<=5'd14;
              
              20'd172:tone<=5'd14;
              
              20'd173:tone<=5'd11;
              
              20'd174:tone<=5'd11;
              20'd175:tone<=5'd11;
              20'd176:tone<=5'd11;
              20'd177:tone<=5'd11;
              
              20'd178:tone<=5'd11;
              
              20'd179:tone<=5'd17;
              
              20'd180:tone<=5'd17;
              
              20'd181:tone<=5'd16;
              20'd182:tone<=5'd16;
              
              20'd183:tone<=5'd15;
              20'd184:tone<=5'd15;
              
              20'd185:tone<=5'd15;
              20'd186:tone<=5'd14;
              20'd187:tone<=5'd14;
              
              20'd188:tone<=5'd16;
              
              20'd189:tone<=5'd16;
              20'd190:tone<=5'd16;  
              20'd191:tone<=5'd16;
              20'd192:tone<=5'd16;
              20'd193:tone<=5'd16;
              20'd194:tone<=5'd16;  
              20'd195:tone<=5'd16;           
              endcase
            end
        //  3'b001:
            default: 
              begin
                count<=1'b0;
                tone<=5'd22;
              end
          endcase
        end
      else
        begin
          count<=1'b0;
          tone<=5'd22;
        end
    end  
endmodule

 
      

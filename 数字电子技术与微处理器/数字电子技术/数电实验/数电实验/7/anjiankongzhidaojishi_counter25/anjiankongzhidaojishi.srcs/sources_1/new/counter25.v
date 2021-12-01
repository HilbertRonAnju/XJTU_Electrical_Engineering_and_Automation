`timescale 1ns / 1ps
module counter25(
input wire clk,
input wire clk_sec,
input wire cnt_en,
input wire load,
output reg[6:0]a_to_g,
output reg[3:0]an
    );
reg [15:0] cnt25;
reg carry;
initial begin
   cnt25[3:0]=0;
   cnt25[7:4]=0;
   cnt25[11:8]=5;
   cnt25[15:12]=2;
end
always@(posedge clk_sec)
begin
if(cnt_en==1&&load==0)
 begin  
     carry<=0;
  if(cnt25[3:0]==0&&cnt25[7:4]==0&&cnt25[11:8]==5&&cnt25[15:12]==2)
     begin
          cnt25[3:0]=9;
          cnt25[7:4]=5;
          cnt25[11:8]=4;
          cnt25[15:12]=2; 
     end
   else begin 
     cnt25[3:0]<=cnt25[3:0]-1;
     if(cnt25[3:0]==0)
        begin
          cnt25[3:0]<=9;
          cnt25[7:4]<=cnt25[7:4]-1;
        end
     if(cnt25[7:4]==0&&cnt25[3:0]==0)
     begin
          cnt25[7:4]<=5;
          cnt25[11:8]<=cnt25[11:8]-1;
     end
     if(cnt25[11:8]==0&&cnt25[7:4]==0&&cnt25[3:0]==0)
     begin
          cnt25[11:8]<=9;
          cnt25[15:12]<=cnt25[15:12]-1;
     end
     if(cnt25[15:12]==0&&cnt25[11:8]==0&&cnt25[7:4]==0&&cnt25[3:0]==0)
        begin
        cnt25[3:0]<=0;
        cnt25[7:4]<=0;
        cnt25[11:8]<=5;
        cnt25[15:12]<=2;
        carry<=1;
        end 
     end 
  end 
else if(cnt_en==0&&load==0)
 begin
        cnt25[3:0]<=cnt25[3:0];
        cnt25[7:4]<=cnt25[7:4];
        cnt25[11:8]<=cnt25[11:8];
        cnt25[15:12]<=cnt25[15:12];
 end
else if(cnt_en==0&&load==1)
 begin
        cnt25[3:0]<=0;
        cnt25[7:4]<=0;
        cnt25[11:8]<=5;
        cnt25[15:12]<=2;
 end
end
wire rst_n=1'b1;
wire [15:0]x;
assign x[3:0]=cnt25[3:0];
assign x[7:4]=cnt25[7:4]; 
assign x[11:8]=cnt25[11:8];
assign x[15:12]=cnt25[15:12];
reg[18:0]clkdiv;
always @(posedge clk or negedge rst_n)begin
   if(!rst_n)
      clkdiv<=19'd0;
    else
      clkdiv<=clkdiv+1;
end
wire [1:0]bitcnt;
assign bitcnt=clkdiv[18:17];
always @* begin
    if(!rst_n)
        an=4'd0;
     else
        an=4'd0;
        an[bitcnt]=1;
end
reg [3:0]digit;     
always@(*)begin
   if(!rst_n)
      digit=4'd0;
   else
      case(bitcnt)
        2'd0:digit=x[3:0];
        2'd1:digit=x[7:4];
        2'd2:digit=x[11:8];
        2'd3:digit=x[15:12];
      default:digit=4'd0;
      endcase
end
always @(*) begin
     if(!rst_n)
        a_to_g=7'b1111111;
     else
        case(digit)
        0:a_to_g=7'b1111110;
        1:a_to_g=7'b0110000;
        2:a_to_g=7'b1101101;
        3:a_to_g=7'b1111001;
        4:a_to_g=7'b0110011;
        5:a_to_g=7'b1011011;
        6:a_to_g=7'b1011111;
        7:a_to_g=7'b1110000;
        8:a_to_g=7'b1111111;
        9:a_to_g=7'b1111011;
        4'b1111:a_to_g=7'b0000000;
        default a_to_g=7'b1111110;
        endcase 
end
endmodule

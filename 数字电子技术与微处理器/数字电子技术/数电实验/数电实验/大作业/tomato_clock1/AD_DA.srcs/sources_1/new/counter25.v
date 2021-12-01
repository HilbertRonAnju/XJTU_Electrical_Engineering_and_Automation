`timescale 1ns / 1ps
module counter25(
input wire clk,
input wire clk_sec,
input wire rst_n,
input wire cnt_en,
input wire load,
input wire key2,
input wire [15:0] customtime,
input wire customtimeena,
output reg[6:0]a_to_g,
output reg[3:0]an,
output reg carry2
    );
reg [15:0] cnt25;
wire [15:0] startnum[1:0];
reg carry;
reg innerbreak;
reg [3:0] counter = 0;
parameter [3:0] MAXNOTIF = 15;
initial begin
   cnt25[3:0]=0;
   cnt25[7:4]=0;
   cnt25[11:8]=5;
   cnt25[15:12]=2;
   carry=0;
   carry2=0;
end
always@(posedge key2 || innerbreak) carry=~carry;

assign startnum[0] = customtimeena?customtime:16'h500;
assign startnum[1] = customtimeena?customtime:16'h1500;

always@(posedge clk_sec or negedge rst_n)
if(!rst_n)
begin
   cnt25[3:0]=0;
   cnt25[7:4]=0;
   cnt25[11:8]=5;
   cnt25[15:12]=2;
   carry2=0;
end
else
begin
innerbreak = 0;
if(cnt_en==0&&carry != carry2)
begin
        if(carry==0)
        begin
           cnt25 <= startnum[1];
           carry2<=0;
        end
        else if(carry==1)
        begin
           cnt25 <= startnum[0];
           carry2<=1;
       end    
end
else if(cnt_en==1&&load==0)
begin  
   if(carry2==0)
   begin 
   if(cnt25[15:12]==0&&cnt25[11:8]==0&&cnt25[7:4]==0&&cnt25[3:0]==0||cnt25 == 16'hFFFF||cnt25 == 16'hAAAA)
   begin
   
   if(counter != MAXNOTIF)
       begin
       counter = counter + 1;
       if(cnt25 == 16'hAAAA) cnt25 <= 16'hFFFF;
       else cnt25 <= 16'hAAAA;
       end
       else
               begin
        cnt25 <= startnum[0];
        carry2<=1;
           innerbreak = 1;
            counter <= 0;
            end 
   end
   else
   begin
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
     end
     end
   else if (carry2==1)
   begin 
   if(cnt25[15:12]==0&&cnt25[11:8]==0&&cnt25[7:4]==0&&cnt25[3:0]==0||cnt25 == 16'hFFFF||cnt25 == 16'hAAAA)
       if(counter != MAXNOTIF)
       begin
       counter = counter + 1;
       if(cnt25 == 16'hAAAA) cnt25 <= 16'hFFFF;
       else cnt25 <= 16'hAAAA;
       end
       else
               begin
             cnt25 <= startnum[1];
            carry2<=0;
            counter <= 0;
           innerbreak = 1;
            end 
        else
    begin
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
        if(cnt25[11:8]==0&&cnt25[7:4]==0&&cnt25[3:0]==0&&cnt25[15:12]!=0)
        begin
          cnt25[11:8]<=9; 
          cnt25[15:12]<=cnt25[15:12]-1;
        end
    end
   end
end
end
//else if(cnt_en==0&&load==0)
// begin
//        cnt25[3:0]<=cnt25[3:0];
//        cnt25[7:4]<=cnt25[7:4];
//        cnt25[11:8]<=cnt25[11:8];
//        cnt25[15:12]<=cnt25[15:12];
// end
//else if(cnt_en==0&&load==1)

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
        10:a_to_g=7'b1111111;
        4'b1111:a_to_g=7'b0000000;
        default a_to_g=7'b1111110;
        endcase 
end
endmodule


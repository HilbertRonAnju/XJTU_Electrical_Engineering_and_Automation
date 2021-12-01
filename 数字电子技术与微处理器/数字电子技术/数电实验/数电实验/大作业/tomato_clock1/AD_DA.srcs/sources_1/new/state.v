`timescale 1ns / 1ps
module State(
input clk,
input key1,
input key2,
output reg cnt_en,
output reg load
    );
wire rst=0;
parameter IDLE=2'b00,
           S1=2'b01,
           S2=2'b10;
reg [1:0]cstate;
reg [1:0]nstate;
always@(posedge clk or posedge rst)
if(rst)
    cstate<=IDLE;
else
    cstate<=nstate;           
    
always@(cstate,key1,key2)
      if(cstate==IDLE&&key1==1)
          nstate=S1;
      else if(cstate==IDLE&&key1==0)
          nstate=IDLE;
      else if(cstate==S1&&key1==1)
          nstate=S2;
      else if(cstate==S1&&key1==0)
          nstate=S1;
      else if(cstate==S2&&key1==1&&key2==0)
          nstate=S1;
      else if(cstate==S2&&key1==0&&key2==0)
          nstate=S2;
      else if(cstate==S2&&key1==1&&key2==1)
          nstate=S2;
      else if(cstate==S2&&key1==0&&key2==1)
          nstate=IDLE;
      else nstate=cstate;                                
 always@*
if(rst)
    begin cnt_en<=1'b0;load<=1'b1;end
else if(cstate==IDLE)
    begin cnt_en<=1'b0;load<=1'b1;end
else if(cstate==S1)
    begin cnt_en<=1'b1;load<=1'b0;end   
else if(cstate==S2)
    begin cnt_en<=1'b0;load<=1'b0;end
else begin cnt_en<=1'b0;load<=1'b1;end
endmodule

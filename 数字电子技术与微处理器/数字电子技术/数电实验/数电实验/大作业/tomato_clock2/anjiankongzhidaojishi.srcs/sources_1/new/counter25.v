`timescale 1ns / 1ps
module counter25(
input ad,
input wire clk,
input wire clk_sec,
input wire cnt_en,
input wire load,
input wire fuck,
input wire [3:0]work_sec_L,
input wire [3:0]work_sec_H,
input wire [3:0]work_min_L,
input wire [3:0]work_min_H,
input wire [3:0]ralex_sec_L,
input wire [3:0]ralex_sec_H,
input wire [3:0]ralex_min_L,
input wire [3:0]ralex_min_H,
output reg [3:0]cycle,
output reg [3:0]WorkTime_sec_L,
output reg [3:0]WorkTime_sec_H,
output reg [3:0]WorkTime_min_L,
output reg [3:0]WorkTime_min_H
   );
reg carry;
reg [15:0]counter;
reg [8:0]chufa;
reg [3:0]low;
reg [3:0]high;
reg [3:0]flash;
reg flaglow;
reg flaghigh;
initial begin
   cycle                 = 4'd0;
   flash                 = 4'd0;
   flaglow               = 1'b0;
   flaghigh              = 1'b0;
   chufa                 = 1'b1;
   low                   = 1'b1;
   high                  = 1'b1;
   WorkTime_sec_L[3:0]   = 4'b0;
   WorkTime_sec_H[3:0]   = 4'b0;
   WorkTime_min_L[3:0]   = 4'd5;
   WorkTime_min_H[3:0]   = 4'd2;
   carry                 = 1'b0;
   counter               = 1500;
end 
//   always@(posedge clk_sec)begin
//      if(ad==0)begin
//      if (carry==0) begin
//         if((cnt_en==1)&&(load==0))
//         begin  
//            if (counter==0) begin
//               counter    <= 10*ralex_sec_H[3:0]+ralex_sec_L[3:0]+60*(ralex_min_L[3:0]+10*ralex_min_H[3:0]);
//               carry      <= 1'b1;
//            end
//            else
//            counter       <= counter-1;
//         end 
//         else if((cnt_en==0)&&(load==0))
//            counter       <= counter;
//         else if((cnt_en==0)&&(load==1))
//         begin
//            counter       <= 10*ralex_sec_H[3:0]+ralex_sec_L[3:0]+60*(ralex_min_L[3:0]+10*ralex_min_H[3:0]);
//            carry         <= 1'b1;
//         end
//      end
//      if (carry==1) begin
//         if((cnt_en==1)&&(load==0))
//         begin  
//            if (counter==0) begin
//               if(flash<15)begin
//                  counter <= 3660-counter;
//                  flash   <= flash+1;
//               end
//               else begin
//                  counter <= 10*work_sec_H[3:0]+work_sec_L[3:0]+60*(work_min_L[3:0]+10*work_min_H[3:0]);
//                  flash   <= 1'b0;
//                  carry   <= 1'b0;
//                  cycle   <= cycle+1;
//               end
//            end
//            else
//            counter       <= counter-1;
//         end 
//         else if((cnt_en==0)&&(load==0))
//            counter       <= counter;
//         else if((cnt_en==0)&&(load==1))
//         begin
//            counter       <= 10*work_sec_H[3:0]+work_sec_L[3:0]+60*(work_min_L[3:0]+10*work_min_H[3:0]);
//            carry         <= 1'b0;
//            cycle         <= cycle+1;
//         end
//      end
//      end
//   end
   always@(posedge clk_sec)begin
      if(ad==1)begin
         if (carry==0) begin
            if((cnt_en==1)&&(load==0))
            begin  
               if (counter==0) begin
                  counter   <= 10*ralex_sec_H[3:0]+ralex_sec_L[3:0]+60*(ralex_min_L[3:0]+10*ralex_min_H[3:0]);
                  carry      <= 1'b1;
               end
               else
               counter       <= counter-1;
            end 
            else if((cnt_en==0)&&(load==0))
               counter       <= counter;
            else if((cnt_en==0)&&(load==1)&&(fuck==1))
            begin
               counter       <=  10*ralex_sec_H[3:0]+ralex_sec_L[3:0]+60*(ralex_min_L[3:0]+10*ralex_min_H[3:0]);
               carry           <= 1'b1;
            end
         end
         if (carry==1) begin
            if((cnt_en==1)&&(load==0))
            begin  
               if ((counter==0)||(counter==3660)) begin
                  if(flash==15)begin
                     counter <= 10*work_sec_H[3:0]+work_sec_L[3:0]+60*(work_min_L[3:0]+10*work_min_H[3:0]);
                     flash   <= 4'd0;
                     carry   <= 1'b0;
                     cycle   <= cycle+1;
                  end
                  else begin
                     counter <= 16'd3660-counter;
                     flash     <= flash+1;
                  end
               end
               else
               counter       <= counter-1;
            end 
            else if((cnt_en==0)&&(load==0))
               counter       <= counter;
            else if((cnt_en==0)&&(load==1)&&(fuck==0))
            begin
               counter       <= 10*work_sec_H[3:0]+work_sec_L[3:0]+60*(work_min_L[3:0]+10*work_min_H[3:0]);
               carry         <= 1'b0;
               cycle         <= cycle+1;
            end
         end
      end
      else begin
         if (carry==0) begin
            counter       <= 10*work_sec_H[3:0]+work_sec_L[3:0]+60*(work_min_L[3:0]+10*work_min_H[3:0]);
         end
         else
            counter   <= 10*ralex_sec_H[3:0]+ralex_sec_L[3:0]+60*(ralex_min_L[3:0]+10*ralex_min_H[3:0]);
      end
   end
   always@(posedge clk)begin
      if (counter==3660) begin
         WorkTime_sec_L[3:0]       <= 4'b1111;
         WorkTime_sec_H[3:0]       <= 4'b1111;
         WorkTime_min_L[3:0]       <= 4'b1111;
         WorkTime_min_H[3:0]       <= 4'b1111;
         flaglow                   <= 1'b1;
         flaghigh                  <= 1'b1;
      end
      else if (counter<10) begin
         WorkTime_sec_L[3:0]       <= counter;
         WorkTime_sec_H[3:0]       <= 0;
         WorkTime_min_L[3:0]       <= 0;
         WorkTime_min_H[3:0]       <= 0;
         flaglow                   <= 1;
         flaghigh                  <= 1;
      end
      else begin
         if(counter<60)begin
            if((counter-10*low)<10)begin
               WorkTime_sec_L[3:0] <= counter-10*low;
               WorkTime_sec_H[3:0] <= low;
               WorkTime_min_L[3:0] <= 0;
               WorkTime_min_H[3:0] <= 0;
               flaglow             <= 1;
               flaghigh            <= 1;
            end
            else 
               low                 <= low+1;
         end
         else if((counter-60*chufa)<60)begin
            if ((counter-60*chufa)<10) begin
               WorkTime_sec_L[3:0] <= counter-60*chufa;
               WorkTime_sec_H      <= 0;
               flaglow             <= 1;
            end
            else if ((counter-60*chufa-10*low)<10) begin
               WorkTime_sec_L[3:0] <= counter-60*chufa-10*low;
               WorkTime_sec_H[3:0] <= low;
               flaglow             <= 1;
            end
            else if((counter-60*chufa-10*low)<0)begin
               low                 <= low-1;
            end
            else
               low                 <= low+1;
            if (chufa<10) begin
               WorkTime_min_L[3:0] <= chufa;
               WorkTime_min_H[3:0] <= 0;
               flaghigh            <= 1;
            end
            else if ((chufa-10*high)<10) begin
               WorkTime_min_L[3:0] <= chufa-10*high;
               WorkTime_min_H[3:0] <= high;
               flaghigh            <= 1;
            end
            else if((chufa-10*high)<0)begin
               high                <= high-1;
            end
            else
               high                <= high+1;
         end
         else if((counter-60*chufa)<0)begin
            chufa                  <= chufa-1;
         end
         else
            chufa                  <= chufa+1;
      end
      if(flaghigh&flaglow)begin
         low                       <= 1;
         high                      <= 1;
         chufa                     <= 1;
         flaghigh                  <= 0;
         flaglow                   <= 0;
      end
   end
endmodule

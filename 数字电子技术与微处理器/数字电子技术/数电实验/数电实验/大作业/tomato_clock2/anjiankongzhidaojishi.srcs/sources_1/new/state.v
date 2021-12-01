`timescale 1ns / 1ps
module State(
input key_1,
input key_2,
input clk,
output reg cnt_en,
output reg load,
output reg fuck
    );
 parameter s0=2'b00,
                    s1=2'b01,
                    s2=2'b10;
reg [1:0]cstate;
reg [1:0]nstate;
initial begin
    fuck    = 0;
    cstate =s1;
    nstate =s1;
    end
    always@(posedge clk)begin
          cstate<=nstate;
    end
     always@(posedge key_1,posedge key_2)begin
         if(key_1)begin
            case(cstate)
               s0:nstate=s1;
               s1:nstate=s2;
               s2:nstate=s1;
               default:nstate=s2;
            endcase
        end
        else if(key_2)begin
           fuck=~fuck;
            case(cstate)
               s0:nstate=s0;
               s1:nstate=s0;
               s2:nstate=s0;
               default:nstate=s1 ;
            endcase                                                                   
        end
    end
    always@ (posedge clk)begin
        case(cstate)
              s0:begin
              cnt_en<=0;
              load<=1;
              end
              s1:begin
              cnt_en<=1;
              load<=0;
              end
              s2:begin
              cnt_en<=0;
              load<=0;
              end
        endcase
        end
endmodule

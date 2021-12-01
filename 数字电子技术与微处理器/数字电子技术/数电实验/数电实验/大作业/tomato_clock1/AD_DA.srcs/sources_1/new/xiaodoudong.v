`timescale 1ns / 1ps
module xiaodoudong(
    input i_sig1,
    input i_sig2,
    input clk,
    output wire o_sigflag1_r,
    output wire o_sigflag2_r
    );
    reg i_sig1_reg0;
    reg i_sig1_reg1;
    reg i_sig2_reg0;
    reg i_sig2_reg1;
    always@(posedge clk)
         begin
             i_sig1_reg0<=i_sig1;
             i_sig1_reg1<=i_sig1_reg0;
              i_sig2_reg0<=i_sig2;
             i_sig2_reg1<=i_sig2_reg0;
         end
    assign o_sigflag1_r=i_sig1_reg0&(~i_sig1_reg1);
    assign o_sigflag2_r=i_sig2_reg0&(~i_sig2_reg1);
endmodule


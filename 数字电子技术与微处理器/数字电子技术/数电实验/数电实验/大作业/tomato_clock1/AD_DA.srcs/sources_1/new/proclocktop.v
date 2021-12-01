`timescale 1ns / 1ps
module top(
    input dclk_in,
    input reset_in,
    input vauxpl,vauxnl,
    input secadjin,
    input minadjin,
    input wire key2,
    input wire key1,
    input wire timerstin,
    output wire [13:0]a_to_g,
    output wire [7:0]anout,
    input wire customtimeena
);
    wire [7:0] led,an,anmid,pwmctrl;
    wire [15:0] customtime;
    wire secadjout,minadjout,secadjmid,minadjmid,timerstmid,timerstout,xiaodoumaichong;

//创意功能模块
//通过AD转换调节显示亮度    
XADC_channel_1(
    .dclk_in(dclk_in),
    .reset_in(1),
    .vauxnl(vauxnl),
    .vauxpl(vauxpl),
    .led(led)
    );
        
function [7:0] nonlinearrevise(input [7:0] x);
    nonlinearrevise = x * x / 255;
endfunction

assign pwmctrl = nonlinearrevise(led);
genvar i;
generate 
    for(i = 0;i < 8;i = i + 1) 
        begin: 
            ENLOOP
            pwmctrl
            (
            .clk(dclk_in),
            .linein(an[i]),
            .lineout(anmid[i]),
            .pwmctrl(pwmctrl)
            );
        end
endgenerate

assign anout = reset_in?anmid:8'bz;
    
fanqiezhong_top(
    .clk(dclk_in),
    .key1(key1),
    .key2(key2 || (customtimeena && (secadjin || minadjin || timerstin))),
    .a_to_g(a_to_g),
    .an(an),
    .reset_in(reset_in),
     .customtime(customtime),
     .customtimeena(customtimeena)
    );
    
Sec_pule_generator #(.N(100_000))(
    .clk(dclk_in),
    .sec_pule(xiaodoumaichong)
);

xiaodoudong (
    .i_sig1(secadjin),
    .i_sig2(minadjin),
    .clk(xiaodoumaichong),
    .o_sigflag1_r(secadjmid),
    .o_sigflag2_r(minadjmid)
);

xiaodoudong (
    .i_sig1(timerstin),
    .i_sig2(0),
    .clk(xiaodoumaichong),
    .o_sigflag1_r(timerstmid)
);

differenciator min(
    .clk(dclk_in),
    .NumIn(minadjmid),
    .NumOut(minadjout)
    );
    
differenciator sec(
    .clk(dclk_in),
    .NumIn(secadjmid),
    .NumOut(secadjout)
    );
    
differenciator timerst(
    .clk(dclk_in),
    .NumIn(timerstmid),
    .NumOut(timerstout)
    );

pressadjuster(
    .minadj(minadjout),
    .secadj(secadjout),
    .timerst(timerstout),
    .en(reset_in),
    .clk(dclk_in),
    .numout(customtime)
    );
endmodule

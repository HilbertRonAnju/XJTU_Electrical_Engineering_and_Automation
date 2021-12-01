`timescale 1ns / 1ps
module fanqiezhong_top(
input wire clk,
input wire key1,
input wire key2,
output wire [13:0]a_to_g,
output wire [7:0]an,
input wire [15:0] customtime,
input wire customtimeena,
input wire reset_in
    );
wire m1,m2, modeind, xiaodoumaichong;
Sec_pule_generator #(.N(100000))(
    .clk(clk),
    .sec_pule(xiaodoumaichong)
);

xiaodoudong U0(
    .i_sig1(key1),
    .i_sig2(key2),
    .clk(xiaodoumaichong),
    .o_sigflag1_r(m1),
    .o_sigflag2_r(m2)
);
counter25_top U1(
      .clk(clk),
      .key1(m1),
      .key2(m2),
      .a_to_g(a_to_g[6:0]),
      .an(an[3:0]),
      .modeind(modeind),
     .customtime(customtime),
     .customtimeena(customtimeena),
     .reset_in(reset_in)
    );
    
edgecounter U2(
.rst_n(reset_in),
.ena(!(key1||key2)),
.clk(clk),
.in(modeind),
.a_to_g(a_to_g[13:7]),
.an(an[7:6])
);

endmodule

`timescale 1ns / 1ps
module counter25_top(
input wire clk,
input wire key1,
input wire key2,
output wire [6:0]a_to_g,
output wire [3:0]an,
output wire modeind,
input wire [15:0] customtime,
input wire customtimeena,
input wire reset_in
    );
wire jinwei;
wire a;
wire b;
wire c;
Sec_pule_generator U0(
    .clk(clk),
    .sec_pule(jinwei)
);
State U1(
    .clk(clk),
    .key1(key1),
    .key2(key2),
    .cnt_en(a),
    .load(b)
);
counter25 U2(
    .clk_sec(jinwei),
    .clk(clk),
    .cnt_en(a),
    .load(b),
    .a_to_g(a_to_g),
    .key2(key2),
    .an(an),
    .carry2(modeind),
    .customtime(customtime),
    .customtimeena(customtimeena),
    .rst_n(reset_in)
     );
endmodule

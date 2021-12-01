`timescale 1ns / 1ps
module counter25_top(
input wire clk,
input wire key1,
input wire key2,
output wire[6:0]a_to_g,
output wire[3:0]an
    );
wire jinwei;
wire a;
wire b;
wire anjian1,anjian2;

Sec_pule_generator U0(
    .clk(clk),
    .sec_pule(jinwei)
);
ButtonEdgeDetect U3(
    .clk(clk),
    .button(key1),
    .rise(anjian1)
    );
ButtonEdgeDetect U4(
    .clk(clk),
    .button(key2),
    .rise(anjian2)
    );
State U1(
    .clk(clk),
    .key1(anjian1),
    .key2(anjian2),
    .cnt_en(a),
    .load(b)
);
counter25 U2(
    .clk_sec(jinwei),
    .clk(clk),
    .cnt_en(a),
    .load(b),
    .a_to_g(a_to_g),
    .an(an)      
     );
endmodule

`timescale 1ns / 1ps
module rstreg(
    input rstline,
    output rststable,
    output [1:0] sig
    );
    reg lhs = 1, rhs = 0;
    assign rststable = (lhs == rhs)?1:0;
    assign sig[0] = rststable;
    assign sig[1] = rststable;
    always @(posedge rstline)
        lhs = ~lhs;
    always @(negedge rstline)
        rhs = lhs;
endmodule

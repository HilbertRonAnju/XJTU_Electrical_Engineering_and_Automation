`timescale 1ns / 1ps
module dejittertop#(parameter DEBUG = 0) (
input clk,
input keyIn,
input keyOut
    );
    wire clk100ms, keyDejitter;
    
    sec#(.MAX((DEBUG == 1)?50:5_000_000)) 
     clklow
     (
         .clk(clk),
         .rst(1),
         .sec(clk100ms)
     );
    
    ButtonEdgeDetect trigger(
        .clk(clk),
        .clk100ms(clk100ms),
        .keyIn(keyIn),
        .keyOut(keyDejitter)
    );
    
    differenciator diff(
        .clk(clk),
        .NumIn(keyDejitter),
        .NumOut(keyOut)
    );
    
endmodule

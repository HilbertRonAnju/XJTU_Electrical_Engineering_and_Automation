`timescale 1ns / 1ps
module top(
    input clk,
    input rstin,
    input tri0 key1in,
    input tri0 key2in,
    input tri0 modekeyin,
    input tri0 timereverseena,
    input [7:0] timeswitch,
    output [7:0] disp,
    output [3:0] en,
    output [7:0] cycle,
    output [3:0] debug
    );
    
    wire sec, rst;
    wire innerinterrupt;
    wire [3:0] dot;
    wire [15:0] num, numreversed, numout;
    assign numout = timereverseena?numreversed:num;
    wire key1out, key2out, modekeyout;
    wire pause, load, eoc;
    wire [7:0] settime;
    
    assign debug = {key1out, key2out, pause, load};
    
    rstreg rstctrl(
        .rstline(rstin),
        .rststable(rst)
    );
    
    idlehandler(
        .clk(clk),
        .rst(rst),
        .sec(sec),
        .num(num),
        .interrupt(innerinterrupt)
    );
    
    cyclecounter(
        .clk(clk),
        .rst(rst),
        .startnum(num),
        .minoverflow(eoc),
        .cycle(cycle)
    );

    counter(
        .COUNTDOWN(settime),
        .clk(clk),
        .rst(rst),
        .sec(sec),
        .num(num),
        .pause(pause),
        .load(load),
        .dot(dot),
        .minoverflow(eoc)
    );
        
    timereverse tmrvsrmin(
        .reversedtime(num),
        .maxtime({settime, 8'b0}),
        .timertn(numreversed)
    );
    
    sec #(.MAX(100_000_000))
    secgen(
        .clk(clk),
        .rst(1),
        .sec(sec)
    );
    
    muldisp #(.LEN(4)) 
    shownum (
        .clkin(clk),
        .num(numout),
        .disp(disp),
        .dotlist(dot),
        .en(en)
    );
    
    dejittertop key1(
        .clk(clk),
        .keyIn(key1in),
        .keyOut(key1out)
        );
            
    dejittertop key2(
        .clk(clk),
        .keyIn(key2in),
        .keyOut(key2out)
        );
        
    dejittertop modekey(
        .clk(clk),
        .keyIn(modekeyin),
        .keyOut(modekeyout)
        );
        
    statectrl state(
        .clk(clk),
        .key1(key1out),
        .key2(key2out),
        .cnt_en(pause),
        .load(load),
        .interrupt(innerinterrupt));
    
    timectrl timemachine(
        .clk(clk),
        .key(modekeyout),
        .switchin(timeswitch),
        .ena(load),
        .timeout(settime),
        .interrupt(innerinterrupt)
        );
    
endmodule
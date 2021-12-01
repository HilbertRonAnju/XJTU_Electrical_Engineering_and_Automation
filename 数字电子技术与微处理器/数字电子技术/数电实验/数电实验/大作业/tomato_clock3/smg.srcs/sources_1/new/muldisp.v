`timescale 1ns / 1ps
module muldisp #(parameter LEN = 3)
(
    input clkin,
    input [4*LEN-1:0] num,
    input [LEN-1:0]dotlist,
    output [7:0] disp,
    output reg [LEN-1:0] en
    );
    
    wire clk;
    reg dot;
    reg [3:0] number=0;
    reg [3:0] count=0;
    
    disp dispout(
        .number(number),
        .dot(dot),
        .display(disp[7:0])
    );
    
    sec #(.MAX(100_000)) 
    clockflash(
        .clk(clkin),
        .rst(1),
        .sec(clk)
    );
    
    always@(posedge clk) 
    begin
        count = count + 1;
        if(count > 8) count = 0;
            number = num[4*count+3-:4];
            dot = dotlist[count];
            en = 1 << count;
        end
    
endmodule

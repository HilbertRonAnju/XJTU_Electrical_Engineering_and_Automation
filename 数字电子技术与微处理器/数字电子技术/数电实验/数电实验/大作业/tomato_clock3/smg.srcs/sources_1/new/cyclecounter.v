`timescale 1ns / 1ps
module cyclecounter#(parameter [15:0] IDLEWORKEDGE = 16'h1500)(
    input rst,
    input [15:0] startnum,
    input clk,
    input minoverflow,
    output reg cycle
    );
    
    parameter [1:0] WORK = 2'b01, IDLE = 2'b10;
    reg [1:0] prev, current;
    
    always@(posedge clk)
    begin
    if(!rst)
        begin
            cycle = 0;
            prev = 0;
        end
    else if(minoverflow)
        if(startnum > IDLEWORKEDGE) 
            current = WORK;
        else 
            current = IDLE;
    else 
        current = current;
    
    if((current == WORK && prev == IDLE) || (current == IDLE && prev == WORK))
        begin
            cycle = cycle + 1;
            current = 0;
            prev = 0;
        end
    else 
        prev = current;
    end
 
endmodule

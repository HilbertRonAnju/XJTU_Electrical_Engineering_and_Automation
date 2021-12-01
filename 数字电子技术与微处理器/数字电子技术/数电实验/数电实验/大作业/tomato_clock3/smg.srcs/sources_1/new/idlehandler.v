`timescale 1ns / 1ps
module idlehandler#(parameter IDLETIME = 15)(
    input  rst,
    input [15:0] num,
    input  clk,
    input sec,
    output reg interrupt
    );
    
    reg [5:0] count;
    always@(posedge clk)
    if(!rst)
    begin
        count = 0;
    end
       else if(num != 0)
           begin
               interrupt = 0;
               count =  0;
           end
       else if(sec == 1)
           if(count < IDLETIME) 
               count = count + 1;
           else if(count == IDLETIME)
               begin
                   interrupt = 1;
                   count = IDLETIME+1;
               end
           else 
               count = count;
       else
           begin
               interrupt = 0;
               count = count;
           end
endmodule

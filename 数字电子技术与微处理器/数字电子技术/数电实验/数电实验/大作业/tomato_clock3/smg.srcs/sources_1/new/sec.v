`timescale 1ns / 1ps
module sec#(parameter WIDTH=32, MAX=100_000)
(
input wire clk,
input wire rst,
output reg sec
);
    reg [WIDTH-1:0]count;
    initial begin 
        count=0;
        sec=0;
    end
    always@(posedge clk or negedge rst) 
    begin
    if(!rst)
        count = 0;
    else if(count == MAX - 1)
           begin
               count=0;
               sec=1;
           end
    else
        begin
            count=count+1;
            sec = 0;
        end
    end
endmodule
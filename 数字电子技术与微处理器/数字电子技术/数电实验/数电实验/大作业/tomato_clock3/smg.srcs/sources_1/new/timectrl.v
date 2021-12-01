`timescale 1ns / 1ps
module timectrl(
input clk,
input key,
input ena,
input interrupt,
input [7:0] switchin,
output [7:0] timeout
    );
    parameter WORK = 2'b00,
    IDLE = 2'b01,
    FREEMODE = 2'b10;
    parameter WORKTIME = 8'h25,
    IDLETIME = 8'h5;
    reg [1:0] cstate = WORK, nstate = WORK;
    
    always @(posedge clk)
    if(key)
        if(cstate != FREEMODE) nstate = nstate + 1;
            else nstate = 0;
    else if(interrupt)
            if(cstate == WORK) 
                nstate = IDLE;
            else if(cstate == IDLE) 
                nstate = WORK;
            else 
                nstate = cstate;
    else 
        cstate = nstate;
    
    assign timeout = !ena?timeout:cstate == WORK?WORKTIME:cstate == IDLE?IDLETIME:switchin;
endmodule

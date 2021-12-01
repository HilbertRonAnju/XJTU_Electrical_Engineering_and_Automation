`timescale 1ns / 1ps

module ButtonEdgeDetect(
    input clk,
    input button,
    output reg rise
    );
    reg[7:0] samp;
  
    initial
    begin
        rise=0;

        samp=8'b0000_0000;
    end
   
    always @(posedge clk)
        samp<={samp[6:0],button};
        
    always @(posedge clk)
        if(samp==8'b0000_0001)
            rise<=1'b1;
        else
            rise<=1'b0;
              
//    always @(posedge clk)
//        if(samp==8'b1111_1110)
//            fall<=1'b1;
//        else
//            fall<=1'b0;
        
endmodule

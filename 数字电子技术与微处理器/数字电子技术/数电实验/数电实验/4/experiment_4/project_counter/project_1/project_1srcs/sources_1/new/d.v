`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/26 01:18:44
// Design Name: 
// Module Name: trans38
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module d(
    output q,
    output qbar,
    input d,
    input cp,
    input rd,
    input sd
    );
    wire g3, g4, g5, g6;
    nand(g5, g3, d, rd);
    nand(g6, g5, g4, sd);
    nand(g3, g5, g4, cp);
    nand(g4, g6, cp, rd);
    nand(qbar, rd, g3, q);
    nand(q, sd, g4, qbar);
    
endmodule

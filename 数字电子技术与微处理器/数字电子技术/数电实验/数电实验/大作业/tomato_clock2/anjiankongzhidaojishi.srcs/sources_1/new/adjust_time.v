`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/24 17:32:56
// Design Name: 
// Module Name: adjust_time
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


module adjust_time(
    input ad,
    input clk,
    input m_to_s,
    input i_or_d,
    input clr,
    input Key2,
    input W_to_R,
    output reg [3:0]work_sec_L,
    output reg [3:0]work_sec_H,
    output reg [3:0]work_min_L,
    output reg [3:0]work_min_H,
    output reg [3:0]ralex_sec_L,
    output reg [3:0]ralex_sec_H,
    output reg [3:0]ralex_min_L,
    output reg [3:0]ralex_min_H
    );
//reg M_or_S;
//reg w_to_r;
initial begin
//    w_to_r             = 1'b0;
//    M_or_S             = 1'b0;
    work_sec_L[3:0]    = 4'd0;
    work_sec_H[3:0]    = 4'd0;
    work_min_L[3:0]    = 4'd5;
    work_min_H[3:0]    = 4'd2;
    ralex_sec_L[3:0]   = 4'd0;
    ralex_sec_H[3:0]   = 4'd0;
    ralex_min_L[3:0]   = 4'd5;
    ralex_min_H[3:0]   = 4'd0;
end
//always@(posedge Key1)begin
//    if(Key1)begin
//        if (m_to_s) begin
//            if(W_to_R)begin
//                if((work_sec_L==9)&&(work_sec_H==5))begin
//                    work_sec_L=4'd0;
//                    work_sec_H=4'd0;
//                end
//                else if(work_sec_L==4'd9) begin
//                    work_sec_L=4'd0;
//                        work_sec_H=work_sec_H+1;
//                    end
//                    else
//                        work_sec_L=work_sec_L+1;
//            end
//            else begin
//                if((work_min_L==9)&&(work_min_H==5))begin
//                    work_min_L=4'd0;
//                    work_min_H=4'd0;
//                end
//                else if(work_min_L==9) begin
//                    work_min_L=4'd0;
//                    work_min_H=work_min_H+1;
//                end
//                else
//                    work_min_L=work_min_L+1;
//            end
//        end
//        else begin
//            if(W_to_R)begin
//                if((ralex_sec_L==9)&&(ralex_sec_H==5))begin
//                    ralex_sec_L=4'd0;
//                    ralex_sec_H=4'd0;
//                end
//                else if(ralex_sec_L==4'd9) begin
//                    ralex_sec_L=4'd0;
//                        ralex_sec_H=ralex_sec_H+1;
//                    end
//                    else
//                        ralex_sec_L=ralex_sec_L+1;
//            end
//            else begin
//                if((ralex_min_L==9)&&(ralex_min_H==5))begin
//                    ralex_min_L=4'd0;
//                    ralex_min_H=4'd0;
//                end
//                else if(ralex_min_L==9) begin
//                    ralex_min_L=4'd0;
//                    ralex_min_H=ralex_min_H+1;
//                end
//                else
//                    ralex_min_L=ralex_min_L+1;
//            end
//        end
//    end
//end
always@(posedge Key2 or posedge clr)begin
    if(clr)begin
        work_sec_L[3:0]    <= 4'd0;
        work_sec_H[3:0]    <= 4'd0;
        work_min_L[3:0]    <= 4'd5;
        work_min_H[3:0]    <= 4'd2;
        ralex_sec_L[3:0]   <= 4'd0;
        ralex_sec_H[3:0]   <= 4'd0;
        ralex_min_L[3:0]   <= 4'd5;
        ralex_min_H[3:0]   <= 4'd0;
    end
    else if(Key2)begin
        if(i_or_d)begin
            if (m_to_s) begin
                if(W_to_R)begin
                    if((work_sec_L==0)&&(work_sec_H==0))begin
                        work_sec_L=4'd9;
                        work_sec_H=4'd5;
                    end
                    else if(work_sec_L==4'd0) begin
                        work_sec_L=4'd9;
                            work_sec_H=work_sec_H-1;
                        end
                        else
                            work_sec_L=work_sec_L-1;
                end
                else begin
                    if((work_min_L==0)&&(work_min_H==0))begin
                        work_min_L=4'd9;
                        work_min_H=4'd5;
                    end
                    else if(work_min_L==0) begin
                        work_min_L=4'd9;
                        work_min_H=work_min_H-1;
                    end
                    else
                        work_min_L=work_min_L-1;
                end
            end
            else begin
                if(W_to_R)begin
                    if((ralex_sec_L==0)&&(ralex_sec_H==0))begin
                        ralex_sec_L=4'd9;
                        ralex_sec_H=4'd5;
                    end
                    else if(ralex_sec_L==4'd0) begin
                        ralex_sec_L=4'd9;
                            ralex_sec_H=ralex_sec_H-1;
                        end
                        else
                            ralex_sec_L=ralex_sec_L-1;
                end
                else begin
                    if((ralex_min_L==0)&&(ralex_min_H==0))begin
                        ralex_min_L=4'd9;
                        ralex_min_H=4'd5;
                    end
                    else if(ralex_min_L==0) begin
                        ralex_min_L=4'd9;
                        ralex_min_H=ralex_min_H-1;
                    end
                    else
                        ralex_min_L=ralex_min_L-1;
                end
            end
        end
    else begin
        if (m_to_s) begin
            if(W_to_R)begin
                if((work_sec_L==9)&&(work_sec_H==5))begin
                    work_sec_L=4'd0;
                    work_sec_H=4'd0;
                end
                else if(work_sec_L==4'd9) begin
                    work_sec_L=4'd0;
                        work_sec_H=work_sec_H+1;
                    end
                    else
                        work_sec_L=work_sec_L+1;
            end
            else begin
                if((work_min_L==9)&&(work_min_H==5))begin
                    work_min_L=4'd0;
                    work_min_H=4'd0;
                end
                else if(work_min_L==9) begin
                    work_min_L=4'd0;
                    work_min_H=work_min_H+1;
                end
                else
                    work_min_L=work_min_L+1;
            end
        end
        else begin
            if(W_to_R)begin
                if((ralex_sec_L==9)&&(ralex_sec_H==5))begin
                    ralex_sec_L=4'd0;
                    ralex_sec_H=4'd0;
                end
                else if(ralex_sec_L==4'd9) begin
                    ralex_sec_L=4'd0;
                        ralex_sec_H=ralex_sec_H+1;
                    end
                    else
                        ralex_sec_L=ralex_sec_L+1;
            end
            else begin
                if((ralex_min_L==9)&&(ralex_min_H==5))begin
                    ralex_min_L=4'd0;
                    ralex_min_H=4'd0;
                end
                else if(ralex_min_L==9) begin
                    ralex_min_L=4'd0;
                    ralex_min_H=ralex_min_H+1;
                end
                else
                    ralex_min_L=ralex_min_L+1;
            end
        end
    end
    end
end
//always@(posedge Key1,posedge Key2,negedge clr)begin
//    if(!clr)begin
//        work_sec_L[3:0]    <= 4'd0;
//        work_sec_H[3:0]    <= 4'd0;
//        work_min_L[3:0]    <= 4'd0;
//        work_min_H[3:0]    <= 4'd0;
//        ralex_sec_L[3:0]   <= 4'd0;
//        ralex_sec_H[3:0]   <= 4'd0;
//        ralex_min_L[3:0]   <= 4'd0;
//        ralex_min_H[3:0]   <= 4'd0;
//    end
//    if(Key1)begin
//        if(W_to_R)begin
//            if (m_to_s) begin
//                if((work_sec_L==9)&&(work_sec_H==5))begin
//                    work_sec_L=4'd0;
//                    work_sec_H=4'd0;
//                end
//                else if(work_sec_L==4'd9) begin
//                    work_sec_L=4'd0;
//                    work_sec_H=work_sec_H+1;
//                end
//                else
//                    work_sec_L=work_sec_L+1;
//            end 
//            else begin
//                if((work_min_L==9)&&(work_min_H==5))begin
//                    work_min_L=4'd0;
//                    work_min_H=4'd0;
//                end
//                else if(work_min_L==9) begin
//                    work_min_L=4'd0;
//                    work_min_H=work_min_H+1;
//                end
//                else
//                    work_min_L=work_min_L+1;
//            end
//        end
//        else begin
//            if (m_to_s) begin
//                if((ralex_sec_L==9)&&(ralex_sec_H==5))begin
//                    ralex_sec_L=4'd0;
//                    ralex_sec_H=4'd0;
//                end
//                else if(ralex_sec_L==9) begin
//                    ralex_sec_L=4'd0;
//                    ralex_sec_H=ralex_sec_H+1;
//                end
//                else
//                    ralex_sec_L=ralex_sec_L+1;
//            end 
//            else begin
//                if((ralex_min_L==9)&&(ralex_min_H==5))begin
//                    ralex_min_L=4'd0;
//                    ralex_min_H=4'd0;
//                end
//                else if(ralex_min_L==9) begin
//                    ralex_min_L=4'd0;
//                    ralex_min_H=ralex_min_H+1;
//                end
//                else
//                    ralex_min_L=ralex_min_L+1;
//            end
//        end
//    end
//    else if(Key2)begin
//        if(W_to_R)begin
//            if (m_to_s) begin
//                if((work_sec_L==0)&&(work_sec_H==0))begin
//                    work_sec_L=4'd9;
//                    work_sec_H=4'd5;
//                end
//                else if(work_sec_L==0) begin
//                    work_sec_L=4'd9;
//                    work_sec_H=work_sec_H-1;
//                end
//                else
//                    work_sec_L=work_sec_L-1;
//            end 
//            else begin
//                if((work_min_L==0)&&(work_min_H==0))begin
//                    work_min_L=4'd9;
//                    work_min_H=4'd5;
//                end
//                else if(work_min_L==0) begin
//                    work_min_L=4'd9;
//                    work_min_H=work_min_H-1;
//                end
//                else
//                    work_min_L=work_min_L-1;
//            end
//        end
//        else begin
//            if (m_to_s) begin
//                if((ralex_sec_L==0)&&(ralex_sec_H==0))begin
//                    ralex_sec_L=4'd9;
//                    ralex_sec_H=4'd5;
//                end
//                else if(ralex_sec_L==0) begin
//                    ralex_sec_L=4'd9;
//                    ralex_sec_H=ralex_sec_H-1;
//                end
//                else
//                    ralex_sec_L=ralex_sec_L-1;
//            end 
//            else begin
//                if((ralex_min_L==0)&&(ralex_min_H==0))begin
//                    ralex_min_L=4'd9;
//                    ralex_min_H=4'd5;
//                end
//                else if(ralex_min_L==0) begin
//                    ralex_min_L=4'd9;
//                    ralex_min_H=ralex_min_H-1;
//                end
//                else
//                    ralex_min_L=ralex_min_L-1;
//            end
//        end
//    end
//end
//always@(posedge m_to_s)begin
//    if(m_to_s)begin
//        M_or_S=~M_or_S;
//    end
//end
//always@ (posedge W_to_R)begin
//    if (W_to_R) begin
//        w_to_r=~w_to_r;
//    end
//end
endmodule

`timescale 1ns / 1ps
module counter25_top(
input wire clk,
input wire key1,
input wire key2,
input AdjustTime,
input wire w_to_r,
input wire min_to_sec,
input wire clr,
input wire pluse,
input wire jian,
output wire[13:0]a_to_g,
output wire[7:0]an
    );
//wire pp;
//wire jj;
wire jinwei;
wire cnt_en;
wire load;
wire Key1;
wire Key2;
wire m_to_s;
wire W_to_R;
wire AdT;
wire fuck;
wire [3:0] x_one;
wire [3:0] x_tow;
wire [3:0] x_three;
wire [3:0] x_four;
wire [3:0] x_five;
wire [3:0] x_six;
wire [3:0] x_seven;
wire [3:0] x_eight;
wire [3:0]work_sec_L;
wire [3:0]work_sec_H;
wire [3:0]work_min_L;
wire [3:0]work_min_H;
wire [3:0]ralex_sec_L;
wire [3:0]ralex_sec_H;
wire [3:0]ralex_min_L;
wire [3:0]ralex_min_H;
wire [3:0]WorkTime_sec_L;
wire [3:0]WorkTime_sec_H;
wire [3:0]WorkTime_min_L;
wire [3:0]WorkTime_min_H;
wire [3:0]cycle;
reg ad;
initial begin
    ad = 0;
end
always@(posedge AdT)begin
    if(AdT)begin
        ad=~ad;
    end
end
Sec_pule_generator U0(
    .clk(clk),
    .sec_pule(jinwei)
);
keep_switch u4(
//    .jj(jj),
//    .pp(pp),
//    .pluse(pluse),
//    .jian(jian),
    .clk(clk),
    .key1(key1),
    .key2(key2),
    .min_to_sec(min_to_sec),
    .AdjustTime(AdjustTime),
    .w_to_r(w_to_r),
    .W_to_R(W_to_R),
    .Key1(Key1),
    .Key2(Key2),
    .Min(Min),
    .Sec(Sec),
    .AdT(AdT),
    .m_to_s(m_to_s)
);
    State U1(
        .clk(clk),
        .key_1(Key1),
        .key_2(Key2),
        .fuck(fuck),
        .cnt_en(cnt_en),
        .load(load)
    );
    counter25 U2(
        .fuck(fuck),
        .ad(ad),
        .clk_sec(jinwei),
        .clk(clk),
        .cnt_en(cnt_en),
        .load(load),
        .work_sec_L(work_sec_L),
        .work_sec_H(work_sec_H),
        .work_min_L(work_min_L),
        .work_min_H(work_min_H),
        .ralex_sec_L(ralex_sec_L),
        .ralex_sec_H(ralex_sec_H),
        .ralex_min_L(ralex_min_L),
        .ralex_min_H(ralex_min_H),
        .WorkTime_sec_L(WorkTime_sec_L),    
        .WorkTime_sec_H(WorkTime_sec_H),
        .WorkTime_min_L(WorkTime_min_L),
        .WorkTime_min_H(WorkTime_min_H),
        .cycle(cycle)
    );
//    LCD u3(
//        .x_one(WorkTime_sec_L),
//        .x_tow(WorkTime_sec_H),
//        .x_three(WorkTime_min_L),
//        .x_four(WorkTime_min_H),
//        .x_five(cycle),
//        .x_six(x_six),
//        .x_seven(x_seven),
//        .x_eight(x_eight),
//        .clk(clk),
//        .an(an),
//        .a_to_g(a_to_g)
//    );
    LCD u3(
        .x_one(x_one),
        .x_tow(x_tow),
        .x_three(x_three),
        .x_four(x_four),
        .x_five(x_five),
        .x_six(x_six),
        .x_seven(x_seven),
        .x_eight(x_eight),
        .clk(clk),
        .an(an),
        .a_to_g(a_to_g)
    );
    mux u6(
        .ad(ad),
        .clk(clk),
        .work_sec_L(work_sec_L),
        .work_sec_H(work_sec_H),
        .work_min_L(work_min_L),
        .work_min_H(work_min_H),
        .ralex_sec_L(ralex_sec_L),
        .ralex_sec_H(ralex_sec_H),
        .ralex_min_L(ralex_min_L),
        .ralex_min_H(ralex_min_H),
        .WorkTime_sec_L(WorkTime_sec_L),    
        .WorkTime_sec_H(WorkTime_sec_H),
        .WorkTime_min_L(WorkTime_min_L),
        .WorkTime_min_H(WorkTime_min_H),
        .x_one(x_one),
        .x_tow(x_tow),
        .x_three(x_three),
        .x_four(x_four),
        .x_five(x_five),
        .x_six(x_six),
        .x_seven(x_seven),
        .x_eight(x_eight),
        .cycle(cycle)
    );
    adjust_time u5(
        .ad(ad),
        .clk(clk),
        .m_to_s(pluse),
        .i_or_d(clr),
        .clr(W_to_R),
        .Key2(m_to_s),
        .W_to_R(jian),
        .work_sec_L(work_sec_L),
        .work_sec_H(work_sec_H),
        .work_min_L(work_min_L),
        .work_min_H(work_min_H),
        .ralex_sec_L(ralex_sec_L),
        .ralex_sec_H(ralex_sec_H),
        .ralex_min_L(ralex_min_L),
        .ralex_min_H(ralex_min_H)
    );
endmodule

`timescale 1ns / 1ps
module XADC_channel_1(
input dclk_in,
input reset_in,
input vauxpl,vauxnl,
output [7:0]led
    );
wire [15:0] do_out;
wire drdy_out;
wire eoc_out;
xadc_wiz_0 U1 (
  .di_in(16'b0),              // input wire [15 : 0] di_in
  .daddr_in(7'h11),        // input wire [6 : 0] daddr_in
  .den_in(eoc_out),            // input wire den_in
  .dwe_in(1'b0),            // input wire dwe_in
  .drdy_out(drdy_out),        // output wire drdy_out
  .do_out(do_out),            // output wire [15 : 0] do_out
  .dclk_in(dclk_in),          // input wire dclk_in
  .reset_in(~reset_in),        // input wire reset_in
  .vp_in(),              // input wire vp_in
  .vn_in(),              // input wire vn_in
  .vauxp1(vauxpl),            // input wire vauxp1
  .vauxn1(vauxnl),            // input wire vauxn1
  .channel_out(),  // output wire [4 : 0] channel_out
  .eoc_out(eoc_out),          // output wire eoc_out
  .alarm_out(),      // output wire alarm_out
  .eos_out(),          // output wire eos_out
  .busy_out()        // output wire busy_out
); 
duqu U2(
  .clk(dclk_in),
  .rst(~reset_in),
  .drdy_out(drdy_out),        
  .do_out(do_out),  
  .led(led)          
    );  
endmodule

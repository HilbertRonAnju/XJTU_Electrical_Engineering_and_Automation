`timescale 1ns / 1ps
module ps2_rx(
input wire clk, reset,
input wire ps2d, ps2c, rx_en,
output reg rx_done_tick,
output wire [7:0] dout
);

// symbolic state declaration
localparam [1:0]
  idle = 2'b00,
  dps  = 2'b01, //data, parity, stop
  load = 2'b10;

// signal declaration
reg [1:0] state_reg, state_next;
reg [7:0] filter_reg;
wire [7:0] filter_next;
reg f_ps2c_reg;
wire f_ps2c_next;
reg [3:0] n_reg, n_next;
reg [10:0] b_reg, b_next;
wire fall_edge;

// filter and falling-edge tick generation for ps2c
always @(posedge clk, posedge reset)
if (reset)
  begin
     filter_reg <= 0;
     f_ps2c_reg <= 0;
  end
else
  begin
     filter_reg <= filter_next;
     f_ps2c_reg <= f_ps2c_next;
  end

assign filter_next = {ps2c, filter_reg[7:1]};
assign f_ps2c_next = (filter_reg==8'b11111111) ? 1'b1 :
                    (filter_reg==8'b00000000) ? 1'b0 :
                     f_ps2c_reg;
assign fall_edge = f_ps2c_reg & ~f_ps2c_next;


// FSMD state & data registers
always @(posedge clk, posedge reset)
  if (reset)
     begin
        state_reg <= idle;
        n_reg <= 0;
        b_reg <= 0;
     end
  else
     begin
        state_reg <= state_next;
        n_reg <= n_next;
        b_reg <= b_next;
     end
     
// FSMD next-state logic
always @*
begin
  state_next = state_reg;
  rx_done_tick = 1'b0;
  n_next = n_reg;
  b_next = b_reg;
  case (state_reg)
     idle:
        if (fall_edge & rx_en)
           begin
              // shift in start bit
              b_next = {ps2d, b_reg[10:1]};
              n_next = 4'b1001;
              state_next = dps;
           end
     dps: // 8 data + 1 parity + 1 stop
        if (fall_edge)
           begin
              b_next = {ps2d, b_reg[10:1]};
              if (n_reg==0)
                 state_next = load;
              else
                 n_next = n_reg - 1;
           end
     load: // 1 extra clock to complete the last shift
        begin
           state_next = idle;
           rx_done_tick = 1'b1;
        end
  endcase
end

// output
assign dout = b_reg[8:1]; // data bits

endmodule


// file: xadc_wiz_0.v
// (c) Copyright 2009 - 2013 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
`timescale 1ns / 1 ps

(* CORE_GENERATION_INFO = "xadc_wiz_0,xadc_wiz_v3_3_6,{component_name=xadc_wiz_0,enable_axi=false,enable_axi4stream=false,dclk_frequency=100,enable_busy=true,enable_convst=false,enable_convstclk=false,enable_dclk=true,enable_drp=true,enable_eoc=true,enable_eos=true,enable_vbram_alaram=false,enable_vccddro_alaram=false,enable_Vccint_Alaram=false,enable_Vccaux_alaram=false,enable_vccpaux_alaram=false,enable_vccpint_alaram=false,ot_alaram=false,user_temp_alaram=false,timing_mode=continuous,channel_averaging=None,sequencer_mode=off,startup_channel_selection=single_channel}" *)


module xadc_wiz_0
          (
          daddr_in,            // Address bus for the dynamic reconfiguration port
          dclk_in,             // Clock input for the dynamic reconfiguration port
          den_in,              // Enable Signal for the dynamic reconfiguration port
          di_in,               // Input data bus for the dynamic reconfiguration port
          dwe_in,              // Write Enable for the dynamic reconfiguration port
          reset_in,            // Reset signal for the System Monitor control logic
          vauxp1,              // Auxiliary channel 1
          vauxn1,
          busy_out,            // ADC Busy signal
          channel_out,         // Channel Selection Outputs
          do_out,              // Output data bus for dynamic reconfiguration port
          drdy_out,            // Data ready signal for the dynamic reconfiguration port
          eoc_out,             // End of Conversion Signal
          eos_out,             // End of Sequence Signal
          alarm_out,           // OR'ed output of all the Alarms    
          vp_in,               // Dedicated Analog Input Pair
          vn_in);

          input [6:0] daddr_in;
          input dclk_in;
          input den_in;
          input [15:0] di_in;
          input dwe_in;
          input reset_in;
          input vauxp1;
          input vauxn1;
          input vp_in;
          input vn_in;

          output busy_out;
          output [4:0] channel_out;
          output [15:0] do_out;
          output drdy_out;
          output eoc_out;
          output eos_out;
          output alarm_out;

        wire FLOAT_VCCAUX;
        wire FLOAT_VCCINT;
        wire FLOAT_TEMP;
          wire GND_BIT;
    wire [2:0] GND_BUS3;
          assign GND_BIT = 0;
    assign GND_BUS3 = 3'b000;
          wire [15:0] aux_channel_p;
          wire [15:0] aux_channel_n;
          wire [7:0]  alm_int;
          assign alarm_out = alm_int[7];
          assign aux_channel_p[0] = 1'b0;
          assign aux_channel_n[0] = 1'b0;

          assign aux_channel_p[1] = vauxp1;
          assign aux_channel_n[1] = vauxn1;

          assign aux_channel_p[2] = 1'b0;
          assign aux_channel_n[2] = 1'b0;

          assign aux_channel_p[3] = 1'b0;
          assign aux_channel_n[3] = 1'b0;

          assign aux_channel_p[4] = 1'b0;
          assign aux_channel_n[4] = 1'b0;

          assign aux_channel_p[5] = 1'b0;
          assign aux_channel_n[5] = 1'b0;

          assign aux_channel_p[6] = 1'b0;
          assign aux_channel_n[6] = 1'b0;

          assign aux_channel_p[7] = 1'b0;
          assign aux_channel_n[7] = 1'b0;

          assign aux_channel_p[8] = 1'b0;
          assign aux_channel_n[8] = 1'b0;

          assign aux_channel_p[9] = 1'b0;
          assign aux_channel_n[9] = 1'b0;

          assign aux_channel_p[10] = 1'b0;
          assign aux_channel_n[10] = 1'b0;

          assign aux_channel_p[11] = 1'b0;
          assign aux_channel_n[11] = 1'b0;

          assign aux_channel_p[12] = 1'b0;
          assign aux_channel_n[12] = 1'b0;

          assign aux_channel_p[13] = 1'b0;
          assign aux_channel_n[13] = 1'b0;

          assign aux_channel_p[14] = 1'b0;
          assign aux_channel_n[14] = 1'b0;

          assign aux_channel_p[15] = 1'b0;
          assign aux_channel_n[15] = 1'b0;
XADC #(
        .INIT_40(16'h0011), // config reg 0
        .INIT_41(16'h31AF), // config reg 1
        .INIT_42(16'h0400), // config reg 2
        .INIT_48(16'h0100), // Sequencer channel selection
        .INIT_49(16'h0000), // Sequencer channel selection
        .INIT_4A(16'h0000), // Sequencer Average selection
        .INIT_4B(16'h0000), // Sequencer Average selection
        .INIT_4C(16'h0000), // Sequencer Bipolar selection
        .INIT_4D(16'h0000), // Sequencer Bipolar selection
        .INIT_4E(16'h0000), // Sequencer Acq time selection
        .INIT_4F(16'h0000), // Sequencer Acq time selection
        .INIT_50(16'hB5ED), // Temp alarm trigger
        .INIT_51(16'h57E4), // Vccint upper alarm limit
        .INIT_52(16'hA147), // Vccaux upper alarm limit
        .INIT_53(16'hCA33),  // Temp alarm OT upper
        .INIT_54(16'hA93A), // Temp alarm reset
        .INIT_55(16'h52C6), // Vccint lower alarm limit
        .INIT_56(16'h9555), // Vccaux lower alarm limit
        .INIT_57(16'hAE4E),  // Temp alarm OT reset
        .INIT_58(16'h5999), // VCCBRAM upper alarm limit
        .INIT_5C(16'h5111),  //  VCCBRAM lower alarm limit
        .SIM_DEVICE("7SERIES"),
        .SIM_MONITOR_FILE("design.txt")
)

inst (
        .CONVST(GND_BIT),
        .CONVSTCLK(GND_BIT),
        .DADDR(daddr_in[6:0]),
        .DCLK(dclk_in),
        .DEN(den_in),
        .DI(di_in[15:0]),
        .DWE(dwe_in),
        .RESET(reset_in),
        .VAUXN(aux_channel_n[15:0]),
        .VAUXP(aux_channel_p[15:0]),
        .ALM(alm_int),
        .BUSY(busy_out),
        .CHANNEL(channel_out[4:0]),
        .DO(do_out[15:0]),
        .DRDY(drdy_out),
        .EOC(eoc_out),
        .EOS(eos_out),
        .JTAGBUSY(),
        .JTAGLOCKED(),
        .JTAGMODIFIED(),
        .OT(),
        .MUXADDR(),
        .VP(vp_in),
        .VN(vn_in)
          );

endmodule

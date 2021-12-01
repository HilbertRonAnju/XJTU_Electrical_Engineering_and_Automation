`timescale 1ns / 1ps
module DAC_SawtoothWave(
    input clk,
    output dac_cs_n,
    output dac_wr1_n,
    output dac_wr2_n,
    output dac_xfer_n,
    output dac_ile, 
    output reg[7:0]dac_data    
    );
   	reg [7:0]q;

always@(posedge clk)
	if (q==100)
	begin
	   q<=0;
	   dac_data<=dac_data+1;
	end
	else if (dac_data==255)
	   dac_data<=0;
	else  
		q<=q+1;
					
    assign dac_ile =1;         
    assign dac_cs_n =0;        
    assign dac_wr1_n =0;       
    assign dac_wr2_n =0;       
    assign dac_xfer_n =0;      

endmodule

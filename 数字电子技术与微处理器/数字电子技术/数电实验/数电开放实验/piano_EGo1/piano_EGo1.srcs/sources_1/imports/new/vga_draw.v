`timescale 1ns / 1ps
¡¤module vga_draw(
                    input   wire            sys_clk,
                    input   wire            sys_rst_n,
                    input  wire  [7:0]     keydata,
                    output  wire            hsync,
                    output  wire            vsync,
                    output  wire            [11:0]   rgb,
                    output wire             video_en
                );
//ºì_ÂÌ_ÉB
parameter	BLACK   = 12'b0000_0000_0000;     //24'b00000000_00000000_00000000;  
parameter	BLUE    = 12'b0000_0000_1111;     //24'b00000000_00000000_11111111;
parameter	GREEN   = 12'b0000_1111_0000;     //24'b00000000_11111111_00000000;
parameter	DIAN	= 12'b0000_1111_1111;     //24'b00000000_11111111_11111111;
parameter	RED     = 12'b1111_0000_0000;     //24'b11111111_00000000_00000000;
parameter	PURPLE  = 12'b1111_0000_1111;     //24'b11111111_00000000_11111111;
parameter	YELLOW  = 12'b1111_1111_0000;     //24'b11111111_11111111_00000000;
parameter	WHITE   = 12'b1111_1111_1111;     //24'b11111111_11111111_11111111;
					 
wire    [9:0]   pixel_x;
wire    [9:0]   pixel_y;


reg	    [23:0]rgb_reg;

    
      
always @ (posedge sys_clk )
    if(sys_rst_n)
        begin
            rgb_reg <= BLACK;
        end 
    else
	 begin				
	  if (pixel_x>20&&pixel_x<35&&pixel_y>280&&pixel_y<380)
             rgb_reg=(keydata==8'h43)? BLUE:BLACK;
        else if (pixel_x>50&&pixel_x<65&&pixel_y>280&&pixel_y<380)
             rgb_reg=(keydata==8'h44)? BLUE:BLACK;     
        else if (pixel_x>110&&pixel_x<125&&pixel_y>280&&pixel_y<380)
             rgb_reg=(keydata==8'h4D)? BLUE:BLACK;                                    
        else if (pixel_x>140&&pixel_x<155&&pixel_y>280&&pixel_y<380)
             rgb_reg=(keydata==8'h54)? BLUE:BLACK;          
        else if (pixel_x>170&&pixel_x<185&&pixel_y>280&&pixel_y<380)
             rgb_reg=(keydata==8'h5B)? BLUE:BLACK;      
        else if (pixel_x>237&&pixel_x<252&&pixel_y>280&&pixel_y<380)
             rgb_reg=(keydata==8'h05)? BLUE:BLACK; 
        else if (pixel_x>267&&pixel_x<282&&pixel_y>280&&pixel_y<380)
             rgb_reg=(keydata==8'h06)? BLUE:BLACK; 
        else if (pixel_x>327&&pixel_x<342&&pixel_y>280&&pixel_y<380)
             rgb_reg=(keydata==8'h04)? BLUE:BLACK; 
        else if (pixel_x>357&&pixel_x<372&&pixel_y>280&&pixel_y<380)
             rgb_reg=(keydata==8'h0C)? BLUE:BLACK; 
        else if (pixel_x>387&&pixel_x<402&&pixel_y>280&&pixel_y<380)
             rgb_reg=(keydata==8'h03)? BLUE:BLACK; 
        else if (pixel_x>455&&pixel_x<470&&pixel_y>280&&pixel_y<380)
             rgb_reg=(keydata==8'h0B)? BLUE:BLACK; 
        else if (pixel_x>485&&pixel_x<500&&pixel_y>280&&pixel_y<380)
             rgb_reg=(keydata==8'h83)? BLUE:BLACK; 
        else if (pixel_x>545&&pixel_x<560&&pixel_y>280&&pixel_y<380)
             rgb_reg=(keydata==8'h0A)? BLUE:BLACK; 
        else if (pixel_x>575&&pixel_x<590&&pixel_y>280&&pixel_y<380)
             rgb_reg=(keydata==8'h01)? BLUE:BLACK; 
        else if (pixel_x>605&&pixel_x<620&&pixel_y>280&&pixel_y<380)
             rgb_reg=(keydata==8'h09)? BLUE:BLACK; 
			        else if(pixel_x < 10'd25&&pixel_y>280 )
						rgb_reg = (keydata==8'h15)? BLUE:WHITE;
					else if(pixel_x < 10'd30&&pixel_y>280 )
						rgb_reg =  BLACK;     		
					else if(pixel_x < 10'd55&&pixel_y>280 )
						rgb_reg =(keydata==8'h1D)?  BLUE:WHITE;	 			
					else if(pixel_x < 10'd60&&pixel_y>280 )
						rgb_reg = BLACK;		
					else if(pixel_x < 10'd85&&pixel_y>280 )
						rgb_reg =  (keydata==8'h24)?  BLUE:WHITE;				
					else if(pixel_x < 10'd90&&pixel_y>280 )
						rgb_reg = BLACK;					
					else if(pixel_x < 10'd115&&pixel_y>280 )
						rgb_reg = (keydata==8'h2D)? BLUE:WHITE;		
	     			else if(pixel_x < 10'd120&&pixel_y>280 )
                         rgb_reg =BLACK;	
                    else if(pixel_x<10'd145&&pixel_y>280 )
                         rgb_reg=(keydata==8'h2C)? BLUE:WHITE;
                    else if(pixel_x<10'd150&&pixel_y>280 )
                         rgb_reg=BLACK;
                     else if (pixel_x<10'd175&&pixel_y>280 )
                         rgb_reg=(keydata==8'h35)? BLUE:WHITE;
                     else if (pixel_x<10'd180&&pixel_y>280 )
                         rgb_reg=BLACK;
                    else if(pixel_x<10'd205&&pixel_y>280 )
                         rgb_reg=(keydata==8'h3C)? BLUE:WHITE;                             //
					else if(pixel_x<10'd217&&pixel_y>280)
					     rgb_reg=BLACK;
				    else if(pixel_x<10'd242&&pixel_y>280 )
                           rgb_reg=(keydata==8'h1C)? BLUE:WHITE;                               //1
                      else if(pixel_x<10'd247&&pixel_y>280)
                           rgb_reg=BLACK;
                    else if(pixel_x<10'd272&&pixel_y>280 )
                            rgb_reg=(keydata==8'h1B)? BLUE:WHITE;                              //2
                      else if(pixel_x<10'd277&&pixel_y>280)
                            rgb_reg=BLACK;
                      else if(pixel_x<10'd302&&pixel_y>280 )
                           rgb_reg=(keydata==8'h23)? BLUE:WHITE;                               //3
                      else if(pixel_x<10'd307&&pixel_y>280)
                              rgb_reg=BLACK;
                     else if(pixel_x<10'd332&&pixel_y>280 )
                              rgb_reg=(keydata==8'h2B)? BLUE:WHITE;                            //4
                      else if(pixel_x<10'd337&&pixel_y>280)
                                rgb_reg=BLACK; 
                      else if(pixel_x<10'd362&&pixel_y>280 )
                                 rgb_reg=(keydata==8'h34)? BLUE:WHITE;                         //5
                        else if(pixel_x<10'd367&&pixel_y>280)
                                rgb_reg=BLACK;      
                     else if(pixel_x<10'd392&&pixel_y>280 )
                                 rgb_reg=(keydata==8'h33)? BLUE:WHITE;                        //6
                      else if(pixel_x<10'd397&&pixel_y>280)
                                  rgb_reg=BLACK;   
                     else if(pixel_x<10'd422&&pixel_y>280 )
                                   rgb_reg=(keydata==8'h3B)? BLUE:WHITE;                      //7
                  else if(pixel_x<10'd435&&pixel_y>280 )
                                             rgb_reg=BLACK;
                                    else if(pixel_x<10'd460&&pixel_y>280)
                                             rgb_reg=(keydata==8'h1A)? BLUE:WHITE;         //1
                                   else if(pixel_x<10'd465&&pixel_y>280 )
                                             rgb_reg=BLACK;
                                  else if(pixel_x<10'd490&&pixel_y>280)
                                             rgb_reg=(keydata==8'h22)? BLUE:WHITE;         //2
                                   else if(pixel_x<10'd495&&pixel_y>280 )
                                             rgb_reg=BLACK;
                                   else if(pixel_x<10'd520&&pixel_y>280)
                                             rgb_reg=(keydata==8'h21)? BLUE:WHITE;         //3
                                   else if(pixel_x<10'd525&&pixel_y>280 )
                                             rgb_reg=BLACK;
                                  else if(pixel_x<10'd550&&pixel_y>280)
                                             rgb_reg=(keydata==8'h2A)? BLUE:WHITE;        //4
                                   else if(pixel_x<10'd555&&pixel_y>280 )
                                             rgb_reg=BLACK;
                                  else if(pixel_x<10'd580&&pixel_y>280)
                                             rgb_reg=(keydata==8'h32)? BLUE:WHITE;         //5
                                   else if(pixel_x<10'd585&&pixel_y>280 )
                                             rgb_reg=BLACK;
                                  else if(pixel_x<10'd610&&pixel_y>280)
                                             rgb_reg=(keydata==8'h31)? BLUE:WHITE;         //6
                                   else if(pixel_x<10'd615&&pixel_y>280 )
                                             rgb_reg=BLACK;
                                  else if(pixel_x<10'd640&&pixel_y>280)
                                             rgb_reg=(keydata==8'h3A)? BLUE:WHITE;         //7 
                                  else if(pixel_y>70&&pixel_y<90&&pixel_x>40&&pixel_x<60)
                                          rgb_reg=(keydata==8'h00)?GREEN:YELLOW;
                                else if(pixel_y>70&&pixel_y<90&&pixel_x>440&&pixel_x<460)
                                           rgb_reg=(keydata==8'h00)?PURPLE:YELLOW;
                                  else if(pixel_y>160&&pixel_y<180&&pixel_x>190&&pixel_x<210)
                                                  rgb_reg=(keydata==8'h00)?PURPLE:DIAN;
                                 else if(pixel_y>100&&pixel_y<120&&pixel_x>290&&pixel_x<310)
                                                  rgb_reg=(keydata==8'h00)?YELLOW:DIAN;
                                 else if(pixel_y>130&&pixel_y<150&&pixel_x>390&&pixel_x<410)
                                                  rgb_reg=(keydata==8'h00)?GREEN:PURPLE;
                                else if(pixel_y>130&&pixel_y<150&&pixel_x>80&&pixel_x<100)
                                                rgb_reg=(keydata==8'h00)?DIAN:WHITE;
                                 else if(pixel_y>160&&pixel_y<180&&pixel_x>490&&pixel_x<510)
                                                rgb_reg=(keydata==8'h00)?RED:YELLOW;
                                 else if(pixel_y>40&&pixel_y<60&&pixel_x>590&&pixel_x<610)
                                                rgb_reg=(keydata==8'h00)?DIAN:GREEN;
                                 else if(pixel_y>40&&pixel_y<60&&pixel_x>130&&pixel_x<150)
                                       rgb_reg=(keydata==8'h00)? YELLOW:RED;
                                            else if(pixel_y>50&&pixel_y<55 )     //ÎåÏßÆ×
                                                       rgb_reg=RED;
                                             else if(pixel_y>80&&pixel_y<85 )
                                                       rgb_reg=RED;
                                             else if(pixel_y>110&&pixel_y<115 )
                                                       rgb_reg=RED;
                                             else if(pixel_y>140&&pixel_y<145 )
                                                       rgb_reg=RED;
                                             else if(pixel_y>170&&pixel_y<175 )
                                                       rgb_reg=RED;                            
                      else 
                         rgb_reg=BLACK;                                                   
	end
	



//ÏÔÊ¾¾²Ì¬Í¼Ïñ640*480
assign rgb = (video_en == 1'b1) ? rgb_reg:BLACK;

//////////////////////////////////////////////////////////////		

vga_sync vga_syn_inst(
            .pclk            (sys_clk),
            .reset           (sys_rst_n),
            .valid           (video_en),
            .hsync           (hsync),
            .vsync           (vsync),
            .h_cnt           (pixel_x),
            .v_cnt           (pixel_y)
        );

               
endmodule
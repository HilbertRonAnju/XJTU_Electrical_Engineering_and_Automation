`timescale 1ns / 1ps
module scan_led_hex_disp(
    input clk,
    input reset,
    input [4:0] key_value,
//    input [1:0] hex1,hex0,
//    input [1:0] dp_in,
    output reg [1:0] an,
    output reg [7:0] sseg
    );
    
    reg [4:0] hex1,hex0;
    reg [1:0] dp_in;    
    reg [17:0] regN;
    reg [4:0] hex_in;
    reg dp;
    
  always @(posedge clk)
        begin
          case(key_value)
            5'd0:
              begin
                hex1<=4'ha;
                hex0<=4'd1;       
                dp_in<=2'b10;      
              end
            5'd1:
              begin
                hex1<=4'ha;
                hex0<=4'd2;       
               dp_in<=2'b10;                    
              end
            5'd2:
               begin
                hex1<=4'ha;
                hex0<=4'd3;       
                dp_in<=2'b10;                    
              end              
           5'd3:
              begin
               hex1<=4'ha;
               hex0<=4'd4;
               dp_in<=2'b10;
              end
          5'd4:
             begin
              hex1<=4'ha;
              hex0<=4'd5;
              dp_in<=2'b10;
             end
          5'd5:
             begin
              hex1<=4'ha;
              hex0<=4'd6;
              dp_in<=2'b10;
             end
          5'd6:
             begin
              hex1<=4'ha;
              hex0<=4'd7;
              dp_in<=2'b10;
             end
            5'd7:
               begin
                 hex1<=4'hb;
                 hex0<=4'd1;       
                 dp_in<=2'b10;      
               end
             5'd8:
               begin
                 hex1<=4'hb;
                 hex0<=4'd2;       
                dp_in<=2'b10;                    
               end
             5'd9:
                begin
                 hex1<=4'hb;
                 hex0<=4'd3;       
                 dp_in<=2'b10;                    
               end              
            5'd10:
               begin
                hex1<=4'hb;
                hex0<=4'd4;
                dp_in<=2'b10;
               end
           5'd11:
              begin
               hex1<=4'hb;
               hex0<=4'd5;
               dp_in<=2'b10;
              end
           5'd12:
              begin
               hex1<=4'hb;
               hex0<=4'd6;
               dp_in<=2'b10;
              end
           5'd13:
              begin
               hex1<=4'hb;
               hex0<=4'd7;
               dp_in<=2'b10;
              end   
            5'd14:
                begin
                  hex1<=4'hc;
                  hex0<=4'd1;       
                  dp_in<=2'b10;      
                end
              5'd15:
                begin
                  hex1<=4'hc;
                  hex0<=4'd2;       
                 dp_in<=2'b10;                    
                end
              5'd16:
                 begin
                  hex1<=4'hc;
                  hex0<=4'd3;       
                  dp_in<=2'b10;                    
                end              
             5'd17:
                begin
                 hex1<=4'hc;
                 hex0<=4'd4;
                 dp_in<=2'b10;
                end
            5'd18:
               begin
                hex1<=4'hc;
                hex0<=4'd5;
                dp_in<=2'b10;
               end
            5'd19:
               begin
                hex1<=4'hc;
                hex0<=4'd6;
                dp_in<=2'b10;
               end
            5'd20:
               begin
                hex1<=4'hc;
                hex0<=4'd7;
                dp_in<=2'b10;
               end   
            default:
              begin
                hex1<=5'd22;
                hex0<=5'd22;
                dp_in<=2'b00;
              end                          
          endcase
        end
    
  always @(posedge clk or posedge reset)
     if(reset==0)
      regN <= 0;
     else
      regN <= regN +1'b1;
     
 always @ (posedge clk)
   begin
    case(regN[16])
       1'b0 :
          begin
             an <= 2'b01;
             hex_in <= hex0;
             dp<=dp_in[0];
          end
       default :
                 begin
                    an <= 2'b10;
                    hex_in <= hex1;
                    dp<=dp_in[1];
               end   
        endcase
     end
 always  @ (posedge clk)    
 begin
   case(hex_in)
        5'h0:sseg[6:0] <= 7'b1111110;
        5'h1:sseg[6:0] <= 7'b0110000;
        5'h2:sseg[6:0] <= 7'b1101101;
        5'h3:sseg[6:0] <= 7'b1111001;
        5'h4:sseg[6:0] <= 7'b0110011;
        5'h5:sseg[6:0] <= 7'b1011011;
        5'h6:sseg[6:0] <= 7'b1011111;
        5'h7:sseg[6:0] <= 7'b1110000;
        5'h8:sseg[6:0] <= 7'b1111111;
        5'h9:sseg[6:0] <= 7'b1111011;
        5'ha:sseg[6:0] <= 7'b1110111;
        5'hb:sseg[6:0] <= 7'b0011111;
        5'hc:sseg[6:0] <= 7'b1001110;
        5'hd:sseg[6:0] <= 7'b0111101;
        5'he:sseg[6:0] <= 7'b1001111;
        5'hf:sseg[6:0] <= 7'b1000111;
        default:sseg[6:0] <= 7'b0000000;
   endcase
  sseg[7] <= dp;
  end
endmodule

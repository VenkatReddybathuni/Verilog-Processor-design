`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2024 08:52:41
// Design Name: 
// Module Name: moore
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


`timescale 1ns / 1ps
module moore(Clock, Resetn, w, z);
    input Clock, Resetn, w; // w is the input and we are assuming active low reset
    output z; // z is the output
    reg [3:0] y, Y; 
parameter [3:0] A = 4'b00, B = 4'b01,C = 4'b10, D = 4'b11, E = 4'b100, F = 4'b101, G = 4'b110, H = 4'b111, I = 4'b1000;

// Define the next state combinational circuit
always @(w or y)
    case (y)
        A: if (w) Y = B;
            else Y = F;
        B: if (w) Y = B;
            else Y = C;
        C: if (w) Y = D;
            else Y = F;
        D: if (w) Y = E;
            else Y = C;
        E: if (w) Y = B;
            else Y = I;
        F: if (w) Y = G;
            else Y = F;
        G: if (w) Y = H;
            else Y = C;
        H: if (w) Y = B;
            else Y = I;
        I: if (w) Y = D;
            else Y = F;
    default: Y = 2'bxx;
endcase

// Define the sequential block
always @(negedge Resetn or posedge Clock)
begin
    if (Resetn == 0) y <= A;
    else y <= Y;
end
// Define output
assign z = (y == E || y == I);
endmodule

//module moore(input clk,
//                   input reset,
//                   input din,
//                   output reg dout);

//reg [3:0]state;

//  always @(posedge clk) begin
//    if(~reset) begin
//      dout <= 1'b0;
//      state <= 4'b0000;
//    end
//    else begin
//      case(state)
//        4'b0000: begin
//          dout <=1'b0;
//          if(din)
//            state <= 4'b0001;
//          else
//            state <= 4'b0101;
//        end
//        4'b0001: begin
//          dout <= 1'b0;
//          if(din)
//            state <= 4'b0001;
//          else
//            state <= 4'b0010;
//        end
//        4'b0010: begin
//          dout <= 1'b0;
//          if(din)
//            state <= 4'b0011;
//          else
//            state <= 4'b0101;
//        end
//        4'b0011: begin
//          dout <= 1'b0;
//          if(din)
//            state <= 4'b0100;
//          else
//            state <= 4'b0010;
//        end
//        4'b0100: begin
//          dout <= 1'b1;
//          if(din)
//            state <= 4'b0001;
//          else
//            state <= 4'b1000;
//          end
//        4'b0101: begin
//          dout <= 1'b0;
//          if(din)
//            state <= 4'b0110;
//          else
//            state <= 4'b0101;
//          end
//        4'b0110: begin
//          dout <= 1'b0;
//          if(din)
//            state <= 4'b0111;
//          else
//            state <= 4'b0010;
//          end
//        4'b0111: begin
//          dout <= 1'b0;
//          if(din)
//            state <= 4'b0001;
//          else
//            state <= 4'b1000;
//        end
//        4'b1000: begin
//          dout <= 1'b1;
//          if(din)
//            state <= 4'b0011;
//          else
//            state <= 4'b0101;
//        end
//      endcase
//    end
//  end


//endmodule

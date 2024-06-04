`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 14:29:34
// Design Name: 
// Module Name: mealy_11
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

//module tff(input T, clk, reset, output reg Q);
//always@(posedge clk)
//begin
//if (!reset)
//Q <= 0;
//else
//if (T)
//Q <= ~Q;
//else 
//Q <= Q;
//end
//endmodule

module mealy_11(input clk, reset, w, output reg z);
reg [1:0]y, Y;
parameter A = 1'b0, B = 1'b1;

always@(w or y)
case (y)
A: if (w == 0) begin
Y = A; z = 0;
end
else begin
Y = B; z = 0;
end

B: if (w == 0) begin
Y = A; z = 0;
end
else begin
Y = B; z = 1;
end

default: Y = 1'bx;

endcase

always@(posedge clk)
if (!reset)
y <= A;
else 
y <= Y;
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 13:52:50
// Design Name: 
// Module Name: moore_11
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

module clock_divider(input main_clk, output slow_clk);
reg [31:0]counter;
always@(posedge main_clk)
begin
counter <= counter + 1;
end 
assign slow_clk = counter[27];
endmodule

module moore_11(input clk, reset, w, output z);
reg [1:0]y, Y;
wire slow_clk;
parameter [1:0]A = 2'b00, B = 2'b01, C = 2'b10;

clock_divider inst(.main_clk(clk), .slow_clk(slow_clk));

always@(w or y)
case(y)
A: if (w)
Y <= B;
else
Y <= A;

B: if (w)
Y <= C;
else
Y <= A;

C: if (w)
Y <= C;
else 
Y <= A;

default: Y = 2'bxx;
endcase

always@(posedge clk)
if (reset == 0)
y <= A;
else
y <= Y;

assign z = (y == C);
endmodule

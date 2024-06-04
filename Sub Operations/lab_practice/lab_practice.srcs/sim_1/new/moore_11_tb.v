`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 14:04:09
// Design Name: 
// Module Name: moore_11_tb
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


module moore_11_tb();
reg clk, reset, w;
wire z;

moore_11 uut(.clk(clk), .reset(reset), .w(w), .z(z));
initial
clk = 0;
always #5 clk = ~clk;

initial
begin
reset = 0;
#6;

reset = 1;
w = 0;
#5;
w = 1;
#5;
w = 1;
#20;
$finish();
end
endmodule

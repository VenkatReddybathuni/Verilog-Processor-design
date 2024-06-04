`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 14:38:03
// Design Name: 
// Module Name: mealy_11_tb
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


module mealy_11_tb();
reg clk, reset, w;
wire z;

mealy_11 uut(.clk(clk), .reset(reset), .w(w), .z(z));
initial 
clk = 0;
always #5 clk = ~clk;

initial
begin
reset = 0;
#10.1;
reset = 1; 
w = 0;
#10;
w = 0;
#10;
w = 1;
#10;
w = 1;
#10;
w = 0;
#30;

$finish();
end
endmodule

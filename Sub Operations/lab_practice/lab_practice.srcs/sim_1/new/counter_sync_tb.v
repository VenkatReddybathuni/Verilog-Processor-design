`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 10:38:20
// Design Name: 
// Module Name: counter_sync_tb
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


module counter_sync_tb();
reg [3:0]D;
reg clk, load, reset;
wire [3:0]Q;

counter_sync uut(.D(D), .load(load), .clk(clk), .reset(reset), .Q(Q));
initial
clk = 0;
always #5 clk = ~clk;

initial
begin
reset = 0;
#10;
reset = 1;
load = 1; D = 4'b0101;
#6;
load = 0;
#200;

$finish();
end 
endmodule

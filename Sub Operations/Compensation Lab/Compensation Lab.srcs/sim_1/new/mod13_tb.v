`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 15:51:38
// Design Name: 
// Module Name: mod13_tb
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


module mod13_tb();
reg clk, reset;
reg [2:0]mode;
wire [3:0]Q;

mod13 uut (.clk(clk), .reset(reset), .mode(mode), .Q(Q));

initial
clk = 0;
always #5 clk = ~clk;

initial 
begin
    reset = 0;
    #5
    mode = 0;
    reset = 1;
    #200;
    mode = 1;
    reset = 1;
    #200;
    $finish();
end
endmodule

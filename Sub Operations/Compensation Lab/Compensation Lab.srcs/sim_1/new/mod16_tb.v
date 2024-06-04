`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 14:48:16
// Design Name: 
// Module Name: mod16_tb
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


module mod16_tb();
reg clk, reset, mode;
wire [3:0]T;
wire [3:0]Q;

mod16 uut (.clk(clk), .reset(reset), .mode(mode), .Q(Q), .T(T));

initial
clk = 0;
always #5 clk = ~clk;

initial
begin
    mode = 0;
    reset = 0;
    #5;
    mode = 0;
    reset = 1;
    #300;
    mode = 1;
    reset = 1;
    #300;
    $finish();
    end
endmodule

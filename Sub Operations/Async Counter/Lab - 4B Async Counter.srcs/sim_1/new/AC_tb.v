`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2024 03:57:00
// Design Name: 
// Module Name: AC_tb
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


module AC_tb();
reg clk, reset;
wire [3:0]Q;

AC uut(.clk(clk), .reset(reset), .Q(Q));
    initial
    begin
    clk = 1;
    forever #5 clk = ~clk;
    end
    initial
    begin
    reset = 0;
    #10;
    reset = 1;
    #160;
    reset = 0;
    #10;
    reset = 1;
    #160;
    $finish();
    end
endmodule

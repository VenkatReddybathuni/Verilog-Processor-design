`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2024 11:07:45
// Design Name: 
// Module Name: counter_tb
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


module counter_tb();
    reg clk;
    reg reset;
    reg en;
    reg [1:0]M;
    wire [3:0]Q;
    counter uut(.clk(clk),.reset(reset), .en(en), .M(M), .Q(Q));
    initial
    begin
    clk = 1;
    forever #5 clk = ~clk;
    end
    initial
    begin
    reset = 0; en =1; M = 2'b11;
    #5;
    reset = 1; en =1; M = 2'b11;
    #80;
    reset = 0; en =1; M = 2'b11;
    #20;
    reset = 1; en =1; M = 2'b11;
    #100;
    $finish();
    end
endmodule

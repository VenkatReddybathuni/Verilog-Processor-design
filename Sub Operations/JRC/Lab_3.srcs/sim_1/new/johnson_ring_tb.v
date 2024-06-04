`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2024 03:30:00
// Design Name: 
// Module Name: johnson_ring_tb
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


module johnson_ring_tb();
    reg clk;
    reg reset;
    wire [3:0] Q;
    johnson_ring_4bit uut(.clk(clk), .reset(reset), .Q(Q));
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

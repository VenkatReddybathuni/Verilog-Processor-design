`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2024 18:02:42
// Design Name: 
// Module Name: top_module_tb
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


module top_module_tb();
    reg clk;
    reg reset;
    reg en;
    reg transfer;
    reg [1:0] c_mode;
    reg [1:0] s_mode;
    wire [3:0] c_OUT;
    wire [3:0] s_OUT;
    top_module uut(.clk(clk), .reset(reset), .en(en),.transfer(transfer), .c_mode(c_mode), .s_mode(s_mode), .c_OUT(c_OUT), .s_OUT(s_OUT));
    initial
    begin
    clk = 1;
    forever #5 clk = ~clk;
    end
    initial
    begin
    en = 1; reset = 0; transfer = 0; c_mode = 2'b00; s_mode = 2'b00;
    #10;
    en = 1; reset = 1; transfer = 0; c_mode = 2'b00; s_mode = 2'b10;
    #70;
    en = 0; reset = 1; transfer = 1; c_mode = 2'b00; s_mode = 2'b10;
    #10;
    en = 1; reset = 1; transfer = 0; c_mode = 2'b00; s_mode = 2'b10;
    #70;
    en = 0; reset = 1; transfer = 1; c_mode = 2'b00; s_mode = 2'b11;
    #10;
    en = 0; reset = 1; transfer = 0; c_mode = 2'b00; s_mode = 2'b10;
    #30;
    en = 0; reset = 1; transfer = 0; c_mode = 2'b00; s_mode = 2'b11;
    #10;
    en = 1; reset = 1; transfer = 0; c_mode = 2'b00; s_mode = 2'b10;
    #40;
    $finish();
    end
endmodule

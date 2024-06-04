`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2024 17:51:13
// Design Name: 
// Module Name: shift_register_tb
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


module shift_register_tb();
    reg [3:0]Q;
    reg [1:0] mode;
    reg en;
    reg transfer;
    reg clk;
    wire [3:0]OUT;
    shift_register_4bit uut(.Q(Q), .mode(mode), .en(en), .transfer(transfer), .clk(clk), .OUT(OUT));
    initial
    begin
    clk = 1;
    forever #5 clk = ~clk;
    end
    initial
    begin
    transfer = 1; en = 1; Q = 4'b1001; mode =2'b00;
    #10;
    transfer = 1; en = 1; Q = 4'b1001; mode =2'b10;
    #10;
    transfer = 1; en = 1; Q = 4'b1001; mode =2'b11;
    #10;
    $finish();
    end
endmodule

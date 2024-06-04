`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2024 03:11:40
// Design Name: 
// Module Name: universal_shift_register_tb
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


module universal_shift_register_tb();
    reg [3:0]Q;
    reg [1:0] mode;
    reg reset,clk;
    wire [3:0]OUT;
    universal_shift_register uut(.Q(Q), .mode(mode), .reset(reset), .clk(clk), .OUT(OUT));
    initial
    begin
    clk = 1;
    forever #5 clk = ~clk;
    end
    initial
    begin
    Q = 4'b1110; mode = 2'b01; reset = 1;
    #10;
    Q = 4'b1110; mode = 2'b10; reset = 1;
    #10;
    Q = 4'b1110; mode = 2'b11; reset = 1;
    #10;
    Q = 4'b1110; mode = 2'b00; reset = 1;
    #10;
    $finish();
    end
endmodule

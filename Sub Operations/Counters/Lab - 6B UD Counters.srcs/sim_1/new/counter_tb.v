`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2024 13:51:48
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
reg clk, reset;
reg [2:0]mode;
wire [3:0]Q;

counter uut (.clk(clk), .reset(reset), .mode(mode), .Q(Q));

initial
clk = 0;
always #5 clk = ~clk;

initial 
begin
    reset = 0;
    #5
    mode = 2'b00;
    reset = 1;
    #200;
    mode = 2'b01;
    reset = 1;
    #200;
    mode = 2'b10;
    reset = 1;
    #200;
    mode = 2'b11;
    reset = 1;
    #200;
    $finish();
end
endmodule

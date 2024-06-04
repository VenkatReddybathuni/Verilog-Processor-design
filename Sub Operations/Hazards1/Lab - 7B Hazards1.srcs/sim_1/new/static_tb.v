`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2024 02:42:34
// Design Name: 
// Module Name: static_tb
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


module static_tb();
reg A, B, C;
wire Y;
static uut(.A(A), .B(B), .C(C), .Y(Y));
    initial
    begin
    A = 1; B = 1; C = 1;
    #10
    A = 0; B =1; C = 0;
    #10
    $finish();
    end
endmodule
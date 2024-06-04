`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2024 14:54:43
// Design Name: 
// Module Name: ofa_tb
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


module ofa_tb();
reg A, B, Cin;
wire sum, Cout;
one_bit_adder uut(.A(A), .B(B), .Cin(Cin), .sum(sum), .Cout(Cout));
    initial
    begin
    A = 0; B = 0; Cin = 0;
    #10
    A = 0; B = 0; Cin = 1;
    #10
    A = 0; B = 1; Cin = 0;
    #10
    A = 0; B = 1; Cin = 1;
    #10
    A = 1; B = 0; Cin = 0;
    #10
    A = 1; B = 0; Cin = 1;
    #10
    A = 1; B = 1; Cin = 0;
    #10
    A = 1; B = 1; Cin = 1;
    #10
    $finish();
    end
endmodule

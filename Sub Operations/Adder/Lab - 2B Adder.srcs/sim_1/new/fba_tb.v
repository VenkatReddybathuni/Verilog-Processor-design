`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2024 15:11:49
// Design Name: 
// Module Name: fba_tb
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


module fba_tb();
reg [3:0]A;
reg [3:0]B;
reg Cin;
wire [3:0]sum; 
wire [2:0]Cout;
wire Carry;

four_bit_adder uut(.A(A), .B(B), .Cin(Cin), .sum(sum), .Cout(Cout), .Carry(Carry));
    initial
    begin
    A = 4'b0000; B = 4'b1111; Cin = 0;
    #10;
    A = 4'b0011; B = 4'b0100; Cin = 0;
    #10;
    A = 4'b1111; B = 4'b1111; Cin = 0;
    #10;
    A = 4'b1111; B = 4'b1111; Cin = 1;
    #10;
    $finish();
    end
endmodule

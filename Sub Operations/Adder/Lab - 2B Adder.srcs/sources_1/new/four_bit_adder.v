`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2024 15:01:45
// Design Name: 
// Module Name: four_bit_adder
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


module four_bit_adder(input [3:0]A, [3:0]B, Cin, output [3:0]sum, [2:0]Cout, Carry);

    one_bit_adder inst1(.A(A[0]), .B(B[0]), .Cin(Cin), .sum(sum[0]), .Cout(Cout[0]));
    one_bit_adder inst2(.A(A[1]), .B(B[1]), .Cin(Cout[0]), .sum(sum[1]), .Cout(Cout[1]));
    one_bit_adder inst3(.A(A[2]), .B(B[2]), .Cin(Cout[1]), .sum(sum[2]), .Cout(Cout[2]));
    one_bit_adder inst4(.A(A[3]), .B(B[3]), .Cin(Cout[2]), .sum(sum[3]), .Cout(Carry));
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2024 14:48:04
// Design Name: 
// Module Name: one_bit_adder
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


module one_bit_adder(input A, B, Cin, output sum, Cout);

    xor g1(sum, A ,B, Cin);
    and g2(out1, A, B);
    xor g3(out2, A, B);
    and g4(out3, out2, Cin);
    or g5(Cout, out1, out3);
    
endmodule

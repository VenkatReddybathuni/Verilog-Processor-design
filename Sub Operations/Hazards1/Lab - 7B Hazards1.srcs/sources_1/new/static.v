`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2024 02:35:06
// Design Name: 
// Module Name: static
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


module static(input A, B, C, output Y);
    not #(1) N1(NA, A);
    not #(1) N2(NB, B);
    or #(0) G1(r1, A, B);
    or #(0) G2(r2, NA, C);
    and #(0) G3(r3, r1, r2);
    and #(0) G4(r4, NB, A);
    or #(0) G5(Y, r3, r4);
    
endmodule

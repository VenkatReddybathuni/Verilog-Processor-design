`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.01.2024 10:14:46
// Design Name: 
// Module Name: question1b
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


module gray_converter(
    input [7:0] C,
    input carry_borrow_out,
    output [8:0] C_gray
    );
//    assign C_gray[8] = carry_borrow_out;
    and(C_gray[8], carry_borrow_out, 1);
    xor g1(C_gray[7],carry_borrow_out, C[7]); 
    xor g2(C_gray[6],C[6], C[7]);
    xor g3(C_gray[5],C[5], C[6]);
    xor g4(C_gray[4],C[4], C[5]);
    xor g5(C_gray[3],C[3], C[4]);
    xor g6(C_gray[2],C[2], C[3]);
    xor g7(C_gray[1],C[1], C[2]);
    xor g8(C_gray[0],C[0], C[1]);
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2024 13:07:25
// Design Name: 
// Module Name: Prime_fn_struct
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


module Prime_fn_struct(input [3:0]A, output f);
    
    and g1(out1, A[1], ~A[3], ~A[2]);
    and g2(out2, ~A[2], A[1], A[0]);
    and g3(out3, A[0], ~A[3], A[2]);
    and g4(out4, A[2], ~A[1], A[0]);
    or g5(f, out1, out2, out3, out4);
    
endmodule

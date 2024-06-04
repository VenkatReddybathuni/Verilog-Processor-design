`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2024 13:28:38
// Design Name: 
// Module Name: Prime_fn_CA
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


module Prime_fn_CA(input [3:0]A, output f);
    
    assign f = (A[1] & ~A[3] & ~A[2]) | (~A[2] & A[1] & A[0]) | (A[0] & ~A[3] & A[2]) | (A[2] & ~A[1] & A[0]);

endmodule

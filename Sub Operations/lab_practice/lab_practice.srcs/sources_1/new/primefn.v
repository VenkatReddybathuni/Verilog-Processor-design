`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 01:26:27
// Design Name: 
// Module Name: primefn
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

module primefn(input [3:0]A, output f);

begin

//assign f = (~A[3] & A[2] & A[0]) | (~A[1] & A[0] & A[2]) | (~A[2] & A[1] & A[0]) | (~A[3] & ~A[2] & A[1]);
and g1(o1, ~A[3], A[2], A[0]);
and g2(o2, ~A[1], A[0], A[2]);
and g3(o3, ~A[2], A[1], A[0]);
and g4(o4, ~A[3], ~A[2], A[1]);

or g5(f, o1, o2, o3, o4);
end
endmodule


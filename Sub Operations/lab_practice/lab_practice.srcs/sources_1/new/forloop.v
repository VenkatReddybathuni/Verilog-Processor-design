`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 17:33:01
// Design Name: 
// Module Name: ripple_adder
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


module ripple_adder #(parameter n = 4)(input [n-1:0] X, Y, output reg cout, output reg [n-1:0] S);
reg [n:0] C;
integer k;
always@(*)
begin
C[0] = 0;
for (k=0; k<n; k=k+1)
begin
S[k] = X[k] ^ Y[k] ^ C[k];
C[k+1] = (X[k] & Y[k] ) | (X[k] & C[k] ) | (C[k] & Y[k]);
end
cout = C[n];
end
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 17:57:31
// Design Name: 
// Module Name: lookahead_adder
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


module lookahead_adder(cin,X,Y,S,cout);
    parameter n = 4;
    input cin;
    input [n-1:0] X, Y;
    output reg [n-1:0] S;
    output reg cout;
    reg [n:0] C;
    reg [n:0] G, P;
    integer k;
    always@(*)
    begin
    C[0] = cin;
    for (k = 0; k < n; k = k +1)
    begin
        G[k] = X[k] & Y[k];
        P[k] = X[k] ^ Y[k];
        S[k] = P[k] ^ C[k];
        C[k+1] = G[k] | (P[k] & C[k]);
    end
     cout = C[n];
    end
endmodule
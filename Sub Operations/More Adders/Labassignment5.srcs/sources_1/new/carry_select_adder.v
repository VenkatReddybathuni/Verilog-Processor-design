`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2024 08:11:00
// Design Name: 
// Module Name: carry_select_adder
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

module ripple_adder_4bit(cin,X,Y,S,cout);
    parameter n = 2;
    input cin;
    input [n-1:0] X, Y;
    output reg [n-1:0] S;
    output reg cout;
    reg [n:0] C;
    integer k;
    always@(*)
    begin
    C[0] = cin;
    for (k=0; k<n; k=k+1)
    begin
    S[k] = X[k] ^ Y[k] ^ C[k];
    C[k+1] = (X[k] & Y[k] ) | (X[k] & C[k] ) | (C[k] & Y[k]);
    end
    cout = C[n];
    end
endmodule
module multiplexer2to1(X, Y, select, OUT);
    parameter n = 2;
    input [n-1:0] X,Y;
    input select;
    output reg [n-1:0] OUT;
    always@(*)
    begin
    if(!select)
    OUT = X;
    else
    OUT = Y;
    end
endmodule
module carry_select_adder(cin,X,Y,S,cout);
    parameter n = 4;
    input cin;
    input [n-1:0] X, Y;
    output [n-1:0] S;
    output cout;
    wire c;
    ripple_adder_4bit inst1(.cin(cin), .X(X[n/2 -1:0]), .Y(Y[n/2 -1:0]), .S(S[n/2 -1:0]), .cout(c));
    wire [n/2-1:0] S0, S1;
    wire cout0,cout1;
    ripple_adder_4bit inst2(.cin(0), .X(X[n-1 :n/2]), .Y(Y[n-1 :n/2]), .S(S0[n/2-1:0]), .cout(cout0));
    ripple_adder_4bit inst3(.cin(1), .X(X[n-1 :n/2]), .Y(Y[n-1 :n/2]), .S(S1[n/2-1:0]), .cout(cout1));
    multiplexer2to1 inst4 (.X(S0), .Y(S1), .select(c), .OUT(S[n-1 :n/2]));
    and i1(l1, ~c, cout0);
    and i2(l2, c, cout1);
    or i3(cout, l1,l2);
endmodule

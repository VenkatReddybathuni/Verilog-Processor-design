`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2024 08:31:09
// Design Name: 
// Module Name: select_adder_tb
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


module select_adder_tb();
parameter n = 4;
    reg cin;
    reg [n-1:0] X, Y;
    wire [n-1:0] S;
    wire cout;
    carry_select_adder uut(.cin(cin), .X(X), .Y(Y), .S(S), .cout(cout));
    initial
    begin
    cin = 0; X = 51; Y = 17;
    #10;
    cin = 0; X = 71; Y = 10;
    #10;
    cin = 0; X = 255; Y = 1;
    #10;
    cin = 0; X = 255; Y = 10;
    #10;
    cin = 0; X = 255; Y = 255;
    #10;
    $finish();
    end
     
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 03:15:19
// Design Name: 
// Module Name: comparator_tb
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


module comparator_tb();
    reg [3:0] A,B;
    wire f, g;
    comparator_4bit uut (.A(A), .B(B), .f(f), .g(g));
    initial
    begin
    A = 10; B = 12;
    #10;
    A = 5; B = 2;
    #10;
    A = 7; B = 7;
    #10;
    A = 15; B = 17;
    #10;
    $finish();
    end
    
endmodule

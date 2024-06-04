`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 03:09:25
// Design Name: 
// Module Name: comparator_4bit
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


module comparator_4bit(
    input [3:0] A,B,
    output reg f, g
    );
    always@(*)
    begin
    if(A > B) begin
    f = 1;
    g = 0;
    end
    else if (A < B) begin
    f = 0;
    g = 1;
    end
    else
    begin
    f = 0;
    g = 0;
    end
    end
endmodule

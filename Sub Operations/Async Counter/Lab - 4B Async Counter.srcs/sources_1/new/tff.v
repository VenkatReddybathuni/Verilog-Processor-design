`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2024 03:39:02
// Design Name: 
// Module Name: tff
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


module tff(input T, clk, reset, output reg Q = 0); //Very imp to initialize Q
always@(posedge clk)
    begin
    if (!reset)
        Q <= 0;
    else
        if (T)
            Q <= ~Q;
        else
            Q <= Q;
    end
endmodule

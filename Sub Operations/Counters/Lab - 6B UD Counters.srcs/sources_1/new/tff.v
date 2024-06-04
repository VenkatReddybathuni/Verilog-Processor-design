`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2024 13:11:11
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


module tff(input clk, reset, T, output reg Q);
always@(negedge clk)
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

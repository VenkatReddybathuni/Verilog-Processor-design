`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2024 03:48:46
// Design Name: 
// Module Name: AC
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


module AC(input clk, reset, output [3:0]Q);

    tff inst1 (.T(1), .clk(clk), .reset(reset), .Q(Q[0]));
    tff inst2 (.T(1), .clk(Q[0]), .reset(reset), .Q(Q[1]));
    tff inst3 (.T(1), .clk(Q[1]), .reset(reset), .Q(Q[2]));
    tff inst4 (.T(1), .clk(Q[2]), .reset(reset), .Q(Q[3]));

endmodule

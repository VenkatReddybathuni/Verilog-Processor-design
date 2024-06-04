`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 10:35:43
// Design Name: 
// Module Name: counter_sync
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


module counter_sync(input [3:0]D, clk, reset, load, output reg [3:0]Q);

always@(posedge clk)
begin
    if (!reset)
        Q <= 0;
    else if (load)
        Q <= D;
    else
        Q <= Q + 1;
end
endmodule

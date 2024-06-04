`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2024 15:53:25
// Design Name: 
// Module Name: shift_register
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


module shift_register(input D, input clk, output [3:0]Q);
    begin
    Dff inst1(.D(D), .clk(clk), .Q(Q[3]));
    Dff inst2(.D(Q[3]), .clk(clk), .Q(Q[2]));
    Dff inst3(.D(Q[2]), .clk(clk), .Q(Q[1]));
    Dff inst4(.D(Q[1]), .clk(clk), .Q(Q[0]));
    
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2024 03:06:13
// Design Name: 
// Module Name: Down_counter
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

module T_ff(
//T flopflop with always block
    input clk, preset, reset, T,
    output reg Q
    );
    always@(posedge clk, negedge preset)
    begin
    if(!reset)
        Q <= 0;
    else if (!preset)
        Q <= 1;
    else 
        Q <= T ^ Q;
    end
endmodule
module Down_counter(
     input clk, reset, preset,
     output [3:0] Q
    );
    
    wire [3:0] T;
    and(T[0], 1,1);
    and(T[1], ~Q[0], 1);
    and(T[2], ~Q[0], ~Q[1]);
    and(T[3], ~Q[0], ~Q[1], ~Q[2]);
    T_ff inst1(.clk(clk), .preset(preset), .reset(reset), .T(T[0]), .Q(Q[0]));
    T_ff inst2(.clk(clk), .preset(preset), .reset(reset), .T(T[1]), .Q(Q[1]));
    T_ff inst3(.clk(clk), .preset(preset), .reset(reset), .T(T[2]), .Q(Q[2]));
    T_ff inst4(.clk(clk), .preset(preset), .reset(reset), .T(T[3]), .Q(Q[3]));
    
endmodule

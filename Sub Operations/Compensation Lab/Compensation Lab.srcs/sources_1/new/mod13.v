`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 14:33:47
// Design Name: 
// Module Name: mod13
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

module tff(input T, clk, reset, output reg Q);
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

module mod16(input clk, reset, mode, output[3:0]Q, [3:0]T );
    assign T[0] = 1;
    tff inst1(T[0], clk, reset, Q[0]);
    assign T[1] = mode^Q[0];
    tff inst2(T[1], clk, reset, Q[1]);
    assign T[2] = (~mode & Q[1] & Q[0]) + (mode & ~Q[1] & ~Q[0]);
    tff inst3(T[2], clk, reset, Q[2]);
    assign T[3] = (~mode & Q[2] & Q[1] & Q[0]) + (mode & ~Q[2] & ~Q[1] & ~Q[0]);
    tff inst4(T[3], clk, reset, Q[3]);
    
endmodule

// Mod 13 sync counter is same as lab 6 B
// The above is for Mod 16 counter

module mod13(input clk, reset, mode, output reg [3:0] Q);
    always @(negedge clk) begin
        if (mode == 0)
            if (!reset)
                Q <= 4'b0000;
            else
                if (Q == 12)
                    Q <= 0;
                else
                    Q <= Q + 1;
                
        else
            if (!reset)
                Q <= 4'b0000;
            else
                if (Q == 4'b0000)
                    Q <= 4'b1100;
                else
                    Q <= Q - 1;

    end
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2024 10:05:36
// Design Name: 
// Module Name: counter
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
    input clk, reset, en, T,
    output reg Q
    );
    always@(posedge clk)
    begin
    if(!reset & en)
        Q <= 0;
    else if(reset & en)
        Q <= T ^ Q;
    else
        Q <= Q;
    end
endmodule

module counter(
    input clk, reset, en,
    input [1:0]M,
    output [3:0]Q
    );
    wire [3:0]T_binary; // for flipflop inputs T in case of binary
    wire [3:0]T_BCD;// for flipflop inputs T in case of BCD
    // populating array T_binary with binary outputs using multiplexer for up and down counters.
    and binary0(T_binary[0], 1,1);
    
    xor binary1(T_binary[1],Q[0],M[0]);
    
    and binary20(bin20, Q[0], Q[1]);
    and binary21(bin21, ~Q[0], ~Q[1]);
    and binary22(bin22, bin20, ~M[0]);
    and binary23(bin23, bin21, M[0]);
    or binary24(T_binary[2], bin22, bin23);
    
    and binary30(bin30, Q[0], Q[1], Q[2]);
    and binary31(bin31, ~Q[0],~Q[1], ~Q[2]);
    and binary32(bin32, bin30, ~M[0]);
    and binary33(bin33, bin31, M[0]);
    or binary34(T_binary[3], bin32, bin33);
    
    // populating array T_binary with BCD outputs using multiplexer for up and down counters.
    and BCD0(T_BCD[0], 1,1);
    
    and BCD10(bcd10, ~Q[3], Q[0]);
    or BCD11(bcd11, Q[1], Q[2], Q[3]);
    and BCD12(bcd12, bcd11, ~Q[0]);
    and BCD13(bcd13, ~M[0], bcd10);
    and BCD14(bcd14, bcd12, M[0]);
    or BCD15(T_BCD[1], bcd14, bcd13);
    
    and BCD20(bcd20, Q[1], Q[0]);
    and BCD21(bcd21, Q[2], ~Q[1]);
    or BCD22(bcd22, bcd21, Q[3]);
    and BCD23(bcd23, bcd22, ~Q[0]);
    and BCD24(bcd24, ~M[0],bcd20);
    and BCD25(bcd25, bcd23, M[0]);
    or BCD26(T_BCD[2], bcd24, bcd25);
    
    and BCD30(bcd30, ~Q[0], ~Q[1], ~Q[2]);
    and BCD31(bcd31, Q[3], Q[0]);
    and BCD32(bcd32, Q[0], Q[1], Q[2]);
    or BCD33(bcd33, bcd31, bcd32);
    and BCD34(bcd34, ~M[0], bcd33);
    and BCD35(bcd35, M[0], bcd30);
    or BCD36(T_BCD[3], bcd34, bcd35);
    
    wire [3:0]T;// For final T flipflop inputs using multiplexer for selecting BCD and binary
    
    and T0(T[0], 1,1);
    
    and T10(t10, ~M[1], T_binary[1]);
    and T11(t11, M[1], T_BCD[1]);
    or T12(T[1], t10, t11);
    
    and T20(t20, ~M[1], T_binary[2]);
    and T21(t21, M[1], T_BCD[2]);
    or T22(T[2], t20, t21);
    
    and T30(t30, ~M[1], T_binary[3]);
    and T31(t31, M[1], T_BCD[3]);
    or T32(T[3], t30, t31);
    //implementation of 4 bit counter
    T_ff bit0(.clk(clk), .reset(reset), .en(en), .T(T[0]), .Q(Q[0]));
    T_ff bit1(.clk(clk), .reset(reset), .en(en), .T(T[1]), .Q(Q[1]));
    T_ff bit2(.clk(clk), .reset(reset), .en(en), .T(T[2]), .Q(Q[2]));
    T_ff bit3(.clk(clk), .reset(reset), .en(en), .T(T[3]), .Q(Q[3]));
endmodule
